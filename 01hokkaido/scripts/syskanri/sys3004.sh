#!/bin/bash
echo $0 | logger
echo `pwd`  | logger

JMARECEIPT_ENV="/etc/jma-receipt/jma-receipt.env"
if [ ! -f ${JMARECEIPT_ENV} ]; then
    echo "${JMARECEIPT_ENV} does not found."
    exit 1
fi
. $JMARECEIPT_ENV

HOSPNUM="01"
#--# POST=`pwd`

PREFNAME=sys3004
PROGRAMID=SYS3004

#--# cd ../scripts/syskanri
pushd ${MCP_TEMPDIR}/syskanri

# compile COBOL programs
MODULES=${PROGRAMID}.CBL
for f in $MODULES; do
  if test "x`echo -n $f | grep 'CBL$'`" != "x"; then
    m=`echo $f | sed 's/CBL$/so/'`
    echo -n "Building ${m}..."
    #--# ${COBOL} ${COBOLFLAGS} -o ${SITELIBDIR}/${m} \
    ${COBOL} ${COBOLFLAGS} -o ./${m} \
         -I ${PATCHCOPYDIR} \
         -I ${COPYDIR} \
         -I ${SITESRCDIR}/cobol/copy \
        ${f}
#**********************************
#ここでコンパイルエラーの考慮がない
#**********************************
    if [ $? -ne 0 ]; then
      echo "${f} compile error" | logger
    fi
    echo "done"
  fi
done

#------------------------------------------------------
#     シス管「3004」登録
#     NOWYMD    現在日付
#     NOWHMS    現在時間
#     NOWDIR    現在ディレクトリ
#     FILENAME  ファイル名
#------------------------------------------------------
NOWYMD=$(date +"%Y%m%d")
NOWHMS=$(date +"%H%M%S")
NOWDIR=$(pwd)
FILENAME=sys3004.data

ln -s $SYSCONFDIR/dbgroup.inc dbgroup.inc

#グループ診療対応（HOSPNUMの数だけ実行）
#--# SYSBASE=`psql -t -c "SELECT hospnum FROM tbl_sysbase ;" `
SYSBASE=`${MONSQL} -dir directory -o CSV2 -c "SELECT hospnum FROM tbl_sysbase;"`
for HOSPNUM in $SYSBASE
do
# syskanri 3004 set
  #--# $DBSTUB -dir ${NOWDIR}/directory -bd $PREFNAME $PROGRAMID -parameter ${HOSPNUM},${NOWYMD},${NOWHMS},${NOWDIR},${FILENAME}
  echo "${PROGRAMID} GO !! ${PREFNAME} ${HOSPNUM}" | logger
  $DBSTUB -dir directory -bd $PREFNAME $PROGRAMID -parameter ${HOSPNUM},${NOWYMD},${NOWHMS},${NOWDIR},${FILENAME}
done

# so del
#--# rm ${SITEDIR}/${PROGRAMID}.so
#--# rm dbgroup.inc

#--cd $POST
popd

exit 0
