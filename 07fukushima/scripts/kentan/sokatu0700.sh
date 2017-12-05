#!/bin/bash

. @jma-receipt-env@

PREFNAME=fukushima
PROGRAMID=SOKATU0700
LOG_FILE="/var/log/jma-receipt/${15}sokatu0700"
RENNUM=0
#-------------------------------------------#
#    国保総括表作成（福島）
#        $1-${11}
#              印刷ＤＢ用定固定引数(CPORCSRTLNK.INC)
#        ${12} ジョブＩＤ
#        ${13} シェルＩＤ
#        ${15} 医療機関番号
#        ${16} エラーファイル名 
#        ${19} 処理対象区分
#              0:全体  1:当月・月遅れ分  2:返戻分
#        ${20} - ${21} 医療機関コード別の処理指定時
#                      該当診療年月の開始、終了
#-------------------------------------------#
#
##      エラーファイル削除
	echo $#
	echo "echo " ${MCP_TEMPDIR}/${16}
        if  [ -e ${MCP_TEMPDIR}/${16} ]; then
            rm  ${MCP_TEMPDIR}/${16}
        fi

##      返戻分
        if  [ ${19} -eq '0' ] || [ ${19} -eq '2' ]; then
            RENNUM=$(expr ${RENNUM} + 1) 
            $DBSTUB -dir $LDDIRECTORY -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${12},${13},${15},2,1,${20},${21},${16}
            if  [ -e ${MCP_TEMPDIR}/${16} ]; then
                exit
            fi
        fi
##      当月・月遅れ分
        if  [ ${19} -eq '0' ] || [ ${19} -eq '1' ]; then
            RENNUM=$(expr $RENNUM + 1) 
            $DBSTUB -dir $LDDIRECTORY -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${12},${13},${15},1,1,${20},${21},${16}
            if  [ -e ${MCP_TEMPDIR}/${16} ]; then
                exit
            fi
        fi
##      返戻分（特別療養費分）
        if  [ ${19} -eq '0' ] || [ ${19} -eq '2' ]; then
            RENNUM=$(expr ${RENNUM} + 1) 
            $DBSTUB -dir $LDDIRECTORY -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${12},${13},${15},2,2,${20},${21},${16}
            if  [ -e ${MCP_TEMPDIR}/${16} ]; then
                exit
            fi
        fi
##      当月・月遅れ分（特別療養費分）
        if  [ ${19} -eq '0' ] || [ ${19} -eq '1' ]; then
            RENNUM=$(expr $RENNUM + 1) 
            $DBSTUB -dir $LDDIRECTORY -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${12},${13},${15},1,2,${20},${21},${16}
            if  [ -e ${MCP_TEMPDIR}/${16} ]; then
                exit
            fi
        fi

        $DBSTUB  -dir $LDDIRECTORY -bd orcabt ORCBJOB -parameter JBE${12}${13},${15}
