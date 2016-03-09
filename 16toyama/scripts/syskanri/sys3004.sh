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

cd ../scripts/syskanri

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
#     �V�X�ǁu3004�v�o�^
#     NOWYMD    ���ݓ��t
#     NOWHMS    ���ݎ���
#     NOWDIR    ���݃f�B���N�g��
#     FILENAME  �t�@�C����
#------------------------------------------------------
NOWYMD=$(date +"%Y%m%d")
NOWHMS=$(date +"%H%M%S")
NOWDIR=$(pwd)
FILENAME=sys3004.data

ln -s $SYSCONFDIR/dbgroup.inc dbgroup.inc

#�O���[�v�f�ÑΉ��iHOSPNUM�̐��������s�j
SYSBASE=`psql -t -c "SELECT hospnum FROM tbl_sysbase ;" `
for HOSPNUM in $SYSBASE
do
# syskanri 3004 set
  $DBSTUB -dir ${NOWDIR}/directory -bd $PREFNAME $PROGRAMID -parameter ${HOSPNUM},${NOWYMD},${NOWHMS},${NOWDIR},${FILENAME}
done

# so del
rm ${SITEDIR}/${PROGRAMID}.so
rm dbgroup.inc

cd $POST

exit 0
