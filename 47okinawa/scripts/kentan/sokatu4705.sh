#!/bin/bash
. @jma-receipt-env@

PREFNAME=okinawa
PROGRAMID=SOKATU4705
LOG_FILE="/var/log/jma-receipt/${15}sokatu4705"
RENNUM=0
-------------------------------------------#
#    ¹­°èÏ¢¹çÁí³çÉ½ºîÀ®¡Ê²­Æì¡Ë
#        $1-${11}
#              °õºþ£Ä£ÂÍÑÄê¸ÇÄê°ú¿ô(CPORCSRTLNK.INC)
#        ${12} ¥¸¥ç¥Ö£É£Ä
#        ${13} ¥·¥§¥ë£É£Ä
#        ${15} °åÎÅµ¡´Ø£É£Ä 
#        ${16} ¥¨¥é¡¼¥Õ¥¡¥¤¥ëÌ¾ 
#        ${19} ½èÍýÂÐ¾Ý¶èÊ¬
#              0:Á´ÂÎ  1:Åö·î¡¦·îÃÙ¤ìÊ¬  2:ÊÖÌáÊ¬
#-------------------------------------------#
#
##      ¥¨¥é¡¼¥Õ¥¡¥¤¥ëºï½ü
	echo $#
	echo "echo " ${16}
        if  [ -e ${16} ]; then
            rm  ${16}
        fi
        
##      ÊÖÌáÊ¬
        if  [ ${19} -eq '0' ] || [ ${19} -eq '2' ]; then
            RENNUM=$(expr $RENNUM + 1) 
            $DBSTUB -dir $LDDEFDIR/directory -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${15},${12},${13},2,1,${16} > ${LOG_FILE}-2.log 2>&1
            if  [ -e ${16} ]; then
                exit
            fi
        fi
##      Åö·î¡¦·îÃÙ¤ìÊ¬
        if  [ ${19} -eq '0' ] || [ ${19} -eq '1' ]; then
            RENNUM=$(expr $RENNUM + 1) 
            $DBSTUB -dir $LDDEFDIR/directory -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${15},${12},${13},1,1,${16} > ${LOG_FILE}-1.log 2>&1
            if  [ -e ${16} ]; then
                exit
            fi
        fi
        
##      ÊÖÌáÊ¬¡ÊÆÃÊÌÎÅÍÜÈñ¡Ë
        if  [ ${19} -eq '0' ] || [ ${19} -eq '2' ]; then
            RENNUM=$(expr $RENNUM + 1) 
            $DBSTUB -dir $LDDEFDIR/directory -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${15},${12},${13},2,2,${16} > ${LOG_FILE}-4.log 2>&1
            if  [ -e ${16} ]; then
                exit
            fi
        fi
##      Åö·î¡¦·îÃÙ¤ìÊ¬¡ÊÆÃÊÌÎÅÍÜÈñ¡Ë
        if  [ ${19} -eq '0' ] || [ ${19} -eq '1' ]; then
            RENNUM=$(expr $RENNUM + 1) 
            $DBSTUB -dir $LDDEFDIR/directory -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${15},${12},${13},1,2,${16} > ${LOG_FILE}-3.log 2>&1
            if  [ -e ${16} ]; then
                exit
            fi
        fi
        
	$DBSTUB  -dir $LDDEFDIR/directory -bd orcabt ORCBJOB -parameter JBE${12}${13},${15}

