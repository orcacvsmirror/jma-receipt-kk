#!/bin/bash

. @jma-receipt-env@

PREFNAME=saga
PROGRAMID=SOKATU4100
LOG_FILE="/var/log/jma-receipt/${15}sokatu4100"
RENNUM=0
PRGOPT="select option from tbl_prgoption where hospnum=${15} and prgid='${PROGRAMID}' and kbncd='SRYKA';"
PRGOPT2="select option from tbl_prgoption where hospnum=${15} and prgid='${PROGRAMID}' and kbncd='YUSEN';"
INIFILE="/tmp/${15}${PROGRAMID}SRYKA.INI"
INIFILE2="/tmp/${15}${PROGRAMID}YUSEN.INI"
#-------------------------------------------#
#    国保総括表作成（佐賀）
#        $1-${11}
#              印刷ＤＢ用定固定引数(CPORCSRTLNK.INC)
#        ${12} ジョブＩＤ
#        ${13} シェルＩＤ
#        ${15} 医療機関ＩＤ 
#        ${16} エラーファイル名 
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

        cd  ${ORCA_DIR}

##      返戻分
        if  [ ${19} -eq '0' ] || [ ${19} -eq '2' ]; then
            RENNUM=$(expr ${RENNUM} + 1) 
       	    $DBSTUB -dir $LDDIRECTORY -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${12},${13},${15},2,1,${16} > ${LOG_FILE}-2.log 2>&1
            if  [ -e ${16} ]; then
                exit
            fi
        fi
##      当月・月遅れ分
        if  [ ${19} -eq '0' ] || [ ${19} -eq '1' ]; then
            RENNUM=$(expr ${RENNUM} + 1) 
       	    $DBSTUB -dir $LDDIRECTORY -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${12},${13},${15},1,1,${16} > ${LOG_FILE}-1.log 2>&1
            if  [ -e ${16} ]; then
                exit
            fi
        fi

##      返戻分（特別療養費分）
        if  [ ${19} -eq '0' ] || [ ${19} -eq '2' ]; then
            RENNUM=$(expr $RENNUM + 1) 
            $DBSTUB -dir $LDDIRECTORY -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${12},${13},${15},2,2,${16} > ${LOG_FILE}-22.log 2>&1
            if  [ -e ${16} ]; then
                exit
            fi
        fi
##      当月・月遅れ分（特別療養費分）
        if  [ ${19} -eq '0' ] || [ ${19} -eq '1' ]; then
            RENNUM=$(expr $RENNUM + 1) 
            $DBSTUB -dir $LDDIRECTORY -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${12},${13},${15},1,2,${16} > ${LOG_FILE}-21.log 2>&1
            if  [ -e ${16} ]; then
                exit
            fi
        fi
        

##      INIファイル 削除
        rm -f ${INIFILE}
        rm -f ${INIFILE2}

	    $DBSTUB  -dir $LDDIRECTORY -bd orcabt ORCBJOB -parameter JBE${12}${13},${15}

        exit
