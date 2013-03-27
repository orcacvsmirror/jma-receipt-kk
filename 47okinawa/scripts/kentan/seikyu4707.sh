#!/bin/bash
. @jma-receipt-env@

PREFNAME=okinawa
PROGRAMID=SEIKYU4707
LOG_FILE="/var/log/jma-receipt/${14}seikyu4707"
RENNUM=0
PRGOPT="select option from tbl_prgoption where hospnum=${14} and prgid='${PROGRAMID}' and kbncd='KINYU';"
INIFILE="/tmp/${14}${PROGRAMID}KINYU.INI"
#-------------------------------------------#
#    ÃÏÊý¸øÈñºîÀ®¡Ê²­Æì¸©Àº¿À¾ã³²¼ÔÆÃÊÌÁ¼ÃÖ°åÎÅ»ÙÊ§ÀÁµá½ñ¡Ë
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

##      INI¥Õ¥¡¥¤¥ë ºîÀ®
        echo "${PRGOPT}" | psql -At ${DBNAME} > ${INIFILE}

        cd  ${ORCA_DIR}

            RENNUM=$(expr ${RENNUM} + 1) 
            $DBSTUB -dir $LDDIRECTORY -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${12},${13},${14},${16},${15} > ${LOG_FILE}.log 2>&1
            if  [ -e ${15} ]; then
                exit
            fi

##      INI¥Õ¥¡¥¤¥ë ºï½ü
        rm -f ${INIFILE}

        $DBSTUB  -dir $LDDIRECTORY -bd orcabt ORCBJOB -parameter JBE${12}${13},${14}

        exit
