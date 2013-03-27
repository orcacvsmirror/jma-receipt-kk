#!/bin/bash
. @jma-receipt-env@

PREFNAME=miyazaki
PROGRAMID=SOKATU4505
LOG_FILE="/var/log/jma-receipt/${15}sokatu4505"
RENNUM=0
PRGOPT="select option from tbl_prgoption where hospnum=${15} and prgid='${PROGRAMID}' and kbncd='SRYKA';"
INIFILE="/tmp/${15}${PROGRAMID}SRYKA.INI"
#-------------------------------------------#
#    後期高齢者請求添付票作成（宮崎）
#        $1-${11}
#              印刷ＤＢ用定固定引数(CPORCSRTLNK.INC)
#        ${12} ジョブＩＤ
#        ${13} シェルＩＤ
#        ${14} 総括表の種類
#           0:全体  1:社保　2:国保
#        ${15} 医療機関ＩＤ 
#        ${16} エラーファイル名 
#        ${17} 処理年月 
#        ${18} 対象保険者番号
#-------------------------------------------#
#
##      エラーファイル削除
	echo $#
	echo "echo " ${16}
        if  [ -e ${16} ]; then
            rm  ${16}
        fi

##      INIファイル 作成
        echo "${PRGOPT}" | psql -At ${DBNAME} > ${INIFILE}

        RENNUM=$(expr $RENNUM + 1) 
        $DBSTUB -dir $LDDIRECTORY -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${15},${12},${13},${18},1,${16} > ${LOG_FILE}-1.log 2>&1
        if  [ -e ${16} ]; then
            exit
        fi
        
##      INIファイル 削除
        rm -f ${INIFILE}

	$DBSTUB  -dir $LDDIRECTORY -bd orcabt ORCBJOB -parameter JBE${12}${13},${15}

