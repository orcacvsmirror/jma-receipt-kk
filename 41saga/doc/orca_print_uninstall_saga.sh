#!/bin/sh

. /etc/jma-receipt/jma-receipt.env

prefno=41
prefname=saga

usrname=`whoami`

# Etch�ǻ��Ѥ��륳����UTF-8�ؤ��Ѵ�
# echo message (default character-code EUC)
function echomsg() {
  if [ "${LANG}" = "ja_JP.UTF-8" ] || [ "${LANG}" = "ja_JP.UTF8" ]; then
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
if [ ${usrname} != "root" ] ; then
  echomsg "\nroot�桼���Ǽ¹Ԥ��Ƥ�������\n"
  exit 1
fi

echomsg "���츩(���ɽ����������)���󥤥󥹥ȡ�����..."

cp ${SYSCONFDIR}/kentan.inc ${SYSCONFDIR}/kentan.inc.bak
sed '/saga/d' ${SYSCONFDIR}/kentan.inc.bak > ${SYSCONFDIR}/kentan.inc
rm -rf ${SYSCONFDIR}/kentan.inc.bak


for f in ${SITESRCDIR}/cobol/SEIKYU${prefno}* ; do
  rm -rf $f
done

for f in ${SITESRCDIR}/cobol/SOKATU${prefno}* ; do
  rm -rf $f
done

for f in ${SITESRCDIR}/cobol/copy/*SKT${prefno}* ; do
  rm -rf $f
done

for f in ${SITESRCDIR}/cobol/copy/SC${prefno}* ; do
  rm -rf $f
done

for f in ${SITESRCDIR}/cobol/copy/SEI${prefno}* ; do
  rm -rf $f
done

for f in ${SITESRCDIR}/form/SC${prefno}* ; do
  rm -rf $f
done

for f in ${SITESRCDIR}/form/SKT${prefno}* ; do
  rm -rf $f
done

if test -f ${SITESRCDIR}/lddef/${prefname}.bd ; then
  rm -rf ${SITESRCDIR}/lddef/${prefname}.bd 
fi

for f in ${SITESRCDIR}/record/SC${prefno}* ; do
  rm -rf $f
done

for f in ${SITESRCDIR}/record/SKT${prefno}* ; do
  rm -rf $f
done

for f in ${SITESRCDIR}/scripts/kentan/seikyu${prefno}* ; do
  rm -rf $f
done

for f in ${SITESRCDIR}/scripts/kentan/sokatu${prefno}* ; do
  rm -rf $f
done


for f in ${SITELIBDIR}/SEIKYU${prefno}* ; do
  rm -rf $f
done

for f in ${SITELIBDIR}/SOKATU${prefno}* ; do
  rm -rf $f
done

for f in ${SITEFORMDIR}/SC${prefno}* ; do
  rm -rf $f
done

for f in ${SITEFORMDIR}/SKT${prefno}* ; do
  rm -rf $f
done

if test -f ${SITELDDEFDIR}/${prefname}.bd ; then
  rm -rf ${SITELDDEFDIR}/${prefname}.bd
fi

for f in ${SITERECORDDIR}/SC${prefno}* ; do
  rm -rf $f
done

for f in ${SITERECORDDIR}/SKT${prefno}* ; do
  rm -rf $f
done

for f in ${SITESCRIPTSDIR}/kentan/seikyu${prefno}* ; do
  rm -rf $f
done

for f in ${SITESCRIPTSDIR}/kentan/sokatu${prefno}* ; do
  rm -rf $f
done


if test -f ${LDDEFDIR}/${prefname}.bd ; then
  rm -rf ${LDDEFDIR}/${prefname}.bd
fi


echomsg "���츩(���ɽ����������)���󥤥󥹥ȡ��뽪λ����"

