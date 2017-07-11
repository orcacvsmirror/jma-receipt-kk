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
#    ����������� ʣ�̼��Żҥ쥻�ץ�
#        $1-${11}
#              �����ģ�����������(CPORCSRTLNK.INC)
#        ${12} ����֣ɣ�
#        ${13} ������ɣ�
#        ${14} ���ŵ����ֹ�
#        ${15} ���顼�ե�����̾ 
#        ${16} ������ʬ(������硢��������)
#        ${17} - ${18}���ŵ��إ������̤ν��������
#              ��������ǯ��γ��ϡ���λ
#-------------------------------------------#
#
##      ���顼�ե�������
	echo $#
	echo "echo " ${MCP_TEMPDIR}/${15}
        if  [ -e ${MCP_TEMPDIR}/${15} ]; then
            rm  ${MCP_TEMPDIR}/${15}
        fi

        cd  ${ORCA_DIR}

##          PG���ץ���󤫤�ѥ����������TMP�إ��ԡ�
            RECEDENPATH=`echo "${PRGOPT}" | psql -At ${DBNAME}`
            SITEIKBN=`echo "${PRGOPT2}" | psql -At ${DBNAME}`
            if [ $SITEIKBN = 1 ]; then
                cp ${RECEDENPATH} ${MCP_TEMPDIR}/${RECEDENTMP}
#               ʸ�������ɤ�EUC���Ѵ�
                nkf -Se --overwrite ${MCP_TEMPDIR}/${RECEDENTMP}
            else
                cp ${RECEDENPATH}/${14}_Shaho_${5}/RECEIPTC.UKE  ${MCP_TEMPDIR}/${SYARECEDENTMP}
                cp ${RECEDENPATH}/${14}_Kokuho_${5}/RECEIPTC.UKE ${MCP_TEMPDIR}/${KORECEDENTMP}
#               ʸ�������ɤ�EUC���Ѵ�
                nkf -Se --overwrite ${MCP_TEMPDIR}/${SYARECEDENTMP}
                nkf -Se --overwrite ${MCP_TEMPDIR}/${KORECEDENTMP}
            fi

            RENNUM=$(expr ${RENNUM} + 1) 
            $DBSTUB -dir $LDDIRECTORY -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${12},${13},${14},${16},${15},${RECEDENTMP},${SYARECEDENTMP},${KORECEDENTMP} > ${LOG_FILE}.log 2>&1
            if  [ -e ${MCP_TEMPDIR}/${15} ]; then
                exit
            fi

##          TMP�ե�������
            rm -rf ${MCP_TEMPDIR}/${RECEDENTMP}
            rm -rf ${MCP_TEMPDIR}/${SYARECEDENTMP}
            rm -rf ${MCP_TEMPDIR}/${KORECEDENTMP}

        $DBSTUB  -dir $LDDIRECTORY -bd orcabt ORCBJOB -parameter JBE${12}${13},${14}

        exit
