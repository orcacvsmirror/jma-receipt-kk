#!/bin/bash

. /etc/jma-receipt/jma-receipt.env

PREFNAME=fukushima
PROGRAMID=SOKATU0700
LOG_FILE="/var/log/jma-receipt/${15}sokatu0700"
RENNUM=0
#-------------------------------------------#
#    ��������ɽ������ʡ���
#        $1-${11}
#              �����ģ�����������(CPORCSRTLNK.INC)
#        ${12} ����֣ɣ�
#        ${13} ������ɣ�
#        ${15} ���ŵ��أɣ� 
#        ${16} ���顼�ե�����̾ 
#        ${19} �����оݶ�ʬ
#              0:����  1:������٤�ʬ  2:����ʬ
#-------------------------------------------#
#
##      ���顼�ե�������
	echo $#
	echo "echo " ${16}
        if  [ -e ${16} ]; then
            rm  ${16}
        fi

        cd  ${ORCA_DIR}

##      ����ʬ
        if  [ ${19} -eq '0' ] || [ ${19} -eq '2' ]; then
            RENNUM=$(expr ${RENNUM} + 1) 
       	    ${DBSTUB} -record ${RECORDDIR} -dir ${LDDEFDIR}/directory -bddir ${LDDEFDIR} -db orca -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${12},${13},${15},2,${16} > ${LOG_FILE}-2.log
            if  [ -e ${16} ]; then
                exit
            fi
        fi
##      ������٤�ʬ
        if  [ ${19} -eq '0' ] || [ ${19} -eq '1' ]; then
            RENNUM=$(expr $RENNUM + 1) 
       	    ${DBSTUB} -record ${RECORDDIR} -dir ${LDDEFDIR}/directory -bddir ${LDDEFDIR} -db orca -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${12},${13},${15},1,${16} > ${LOG_FILE}-1.log
            if  [ -e ${16} ]; then
                exit
            fi
        fi

	    ${DBSTUB} -record ${RECORDDIR} -dir ${LDDEFDIR}/directory -bddir ${LDDEFDIR} -db orca -bd orcabt ORCBJOB -parameter JBE${12}${13},${15}

        exit
