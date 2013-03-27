#!/bin/bash

. @jma-receipt-env@

PREFNAME=fukuoka
PROGRAMID=SOKATU4000
LOG_FILE="/var/log/jma-receipt/${15}sokatu4000"
RENNUM=0
PRGOPT="select option from tbl_prgoption where hospnum=${15} and prgid='${PROGRAMID}' and kbncd='SRYKA';"
PRGOPT2="select option from tbl_prgoption where hospnum=${15} and prgid='${PROGRAMID}' and kbncd='TAISYOKOHI';"
PRGOPT3="select option from tbl_prgoption where hospnum=${15} and prgid='${PROGRAMID}' and kbncd='YUSEN';"
INIFILE="/tmp/${15}${PROGRAMID}SRYKA.INI"
INIFILE2="/tmp/${15}${PROGRAMID}TAISYOKOHI.INI"
INIFILE3="/tmp/${15}${PROGRAMID}YUSEN.INI"
#-------------------------------------------#
#    �������ɽ������ʡ����
#        $1-${11}
#              �����ģ�����������(CPORCSRTLNK.INC)
#        ${12} ����֣ɣ�
#        ${13} ������ɣ�
#        ${15} ���ŵ��أɣ� 
#        ${16} ���顼�ե�����̾ 
#        ${17} ����ǯ�� 
#        ${18} �о��ݸ����ֹ�
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

##      INI�ե����� ����
        echo "${PRGOPT}" | psql -At ${DBNAME} > ${INIFILE}
        echo "${PRGOPT2}" | psql -At ${DBNAME} > ${INIFILE2}
        echo "${PRGOPT3}" | psql -At ${DBNAME} > ${INIFILE3}

        cd  ${ORCA_DIR}

##      ����ʬ
        if  [ ${19} -eq '0' ] || [ ${19} -eq '2' ]; then
            RENNUM=$(expr ${RENNUM} + 1) 
            $DBSTUB -dir $LDDIRECTORY -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${12},${13},${15},${18},2,${16} > ${LOG_FILE}-2.log 2>&1
            if  [ -e ${16} ]; then
                exit
            fi
        fi
##      ������٤�ʬ
        if  [ ${19} -eq '0' ] || [ ${19} -eq '1' ]; then
            RENNUM=$(expr ${RENNUM} + 1) 
            $DBSTUB -dir $LDDIRECTORY -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${12},${13},${15},${18},1,${16} > ${LOG_FILE}-1.log 2>&1
            if  [ -e ${16} ]; then
                exit
            fi
        fi

##      INI�ե����� ���
        rm -f ${INIFILE}
        rm -f ${INIFILE2}
        rm -f ${INIFILE3}

	$DBSTUB  -dir $LDDIRECTORY -bd orcabt ORCBJOB -parameter JBE${12}${13},${15}

        exit
