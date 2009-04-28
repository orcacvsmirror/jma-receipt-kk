#!/bin/bash

. @jma-receipt-env@

PREFNAME=okayama
PROGRAMID=SOKATU3300
LOG_FILE="/var/log/jma-receipt/${15}sokatu3300"
RENNUM=0
#-------------------------------------------#
#    国保総括票作成（岡山）
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

        cd  ${ORCA_DIR}

##      返戻分
        if  [ ${19} -eq '0' ] || [ ${19} -eq '2' ]; then
            RENNUM=$(expr ${RENNUM} + 1) 
       	    $DBSTUB -dir $LDDEFDIR/directory -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${12},${13},${15},2,${16} > ${LOG_FILE}-2.log 2>&1
            if  [ -e ${16} ]; then
                exit
            fi
        fi
##      当月・月遅れ分
        if  [ ${19} -eq '0' ] || [ ${19} -eq '1' ]; then
            RENNUM=$(expr ${RENNUM} + 1) 
       	    $DBSTUB -dir $LDDEFDIR/directory -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${12},${13},${15},1,${16} > ${LOG_FILE}-1.log 2>&1
            if  [ -e ${16} ]; then
                exit
            fi
        fi

	    ${DBSTUB} -record ${RECORDDIR} -dir ${LDDEFDIR}/directory -db orca -bd orcabt ORCBJOB -parameter JBE${12}${13},${15}

        exit
