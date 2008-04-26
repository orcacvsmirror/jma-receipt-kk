#!/bin/bash

. @jma-receipt-env@

PREFNAME=fukuoka
PROGRAMID=SOKATU4000
LOG_FILE="/var/log/jma-receipt/${15}sokatu4000"
RENNUM=0
#-------------------------------------------#
#    ¹ñÊÝÁí³çÉ½ºîÀ®¡ÊÊ¡²¬¡Ë
#        $1-${11}
#              °õºþ£Ä£ÂÍÑÄê¸ÇÄê°ú¿ô(CPORCSRTLNK.INC)
#        ${12} ¥¸¥ç¥Ö£É£Ä
#        ${13} ¥·¥§¥ë£É£Ä
#        ${15} °åÎÅµ¡´Ø£É£Ä 
#        ${16} ¥¨¥é¡¼¥Õ¥¡¥¤¥ëÌ¾ 
#-------------------------------------------#
#
##      ¥¨¥é¡¼¥Õ¥¡¥¤¥ëºï½ü
	echo $#
	echo "echo " ${16}
        if  [ -e ${16} ]; then
            rm  ${16}
        fi

        cd  ${ORCA_DIR}

            RENNUM=$(expr ${RENNUM} + 1) 
            $DBSTUB -dir $LDDEFDIR/directory -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${12},${13},${15},${18},${16} > ${LOG_FILE}.log
            if  [ -e ${16} ]; then
                exit
            fi

	$DBSTUB  -dir $LDDEFDIR/directory -bd orcabt ORCBJOB -parameter JBE${12}${13},${15}

        exit
