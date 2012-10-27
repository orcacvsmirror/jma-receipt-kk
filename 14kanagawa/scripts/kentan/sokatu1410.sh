#!/bin/bash
. @jma-receipt-env@

PREFNAME=kanagawa
PROGRAMID=SOKATU1410
LOG_FILE="/var/log/jma-receipt/${15}sokatu1410"
RENNUM=0
YUSEN="select option from tbl_prgoption where hospnum=${15} and prgid='${PROGRAMID}' and kbncd='YUSEN';"
YUSENINI=/tmp/${15}${PROGRAMID}YUSEN.INI
TAISYOKOHI="select option from tbl_prgoption where hospnum=${15} and prgid='${PROGRAMID}' and kbncd='TAISYOKOHI';"
TAISYOKOHIINI=/tmp/${15}${PROGRAMID}TAISYOKOHI.INI
-------------------------------------------#
#    ���ݡ������������ʿ������
#        $1-${11}
#              �����ģ�����������(CPORCSRTLNK.INC)
#        ${12} ����֣ɣ�
#        ${13} ������ɣ�
#        ${14} ����ɽ�μ���
#           0:����  1:���ݡ�2:����
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
        
##	YUSEN.INI,TAISYOKOHI.INI ����
	echo "${YUSEN}" | psql -At ${DBNAME} > ${YUSENINI}
	echo "${TAISYOKOHI}" | psql -At ${DBNAME} > ${TAISYOKOHIINI}

##      ����ʬ
        if  [ ${19} -eq '0' ] || [ ${19} -eq '2' ]; then
            RENNUM=$(expr $RENNUM + 1) 
            $DBSTUB -dir $LDDEFDIR/directory -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${15},${12},${13},${18},2,1,${16} > ${LOG_FILE}-2.log 2>&1
            if  [ -e ${16} ]; then
                exit
            fi
        fi
##      ������٤�ʬ
        if  [ ${19} -eq '0' ] || [ ${19} -eq '1' ]; then
            RENNUM=$(expr $RENNUM + 1) 
            $DBSTUB -dir $LDDEFDIR/directory -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${15},${12},${13},${18},1,1,${16} > ${LOG_FILE}-1.log 2>&1
            if  [ -e ${16} ]; then
                exit
            fi
        fi
##      ����ʬ������������ʬ��
        if  [ ${19} -eq '0' ] || [ ${19} -eq '2' ]; then
            RENNUM=$(expr $RENNUM + 1) 
            $DBSTUB -dir $LDDEFDIR/directory -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${15},${12},${13},${18},2,2,${16} > ${LOG_FILE}-22.log 2>&1
            if  [ -e ${16} ]; then
                exit
            fi
        fi
##      ������٤�ʬ������������ʬ��
        if  [ ${19} -eq '0' ] || [ ${19} -eq '1' ]; then
            RENNUM=$(expr $RENNUM + 1) 
            $DBSTUB -dir $LDDEFDIR/directory -bd $PREFNAME $PROGRAMID -parameter $1,$2,$3,$RENNUM,$5,$6,$7,$8,$9,${10},${11},${15},${12},${13},${18},1,2,${16} > ${LOG_FILE}-21.log 2>&1
            if  [ -e ${16} ]; then
                exit
            fi
        fi
        
##	YUSEN.INI,TAISYOKOHI ���
	rm -f ${YUSENINI}
	rm -f ${TAISYOKOHIINI}

	$DBSTUB  -dir $LDDEFDIR/directory -bd orcabt ORCBJOB -parameter JBE${12}${13},${15}

