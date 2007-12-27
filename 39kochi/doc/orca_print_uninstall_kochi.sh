#!/bin/sh

. /etc/jma-receipt/jma-receipt.env

prefno=39
prefname=kochi

usrname=`whoami`

# user check
if [ ${usrname} != "root" ] ; then
  echo -e "\nrootユーザで実行してください\n"
  exit 1
fi

echo "高知県(総括表・地方公費)アンインストール中..."

cp ${SYSCONFDIR}/kentan.inc ${SYSCONFDIR}/kentan.inc.bak
sed '/kochi/d' ${SYSCONFDIR}/kentan.inc.bak > ${SYSCONFDIR}/kentan.inc
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


echo "高知県(総括表・地方公費)アンインストール終了！！"

