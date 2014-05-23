#!/bin/bash
. @jma-receipt-env@

PREFNAME=chiba
PROGRAMID=SEIKYU1203
LOG_FILE="/var/log/jma-receipt/${14}seikyu1203"
RENNUM=0
#-------------------------------------------#
#    地方公費作成（千葉・母子家庭）
#        $1-${11}
#              印刷ＤＢ用定固定引数(CPORCSRTLNK.INC)
#        ${12} ジョブＩＤ
#        ${13} シェルＩＤ
#        ${14} 医療機関ＩＤ 
#        ${15} エラーファイル名 
#        ${16} 処理区分(０：一括、１：個別)
#-------------------------------------------#
#
##      エラーファイル削除
	echo $#
	echo "echo " ${15}
        if  [ -e ${15} ]; then
            rm  ${15}
        fi

##      INIファイル 作成
        echo "${PRGOPT}" | psql -At ${DBNAME} > ${INIFILE}

        cd  ${ORCA_DIR}

            RENNUM=$(expr ${RENNUM} + 1) 
            $DBSTUB -dir $LDDIRECTORY -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${12},${13},${14},${16},${15} > ${LOG_FILE}.log 2>&1
            if  [ -e ${15} ]; then
                exit
            fi

        $DBSTUB  -dir $LDDIRECTORY -bd orcabt ORCBJOB -parameter JBE${12}${13},${14}

        exit
