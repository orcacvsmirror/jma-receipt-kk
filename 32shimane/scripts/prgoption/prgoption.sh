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

PREFNAME=prgoption
PROGRAMID=PRGOPTIONSET

cd ../scripts/prgoption

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
#     シス管「1910」登録
#     NOWYMD     現在日付
#     NOWHMS     現在時間
#     NOWDIR     現在ディレクトリ
#     KAKUNASHI  拡張子なしファイル名
#                拡張子（exp or opt）
#------------------------------------------------------
NOWYMD=$(date +"%Y%m%d")
NOWHMS=$(date +"%H%M%S")
NOWDIR=$(pwd)

FILENAME=(`ls | grep exp$`)
COUNT=(`ls | grep exp$ | wc -w`)
SU=0

ln -s $SYSCONFDIR/dbgroup.inc dbgroup.inc

#ファイルの数だけ登録プログラムを実行する
while test ${SU} -lt ${COUNT}
do
    KAKUNASHI=`echo ${FILENAME[${SU}]} | sed -e 's/.exp//'`
    $DBSTUB -dir ${NOWDIR}/directory -bd $PREFNAME $PROGRAMID -parameter ${HOSPNUM},${NOWYMD},${NOWHMS},${NOWDIR},${KAKUNASHI},"exp"

    SU=$(expr ${SU} + 1)
done

#optファイルも同様に行う
FILENAME=(`ls | grep opt$`)
COUNT=(`ls | grep opt$ | wc -w`)
SU=0

while test ${SU} -lt ${COUNT}
do
    KAKUNASHI=`echo ${FILENAME[${SU}]} | sed -e 's/.opt//'`
    $DBSTUB -dir ${NOWDIR}/directory -bd $PREFNAME $PROGRAMID -parameter ${HOSPNUM},${NOWYMD},${NOWHMS},${NOWDIR},${KAKUNASHI},"opt"

    SU=$(expr ${SU} + 1)
done

# so del
rm ${SITEDIR}/${PROGRAMID}.so
rm dbgroup.inc

cd $POST

exit 0
