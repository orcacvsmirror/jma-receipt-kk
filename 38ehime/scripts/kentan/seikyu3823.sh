#!/bin/bash
. @jma-receipt-env@

PREFNAME=ehime
PROGRAMID=SEIKYU3823
LOG_FILE="/var/log/jma-receipt/${14}seikyu3823"
RENNUM=0
PRGOPT="select option from tbl_prgoption where hospnum=${14} and prgid='${PROGRAMID}' and kbncd='COMMENT';"
INIFILE="/tmp/${14}${PROGRAMID}COMMENT.INI"
#-------------------------------------------#
#    ����������� ʡ�����������ɽ
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

        cd  ${ORCA_DIR}

            RENNUM=$(expr ${RENNUM} + 1) 
            $DBSTUB -dir $LDDIRECTORY -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${12},${13},${14},${16},${15} > ${LOG_FILE}.log 2>&1
            if  [ -e ${15} ]; then
                exit
            fi

##      INI�ե����� ���
        rm -f ${INIFILE}

        $DBSTUB  -dir $LDDIRECTORY -bd orcabt ORCBJOB -parameter JBE${12}${13},${14}

        exit
