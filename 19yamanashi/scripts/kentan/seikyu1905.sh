#!/bin/bash

. @jma-receipt-env@

PREFNAME=yamanashi
PROGRAMID=SEIKYU1905
LOG_FILE="/var/log/jma-receipt/${14}seikyu1905"
RENNUM=0
PRGOPT="select option from tbl_prgoption where hospnum=${14} and prgid='${PROGRAMID}' and kbncd='RECEDENPATH';"
PRGOPT2="select option from tbl_prgoption where hospnum=${14} and prgid='${PROGRAMID}' and kbncd='SITEIKBN';"
RECEDENTMP=${14}RECEDEN-TMP.CSV
SYARECEDENTMP=${14}SYARECEDEN-TMP.CSV
KORECEDENTMP=${14}KORECEDEN-TMP.CSV
#-------------------------------------------#
#    地方公費作成 複写式電子レセプト
#        $1-${11}
#              印刷ＤＢ用定固定引数(CPORCSRTLNK.INC)
#        ${12} ジョブＩＤ
#        ${13} シェルＩＤ
#        ${14} 医療機関番号
#        ${15} エラーファイル名 
#        ${16} 処理区分(０：一括、１：個別)
#        ${17} - ${18}医療機関コード別の処理指定時
#              該当診療年月の開始、終了
#-------------------------------------------#
#
##      エラーファイル削除
	echo $#
	echo "echo " ${MCP_TEMPDIR}/${15}
        if  [ -e ${MCP_TEMPDIR}/${15} ]; then
            rm  ${MCP_TEMPDIR}/${15}
        fi

        cd  ${ORCA_DIR}

##          PGオプションからパスを取得し、TMPへコピー
            RECEDENPATH=`echo "${PRGOPT}" | psql -At ${DBNAME}`
            SITEIKBN=`echo "${PRGOPT2}" | psql -At ${DBNAME}`
            if [ $SITEIKBN = 1 ]; then
                cp ${RECEDENPATH} ${MCP_TEMPDIR}/${RECEDENTMP}
#               文字コードをEUCに変換
                nkf -Se --overwrite ${MCP_TEMPDIR}/${RECEDENTMP}
            else
                cp ${RECEDENPATH}/${14}_Shaho_${5}/RECEIPTC.UKE  ${MCP_TEMPDIR}/${SYARECEDENTMP}
                cp ${RECEDENPATH}/${14}_Kokuho_${5}/RECEIPTC.UKE ${MCP_TEMPDIR}/${KORECEDENTMP}
#               文字コードをEUCに変換
                nkf -Se --overwrite ${MCP_TEMPDIR}/${SYARECEDENTMP}
                nkf -Se --overwrite ${MCP_TEMPDIR}/${KORECEDENTMP}
            fi

            RENNUM=$(expr ${RENNUM} + 1) 
            $DBSTUB -dir $LDDIRECTORY -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${12},${13},${14},${16},${15},${RECEDENTMP},${SYARECEDENTMP},${KORECEDENTMP} > ${LOG_FILE}.log 2>&1
            if  [ -e ${MCP_TEMPDIR}/${15} ]; then
                exit
            fi

##          TMPファイル削除
            rm -rf ${MCP_TEMPDIR}/${RECEDENTMP}
            rm -rf ${MCP_TEMPDIR}/${SYARECEDENTMP}
            rm -rf ${MCP_TEMPDIR}/${KORECEDENTMP}

        $DBSTUB  -dir $LDDIRECTORY -bd orcabt ORCBJOB -parameter JBE${12}${13},${14}

        exit
