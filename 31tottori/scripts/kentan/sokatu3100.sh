#!/bin/bash
. @jma-receipt-env@

PREFNAME=tottori
PROGRAMID=SOKATU3100
LOG_FILE="/var/log/jma-receipt/${15}sokatu3100"
RENNUM=0
#-------------------------------------------#
#    ¿ÇÎÅÊó½·ÀÁµáÌÀºÙ½ñÁ÷ÉÕ½ñ¡ÊÄ»¼è¡Ë
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
	echo "echo " ${MCP_TEMPDIR}/${16}
        if  [ -e ${MCP_TEMPDIR}/${16} ]; then
            rm  ${MCP_TEMPDIR}/${16}
        fi

        cd  ${ORCA_DIR}

##      ÊÖÌáÊ¬
        if  [ ${19} -eq '0' ] || [ ${19} -eq '2' ]; then
            RENNUM=$(expr ${RENNUM} + 1) 
       	    $DBSTUB -dir $LDDIRECTORY -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${12},${13},${15},2,1,${16} > ${LOG_FILE}-2.log 2>&1
            if  [ -e ${MCP_TEMPDIR}/${16} ]; then
                exit
            fi
        fi
##      Åö·î¡¦·îÃÙ¤ìÊ¬
        if  [ ${19} -eq '0' ] || [ ${19} -eq '1' ]; then
            RENNUM=$(expr $RENNUM + 1) 
       	    $DBSTUB -dir $LDDIRECTORY -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${12},${13},${15},1,1,${16} > ${LOG_FILE}-1.log 2>&1
            if  [ -e ${MCP_TEMPDIR}/${16} ]; then
                exit
            fi
        fi
##      ÊÖÌáÊ¬¡ÊÆÃÊÌÎÅÍÜÈñÊ¬¡Ë
        if  [ ${19} -eq '0' ] || [ ${19} -eq '2' ]; then
            RENNUM=$(expr ${RENNUM} + 1) 
       	    $DBSTUB -dir $LDDIRECTORY -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${12},${13},${15},2,2,${16} > ${LOG_FILE}-22.log 2>&1
            if  [ -e ${MCP_TEMPDIR}/${16} ]; then
                exit
            fi
        fi
##      Åö·î¡¦·îÃÙ¤ìÊ¬¡ÊÆÃÊÌÎÅÍÜÈñÊ¬¡Ë
        if  [ ${19} -eq '0' ] || [ ${19} -eq '1' ]; then
            RENNUM=$(expr $RENNUM + 1) 
       	    $DBSTUB -dir $LDDIRECTORY -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${12},${13},${15},1,2,${16} > ${LOG_FILE}-21.log 2>&1
            if  [ -e ${MCP_TEMPDIR}/${16} ]; then
                exit
            fi
        fi

	$DBSTUB  -dir $LDDIRECTORY -bd orcabt ORCBJOB -parameter JBE${12}${13},${15}
