#!/bin/bash
. @jma-receipt-env@

PREFNAME=shimane
PROGRAMID=SEIKYU3211
LOG_FILE="/var/log/jma-receipt/${14}seikyu3211"
RENNUM=0
PRGOPT="select option from tbl_prgoption where hospnum=${14} and prgid='${PROGRAMID}' and kbncd='BAITAI';"
PRGOPT2="select option from tbl_prgoption where hospnum=${14} and prgid='${PROGRAMID}' and kbncd='TAISYOKOHI';"
INIFILE="/tmp/${14}${PROGRAMID}BAITAI.INI"
INIFILE2="/tmp/${14}${PROGRAMID}TAISYOKOHI.INI"
#-------------------------------------------#
#    地方公費作成（島根・電子媒体等送付書）
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
        echo "${PRGOPT2}" | psql -At ${DBNAME} > ${INIFILE2}

        cd  ${ORCA_DIR}

            RENNUM=$(expr ${RENNUM} + 1) 
            $DBSTUB -dir $LDDIRECTORY -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${12},${13},${14},${16},${15} > ${LOG_FILE}.log 2>&1
            if  [ -e ${15} ]; then
                exit
            fi

##      INIファイル 削除
        rm -f ${INIFILE}
        rm -f ${INIFILE2}
        
        $DBSTUB  -dir $LDDIRECTORY -bd orcabt ORCBJOB -parameter JBE${12}${13},${14}

        exit
