#!/bin/bash

if test -z "$JMARECEIPT_ENV" ; then
    JMARECEIPT_ENV="/etc/jma-receipt/jma-receipt.env"
fi
if ! test -f "$JMARECEIPT_ENV" ; then
    exit 0
fi

. $JMARECEIPT_ENV

HOSPNUM="01"
POST=`pwd`

PREFNAME=sys3004
PROGRAMID=SYS3004
LOG_FILE="/var/log/jma-receipt/hokkaido-plugin"

cd ${SITESRCDIR}/scripts/syskanri
###export APS_EXEC_PATH=`pwd`
#cd  ${ORCA_DIR}

# compile COBOL programs
MODULES=${PROGRAMID}.CBL
for f in $MODULES; do
  if test "x`echo -n $f | grep 'CBL$'`" != "x"; then
    m=`echo $f | sed 's/CBL$/so/'`
    echo -n "Building ${m}..."
    ${COBOL} ${COBOLFLAGS} -o ${SITELIBDIR}/${m} \
         -I ${PATCHCOPYDIR} \
         -I ${COPYDIR} \
         -I ${SITESRCDIR}/cobol/copy \
        ${f}
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
echo  "NOWDIR  :  "  ${NOWDIR}

#test
#COB_LIBRARY_PATH="$SITELIBDIR":"$PATCHLIBDIR":"$ORCALIBDIR":"$PANDALIB"
#export COB_LIBRARY_PATH

ln -s $SYSCONFDIR/dbgroup.inc dbgroup.inc

# syskanri 3004 set
$DBSTUB -dir ${NOWDIR}/directory -bd $PREFNAME -ddir ${NOWDIR} $PROGRAMID -parameter ${HOSPNUM},${NOWYMD},${NOWHMS},${NOWDIR},${FILENAME} > ${LOG_FILE}.log 2>&1
#so del
rm ${SITEDIR}/${PROGRAMID}.so

cd $POST

exit 0
