#!/bin/bash

. @jma-receipt-env@

PREFNAME=kagoshima
PROGRAMID=SEIKYU4605
LOG_FILE="/var/log/jma-receipt/${14}seikyu4605"
RENNUM=0
#-------------------------------------------#
#    ÆýÍÄ»ù°åÎÅÈñ¼«¸ÊÉéÃ´³Û»ÙÊ§ÌÀºÙ¸ÄÉ¼Á÷ÉÕ½ñ¡Ê¼¯»ùÅç¡Ë
#        $1-${11}
#              °õºþ£Ä£ÂÍÑÄê¸ÇÄê°ú¿ô(CPORCSRTLNK.INC)
#        ${12} ¥¸¥ç¥Ö£É£Ä
#        ${13} ¥·¥§¥ë£É£Ä
#        ${14} °åÎÅµ¡´ØÈÖ¹æ
#        ${15} ¥¨¥é¡¼¥Õ¥¡¥¤¥ëÌ¾ 
#        ${16} ½èÍý¶èÊ¬(£°¡§°ì³ç¡¢£±¡§¸ÄÊÌ)
#        ${17}-  ${18}°åÎÅµ¡´Ø¥³¡¼¥ÉÊÌ¤Î½èÍý»ØÄê»þ
#            ³ºÅö¿ÇÎÅÇ¯·î¤Î³«»Ï¡¢½ªÎ»
#-------------------------------------------#
#
##      ¥¨¥é¡¼¥Õ¥¡¥¤¥ëºï½ü
	echo $#
	echo "echo " ${MCP_TEMPDIR}/${15}
        if  [ -e ${MCP_TEMPDIR}/${15} ]; then
            rm  ${MCP_TEMPDIR}/${15}
        fi

        cd  ${ORCA_DIR}

            RENNUM=$(expr ${RENNUM} + 1) 
            $DBSTUB -dir $LDDIRECTORY -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${12},${13},${14},${16},${17},${18},${15} > ${LOG_FILE}.log 2>&1
            if  [ -e ${MCP_TEMPDIR}/${15} ]; then
                exit
            fi

        $DBSTUB  -dir $LDDIRECTORY -bd orcabt ORCBJOB -parameter JBE${12}${13},${14}

        exit
