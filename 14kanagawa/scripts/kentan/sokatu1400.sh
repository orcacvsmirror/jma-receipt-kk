#!/bin/bash
. @jma-receipt-env@

PREFNAME=kanagawa
PROGRAMID=SOKATU1400
LOG_FILE="/var/log/jma-receipt/${15}sokatu1400"
RENNUM=0
-------------------------------------------#
#    ¹ñÊÝ¡¦¿ÇÎÅÊó½·Áí³çÉ½¡Ê¿ÀÆàÀî¡Ë
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
            $DBSTUB -dir $LDDEFDIR/directory -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${15},${12},${13},2,${16} > ${LOG_FILE}-2.log
            if  [ -e ${16} ]; then
                exit
            fi
        fi
##      Åö·î¡¦·îÃÙ¤ìÊ¬
        if  [ ${19} -eq '0' ] || [ ${19} -eq '1' ]; then
            RENNUM=$(expr $RENNUM + 1) 
            $DBSTUB -dir $LDDEFDIR/directory -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${15},${12},${13},1,${16} > ${LOG_FILE}-1.log
            if  [ -e ${16} ]; then
                exit
            fi
        fi
        
	$DBSTUB  -dir $LDDEFDIR/directory -bd orcabt ORCBJOB -parameter JBE${12}${13},${15}

