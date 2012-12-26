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

# program option set
cd ${SITESRCDIR}/scripts/prgoption
export APS_EXEC_PATH=`pwd`

ln -s $SYSCONFDIR/dbgroup.inc dbgroup.inc

$DBSTUB -bd prgoption Prgoption -parameter $HOSPNUM

#rm dbgroup.inc
cd $POST

exit 0
