#!/bin/bash

. @jma-receipt-env@

PREFNAME=yamanashi
PROGRAMID=SEIKYU1905
LOG_FILE="/var/log/jma-receipt/${14}seikyu1905"
RENNUM=0
PRGOPT="select option from tbl_prgoption where hospnum=${14} and prgid='${PROGRAMID}' and kbncd='RECEDENPATH';"
RECEDENTMP=/var/tmp/${14}RECEDEN-TMP.CSV
#-------------------------------------------#
#    ����������� ʣ�̼��Żҥ쥻�ץ�
#        $1-${11}
#              �����ģ�����������(CPORCSRTLNK.INC)
#        ${12} ����֣ɣ�
#        ${13} ������ɣ�
#        ${14} ���ŵ��أɣ� 
#        ${15} ���顼�ե�����̾ 
#        ${16} ������ʬ(������硢��������)
#-------------------------------------------#
#
##      ���顼�ե�������
	echo $#
	echo "echo " ${15}
        if  [ -e ${15} ]; then
            rm  ${15}
        fi

        cd  ${ORCA_DIR}

##          PG���ץ���󤫤�ѥ����������TMP�إ��ԡ�
            RECEDENPATH=`echo "${PRGOPT}" | psql -At ${DBNAME}`
            cp ${RECEDENPATH} ${RECEDENTMP}
            
##          ʸ�������ɤ�EUC���Ѵ�
            nkf -Se --overwrite ${RECEDENTMP}

            RENNUM=$(expr ${RENNUM} + 1) 
            $DBSTUB -dir $LDDIRECTORY -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${12},${13},${14},${16},${15} > ${LOG_FILE}.log 2>&1
            if  [ -e ${15} ]; then
                exit
            fi

##          TMP�ե�������
            rm -rf ${RECEDENTMP}

        $DBSTUB  -dir $LDDIRECTORY -bd orcabt ORCBJOB -parameter JBE${12}${13},${14}

        exit
