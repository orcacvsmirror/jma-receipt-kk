#!/bin/bash

. @jma-receipt-env@

PREFNAME=yamanashi
PROGRAMID=SEIKYU1905
LOG_FILE="/var/log/jma-receipt/${14}seikyu1905"
RENNUM=0
PRGOPT="select option from tbl_prgoption where hospnum=${14} and prgid='${PROGRAMID}' and kbncd='RECEDENPATH';"
PRGOPT2="select option from tbl_prgoption where hospnum=${14} and prgid='${PROGRAMID}' and kbncd='SITEIKBN';"
RECEDENTMP=/var/tmp/${14}RECEDEN-TMP.CSV
SYARECEDENTMP=/var/tmp/${14}SYARECEDEN-TMP.CSV
KORECEDENTMP=/var/tmp/${14}KORECEDEN-TMP.CSV
#-------------------------------------------#
#    地方公費作成 複写式電子レセプト
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

        cd  ${ORCA_DIR}

##          PGオプションからパスを取得し、TMPへコピー
            RECEDENPATH=`echo "${PRGOPT}" | psql -At ${DBNAME}`
            SITEIKBN=`echo "${PRGOPT2}" | psql -At ${DBNAME}`
            if [ $SITEIKBN = 1 ]; then
                cp ${RECEDENPATH} ${RECEDENTMP}
#               文字コードをEUCに変換
                nkf -Se --overwrite ${RECEDENTMP}
            else
                cp ${RECEDENPATH}/${14}_Shaho_${5}/RECEIPTC.UKE  ${SYARECEDENTMP}
                cp ${RECEDENPATH}/${14}_Kokuho_${5}/RECEIPTC.UKE ${KORECEDENTMP}
#               文字コードをEUCに変換
                nkf -Se --overwrite ${SYARECEDENTMP}
                nkf -Se --overwrite ${KORECEDENTMP}
            fi

            RENNUM=$(expr ${RENNUM} + 1) 
            $DBSTUB -dir $LDDIRECTORY -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${12},${13},${14},${16},${15} > ${LOG_FILE}.log 2>&1
            if  [ -e ${15} ]; then
                exit
            fi

##          TMPファイル削除
            rm -rf ${RECEDENTMP}
            rm -rf ${SYARECEDENTMP}
            rm -rf ${KORECEDENTMP}

        $DBSTUB  -dir $LDDIRECTORY -bd orcabt ORCBJOB -parameter JBE${12}${13},${14}

        exit
