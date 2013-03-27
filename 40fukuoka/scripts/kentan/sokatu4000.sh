#!/bin/bash

. @jma-receipt-env@

PREFNAME=fukuoka
PROGRAMID=SOKATU4000
LOG_FILE="/var/log/jma-receipt/${15}sokatu4000"
RENNUM=0
PRGOPT="select option from tbl_prgoption where hospnum=${15} and prgid='${PROGRAMID}' and kbncd='SRYKA';"
PRGOPT2="select option from tbl_prgoption where hospnum=${15} and prgid='${PROGRAMID}' and kbncd='TAISYOKOHI';"
PRGOPT3="select option from tbl_prgoption where hospnum=${15} and prgid='${PROGRAMID}' and kbncd='YUSEN';"
INIFILE="/tmp/${15}${PROGRAMID}SRYKA.INI"
INIFILE2="/tmp/${15}${PROGRAMID}TAISYOKOHI.INI"
INIFILE3="/tmp/${15}${PROGRAMID}YUSEN.INI"
#-------------------------------------------#
#    国保総括表作成（福岡）
#        $1-${11}
#              印刷ＤＢ用定固定引数(CPORCSRTLNK.INC)
#        ${12} ジョブＩＤ
#        ${13} シェルＩＤ
#        ${15} 医療機関ＩＤ 
#        ${16} エラーファイル名 
#        ${17} 処理年月 
#        ${18} 対象保険者番号
#        ${19} 処理対象区分
#              0:全体  1:当月・月遅れ分  2:返戻分
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
        echo "${PRGOPT2}" | psql -At ${DBNAME} > ${INIFILE2}
        echo "${PRGOPT3}" | psql -At ${DBNAME} > ${INIFILE3}

        cd  ${ORCA_DIR}

##      返戻分
        if  [ ${19} -eq '0' ] || [ ${19} -eq '2' ]; then
            RENNUM=$(expr ${RENNUM} + 1) 
            $DBSTUB -dir $LDDIRECTORY -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${12},${13},${15},${18},2,${16} > ${LOG_FILE}-2.log 2>&1
            if  [ -e ${16} ]; then
                exit
            fi
        fi
##      当月・月遅れ分
        if  [ ${19} -eq '0' ] || [ ${19} -eq '1' ]; then
            RENNUM=$(expr ${RENNUM} + 1) 
            $DBSTUB -dir $LDDIRECTORY -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${12},${13},${15},${18},1,${16} > ${LOG_FILE}-1.log 2>&1
            if  [ -e ${16} ]; then
                exit
            fi
        fi

##      INIファイル 削除
        rm -f ${INIFILE}
        rm -f ${INIFILE2}
        rm -f ${INIFILE3}

	$DBSTUB  -dir $LDDIRECTORY -bd orcabt ORCBJOB -parameter JBE${12}${13},${15}

        exit
