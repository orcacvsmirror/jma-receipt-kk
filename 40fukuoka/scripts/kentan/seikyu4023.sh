#!/bin/bash

. @jma-receipt-env@

PREFNAME=fukuoka
PROGRAMID=SEIKYU4023
LOG_FILE="/var/log/jma-receipt/${14}seikyu4023"
RENNUM=0
PRGOPT="select option from tbl_prgoption where hospnum=${14} and prgid='${PROGRAMID}' and kbncd='KINYU';"
PRGOPT2="select option from tbl_prgoption where hospnum=${14} and prgid='${PROGRAMID}' and kbncd='TAISYOKOHI';"
INIFILE="/tmp/${14}${PROGRAMID}KINYU.INI"
INIFILE2="/tmp/${14}${PROGRAMID}TAISYOKOHI.INI"
#-------------------------------------------#
#    �������������ʡ��������������ܼ��ξ��ݻ��Ԥμ�����ôʬ�����ۿ������
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

##      INI�ե����� ����
        echo "${PRGOPT}" | psql -At ${DBNAME} > ${INIFILE}
        echo "${PRGOPT2}" | psql -At ${DBNAME} > ${INIFILE2}

        cd  ${ORCA_DIR}

            RENNUM=$(expr ${RENNUM} + 1) 
            $DBSTUB -dir $LDDIRECTORY -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${12},${13},${14},${16},${15} > ${LOG_FILE}.log 2>&1
            if  [ -e ${15} ]; then
                exit
            fi

##      INI�ե����� ���
        rm -f ${INIFILE}
        rm -f ${INIFILE2}

        $DBSTUB  -dir $LDDIRECTORY -bd orcabt ORCBJOB -parameter JBE${12}${13},${14}

        exit
