#!/bin/bash

. @jma-receipt-env@

PREFNAME=fukuoka
PROGRAMID=SOKATU4000
LOG_FILE="/var/log/jma-receipt/${15}sokatu4000"
RENNUM=0
#-------------------------------------------#
#    �������ɽ������ʡ����
#        $1-${11}
#              �����ģ�����������(CPORCSRTLNK.INC)
#        ${12} ����֣ɣ�
#        ${13} ������ɣ�
#        ${15} ���ŵ��أɣ� 
#        ${16} ���顼�ե�����̾ 
#-------------------------------------------#
#
##      ���顼�ե�������
	echo $#
	echo "echo " ${16}
        if  [ -e ${16} ]; then
            rm  ${16}
        fi

        cd  ${ORCA_DIR}

            RENNUM=$(expr ${RENNUM} + 1) 
            $DBSTUB -dir $LDDEFDIR/directory -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${12},${13},${15},${18},${16} > ${LOG_FILE}.log
            if  [ -e ${16} ]; then
                exit
            fi

	$DBSTUB  -dir $LDDEFDIR/directory -bd orcabt ORCBJOB -parameter JBE${12}${13},${15}

        exit
