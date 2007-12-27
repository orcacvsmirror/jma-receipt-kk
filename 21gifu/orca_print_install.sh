#!/bin/bash

. /etc/jma-receipt/jma-receipt.env

usrname=`whoami`

# user check
if [ $usrname != "root" ] ; then
  echo -e "\nroot�桼���Ǽ¹Ԥ��Ƥ�������\n"
  exit 1
fi

echo "���츩�����ɽ����������˥ץ���ॳ�ԡ���..."

# file copy
for d in cobol doc data form lddef record scripts ; do
  cp -af ${d} ${SITESRCDIR}
done

# kentan.inc copy
cp ${SYSCONFDIR}/kentan.inc ${SYSCONFDIR}/kentan.inc.bak
sed '/gifu/d' ${SYSCONFDIR}/kentan.inc.bak > ${SYSCONFDIR}/kentan.inc
rm -rf ${SYSCONFDIR}/kentan.inc.bak
echo -e "\tgifu;" >> ${SYSCONFDIR}/kentan.inc

# site-upgrade.sh run
if [ -f ${SCRIPTSDIR}/allways/site-upgrade.sh ] ; then
	sh ${SCRIPTSDIR}/allways/site-upgrade.sh
else
	echo "���츩�����ɽ����������˥ץ���ॳ�ԡ��۾ｪλ!!"
	exit
fi

# ???
cp -af ${SITELDDEFDIR} ${ORCA_DIR}

sync
echo "���츩�����ɽ����������˥ץ���ॳ�ԡ���λ!!"
