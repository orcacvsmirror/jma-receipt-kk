#!/bin/bash

. @jma-receipt-env@

PREFNAME=iwate
PROGRAMID=SEIKYU0303
LOG_FILE="/var/log/jma-receipt/${14}seikyu0303"
RENNUM=0
#-------------------------------------------#
#    ����������������Ļ���������������տ��������ս��
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

            RENNUM=$(expr ${RENNUM} + 1) 
       	    ${DBSTUB} -record ${RECORDDIR} -dir ${LDDEFDIR}/directory -db orca -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${12},${13},${14},${16},${15} > ${LOG_FILE}.log 2>&1
            if  [ -e ${15} ]; then
                exit
            fi

	    ${DBSTUB} -record ${RECORDDIR} -dir ${LDDEFDIR}/directory -db orca -bd orcabt ORCBJOB -parameter JBE${12}${13},${14}

        exit
