#!/bin/bash

. @jma-receipt-env@

PREFNAME=gifu
PROGRAMID=SEIKYU2109
LOG_FILE="/var/log/jma-receipt/${14}seikyu2109"
RENNUM=0
#-------------------------------------------#
#    ÃÏÊý¸øÈñºîÀ®¡Ê´ôÉì¡¦Âç³ÀÏ·¿Í¡Ë
#        $1-${11}
#              °õºþ£Ä£ÂÍÑÄê¸ÇÄê°ú¿ô(CPORCSRTLNK.INC)
#        ${12} ¥¸¥ç¥Ö£É£Ä
#        ${13} ¥·¥§¥ë£É£Ä
#        ${14} °åÎÅµ¡´Ø£É£Ä 
#        ${15} ¥¨¥é¡¼¥Õ¥¡¥¤¥ëÌ¾ 
#        ${16} ½èÍý¶èÊ¬(£°¡§°ì³ç¡¢£±¡§¸ÄÊÌ)
#-------------------------------------------#
#
##      ¥¨¥é¡¼¥Õ¥¡¥¤¥ëºï½ü
	echo $#
	echo "echo " ${15}
        if  [ -e ${15} ]; then
            rm  ${15}
        fi

        cd  ${ORCA_DIR}

            RENNUM=$(expr ${RENNUM} + 1) 
       	    ${DBSTUB} -record ${RECORDDIR} -dir ${LDDEFDIR}/directory -bddir ${LDDEFDIR} -db orca -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${12},${13},${14},${16},${15} > ${LOG_FILE}.log
            if  [ -e ${15} ]; then
                exit
            fi

	    ${DBSTUB} -record ${RECORDDIR} -dir ${LDDEFDIR}/directory -bddir ${LDDEFDIR} -db orca -bd orcabt ORCBJOB -parameter JBE${12}${13},${14}

        exit
