#!/bin/bash
. @jma-receipt-env@

PREFNAME=tottori
PROGRAMID=SOKATU3100
LOG_FILE="/var/log/jma-receipt/${15}sokatu3100"
RENNUM=0
PRGOPT="select option from tbl_prgoption where hospnum=${15} and prgid='${PROGRAMID}' and kbncd='YUSEN';"
INIFILE="/tmp/${15}${PROGRAMID}YUSEN.INI"
#-------------------------------------------#
#    �������������ٽ����ս��Ļ���
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

##      INI�ե����� ����
        echo "${PRGOPT}" | psql -At ${DBNAME} > ${INIFILE}

##      ����ʬ
        if  [ ${19} -eq '0' ] || [ ${19} -eq '2' ]; then
            RENNUM=$(expr ${RENNUM} + 1) 
       	    $DBSTUB -dir $LDDIRECTORY -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${12},${13},${15},2,1,${16} > ${LOG_FILE}-2.log 2>&1
            if  [ -e ${16} ]; then
                exit
            fi
        fi
##      ������٤�ʬ
        if  [ ${19} -eq '0' ] || [ ${19} -eq '1' ]; then
            RENNUM=$(expr $RENNUM + 1) 
       	    $DBSTUB -dir $LDDIRECTORY -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${12},${13},${15},1,1,${16} > ${LOG_FILE}-1.log 2>&1
            if  [ -e ${16} ]; then
                exit
            fi
        fi
##      ����ʬ������������ʬ��
        if  [ ${19} -eq '0' ] || [ ${19} -eq '2' ]; then
            RENNUM=$(expr ${RENNUM} + 1) 
       	    $DBSTUB -dir $LDDIRECTORY -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${12},${13},${15},2,2,${16} > ${LOG_FILE}-22.log 2>&1
            if  [ -e ${16} ]; then
                exit
            fi
        fi
##      ������٤�ʬ������������ʬ��
        if  [ ${19} -eq '0' ] || [ ${19} -eq '1' ]; then
            RENNUM=$(expr $RENNUM + 1) 
       	    $DBSTUB -dir $LDDIRECTORY -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${12},${13},${15},1,2,${16} > ${LOG_FILE}-21.log 2>&1
            if  [ -e ${16} ]; then
                exit
            fi
        fi

##      INI�ե����� ���
        rm -f ${INIFILE}
        
	$DBSTUB  -dir $LDDIRECTORY -bd orcabt ORCBJOB -parameter JBE${12}${13},${15}
