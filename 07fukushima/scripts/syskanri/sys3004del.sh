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

# syskanri 3004 del
cd ../scripts/syskanri
export APS_EXEC_PATH=`pwd`

ln -s $SYSCONFDIR/dbgroup.inc dbgroup.inc

$DBSTUB -bd sys3004 Sys3004del -parameter $HOSPNUM

cd $POST

exit 0
