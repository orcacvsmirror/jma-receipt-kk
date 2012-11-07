#!/bin/bash

. /etc/jma-receipt/jma-receipt.env

usrname=`whoami`

# Etch�ǻ��Ѥ��륳����UTF-8�ؤ��Ѵ�
# echo message (default character-code EUC)
function echomsg() {
  if [ "${LANG}" = "ja_JP.UTF-8" ] || [ "${LANG}" = "ja_JP.UTF8" ] ||
      [ "${LANG}" = "ja_JP.utf8" ]; then
    if [ -z $2 ]; then
      echo `echo $1 | nkf -wE`
    else
      echo -n `echo $1 | nkf -wE`
    fi 
  else
    if [ -z $2 ]; then
      echo $1
    else
      echo -n $1
    fi
  fi
  return 0
}

# user check
if [ $usrname != "root" ] ; then
  echomsg "root�桼���Ǽ¹Ԥ��Ƥ�������"
  exit 1
fi

echomsg "�̳�ƻ�����ɽ����������˥ץ���ॳ�ԡ���..."

# file copy��form�ʳ���
for d in cobol doc data lddef record scripts ; do
  cp -af ${d} ${SITESRCDIR}
done

# form copy : *.red�ե������monpe-0.6.20��ver4.7.0�˰ʹߤ������å�
version=`grep "version" /usr/lib/jma-receipt/doc/version | cut -b 11-15`
if [ $version = "4.5.0" -o $version = "4.6.0" ] ; then
  for i in form/*-460.red ; do
    cp -af ${i} ${SITESRCDIR}/${i%%-460.red}.red
  done
else
  for i in form/*.red ; do
    if ! echo ${i} | grep -sq "460" ; then
      cp -af ${i} ${SITESRCDIR}/form
    fi
  done
fi

# kentan.inc copy
cp ${SYSCONFDIR}/kentan.inc ${SYSCONFDIR}/kentan.inc.bak
sed '/hokkaido/d' ${SYSCONFDIR}/kentan.inc.bak > ${SYSCONFDIR}/kentan.inc
rm -rf ${SYSCONFDIR}/kentan.inc.bak
echo -e "\thokkaido;" >> ${SYSCONFDIR}/kentan.inc

# site-upgrade.sh run
if [ -f ${SCRIPTSDIR}/allways/site-upgrade.sh ] ; then
	bash ${SCRIPTSDIR}/allways/site-upgrade.sh
else
	echomsg "�̳�ƻ�����ɽ����������˥ץ���ॳ�ԡ��۾ｪλ!!"
	exit
fi

sync
echomsg "�̳�ƻ�����ɽ����������˥ץ���ॳ�ԡ���λ!!"
