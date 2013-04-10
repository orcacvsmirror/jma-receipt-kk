      *******************************************************************
      * Project code name "ORCA"
      * Æü°åÉ¸½à¥ì¥»¥×¥È¥½¥Õ¥È¡ÊJMA standard receipt software¡Ë
      * Copyright(C) 2002 JMA (Japan Medical Association)
      *
      * This program is part of "JMA standard receipt software".
      *
      *     This program is distributed in the hope that it will be useful
      * for further advancement in medical care, according to JMA Open
      * Source License, but WITHOUT ANY WARRANTY.
      *     Everyone is granted permission to use, copy, modify and
      * redistribute this program, but only under the conditions described
      * in the JMA Open Source License. You should have received a copy of
      * this license along with this program. If not, stop using this
      * program and contact JMA, 2-28-16 Honkomagome, Bunkyo-ku, Tokyo,
      * 113-8621, Japan.
      ********************************************************************
       IDENTIFICATION  DIVISION.
       PROGRAM-ID.     SEIKYU0611.
      *****************************************************************
      *  ¥·¥¹¥Æ¥àÌ¾        : £Ï£Ò£Ã£Á
      *  ¥µ¥Ö¥·¥¹¥Æ¥àÌ¾    : ÃÏÊý¸øÈñ
      *  ¥³¥ó¥Ý¡¼¥Í¥ó¥ÈÌ¾  : »³·Á¡¦Ê¡»ã°åÎÅÈñ£Ã£Ó£Ö
      *                      (182,282,183,283,184)
      *  ´ÉÍý¼Ô            : 
      *  ºîÀ®ÆüÉÕ    ºî¶È¼Ô        µ­½Ò
      *  13/02/14    µÈÀî          ¿·µ¬ºîÀ®
      *****************************************************************
      *  ¥×¥í¥°¥é¥à½¤ÀµÍúÎò
      * Maj/Min/Rev  ½¤Àµ¼Ô  ÆüÉÕ        ÆâÍÆ
      *  01.00.13    µÈÀî    13/04/03    ¸øÈñÍó¡Ý°ìÉôÉéÃ´¶â¶â³ÛÃÖ´¹ÂÐ±þ
      *****************************************************************
      *
       ENVIRONMENT   DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT  SECTION.
       FILE-CONTROL.
      *
      *    ÀÁµá½ñÍÑ¥Õ¥¡¥¤¥ë
           SELECT  MF101-FILE   ASSIGN    MF101PARA
                               ORGANIZATION    IS  INDEXED
                               ACCESS  MODE    IS  DYNAMIC
                               RECORD  KEY     IS  MF101-KEY
                               FILE    STATUS  IS  STS-MF101.
      *
      *    È÷¹ÍÍó¥³¥á¥ó¥È¥Õ¥¡¥¤¥ë
           SELECT  COMMENT-FILE  ASSIGN FILE-NAME
                                 ORGANIZATION   IS  LINE SEQUENTIAL
                                 ACCESS MODE    IS  SEQUENTIAL
                                 FILE   STATUS  IS  STS-COMMENT.
      *
006900*    ¥¨¥é¡¼¥Õ¥¡¥¤¥ë
           SELECT  RECEERR-FILE ASSIGN  RECEERR
                                FILE    STATUS  IS  STS-RECEERR.
      *
       DATA  DIVISION.
       FILE  SECTION.
      *
      *
      *    ½¸·×¥Õ¥¡¥¤¥ë
       FD  MF101-FILE.
       01  MF101-REC.
           COPY  "SEI0609.INC".
      *
      *    È÷¹ÍÍó¥³¥á¥ó¥È¥Õ¥¡¥¤¥ë
       FD  COMMENT-FILE.
       01  COMMENT-REC.
           03  COMMENT-COMMENTKBN  PIC X(02).
           03  FILLER              PIC X(01).
           03  COMMENT-COMMENTCD   PIC X(09).
           03  FILLER              PIC X(01).
      *
006900*    ¥¨¥é¡¼¥Õ¥¡¥¤¥ë
       FD  RECEERR-FILE.
       01  RECEERR-REC  PIC X(200).
      *
       WORKING-STORAGE  SECTION.
      *
           COPY  "CPCOMMONDAT2.INC"
                   REPLACING  //RECE01//
                   BY         //MF101//.
      *
      *    ¥¨¥é¡¼¥Õ¥¡¥¤¥ë Ì¾¾ÎÎÎ°è
           COPY    "CPERRFL.INC"    REPLACING  //ERRFLPARA//
                                    BY         //RECEERR//.
      *
      *    ¥¹¥ÑÎÎ°è
       01  STS-AREA.
           03  STS-MF101             PIC X(02).
           03  STS-RECE02            PIC X(02).
           03  STS-RECEERR           PIC X(02).
           03  STS-RECE              PIC X(02).
           03  STS-COMMENT           PIC X(02).
      *
      *    ¥Õ¥é¥°ÎÎ°è
       01  FLG-AREA.
           03  FLG-PTINF             PIC 9(01).
           03  FLG-END               PIC 9(01).
           03  FLG-MF101             PIC 9(01).
           03  FLG-PRINT             PIC 9(01).
           03  FLG-SYSKANRI          PIC 9(01).
           03  FLG-SYSKANRI3         PIC 9(01).
           03  FLG-ERR               PIC 9(01).
           03  FLG-SYUNOU            PIC 9(01).
           03  FLG-SRYACT            PIC 9(01).
           03  FLG-RECE10            PIC 9(01).
           03  FLG-PTKOHINF          PIC 9(01).
           03  FLG-HKNCOMBI          PIC 9(01).
           03  FLG-TSYRRK            PIC 9(01).
           03  FLG-TNKRRK            PIC 9(01).
           03  FLG-TENSU             PIC 9(01).
           03  FLG-PTKOHFTN          PIC 9(01).
           03  FLG-BTPARA            PIC 9(01).
           03  FLG-SYORI             PIC 9(01).
           03  FLG-COMMENT           PIC 9(01).
           03  FLG-MOJI              PIC 9(01).
      *=== ¸øÈñÍó¡Ý°ìÉôÉéÃ´¶â¶â³ÛÃÖ´¹ÂÐ±þ by Yoshikawa(2013/04/03) start
           03  FLG-PTCOM             PIC 9(01).
      *=== ¸øÈñÍó¡Ý°ìÉôÉéÃ´¶â¶â³ÛÃÖ´¹ÂÐ±þ by Yoshikawa(2013/04/03) end
      *
      *    Åº»úÎÎ°è
       01  IDX-AREA.
           03  IDX                   PIC 9(04).
           03  IDXX                  PIC 9(04).
           03  IDX1                  PIC 9(04).
           03  IDX2                  PIC 9(04).
           03  IDX3                  PIC 9(04).
           03  IDX4                  PIC 9(04).
           03  IDY                   PIC 9(04).
           03  IDZ                   PIC 9(04).
           03  IDW                   PIC 9(04).
      *=== ¸øÈñÍó¡Ý°ìÉôÉéÃ´¶â¶â³ÛÃÖ´¹ÂÐ±þ by Yoshikawa(2013/04/03) start
           03  IDW1           PIC 9(04).
           03  IDW2           PIC 9(04).
      *=== ¸øÈñÍó¡Ý°ìÉôÉéÃ´¶â¶â³ÛÃÖ´¹ÂÐ±þ by Yoshikawa(2013/04/03) end
      *
      *    ¥Ñ¥é¥á¥¿ÎÎ°è
       01  WRK-PARA.
           COPY    "CPORCSPRTLNK.INC".
           03  WRK-PARA-JOBID        PIC 9(07).
           03  WRK-PARA-SHELLID      PIC X(08).
           03  WRK-PARA-HOSPNUM      PIC 9(02).
           03  WRK-PARA-PAGE         PIC 9(10).
           03  WRK-PARA-SYORIFLG     PIC X(01).
      *
      *    ´µ¼ÔÉÂÌ¾ÊÔ½¸ÍÑ¥Ñ¥é¥á¥¿ÎÎ°è
       01  WRK-PARA-LINK.
           05  WRK-PARA-LINK-SRYYM   PIC  X(06).
           05  WRK-PARA-LINK-TERMID  PIC  X(16).
           05  WRK-PARA-LINK-SYSYMD  PIC  X(08).
           05  WRK-PARA-LINK-JOBID   PIC  9(07).
           05  WRK-PARA-LINK-SHELLID PIC  X(08).
           05  WRK-PARA-LINK-HOSPNUM PIC  9(02). 
      *
      *    °ì»þÎÎ°è
       01  WRK-AREA.
           03  WRK-RECEERR           PIC  X(200).
           03  WRK-Z1                PIC Z.
           03  WRK-Z2                PIC ZZ.
           03  WRK-Z3                PIC ZZZ.
           03  WRK-Z5                PIC Z,ZZZ.
           03  WRK-Z6                PIC ZZ,ZZZ.
           03  WRK-Z7                PIC ZZZ,ZZZ.
           03  WRK-Z9                PIC Z,ZZZ,ZZZ.
           03  WRK-SRYYMWH           PIC X(16).
           03  WRK-SEIYMDWH          PIC X(22).
           03  WRK-HENYMDG           PIC X(22).
           03  WRK-SYMD.
               05  WRK-SYY           PIC 9(04).
               05  WRK-SMM           PIC 9(02).
               05  WRK-SDD           PIC 9(02).
           03  WRK-LASTYMD           PIC 9(08).
           03  WRK-NYMD.
               05  WRK-NYY           PIC 9(04).
               05  WRK-NMM           PIC 9(02).
               05  WRK-NDD           PIC 9(02).
           03  WRK-TYMD.
               05  WRK-TYY           PIC 9(04).
               05  WRK-TMM           PIC 9(02).
               05  WRK-TDD           PIC 9(02).
           03  WRK-WYMD.
               05  WRK-WGEN          PIC 9(01).
               05  WRK-WYY           PIC 9(02).
               05  WRK-WMM           PIC 9(02).
               05  WRK-WDD           PIC 9(02).
           03  WRK-HKNJANUM          PIC X(05).
           03  WRK-HKNJANUM2         PIC X(08).
           03  WRK-PRTID             PIC X(20).
           03  WRK-KOHNUM            PIC X(03).
           03  WRK-GKENSU            PIC 9(04).
           03  WRK-KOBETUCITYNUM     PIC X(03).
           03  WRK-BIKO              PIC X(40).
           03  WRK-COMMENT.
               05  WRK-COMMENTKBN    PIC X(02) OCCURS 5.
               05  WRK-COMMENTCD     PIC X(09) OCCURS 5.
      *
           03  FILE-NAME             PIC X(512).
      *    Ê¸»úÊÑ´¹
           03  WRK-MAE-INPUT         PIC X(200).
           03  WRK-OUT-INPUT         PIC X(200).
      *
           03  WRK-KOHID             PIC 9(10).
           03  WRK-FTNMONEY-G        PIC 9(08).
           03  WRK-ETC-TBL.
               05  WRK-ETC-KOHNUM    PIC X(03) OCCURS 2.
               05  WRK-ETC-TENSU     PIC 9(07) OCCURS 2.
               05  WRK-ETC-ITBFTN    PIC 9(07) OCCURS 2.
               05  WRK-ETC-FTNJANUM  PIC X(20).
               05  WRK-ETC-JKYSNUM   PIC X(20).
      *=== ¸øÈñÍó¡Ý°ìÉôÉéÃ´¶â¶â³ÛÃÖ´¹ÂÐ±þ by Yoshikawa(2013/04/03) start
           03  WRK-SRYCD             PIC X(09).
           03  WRK-INPUTCOMENT       PIC X(80).
           03  WRK-INPUTCOMENT2      PIC X(14).
           03  WRK-INPUTCOMENT-KIN-T.
               05  WRK-INPUTCOMENT-KIN     PIC 9(07).
           03  WRK-INPUTCOMENT-KIN2-T.
               05  WRK-INPUTCOMENT-KIN2    PIC X(07).
      *=== ¸øÈñÍó¡Ý°ìÉôÉéÃ´¶â¶â³ÛÃÖ´¹ÂÐ±þ by Yoshikawa(2013/04/03) end
      *
      *    ¥Ç¡¼¥¿ÊÔ½¸
           03  WRK-HENSHU.
               05  WRK-RATE          PIC 9(02).
               05  WRK-MOJIHEN       PIC 9(10).
      *
           03  WRK-REC               PIC X(500).
           03  WRK-REC-LENGTH        PIC 9(04).
           03  WRK-HENSYU-AREA.
               05  WRK-DATA          PIC X(100).
               05  WRK-NUM           PIC ZZZZZZZZZZ.999.
               05  WRK-NUM9          PIC 9999999999.999.
               05  WRK-NAGASA        PIC 9(04).
               05  WRK-ST            PIC 9(02).
               05  WRK-SYOSUU        PIC 9(01).
               05  WRK-END           PIC 9(01).
      *
           03  WRK-SCSVINFO-SEQ-NO   PIC 9(06).
           03  WRK-SCSVINFO-PTID     PIC 9(10).
           03  WRK-SCSVINFO-NYUGAIKBN    PIC X(01).
      *
           03  WRK-PATH              PIC X(50).
           03  WRK-FILENAME               PIC  X(40).
      *    °åÎÅµ¡´Ø¾ðÊó
           03  WRK-HOSPNAME          PIC X(100).
           03  WRK-HOSPNAME-R        REDEFINES   WRK-HOSPNAME.
               05  WRK-HOSPNAME1     PIC X(50).
               05  WRK-HOSPNAME2     PIC X(50).
           03  WRK-HOSPADRS          PIC X(100).
           03  WRK-HOSPADRS-R        REDEFINES   WRK-HOSPADRS.
               05  WRK-HOSPADRS1     PIC X(50).
               05  WRK-HOSPADRS2     PIC X(50).
           03  WRK-HOSPTEL           PIC X(15).
      *
      *    ¥ï¡¼¥¯¸øÈñ¥Æ¡¼¥Ö¥ë
       01  WRK-KOH-TBL-AREA.
           03  WRK-KOH-TBL  OCCURS 4.
               05  WRK-KOH-FTNJANUM    PIC X(08).
               05  WRK-KOH-JKYSNUM     PIC X(07).
               05  WRK-KOH-JNISSU      PIC 9(03).
               05  WRK-KOH-TOTALTEN    PIC 9(09).
               05  WRK-KOH-FTNMONEY    PIC 9(09).
               05  WRK-KOH-SHOKUJIINF.
                   07  WRK-KOH-SHOKUJINISSU    PIC 9(02).
                   07  WRK-KOH-SHOKUJIRYOYOHI  PIC 9(09).
                   07  WRK-KOH-SHOKUJIFTN      PIC 9(09).
      *     
      *    ¥«¥¦¥ó¥ÈÎÎ°è
       01  CNT-AREA.
           03  CNT-RECE02            PIC 9(06).
           03  CNT-MF101             PIC 9(06).
           03  CNT-PAGE              PIC 9(03).
           03  CNT-OUT               PIC 9(06).
      *
       01  TABLE-AREA.
           03  TBL-PARA-OCC    OCCURS  100.
               05  TBL-PARA-HKNJANUM    PIC X(08).
               05  TBL-PARA-PTID        PIC 9(10).
      *
       01  WRK-CONS-PARA-MAX   PIC 9(03)   VALUE   100.
      *
      *    DB»²¾ÈÍÑ
           COPY    "COMMON-SPA".
      *
      *    ¸ÇÄê¹àÌÜ
       01  WRK-CONS-AREA.
           03  WRK-CONS-SRYYM-200804  PIC X(06)   VALUE   "200804".
      *    ¥³¥ó¥Þ
           03  WRK-KUGIRI             PIC X(01)   VALUE   ",".
      *    ²þ¹Ô¥³¡¼¥É
           03  WRK-KAIGYO             PIC X(01)   VALUE   X"0D".
      *    EOF¥³¡¼¥É
           03  WRK-EOF                PIC X(01)   VALUE   X"1A".
      *=== ¸øÈñÍó¡Ý°ìÉôÉéÃ´¶â¶â³ÛÃÖ´¹ÂÐ±þ by Yoshikawa(2013/04/03) start
      *    ¸øÈñ°ìÉôÉéÃ´¶âÃÖ´¹¥³¡¼¥É
           03  WRK-CONS-KIN-OKIKAE     PIC X(09)   VALUE   "099999921".
      *=== ¸øÈñÍó¡Ý°ìÉôÉéÃ´¶â¶â³ÛÃÖ´¹ÂÐ±þ by Yoshikawa(2013/04/03) end
      *    
      *    ÆÃµ­»ö¹à
       01  TBL-TOKKI-AREA.
           03  FILLER          PIC X(02)   VALUE   "01".
           03  FILLER          PIC X(10)   VALUE   "£°£±¸ø".
           03  FILLER          PIC X(02)   VALUE   "02".
           03  FILLER          PIC X(10)   VALUE   "£°£²Ä¹".
           03  FILLER          PIC X(02)   VALUE   "03".
           03  FILLER          PIC X(10)   VALUE   "£°£³Ä¹½è".
           03  FILLER          PIC X(02)   VALUE   "04".
           03  FILLER          PIC X(10)   VALUE   "£°£´¸åÊÝ".
           03  FILLER          PIC X(02)   VALUE   "07".
           03  FILLER          PIC X(10)   VALUE   "£°£·Ï·Ê»".
           03  FILLER          PIC X(02)   VALUE   "08".
           03  FILLER          PIC X(10)   VALUE   "£°£¸Ï··ò".
           03  FILLER          PIC X(02)   VALUE   "09".
           03  FILLER          PIC X(10)   VALUE   "£°£¹»Ü".
           03  FILLER          PIC X(02)   VALUE   "10".
           03  FILLER          PIC X(10)   VALUE   "£±£°Âè»°".
           03  FILLER          PIC X(02)   VALUE   "11".
           03  FILLER          PIC X(10)   VALUE   "£±£±Ìô¼£".
           03  FILLER          PIC X(02)   VALUE   "12".
           03  FILLER          PIC X(10)   VALUE   "£±£²´ï¼£".
           03  FILLER          PIC X(02)   VALUE   "13".
           03  FILLER          PIC X(10)   VALUE   "£±£³Àè¿Ê".
           03  FILLER          PIC X(02)   VALUE   "14".
           03  FILLER          PIC X(10)   VALUE   "£±£´À©Ä¶".
           03  FILLER          PIC X(02)   VALUE   "15".
           03  FILLER          PIC X(10)   VALUE   "£±£µ·Ð²á".
           03  FILLER          PIC X(02)   VALUE   "16".
           03  FILLER          PIC X(10)   VALUE   "£±£¶Ä¹£²".
           03  FILLER          PIC X(02)   VALUE   "17".
           03  FILLER          PIC X(10)   VALUE   "£±£·¾å°Ì".
           03  FILLER          PIC X(02)   VALUE   "18".
           03  FILLER          PIC X(10)   VALUE   "£±£¸°ìÈÌ".
           03  FILLER          PIC X(02)   VALUE   "19".
           03  FILLER          PIC X(10)   VALUE   "£±£¹Äã½ê".
           03  FILLER          PIC X(02)   VALUE   "20".
           03  FILLER          PIC X(10)   VALUE   "£²£°Æó³ä".
           03  FILLER          PIC X(02)   VALUE   "21".
           03  FILLER          PIC X(10)   VALUE   "£²£±¹âÈ¾".
           03  FILLER          PIC X(02)   VALUE   "22".
           03  FILLER          PIC X(10)   VALUE   "£²£²Â¿¾å".
           03  FILLER          PIC X(02)   VALUE   "23".
           03  FILLER          PIC X(10)   VALUE   "£²£³Â¿°ì".
           03  FILLER          PIC X(02)   VALUE   "24".
           03  FILLER          PIC X(10)   VALUE   "£²£´Â¿Äã".
           03  FILLER          PIC X(02)   VALUE   "25".
           03  FILLER          PIC X(10)   VALUE   "£²£µ½Ð»º".
           03  FILLER          PIC X(02)   VALUE   "40".
           03  FILLER          PIC X(10)   VALUE   "50/100".
      *
       01  TBL-TOKKI-R         REDEFINES   TBL-TOKKI-AREA.
           03  TBL-TOKKI       OCCURS   24.
               05  TBL-TOKKICD             PIC X(02).
               05  TBL-TOKKINAME           PIC X(10).
       01  TBL-TOKKI-MAX                   PIC 9(02)   VALUE   24.
      *
      *****************************************************************
      *    ¥Õ¥¡¥¤¥ë¥ì¥¤¥¢¥¦¥È¡¡ÎÎ°è
      *****************************************************************
      *
      *    ¥·¥¹¥Æ¥à´ÉÍý¥Þ¥¹¥¿
           COPY    "CPSK1001.INC".
      *
           COPY    "CPSK2005.INC".
      *
      *    °åÎÅµ¡´Ø¾ðÊó¡Ý½êºßÃÏ¡¢Ï¢ÍíÀè
           COPY    "CPSK1002.INC".
      *
      *    ¿ÇÎÅ²ÊÌÜ¾ðÊó¾ðÊó
           COPY    "CPSK1005.INC".
      *
      *    °åÎÅµ¡´ØÊÔ½¸¾ðÊó
           COPY    "CPSK1900.INC".
      *
      *    °åÎÅµ¡´ØÌ¾¾ÎÊÔ½¸¾ðÊó
           COPY    "CPSK1901.INC".
      *
      *    °åÎÅµ¡´Ø½»½êÊÔ½¸¾ðÊó
           COPY    "CPSK1902.INC".
      *
      *    ¥¸¥ç¥Ö´ÉÍý¥Þ¥¹¥¿
       01  JOBKANRI-REC.
           COPY    "CPJOBKANRI.INC".
      *
      *    ¼ýÇ¼¾ðÊó
       01  SYUNOU-REC.
           COPY    "CPSYUNOU.INC".
      *
      *    ´µ¼Ô¸øÈñ¾ðÊó¥Þ¥¹¥¿
       01  PTKOHINF-REC.
           COPY    "CPPTKOHINF.INC".
      *
      *    ´µ¼Ô¸øÈñÉéÃ´¥Þ¥¹¥¿
       01  PTKOHFTN-REC.
           COPY    "CPPTKOHFTN.INC".
      *
      *    Äã½êÆÀ¾ðÊó
       01  TSYRRK-REC.
           COPY    "CPTSYRRK.INC".
      *
      *    ÄãÇ¯¶â¾ðÊó
       01  TNKRRK-REC.
           COPY    "CPTNKRRK.INC".
      *
      *    ¿ÇÎÅ¹Ô°Ù
       01  SRYACT-REC.
           COPY    "CPSRYACT.INC".
      *
      *    ÀÁµá´ÉÍý¾ðÊó
           COPY    "CPRCF010.INC".
      *
      *    ÅÀ¿ô
           COPY    "CPTENSU.INC".
      *
      *=== ¸øÈñÍó¡Ý°ìÉôÉéÃ´¶â¶â³ÛÃÖ´¹ÂÐ±þ by Yoshikawa(2013/04/03) start
      *    ´µ¼Ô¥³¥á¥ó¥È
       01  PTCOM-REC.
           COPY    "CPPTCOM.INC".
      *=== ¸øÈñÍó¡Ý°ìÉôÉéÃ´¶â¶â³ÛÃÖ´¹ÂÐ±þ by Yoshikawa(2013/04/03) end
      *
      *    ´µ¼Ô¾ðÊó
       01  PTINF-REC.
           COPY    "CPPTINF.INC".
      *
      *    ¸øÈñÀÁµá½ñ
           COPY    "CPKOHSKY.INC"
                   REPLACING  //KOHSKY//
                   BY         //RECE02//.
      *
      *    ÊÝ¸±ÁÈ¹ç¤»
       01  HKNCOMBI-REC.
           COPY    "CPHKNCOMBI.INC".
      *
      *    ¥Ñ¥é¥á¥¿
       01  BTPARA-REC.
           COPY    "CPBTPARA.INC".
      *
      *****************************************************************
      *    ¥µ¥Ö¥×¥íÍÑ¡¡ÎÎ°è
      *****************************************************************
      *
      *    ¥¸¥ç¥Ö´ÉÍý£Ä£ÂÀ©¸æ¥µ¥Ö
           COPY    "CPORCSJOBKANRI.INC".
      *
      *    È¾³Ñ¥Á¥§¥Ã¥¯¥µ¥Ö
           COPY    "CPORCSKANACHK.INC".
      *
      *    ¥Á¥§¥Ã¥¯¥Ç¥£¥¸¥Ã¥È¡Ê¥â¥¸¥å¥é¥¹£±£±ÍÑ¡Ë»»½Ð¥µ¥Ö
           COPY    "CPORCCHKDGT11.INC".
      *
      *    ¥Õ¥¡¥¤¥ë¥Ç¥£¥ì¥¯¥È¥ê°ÌÃÖ»ØÄê¥µ¥Ö
           COPY    "CPMKPASS.INC".
      *
      *    °õºþ£Ä£ÂÀ©¸æ¥µ¥Ö
           COPY    "CPORCSPRT.INC".
      *
      *    ¶¦ÄÌ¥Ñ¥é¥á¥¿
           COPY    "MCPAREA".
      *
      *    ÆüÉÕÊÑ´¹¥µ¥Ö
           COPY    "CPORCSDAY.INC".
           COPY    "CPORCSLNK.INC".      
      *
           COPY    "MCPDATA.INC".
      *
      *    ¥¯¥é¥¤¥¢¥ó¥ÈÊÝÂ¸£Ä£ÂÀ©¸æ¥µ¥Ö
           COPY    "CPORCSFILESV.INC".
      *
      *    £Ã£Ó£Ö´ÉÍý£Ä£ÂÀ©¸æ¥µ¥Ö
           COPY    "CPORCSCSVINFO.INC".
      *
      ****************************************************************
       LINKAGE  SECTION.
       01  COMMAND-PARAM.
           02  FILLER  PIC X(256).
      *****************************************************************
      *
       PROCEDURE  DIVISION
               USING COMMAND-PARAM.
      *
      *****************************************************************
      *    ¼ç¡¡¡¡½èÍý
      *****************************************************************
       000-PROC-SEC  SECTION.
      *
           PERFORM 100-INIT-SEC
      *
           PERFORM 200-MAIN-SEC
                   UNTIL  FLG-END = 1
      *
           PERFORM 300-END-SEC
      *
           STOP    RUN
           .
      *****************************************************************
      *    ½é´ü¡¡½èÍý
      *****************************************************************
       100-INIT-SEC  SECTION.
      *
           INITIALIZE  FLG-AREA
           INITIALIZE  STS-AREA
           INITIALIZE  WRK-AREA
           INITIALIZE  CNT-AREA
           INITIALIZE  SPA-AREA
      *
           DISPLAY "START"
           PERFORM 100-DBOPEN-SEC
      *
           UNSTRING   COMMAND-PARAM    DELIMITED  BY  ","
                                       INTO    LNK-PRTKANRI-RENNUM
                                               LNK-PRTKANRI-TBL-KEY
                                               LNK-PRTKANRI-TBL-GROUP
                                               LNK-PRTKANRI-SHORI-RENNUM
                                               LNK-PRTKANRI-SRYYM
                                               LNK-PRTKANRI-SKYYMD
                                               LNK-PRTKANRI-SHELLID
                                               LNK-PRTKANRI-PRIORITY
                                               LNK-PRTKANRI-TERMID
                                               LNK-PRTKANRI-OPID
                                               LNK-PRTKANRI-PRTNM
                                               WRK-PARA-JOBID
                                               WRK-PARA-SHELLID
                                               WRK-PARA-HOSPNUM
                                               WRK-PARA-SYORIFLG
                                               RECEERR
           END-UNSTRING
           MOVE    WRK-PARA-HOSPNUM    TO  SPA-HOSPNUM
      *
      *    ¥¹¥Æ¥Ã¥×³«»Ï½èÍý
           MOVE    "STS"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           MOVE    "SEIKYU0611"    TO  JOB-PGID
           MOVE    "Ê¡»ã°åÎÅÈñ£Ã£Ó£Ö" 
                                   TO  JOB-SHELLMSG
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA
                                   JOBKANRI-REC
                                   SPA-AREA
      *
      *    ÂÐ¾ÝÇ¯·îºÇ½ªÆü¼èÆÀ
           INITIALIZE  WRK-SYMD
           MOVE    LNK-PRTKANRI-SRYYM  TO    WRK-SYMD(1:6)
           PERFORM 31012-LASTDAY-GET-SEC
           MOVE    WRK-SYMD         TO    WRK-LASTYMD
      *
           MOVE    LNK-PRTKANRI-SRYYM  TO  WRK-SYMD (1:6)
           MOVE    "01"                TO  WRK-SYMD (7:2)
           PERFORM 31012-SEIWA-HEN-SEC
           MOVE    WRK-HENYMDG(1:16)   TO  WRK-SRYYMWH 
      *
           INITIALIZE                      STS-AREA-DAY
           INITIALIZE                      LNK-DAY2-AREA
           MOVE    "21"                TO  LNK-DAY2-IRAI
           MOVE    LNK-PRTKANRI-SKYYMD     TO  LNK-DAY2-YMD
           CALL    "ORCSDAY"           USING   STS-AREA-DAY
                                               LNK-DAY2-AREA
           IF      STS-DAY-RC1         =   ZERO 
                   MOVE    LNK-DAY2-EDTYMD3    TO  WRK-SEIYMDWH
           END-IF
      *
      *
           MOVE  "MF101ZZ"        TO  MF101PARA-FILE-ID
           MOVE  LNK-PRTKANRI-TERMID(1:16)  TO  MF101PARA-TERMID
           MOVE  WRK-PARA-HOSPNUM           TO  MF101PARA-HOSPNUM
      *
      *    °åÎÅµ¡´Ø£É£ÄÊÔ½¸
           INITIALIZE  SYS-1001-REC
           MOVE  "1001"        TO  SYS-1001-KANRICD
           MOVE  "*"           TO  SYS-1001-KBNCD
           MOVE  LNK-PRTKANRI-SRYYM(1:6)
                               TO  SYS-1001-STYUKYMD(1:6)
                                   SYS-1001-EDYUKYMD(1:6)
           MOVE  "01"          TO  SYS-1001-STYUKYMD(7:2)
                                   SYS-1001-EDYUKYMD(7:2)
           MOVE  SPA-HOSPNUM   TO  SYS-1001-HOSPNUM
           MOVE  SYS-1001-REC  TO  MCPDATA-REC
           PERFORM 800-SYSKANRI-READ-SEC
           IF  FLG-SYSKANRI  =  ZERO
             MOVE  MCPDATA-REC  TO  SYS-1001-REC
           ELSE
             DISPLAY "*** SEIKYU0611 SYS 1001 ERR ***"
             MOVE  1            TO  FLG-END
           END-IF
      *
      *    °åÎÅµ¡´Ø¾ðÊó¡Ý½êºßÃÏ¡¢Ï¢ÍíÀè
           INITIALIZE  SYS-1002-REC
           MOVE  "1002"        TO  SYS-1002-KANRICD
           MOVE  "*"           TO  SYS-1002-KBNCD
           MOVE  LNK-PRTKANRI-SRYYM(1:6)
                               TO  SYS-1002-STYUKYMD(1:6)
                                   SYS-1002-EDYUKYMD(1:6)
           MOVE  "01"          TO  SYS-1002-STYUKYMD(7:2)
                                   SYS-1002-EDYUKYMD(7:2)
           MOVE  SPA-HOSPNUM   TO  SYS-1002-HOSPNUM
           MOVE  SYS-1002-REC  TO  MCPDATA-REC
           PERFORM 800-SYSKANRI-READ-SEC
           IF  FLG-SYSKANRI  =  ZERO
             MOVE  MCPDATA-REC  TO  SYS-1002-REC
           ELSE
             DISPLAY "*** SEIKYU0611 SYS 1002 ERR ***"
             MOVE  1            TO  FLG-END
           END-IF
      *
      *    ¥ì¥»¥×¥ÈÊÔ½¸¶èÊ¬¾ðÊó
           INITIALIZE                   SYS-2005-REC
           MOVE    "2005"           TO  SYS-2005-KANRICD
           MOVE    "*"              TO  SYS-2005-KBNCD
           MOVE  LNK-PRTKANRI-SRYYM(1:6)
                                    TO  SYS-2005-STYUKYMD(1:6)
                                        SYS-2005-EDYUKYMD(1:6)
           MOVE  "01"               TO  SYS-2005-STYUKYMD(7:2)
                                        SYS-2005-EDYUKYMD(7:2)
           MOVE  SPA-HOSPNUM        TO  SYS-2005-HOSPNUM
           MOVE  SYS-2005-REC       TO  MCPDATA-REC
           PERFORM 800-SYSKANRI-READ-SEC
           IF      FLG-SYSKANRI     =   ZERO
               MOVE    MCPDATA-REC      TO  SYS-2005-REC
           ELSE    
               MOVE    SPACE            TO  SYS-2005-REC
           END-IF
           IF      SYS-2005-BYOMEIHENKBN    =   SPACE
               MOVE    ZERO             TO  SYS-2005-BYOMEIHENKBN
           END-IF
           IF      SYS-2005-TENKIHENKBN     =   SPACE
               MOVE    ZERO             TO  SYS-2005-TENKIHENKBN
           END-IF
      *
           MOVE    SYS-1001-HOSPNAME   TO  WRK-HOSPNAME
           MOVE    SYS-1002-ADRS       TO  WRK-HOSPADRS
           MOVE    SYS-1002-TEL        TO  WRK-HOSPTEL
      *    °åÎÅµ¡´ØÊÔ½¸¾ðÊó
           PERFORM 900-1900-READ-SEC
      *
      *    ¥Ñ¥é¥á¥¿ÊÔ½¸½èÍý
           PERFORM 1001-PARA-HENSYU-SEC
      *
      *    INI¥Õ¥¡¥¤¥ë¸Æ¤Ó½Ð¤·
           PERFORM 110-INI-FILE-SEC
      *
           PERFORM 900-KOHSKY-START-SEC
           .
       100-INIT-EXT.
           EXIT.
      *
      *****************************************************************
      *    ¥Ñ¥é¥á¥¿ÊÔ½¸½èÍý
      *****************************************************************
       1001-PARA-HENSYU-SEC        SECTION.
      *
           MOVE    ZERO                    TO  IDXX
                                           FLG-SYORI
           INITIALIZE                      TABLE-AREA
      *
           IF      WRK-PARA-SYORIFLG   =   "1" 
               INITIALIZE                      BTPARA-REC
               MOVE    SPA-HOSPNUM         TO  BTPARA-HOSPNUM
               MOVE    WRK-PARA-SHELLID    TO  BTPARA-SHELLID
               MOVE    WRK-PARA-JOBID      TO  BTPARA-JOBID
               MOVE    BTPARA-REC          TO  MCPDATA-REC
               MOVE    "DBSELECT"          TO  MCP-FUNC
               MOVE    "tbl_btpara"        TO  MCP-TABLE
               MOVE    "key5"              TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"         USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
               IF      MCP-RC              =   ZERO
                   MOVE    "tbl_btpara"    TO  MCP-TABLE
                   MOVE    "key5"          TO  MCP-PATHNAME
                   PERFORM 900-BTPARA-READ-N-SEC
               ELSE
                   INITIALIZE                  BTPARA-REC
                   MOVE    1               TO  FLG-BTPARA
               END-IF
      *
               PERFORM     UNTIL   FLG-BTPARA  =   1
                   ADD     1                   TO  IDXX
                   IF      BTPARA-INFO-KBN     =   "1"
                     MOVE    1                 TO  FLG-SYORI
                     MOVE    BTPARA-INFO-PARA
                                       TO TBL-PARA-HKNJANUM(IDXX)
                   ELSE
                     MOVE    2                 TO  FLG-SYORI
                     MOVE    BTPARA-INFO-PTID
                                       TO TBL-PARA-PTID(IDXX)
                   END-IF
                   DISPLAY "¥Ñ¥é¥á¥¿¶èÊ¬=" BTPARA-INFO-KBN
                           "¥Ñ¥é¥á¥¿=" BTPARA-INFO-PARA
                           "ÊÝ¸±¼ÔÈÖ¹æ="   TBL-PARA-HKNJANUM(IDXX)
                           "´µ¼ÔÈÖ¹æ="     TBL-PARA-PTID(IDXX)
      *
                   MOVE    "tbl_btpara"    TO  MCP-TABLE
                   MOVE    "key5"          TO  MCP-PATHNAME
                   PERFORM 900-BTPARA-READ-N-SEC
               END-PERFORM
      *
               MOVE    "tbl_btpara"        TO  MCP-TABLE
               MOVE    "key5"              TO  MCP-PATHNAME
               MOVE    "DBCLOSECURSOR"     TO  MCP-FUNC
               CALL    "ORCDBMAIN"         USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *
               IF      IDXX            =   ZERO
                   MOVE    ZERO            TO  WRK-PARA-SYORIFLG
               END-IF
           END-IF 
           .
       1001-PARA-HENSYU-EXT.
           EXIT.
      *
      *****************************************************************
      *    INI¥Õ¥¡¥¤¥ëÆÉ¤ß¹þ¤ß½èÍý  
      *****************************************************************
       110-INI-FILE-SEC                SECTION.
      *
      *    È÷¹ÍÍó¥³¥á¥ó¥ÈÀßÄê¼èÆÀ
      *    ¥Õ¥¡¥¤¥ë¥Ç¥£¥ì¥¯¥È¥ê°ÌÃÖ»ØÄê
           INITIALIZE           ORCSMKPASSAREA
           MOVE  "data/COMMENT.INI"    TO  MKPASS-IN-01
           CALL  "ORCSMKPASSSITE"  USING  ORCSMKPASSAREA
           MOVE  MKPASS-OT-01  TO  FILE-NAME
      *
           DISPLAY "¥Õ¥¡¥¤¥ëÌ¾="  FILE-NAME
      *
           INITIALIZE   COMMENT-REC
                        WRK-COMMENT
      *
           OPEN  INPUT  COMMENT-FILE
      *
           PERFORM VARYING  IDX  FROM  1  BY  1
                   UNTIL    IDX  >  5
             READ COMMENT-FILE NEXT
               AT END
                 MOVE  1                 TO  FLG-COMMENT
               NOT AT END
                 IF  COMMENT-COMMENTKBN  =  "¢¨"
                   CONTINUE
                 ELSE
                   MOVE  COMMENT-COMMENTKBN TO  WRK-COMMENTKBN(IDX)
                   MOVE  COMMENT-COMMENTCD  TO  WRK-COMMENTCD(IDX)
                   DISPLAY "ÆÉ¤ß¹þ¤ß¥ì¥³¡¼¥É=" COMMENT-REC
                 END-IF
             END-READ
           END-PERFORM
      *
           CLOSE COMMENT-FILE
      *
           .
       110-INI-FILE-EXT.
           EXIT.
      *****************************************************************
      *    ¼ç¡¡¡¡½èÍý
      *****************************************************************
       200-MAIN-SEC  SECTION.
      *
           OPEN     OUTPUT  MF101-FILE
           CLOSE            MF101-FILE
           OPEN     I-O     MF101-FILE
      *
           MOVE     ZERO    TO      FLG-END
      *
           PERFORM  2001-SYUKEI-SEC
                    UNTIL   FLG-END   =   1
      *
           CLOSE   MF101-FILE
      *
           IF       CNT-RECE02   >       0
      *       £Ã£Ó£Ö¥Õ¥¡¥¤¥ë½ÐÎÏ
                    PERFORM   2002-PRINT-SEC
           END-IF
           MOVE   1   TO   FLG-END
      *
           .
       200-MAIN-EXT.
           EXIT.
      *
      *****************************************************************
      *    ½¸·×½èÍý
      *****************************************************************
       2001-SYUKEI-SEC  SECTION.
      *
           PERFORM  VARYING  IDZ  FROM  1  BY  1
                    UNTIL    IDZ  >     4
             IF  RECE02-KOHNUM (IDZ) = "181" OR "182" OR "183" OR
                                       "184" OR "185"
               PERFORM 20011-SYUKEI-SEC
             END-IF
           END-PERFORM
      *
           PERFORM  900-KOHSKY-READ-SEC
      *
           .
       2001-SYUKEI-EXT.
           EXIT.
      **
      *****************************************************************
      *    ½¸·×½èÍý£²
      *****************************************************************
       20011-SYUKEI-SEC  SECTION.
      *
      *    TMP-FILE ¥­¡¼¥»¥Ã¥È
      *
           INITIALIZE       MF101-REC
      *
           MOVE  SPA-HOSPNUM               TO  MF101-HOSPNUM
           MOVE  RECE02-PTNUM              TO  MF101-PTNUM
           MOVE  RECE02-RECEKA             TO  MF101-SRYKA
           MOVE  RECE02-HKNJANUM-KEY       TO  MF101-HKNJANUM-KEY
           MOVE  RECE02-TEKSTYMD           TO  MF101-TEKSTYMD
           MOVE  RECE02-NYUGAIKBN          TO  MF101-NYUGAIKBN
           MOVE  RECE02-SRYYM              TO  MF101-SRYYM
           MOVE  RECE02-TEISYUTUSAKI       TO  MF101-TEISYUTUSAKI
           MOVE  RECE02-RECESYUBETU        TO  MF101-RECESYUBETU
           MOVE  RECE02-HOJOKBN-KEY        TO  MF101-HOJOKBN-KEY
      *
           MOVE  RECE02-PTID               TO  MF101-PTID
           MOVE  RECE02-NAME               TO  MF101-NAME
           MOVE  RECE02-KANANAME           TO  MF101-KANANAME
           MOVE  RECE02-BIRTHDAY           TO  MF101-BIRTHDAY
           MOVE  RECE02-SEX                TO  MF101-SEX
           MOVE  RECE02-AGE                TO  MF101-AGE
           MOVE  RECE02-HKN                TO  MF101-HKN
           MOVE  RECE02-RJNHKN             TO  MF101-RJNHKN
           MOVE  RECE02-ZAITAKU            TO  MF101-ZAI
      *
           MOVE  RECE02-KOHFTNJANUM (IDZ)  TO  MF101-FTNJANUM
           MOVE  RECE02-KOHINF      (IDZ)  TO  MF101-KOHINF
           COMPUTE  IDY  =  IDZ  +  1
           MOVE  RECE02-JNISSU      (IDY)  TO  MF101-JNISSU
           MOVE  RECE02-FTNMONEY    (IDY)  TO  MF101-FTNMONEY2
           MOVE  RECE02-TOTALTEN    (IDY)  TO  MF101-TOTALTEN
           MOVE  RECE02-SHOKUJIINF  (IDY)  TO  MF101-SHOKUJIINF
      *     MOVE  RECE02-SHOKUJIINF(1)      TO  MF101-SHOKUJIINF-G
      *
      *    ¸ÄÊÌÈ¯¹ÔÍÑ»ÔÄ®Â¼ÈÖ¹æ
           MOVE  RECE02-KOHFTNJANUM(IDZ)(5:3)    TO  WRK-KOBETUCITYNUM
      *
      *    ÀÁµá´ÉÍý¾ðÊóÆÉ¹þ
           PERFORM  900-SEIKYU-READ-SEC
           MOVE  RECE10-JNISSU(1)          TO  MF101-JNISSU-G 
           MOVE  RECE10-FTNMONEY(1)        TO  MF101-FTNMONEY-G
           MOVE  RECE10-TOTALTEN(1)        TO  MF101-TOTALTEN-G
           MOVE  RECE10-SHOKUJIINF(1)      TO  MF101-SHOKUJIINF-G
      *
      *    ÀÁµá´ÉÍý¾ðÊó¤è¤ê¡¢Â¾¸øÈñ¾ðÊó¼èÆÀ
           IF       IDZ           =     1
           AND      RECE02-KOHNUM(IDZ + 1)  =  SPACE
              IF  RECE10-KOHNUM(1)  NOT =  SPACE
              OR  RECE10-KOHNUM(2)  NOT =  SPACE
                MOVE   RECE10-TOTALTEN(1)         TO  MF101-TOTALTEN
              END-IF
             PERFORM  VARYING  IDX  FROM  1  BY  1
                      UNTIL    IDX  >     2  OR
                      RECE10-KOHNUM(IDX)  =  SPACE
               MOVE    RECE10-JNISSU(IDX + 1)     TO  MF101-ENISSU(IDX)
               MOVE    RECE10-TOTALTEN(IDX + 1)   TO  MF101-ETENSU(IDX)
               MOVE    RECE10-FTNMONEY(IDX + 1)   TO  MF101-EITBFTN(IDX)
               MOVE    RECE10-KOHNUM(IDX)         TO  WRK-KOHNUM
               MOVE    RECE10-SHOKUJIINF(IDX + 1)
                                           TO  MF101-ESHOKUJIINF(IDX)
               PERFORM 930-PTKOHINF-SET-SEC
               MOVE    WRK-ETC-FTNJANUM    TO  MF101-EKOHFTNJANUM(IDX)
               MOVE    WRK-ETC-JKYSNUM     TO  MF101-EKOHJKYSNUM(IDX)
      *    ÅÀ¿ô¤ÈÆü¿ô¤ÏÃÏÊý¸øÈñ¤ÈÆ±¤¸ÃÍ¤Î»þ¤Ïµ­ºÜ¤ò¾ÊÎ¬¤¹¤ë
      *         IF      MF101-ENISSU(IDX)           =  MF101-JNISSU
      *           MOVE  ZERO                       TO  MF101-ENISSU(IDX)
      *         END-IF
      *         IF      MF101-ETENSU(IDX)           =  MF101-TOTALTEN
      *           MOVE  ZERO                       TO  MF101-ETENSU(IDX)
      *         END-IF
             END-PERFORM
      *      ÆÃµ­»ö¹à
             PERFORM  VARYING  IDX  FROM  1  BY  1
                      UNTIL    IDX  >     5
                 IF   RECE10-TOKKI(IDX)  NOT =  SPACE
                   MOVE  RECE10-TOKKI(IDX)  TO  MF101-TOKKI(IDX)
                 END-IF
             END-PERFORM
           END-IF
      *
      *    ½õÀ®È½ÄêµÚ¤Ó¡¢·îÅÓÃæ¤Ç¸øÈñ¤òÀÚÂØ¤¨¤¿»þ¤ÎÁ´¹ñ¸øÈñÊ¬¤Î¥Ç¡¼¥¿½¸·×
           MOVE     MF101-KOHNUM           TO  WRK-KOHNUM
           MOVE     MF101-KOHID            TO  WRK-KOHID
           MOVE     1                      TO  FLG-ERR
           MOVE     ZERO                   TO  WRK-FTNMONEY-G
           INITIALIZE                          WRK-ETC-TBL
           IF      RECE02-NYUGAIKBN    =   "1"
               MOVE    "key33"        TO  WRK-PATH
           ELSE
               MOVE    "key25"        TO  WRK-PATH
           END-IF
           DISPLAY  "¼ýÇ¼ÆÉ¤ß¹þ¤ß³«»Ï"
           PERFORM  920-SYUNOU-SET-SEC
           IF       IDZ           =     1
           AND      RECE02-KOHNUM(IDZ + 1)  =  SPACE
             DISPLAY "ÀÁµá´ÉÍý¤«¤é¸øÈñ¾ðÊó¼èÆÀºÑ¤ß" RECE02-PTNUM
           ELSE
             DISPLAY  "´µ¼ÔÈÖ¹æ=" RECE02-PTNUM
                      "¤½¤ÎÂ¾¸øÈñ=" WRK-ETC-KOHNUM(1)
             IF  WRK-ETC-KOHNUM(1)     NOT  =  SPACE
               DISPLAY "¤½¤ÎÂ¾¸øÈñÈÖ¹æ=" WRK-ETC-KOHNUM(1)
                       ","               WRK-ETC-KOHNUM(2)
               IF      WRK-ETC-KOHNUM(2)    =  SPACE  OR
                       WRK-ETC-KOHNUM(2)    >  WRK-ETC-KOHNUM(1)
                 MOVE  1                   TO  IDX
                 MOVE  2                   TO  IDY
               ELSE
                 MOVE  2                   TO  IDX
                 MOVE  1                   TO  IDY
               END-IF
               MOVE    WRK-ETC-KOHNUM(1)   TO  WRK-KOHNUM
               PERFORM 930-PTKOHINF-SET-SEC
               MOVE    WRK-ETC-TENSU(1)    TO  MF101-ETENSU(IDX)
               MOVE    WRK-ETC-ITBFTN(1)   TO  MF101-EITBFTN(IDX)
               MOVE    WRK-ETC-FTNJANUM    TO  MF101-EKOHFTNJANUM(IDX)
               MOVE    WRK-ETC-JKYSNUM     TO  MF101-EKOHJKYSNUM(IDX)
               IF      WRK-ETC-KOHNUM(2)  NOT  =  SPACE
                 MOVE    WRK-ETC-KOHNUM(2)   TO  WRK-KOHNUM
                 PERFORM 930-PTKOHINF-SET-SEC
                 MOVE    WRK-ETC-TENSU(2)  TO  MF101-ETENSU(IDY)
                 MOVE    WRK-ETC-ITBFTN(2) TO  MF101-EITBFTN(IDY)
                 MOVE    WRK-ETC-FTNJANUM  TO  MF101-EKOHFTNJANUM(IDY)
                 MOVE    WRK-ETC-JKYSNUM   TO  MF101-EKOHJKYSNUM(IDY)
               END-IF
      *    ÅÀ¿ô¤ÏÃÏÊý¸øÈñ¤ÈÆ±¤¸ÃÍ¤Î»þ¤Ïµ­ºÜ¤ò¾ÊÎ¬¤¹¤ë
               IF      MF101-ETENSU(1)      =  MF101-TOTALTEN
                 MOVE  ZERO                TO  MF101-ETENSU(1)
               END-IF
               IF      MF101-ETENSU(2)      =  MF101-TOTALTEN
                 MOVE  ZERO                TO  MF101-ETENSU(2)
               END-IF
             END-IF
           END-IF
      *
           IF  RECE02-FTNMONEY(1)          >   ZERO  AND
               RECE02-FTNMONEY(1)          <   WRK-FTNMONEY-G
             MOVE  RECE02-FTNMONEY(1)      TO  WRK-FTNMONEY-G
           END-IF
           MOVE  WRK-FTNMONEY-G            TO  MF101-FTNMONEY
      *
      *    ¸øÈñµëÉÕÂÐ¾Ý°ìÉôÉéÃ´¶â
           MOVE    RECE02-ZAITAKU-SAIKEI   TO  MF101-FTNMONEYSAI(1)
      *    
      *    ÊÝ¸±¼ÔÈÖ¹æ¥Á¥§¥Ã¥¯½èÍý
           PERFORM 200111-HKNJANUM-CHK-SEC
      *
      *    ¸ºÌÈ¶èÊ¬¥Á¥§¥Ã¥¯
           PERFORM 200112-GENMEN-CHK-SEC
      *    ¸ºÌÈ³ä¹ç¡¢¶â³Û¼èÆÀ
           EVALUATE  MF101-GENMEN
           WHEN  1
      *      ¸ºÌÈ¡Ê³ä¡Ë
             PERFORM  930-PTKOHFTN-READ-SEC
             IF  MF101-NYUGAIKBN  =  "1"
               MOVE    PTKOHFTN-NYUJGNGAK  TO  MF101-GENMENWARI
             ELSE
               MOVE    PTKOHFTN-GAIJGNGAK  TO  MF101-GENMENWARI
             END-IF
           WHEN  2
      *      ¸ºÌÈ¡Ê³Û¡Ë
             PERFORM  930-PTKOHFTN-READ-SEC
             IF  MF101-NYUGAIKBN  =  "1"
               MOVE    PTKOHFTN-NYUJGNGAK  TO  MF101-GENMENGK
             ELSE
               MOVE    PTKOHFTN-GAIJGNGAK  TO  MF101-GENMENGK
             END-IF
           END-EVALUATE
      *
      *    Äã½êÆÀ¥Á¥§¥Ã¥¯
           PERFORM 200113-TEISHO-CHK-SEC
      *    ÄãÇ¯¶â¥Á¥§¥Ã¥¯
           IF  MF101-TEISHO  =  ZERO
               PERFORM 200114-TEINEN-CHK-SEC
           END-IF
      *
      *    ¥³¥á¥ó¥È¥Á¥§¥Ã¥¯
           PERFORM  940-SRYACT-SET-SEC
      *
      *=== ¸øÈñÍó¡Ý°ìÉôÉéÃ´¶â¶â³ÛÃÖ´¹ÂÐ±þ by Yoshikawa(2013/04/03) start
      *    ¿ÇÎÅ¹Ô°Ù¾ðÊó¼èÆÀ
           MOVE    WRK-CONS-KIN-OKIKAE     TO  WRK-SRYCD
           PERFORM 940-SRYACT2-SET-SEC
           IF  FLG-SRYACT  =  ZERO
      *      ¸øÈñ¡Ý°ìÉôÉéÃ´¶âÃÖ´¹ÊÔ½¸
             PERFORM  200115-ICHIBUFTN-HENSYU-SEC
           END-IF
      *=== ¸øÈñÍó¡Ý°ìÉôÉéÃ´¶â¶â³ÛÃÖ´¹ÂÐ±þ by Yoshikawa(2013/04/03) end
      *
           IF     FLG-ERR         =     1
             DISPLAY "½õÀ®ÂÐ¾Ý³°="  RECE02-PTNUM
           ELSE
             WRITE  MF101-REC
             ADD  1  TO  CNT-MF101
           END-IF
      *
      *
           .
       20011-SYUKEI-EXT.
           EXIT.
      *
      *****************************************************************
      *    ¸ÄÊÌÈ¯¹Ô»þ¤ÎÊÝ¸±¼ÔÈÖ¹æ(»ÔÄ®Â¼ÈÖ¹æ)¥Á¥§¥Ã¥¯½èÍý
      *****************************************************************
       200111-HKNJANUM-CHK-SEC                SECTION.
      *
           INITIALIZE      WRK-HKNJANUM
           MOVE    "06"                     TO  WRK-HKNJANUM(1:2)
           MOVE    WRK-KOBETUCITYNUM(1:3)   TO  WRK-HKNJANUM(3:3)
      *
           IF  WRK-PARA-SYORIFLG       =   "1"
               AND FLG-SYORI           =    1
               AND FLG-ERR             =   ZERO
      *
               DISPLAY "´µ¼ÔÈÖ¹æ = "  RECE02-PTNUM
               DISPLAY "¥Á¥§¥Ã¥¯ÍÑÊÝ¸±¼ÔÈÖ¹æ="  WRK-HKNJANUM
               MOVE    1       TO      FLG-ERR
               PERFORM VARYING IDXX    FROM    1   BY  1
                       UNTIL   IDXX    >   WRK-CONS-PARA-MAX
                       OR      TBL-PARA-HKNJANUM(IDXX)  =   SPACE
                   IF      WRK-HKNJANUM(1:5)
                                   =   TBL-PARA-HKNJANUM(IDXX)(1:5)
                       MOVE    ZERO                TO  FLG-ERR
                       MOVE    WRK-CONS-PARA-MAX   TO  IDXX
                   END-IF
               END-PERFORM 
           END-IF
      *
           .
       200111-HKNJANUM-CHK-EXT.
           EXIT.
      *
      *****************************************************************
      *    ¸ºÌÈ¶èÊ¬¥Á¥§¥Ã¥¯½èÍý
      *****************************************************************
       200112-GENMEN-CHK-SEC                SECTION.
      *
           INITIALIZE                      PTKOHINF-REC
                                           FLG-PTKOHINF
           MOVE    SPA-HOSPNUM             TO  PTKOH-HOSPNUM
           MOVE    RECE02-PTID             TO  PTKOH-PTID
           MOVE    PTKOHINF-REC            TO  MCPDATA-REC
           MOVE    "DBSELECT"              TO  MCP-FUNC
           MOVE    "tbl_ptkohinf"      TO  MCP-TABLE
           MOVE    "key2"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
           IF      FLG-PTKOHINF        =   ZERO
               PERFORM  800-PTKOHINF-FETCH-SEC
      *
               PERFORM  UNTIL  FLG-PTKOHINF  =  1
                 IF  RECE02-SRYYM  >=  PTKOH-TEKSTYMD(1:6)  AND
                     RECE02-SRYYM  <=  PTKOH-TEKEDYMD(1:6)
                   IF  PTKOH-KOHNUM  =  "960" OR "961" OR "962" OR "963"
                     MOVE    1           TO  FLG-PTKOHINF
                     EVALUATE  PTKOH-KOHNUM
                       WHEN  "960"
                       WHEN  "961"
      *                  ¸ºÌÈ
                         MOVE    1           TO  MF101-GENMEN
                       WHEN  "962"
      *                  ÌÈ½ü
                         MOVE    2           TO  MF101-GENMEN
                       WHEN  "963"
      *                  Í±Í½
                         MOVE    3           TO  MF101-GENMEN
                     END-EVALUATE
                   END-IF
                 END-IF
                 PERFORM  800-PTKOHINF-FETCH-SEC
               END-PERFORM
           END-IF
      *
           MOVE    "DBCLOSECURSOR"         TO  MCP-FUNC
           MOVE    "tbl_ptkohinf"      TO  MCP-TABLE
           MOVE    "key2"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *
           .
       200112-GENMEN-CHK-EXT.
           EXIT.
      *
      *****************************************************************
      *    Äã½êÆÀ¥Á¥§¥Ã¥¯½èÍý
      *****************************************************************
       200113-TEISHO-CHK-SEC                SECTION.
      *
           INITIALIZE                      TSYRRK-REC
                                           FLG-TSYRRK
           MOVE    SPA-HOSPNUM             TO  TSYRRK-HOSPNUM
           MOVE    RECE02-PTID             TO  TSYRRK-PTID
           MOVE    TSYRRK-REC              TO  MCPDATA-REC
           MOVE    "DBSELECT"              TO  MCP-FUNC
           MOVE    "tbl_tsyrrk"        TO  MCP-TABLE
           MOVE    "key3"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
           IF      FLG-TSYRRK          =   ZERO
               PERFORM  800-TSYRRK-FETCH-SEC
      *
               PERFORM  UNTIL  FLG-TSYRRK  =  1
                 IF  RECE02-SRYYM  >=  TSYRRK-NINSTYMD(1:6)  AND
                     RECE02-SRYYM  <=  TSYRRK-NINEDYMD(1:6)
                   MOVE  1  TO  MF101-TEISHO
                   MOVE  1  TO  FLG-TSYRRK
                 END-IF
                 PERFORM  800-TSYRRK-FETCH-SEC
               END-PERFORM
           END-IF
      *
           MOVE    "DBCLOSECURSOR"         TO  MCP-FUNC
           MOVE    "tbl_tsyrrk"        TO  MCP-TABLE
           MOVE    "key3"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *
           .
       200113-TEISHO-CHK-EXT.
           EXIT.
      *****************************************************************
      *    ÄãÇ¯¶â¥Á¥§¥Ã¥¯½èÍý
      *****************************************************************
       200114-TEINEN-CHK-SEC                SECTION.
      *
           INITIALIZE                      TNKRRK-REC
                                           FLG-TNKRRK
           MOVE    SPA-HOSPNUM             TO  TNKRRK-HOSPNUM
           MOVE    RECE02-PTID             TO  TNKRRK-PTID
           MOVE    TNKRRK-REC              TO  MCPDATA-REC
           MOVE    "DBSELECT"              TO  MCP-FUNC
           MOVE    "tbl_tnkrrk"        TO  MCP-TABLE
           MOVE    "key3"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
           IF      FLG-TNKRRK          =   ZERO
               PERFORM  800-TNKRRK-FETCH-SEC
      *
               PERFORM  UNTIL  FLG-TNKRRK  =  1
                 IF  RECE02-SRYYM  >=  TNKRRK-STYMD(1:6)  AND
                     RECE02-SRYYM  <=  TNKRRK-EDYMD(1:6)
                   MOVE  1  TO  MF101-TEINEN
                   MOVE  1  TO  FLG-TNKRRK
                 END-IF
                 PERFORM  800-TNKRRK-FETCH-SEC
               END-PERFORM
           END-IF
      *
           MOVE    "DBCLOSECURSOR"         TO  MCP-FUNC
           MOVE    "tbl_tnkrrk"        TO  MCP-TABLE
           MOVE    "key3"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *
           .
       200114-TEINEN-CHK-EXT.
           EXIT.
      *=== ¸øÈñÍó¡Ý°ìÉôÉéÃ´¶â¶â³ÛÃÖ´¹ÂÐ±þ by Yoshikawa(2013/04/03) start
      *****************************************************************
      *    ¸øÈñÍó¡Ý°ìÉôÉéÃ´¶â¶â³ÛÊÔ½¸½èÍý
      *****************************************************************
       200115-ICHIBUFTN-HENSYU-SEC                SECTION.
      *
           INITIALIZE                             WRK-INPUTCOMENT
                                                  WRK-INPUTCOMENT2
                                                  WRK-INPUTCOMENT-KIN
                                                  WRK-INPUTCOMENT-KIN2
      *
           PERFORM  VARYING  IDX4  FROM  1  BY  1
                    UNTIL    IDX4  >  5
             IF  ((SRY-SRYCD(IDX4)(1:1)  =  "8")  OR
                  (SRY-SRYCD(IDX4)(1:3)  =  "008"))
             AND ( SRY-INPUTNUM(IDX4)  NOT =  ZERO )
      *
      *        ´µ¼Ô¥³¥á¥ó¥È¾ðÊóÆÉ¹þ
               PERFORM  950-PTCOM-READ-SEC
               MOVE  PTCOM-INPUTCOMENT           TO  WRK-INPUTCOMENT
      *
               IF  WRK-INPUTCOMENT(1:12)  =  "¸ø£±ÉéÃ´¶â¡§"
               OR  WRK-INPUTCOMENT(1:12)  =  "¸ø£²ÉéÃ´¶â¡§"
               OR  WRK-INPUTCOMENT(1:12)  =  "¸ø£³ÉéÃ´¶â¡§"
               OR  WRK-INPUTCOMENT(1:12)  =  "¸ø£´ÉéÃ´¶â¡§"
                 MOVE  WRK-INPUTCOMENT(13:14)    TO  WRK-INPUTCOMENT2
      *
      *          ÃÖ´¹¶â³ÛÊÔ½¸
                 IF  WRK-INPUTCOMENT2  =  "¡¡¡¡¡¡¡¡¡¡¡¡¡¡"  OR  SPACE
                   CONTINUE
                 ELSE
      *            Á´³Ñ¿ô»ú¤òÈ¾³Ñ¤ËÃÖ¤­´¹¤¨¤ë
                   PERFORM  VARYING  IDW1  FROM  1  BY  2
                            UNTIL    IDW1  >  14
                     COMPUTE  IDW2  =  (IDW1  +  1)  /  2
                     EVALUATE  WRK-INPUTCOMENT2(IDW1:2)
                       WHEN  "£°"
                         MOVE  "0"  TO  WRK-INPUTCOMENT-KIN2-T(IDW2:1)
                       WHEN  "£±"
                         MOVE  "1"  TO  WRK-INPUTCOMENT-KIN2-T(IDW2:1)
                       WHEN  "£²"
                         MOVE  "2"  TO  WRK-INPUTCOMENT-KIN2-T(IDW2:1)
                       WHEN  "£³"
                         MOVE  "3"  TO  WRK-INPUTCOMENT-KIN2-T(IDW2:1)
                       WHEN  "£´"
                         MOVE  "4"  TO  WRK-INPUTCOMENT-KIN2-T(IDW2:1)
                       WHEN  "£µ"
                         MOVE  "5"  TO  WRK-INPUTCOMENT-KIN2-T(IDW2:1)
                       WHEN  "£¶"
                         MOVE  "6"  TO  WRK-INPUTCOMENT-KIN2-T(IDW2:1)
                       WHEN  "£·"
                         MOVE  "7"  TO  WRK-INPUTCOMENT-KIN2-T(IDW2:1)
                       WHEN  "£¸"
                         MOVE  "8"  TO  WRK-INPUTCOMENT-KIN2-T(IDW2:1)
                       WHEN  "£¹"
                         MOVE  "9"  TO  WRK-INPUTCOMENT-KIN2-T(IDW2:1)
                       WHEN  OTHER
                         MOVE  14   TO  IDW1
                     END-EVALUATE
                   END-PERFORM
      *
                   IF  WRK-INPUTCOMENT-KIN2-T  NOT =  SPACE
      *              ±¦µÍ¤á¤Î¿ô»ú¹àÌÜ¤ËÊÑ´¹¤¹¤ë
                     MOVE    8      TO  IDW2
                     PERFORM  VARYING  IDW1  FROM  7  BY  -1
                              UNTIL    IDW1  <  1
                       IF  WRK-INPUTCOMENT-KIN2-T(IDW1:1)  =  SPACE
                         CONTINUE
                       ELSE
                         COMPUTE  IDW2  =  IDW2  -  1
                         MOVE  WRK-INPUTCOMENT-KIN2-T(IDW1:1)
                                    TO  WRK-INPUTCOMENT-KIN-T(IDW2:1)
                       END-IF
                     END-PERFORM
      *
      *              ½¸·×ÍÑ¥Õ¥¡¥¤¥ë¤Ë³ÊÇ¼
                     IF  WRK-INPUTCOMENT(1:12)  =  "¸ø£±ÉéÃ´¶â¡§"
                       MOVE  WRK-INPUTCOMENT-KIN  
                                    TO  MF101-OKIKAE-FTN(1)
                     END-IF
                     IF  WRK-INPUTCOMENT(1:12)  =  "¸ø£²ÉéÃ´¶â¡§"
                       MOVE  WRK-INPUTCOMENT-KIN
                                    TO  MF101-OKIKAE-FTN(2)
                     END-IF
                     IF  WRK-INPUTCOMENT(1:12)  =  "¸ø£³ÉéÃ´¶â¡§"
                       MOVE  WRK-INPUTCOMENT-KIN 
                                    TO  MF101-OKIKAE-FTN(3)
                     END-IF
                     IF  WRK-INPUTCOMENT(1:12)  =  "¸ø£´ÉéÃ´¶â¡§"
                       MOVE  WRK-INPUTCOMENT-KIN 
                                    TO  MF101-OKIKAE-FTN(4)
                     END-IF
                   END-IF
      *
                 END-IF
               END-IF
             END-IF
           END-PERFORM
      *
           .
       200115-ICHIBUFTN-HENSYU-EXT.
           EXIT.
      *=== ¸øÈñÍó¡Ý°ìÉôÉéÃ´¶â¶â³ÛÃÖ´¹ÂÐ±þ by Yoshikawa(2013/04/03) end
      *****************************************************************
      *    Ä¢É¼¥Õ¥¡¥¤¥ë½ÐÎÏ½èÍý
      *****************************************************************
       2002-PRINT-SEC                SECTION.
      *
           DISPLAY "2002-PRINT START"
      *
           OPEN     INPUT       MF101-FILE
      *
           MOVE     ZERO        TO       FLG-PRINT
      *
      *    °ì»þ¥Õ¥¡¥¤¥ëÆÉ¹þ
           PERFORM  900-TMP-READ-SEC
      *
      *    £Ã£Ó£Ö<¥Ø¥Ã¥À¡¼¥ì¥³¡¼¥É>½èÍý
           PERFORM 310-HEAD-HEN-SEC
      *
           PERFORM  UNTIL  FLG-PRINT  =  1
           
      *    £Ã£Ó£Ö<¥Ç¡¼¥¿¥ì¥³¡¼¥É>½èÍý
             PERFORM  330-CSV-HEN-SEC
      *
           END-PERFORM
      *
      *    £Ã£Ó£Ö<¥È¥ì¡¼¥é¥ì¥³¡¼¥É>½èÍý
           PERFORM 350-END-HEN-SEC
      *
      *
           CLOSE    MF101-FILE
      *
           .
       2002-PRINT-EXT.
           EXIT.
      *
      *****************************************************************
      *    £Ã£Ó£Ö<¥Ø¥Ã¥À¡¼¥ì¥³¡¼¥É>½èÍý
      *****************************************************************
       310-HEAD-HEN-SEC          SECTION.
      *
           INITIALIZE                            WRK-REC
                                                 WRK-REC-LENGTH
      *
      *    £±¡¥¥ì¥³¡¼¥É¼±ÊÌ¾ðÊó
           MOVE    "H1"                      TO  WRK-DATA
           MOVE    2                         TO  WRK-NAGASA
           PERFORM 5004-MOJI-HENSYU-SEC
      *
      *    £²¡¥ÀÁµáÇ¯·î
           MOVE    LNK-PRTKANRI-SKYYMD(1:6)  TO  WRK-SYMD (1:6)
           MOVE    "01"                      TO  WRK-SYMD (7:2)
           PERFORM   31011-SEIWA-HEN-SEC
           EVALUATE  LNK-DAY1-GENKIGO
             WHEN  "M"
               MOVE    1                     TO  WRK-WGEN
             WHEN  "T"
               MOVE    2                     TO  WRK-WGEN
             WHEN  "S"
               MOVE    3                     TO  WRK-WGEN
             WHEN  "H"
               MOVE    4                     TO  WRK-WGEN
           END-EVALUATE
           MOVE    LNK-DAY1-WYMD(2:2)        TO  WRK-WYY
           MOVE    LNK-DAY1-WYMD(4:2)        TO  WRK-WMM
           MOVE    WRK-WYMD(1:5)             TO  WRK-DATA
           MOVE    5                         TO  WRK-NAGASA
           PERFORM 5004-MOJI-HENSYU-SEC
      *
      *    £³¡¥ÅÔÆ»ÉÜ¸©
           MOVE    "06"                      TO  WRK-DATA
           MOVE    2                         TO  WRK-NAGASA
           PERFORM 5004-MOJI-HENSYU-SEC
      *
      *    £´¡¥°åÎÅµ¡´Ø¥³¡¼¥É
           MOVE    SYS-1001-HOSPCD           TO  WRK-DATA
           MOVE    7                         TO  WRK-NAGASA
           PERFORM 5004-MOJI-HENSYU-SEC
      *
      *    £µ¡¥ÅÀ¿ôÉ½
           MOVE    SYS-1001-TENHYOKBN        TO  WRK-DATA
           MOVE    1                         TO  WRK-NAGASA
           MOVE    1                         TO  WRK-END
           PERFORM 5004-MOJI-HENSYU-SEC
      *
      *    ²þ¹Ô¥³¡¼¥ÉÊÔ½¸
           STRING  WRK-REC(1:WRK-REC-LENGTH)     DELIMITED  BY  SIZE
                   WRK-KAIGYO                    DELIMITED  BY  SIZE
                   INTO                          WRK-REC
           END-STRING
      *
           MOVE    ZERO                      TO  WRK-SCSVINFO-PTID
           MOVE    SPACE                     TO  WRK-SCSVINFO-NYUGAIKBN
           PERFORM 500-CSVINFO-SEC
      *
           .
       310-HEAD-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    £Ã£Ó£ÖÊÔ½¸<¥Ç¡¼¥¿¥ì¥³¡¼¥É>½èÍý
      *****************************************************************
       330-CSV-HEN-SEC      SECTION.
      *
           INITIALIZE                          WRK-REC
                                               WRK-REC-LENGTH
                                               FLG-MOJI
      *
      *    £±¡¥¥ì¥³¡¼¥É¼±ÊÌ¾ðÊó
           MOVE    "D1"                      TO  WRK-DATA
           MOVE    2                         TO  WRK-NAGASA
           PERFORM 5004-MOJI-HENSYU-SEC
      *
      *    £²¡¥¿ÇÎÅÇ¯·î
           MOVE    MF101-SRYYM               TO  WRK-SYMD (1:6)
           MOVE    "01"                      TO  WRK-SYMD (7:2)
           PERFORM   31011-SEIWA-HEN-SEC
           EVALUATE  LNK-DAY1-GENKIGO
             WHEN  "M"
               MOVE    1                     TO  WRK-WGEN
             WHEN  "T"
               MOVE    2                     TO  WRK-WGEN
             WHEN  "S"
               MOVE    3                     TO  WRK-WGEN
             WHEN  "H"
               MOVE    4                     TO  WRK-WGEN
           END-EVALUATE
           MOVE    LNK-DAY1-WYMD(2:2)        TO  WRK-WYY
           MOVE    LNK-DAY1-WYMD(4:2)        TO  WRK-WMM
           MOVE    WRK-WYMD(1:5)             TO  WRK-DATA
           MOVE    5                         TO  WRK-NAGASA
           PERFORM 5004-MOJI-HENSYU-SEC
      *
      *    £³¡¥ÊÝ¸±À©ÅÙ¡ÊÊÝ¸±¼ïÊÌ¡Ë
           MOVE    1                         TO  WRK-NUM
           MOVE    1                         TO  WRK-NAGASA
           PERFORM 5005-NUM-HENSYU-SEC
      *    
      *    £´¡¥ËÜ¿Í²ÈÂ²
           STRING  "0"                       DELIMITED BY SIZE
                   MF101-RECESYUBETU (4:1)   DELIMITED BY SIZE
                   INTO  WRK-DATA
           MOVE    2                         TO  WRK-NAGASA
           PERFORM 5004-MOJI-HENSYU-SEC
      *    
      *    £µ¡¥µëÉÕ³ä¹ç
           MOVE    MF101-KYURATE             TO  WRK-NUM
           MOVE    3                         TO  WRK-NAGASA
           PERFORM 5005-NUM-HENSYU-SEC
      *    
      *    £¶¡¥ÊÝ¸±¼ÔÈÖ¹æ
           MOVE    MF101-HKNJANUM            TO  WRK-DATA
           MOVE    8                         TO  WRK-NAGASA
           PERFORM 5004-MOJI-HENSYU-SEC
      *    
      *    £·¡¥ÈïÊÝ¸±¼Ô¾ÚÅù¤Îµ­¹æ
           MOVE    MF101-KIGO                TO  WRK-DATA
           MOVE    40                        TO  WRK-NAGASA
           PERFORM 5004-MOJI-HENSYU-SEC
      *    
      *    £¸¡¥ÈïÊÝ¸±¼Ô¾ÚÅù¤ÎÈÖ¹æ¡ÊÁ´³Ñ¡Ë
           MOVE    MF101-NUM                 TO  WRK-DATA
           MOVE    40                        TO  WRK-NAGASA
           PERFORM 5004-MOJI-HENSYU-SEC
      *    
      *    £¹¡¥À¸Ç¯·îÆü
           MOVE    MF101-BIRTHDAY            TO  WRK-SYMD
           PERFORM   31011-SEIWA-HEN-SEC
           EVALUATE  LNK-DAY1-GENKIGO
             WHEN  "M"
               MOVE    1                     TO  WRK-WGEN
             WHEN  "T"
               MOVE    2                     TO  WRK-WGEN
             WHEN  "S"
               MOVE    3                     TO  WRK-WGEN
             WHEN  "H"
               MOVE    4                     TO  WRK-WGEN
           END-EVALUATE
           MOVE    LNK-DAY1-WYMD(2:2)        TO  WRK-WYY
           MOVE    LNK-DAY1-WYMD(4:2)        TO  WRK-WMM
           MOVE    LNK-DAY1-WYMD(6:2)        TO  WRK-WDD
           MOVE    WRK-WYMD(1:7)             TO  WRK-DATA
           MOVE    7                         TO  WRK-NAGASA
           PERFORM 5004-MOJI-HENSYU-SEC
      *    
      *    £±£°¡¥ÃË½÷¶èÊ¬
           MOVE    MF101-SEX                 TO  WRK-NUM
           MOVE    1                         TO  WRK-NAGASA
           PERFORM 5005-NUM-HENSYU-SEC
      *    
      *    £±£±¡¥»áÌ¾
           MOVE    MF101-NAME                TO  WRK-DATA
           MOVE    100                       TO  WRK-NAGASA
           PERFORM 5004-MOJI-HENSYU-SEC
      *    
      *    £±£²¡¥½èÊý¤»¤óÈ¯¹Ô°åÎÅµ¡´Ø¥³¡¼¥É¡ÊÄ´ºÞ¤Î¤ß¡Ë
           MOVE    SPACE                     TO  WRK-DATA
           MOVE    10                        TO  WRK-NAGASA
           PERFORM 5004-MOJI-HENSYU-SEC
      *    
      *    £±£³¡¥¥ì¥»¥×¥ÈÆÃµ­»ö¹à£±
           MOVE    MF101-TOKKI(1)            TO  WRK-DATA
           MOVE    2                         TO  WRK-NAGASA
           PERFORM 5004-MOJI-HENSYU-SEC
      *    
      *    £±£´¡¥¥ì¥»¥×¥ÈÆÃµ­»ö¹à£²
           MOVE    MF101-TOKKI(2)            TO  WRK-DATA
           MOVE    2                         TO  WRK-NAGASA
           PERFORM 5004-MOJI-HENSYU-SEC
      *    
      *    £±£µ¡¥¥ì¥»¥×¥ÈÆÃµ­»ö¹à£³
           MOVE    MF101-TOKKI(3)            TO  WRK-DATA
           MOVE    2                         TO  WRK-NAGASA
           PERFORM 5004-MOJI-HENSYU-SEC
      *    
      *    £±£¶¡¥¥ì¥»¥×¥ÈÆÃµ­»ö¹à£´
           MOVE    MF101-TOKKI(4)            TO  WRK-DATA
           MOVE    2                         TO  WRK-NAGASA
           PERFORM 5004-MOJI-HENSYU-SEC
      *    
      *    £±£·¡¥¥ì¥»¥×¥ÈÆÃµ­»ö¹à£µ
           MOVE    MF101-TOKKI(5)            TO  WRK-DATA
           MOVE    2                         TO  WRK-NAGASA
           PERFORM 5004-MOJI-HENSYU-SEC
      *    
      *    £±£¸¡¥¿ÇÎÅ¼ÂÆü¿ô
           MOVE    MF101-JNISSU-G            TO  WRK-NUM
           MOVE    3                         TO  WRK-NAGASA
           PERFORM 5005-NUM-HENSYU-SEC
      *    
      *    £±£¹¡¥¹ç·×ÅÀ¿ô
           MOVE    MF101-TOTALTEN-G          TO  WRK-NUM
           MOVE    8                         TO  WRK-NAGASA
           PERFORM 5005-NUM-HENSYU-SEC
      *    
      *    £²£°¡¥°åÎÅÊÝ¸±°ìÉôÉéÃ´¶â³Û
           MOVE    MF101-FTNMONEY-G          TO  WRK-NUM
           MOVE    9                         TO  WRK-NAGASA
           PERFORM 5005-NUM-HENSYU-SEC
      *    
      *    £²£±¡¥¸øÈñ£±µëÉÕÂÐ¾Ý°ìÉôÉéÃ´¶â
           MOVE    MF101-FTNMONEYSAI(1)      TO  WRK-NUM
           MOVE    7                         TO  WRK-NAGASA
           PERFORM 5005-NUM-HENSYU-SEC
      *    
      *    £²£²¡¥¸øÈñ£²µëÉÕÂÐ¾Ý°ìÉôÉéÃ´¶â
           MOVE    SPACE                     TO  WRK-DATA
           MOVE    7                         TO  WRK-NAGASA
           PERFORM 5004-MOJI-HENSYU-SEC
      *    
      *    £²£³¡¥¸øÈñ£³µëÉÕÂÐ¾Ý°ìÉôÉéÃ´¶â
           MOVE    SPACE                     TO  WRK-DATA
           MOVE    7                         TO  WRK-NAGASA
           PERFORM 5004-MOJI-HENSYU-SEC
      *    
      *    £²£´¡¥¸øÈñ£´µëÉÕÂÐ¾Ý°ìÉôÉéÃ´¶â
           MOVE    SPACE                     TO  WRK-DATA
           MOVE    7                         TO  WRK-NAGASA
           PERFORM 5004-MOJI-HENSYU-SEC
      *
      *    ¸øÈñ¾ðÊó¤ò¥»¥Ã¥È¤¹¤ë
           PERFORM 3301-KOH-SET-SEC
      *
      *    £²£µ¡¥¸øÈñÉéÃ´¼ÔÈÖ¹æ£±
           MOVE    WRK-KOH-FTNJANUM(1)       TO  WRK-DATA
           MOVE    8                         TO  WRK-NAGASA
           PERFORM 5004-MOJI-HENSYU-SEC
      *    
      *    £²£¶¡¥¸øÈñÉéÃ´°åÎÅ¤Î¼õµë¼ÔÈÖ¹æ£±
           MOVE    WRK-KOH-JKYSNUM(1)        TO  WRK-DATA
           MOVE    7                         TO  WRK-NAGASA
           PERFORM 5004-MOJI-HENSYU-SEC
      *    
      *    £²£·¡¥¸øÈñ£±¿ÇÎÅ¼ÂÆü¿ô
           MOVE    WRK-KOH-JNISSU(1)         TO  WRK-NUM
           MOVE    2                         TO  WRK-NAGASA
           PERFORM 5005-NUM-HENSYU-SEC
      *    
      *    £²£¸¡¥¸øÈñ£±¹ç·×ÅÀ¿ô
           MOVE    WRK-KOH-TOTALTEN(1)       TO  WRK-NUM
           MOVE    8                         TO  WRK-NAGASA
           PERFORM 5005-NUM-HENSYU-SEC
      *    
      *    £²£¹¡¥¸øÈñ£±°ìÉôÉéÃ´¶â³Û
           MOVE    WRK-KOH-FTNMONEY(1)       TO  WRK-NUM
           MOVE    8                         TO  WRK-NAGASA
           PERFORM 5005-NUM-HENSYU-SEC
      *
      *    £³£°¡¥¸øÈñÉéÃ´¼ÔÈÖ¹æ£²
           MOVE    WRK-KOH-FTNJANUM(2)       TO  WRK-DATA
           MOVE    8                         TO  WRK-NAGASA
           PERFORM 5004-MOJI-HENSYU-SEC
      *    
      *    £³£±¡¥¸øÈñÉéÃ´°åÎÅ¤Î¼õµë¼ÔÈÖ¹æ£²
           MOVE    WRK-KOH-JKYSNUM(2)        TO  WRK-DATA
           MOVE    7                         TO  WRK-NAGASA
           PERFORM 5004-MOJI-HENSYU-SEC
      *    
      *    £³£²¡¥¸øÈñ£²¿ÇÎÅ¼ÂÆü¿ô
           MOVE    WRK-KOH-JNISSU(2)         TO  WRK-NUM
           MOVE    2                         TO  WRK-NAGASA
           PERFORM 5005-NUM-HENSYU-SEC
      *    
      *    £³£³¡¥¸øÈñ£²¹ç·×ÅÀ¿ô
           MOVE    WRK-KOH-TOTALTEN(2)       TO  WRK-NUM
           MOVE    8                         TO  WRK-NAGASA
           PERFORM 5005-NUM-HENSYU-SEC
      *    
      *    £³£´¡¥¸øÈñ£²°ìÉôÉéÃ´¶â³Û
           MOVE    WRK-KOH-FTNMONEY(2)       TO  WRK-NUM
           MOVE    8                         TO  WRK-NAGASA
           PERFORM 5005-NUM-HENSYU-SEC
      *
      *    £³£µ¡¥¸øÈñÉéÃ´¼ÔÈÖ¹æ£³
           MOVE    WRK-KOH-FTNJANUM(3)       TO  WRK-DATA
           MOVE    8                         TO  WRK-NAGASA
           PERFORM 5004-MOJI-HENSYU-SEC
      *    
      *    £³£¶¡¥¸øÈñÉéÃ´°åÎÅ¤Î¼õµë¼ÔÈÖ¹æ£³
           MOVE    WRK-KOH-JKYSNUM(3)        TO  WRK-DATA
           MOVE    7                         TO  WRK-NAGASA
           PERFORM 5004-MOJI-HENSYU-SEC
      *    
      *    £³£·¡¥¸øÈñ£³¿ÇÎÅ¼ÂÆü¿ô
           MOVE    WRK-KOH-JNISSU(3)         TO  WRK-NUM
           MOVE    2                         TO  WRK-NAGASA
           PERFORM 5005-NUM-HENSYU-SEC
      *    
      *    £³£¸¡¥¸øÈñ£³¹ç·×ÅÀ¿ô
           MOVE    WRK-KOH-TOTALTEN(3)       TO  WRK-NUM
           MOVE    8                         TO  WRK-NAGASA
           PERFORM 5005-NUM-HENSYU-SEC
      *    
      *    £³£¹¡¥¸øÈñ£³°ìÉôÉéÃ´¶â³Û
           MOVE    WRK-KOH-FTNMONEY(3)       TO  WRK-NUM
           MOVE    8                         TO  WRK-NAGASA
           PERFORM 5005-NUM-HENSYU-SEC
      *
      *    £´£°¡¦¸øÈñÉéÃ´¼ÔÈÖ¹æ£´
           MOVE    WRK-KOH-FTNJANUM(4)       TO  WRK-DATA
           MOVE    8                         TO  WRK-NAGASA
           PERFORM 5004-MOJI-HENSYU-SEC
      *    
      *    £´£±¡¥¸øÈñÉéÃ´°åÎÅ¤Î¼õµë¼ÔÈÖ¹æ£´
           MOVE    WRK-KOH-JKYSNUM(4)        TO  WRK-DATA
           MOVE    7                         TO  WRK-NAGASA
           PERFORM 5004-MOJI-HENSYU-SEC
      *    
      *    £´£²¡¥¸øÈñ£´¿ÇÎÅ¼ÂÆü¿ô
           MOVE    WRK-KOH-JNISSU(4)         TO  WRK-NUM
           MOVE    2                         TO  WRK-NAGASA
           PERFORM 5004-MOJI-HENSYU-SEC
      *    
      *    £´£³¡¥¸øÈñ£´¹ç·×ÅÀ¿ô
           MOVE    WRK-KOH-TOTALTEN(4)       TO  WRK-NUM
           MOVE    8                         TO  WRK-NAGASA
           PERFORM 5004-MOJI-HENSYU-SEC
      *    
      *    £´£´¡¥¸øÈñ£´°ìÉôÉéÃ´¶â³Û
           MOVE    WRK-KOH-FTNMONEY(4)       TO  WRK-NUM
           MOVE    8                         TO  WRK-NAGASA
           PERFORM 5004-MOJI-HENSYU-SEC
      *    
      *    £´£µ¡¥¿©»öÎÅÍÜ²ó¿ô
           MOVE    MF101-SHOKUJINISSU-G      TO  WRK-NUM
           MOVE    3                         TO  WRK-NAGASA
           PERFORM 5005-NUM-HENSYU-SEC
      *    
      *    £´£¶¡¥¿©»öÎÅÍÜ¹ç·×¶â³Û
           MOVE    MF101-SHOKUJIRYOYOHI-G    TO  WRK-NUM
           MOVE    8                         TO  WRK-NAGASA
           PERFORM 5005-NUM-HENSYU-SEC
      *    
      *    £´£·¡¥¿©»öÎÅÍÜÉ¸½àÉéÃ´³Û
           MOVE    MF101-SHOKUJIFTN-G        TO  WRK-NUM
           MOVE    8                         TO  WRK-NAGASA
           PERFORM 5005-NUM-HENSYU-SEC
      *    
      *    £´£¸¡¥¸øÈñ£±¿©»öÎÅÍÜ²ó¿ô
           MOVE    WRK-KOH-SHOKUJINISSU(1)   TO  WRK-NUM
           MOVE    3                         TO  WRK-NAGASA
           PERFORM 5005-NUM-HENSYU-SEC
      *    
      *    £´£¹¡¥¸øÈñ£±¿©»öÎÅÍÜ¹ç·×¶â³Û
           MOVE    WRK-KOH-SHOKUJIRYOYOHI(1) TO  WRK-NUM
           MOVE    8                         TO  WRK-NAGASA
           PERFORM 5005-NUM-HENSYU-SEC
      *    
      *    £µ£°¡¥¸øÈñ£±¿©»öÎÅÍÜÉ¸½àÉéÃ´³Û
           MOVE    WRK-KOH-SHOKUJIFTN(1)     TO  WRK-NUM
           MOVE    8                         TO  WRK-NAGASA
           PERFORM 5005-NUM-HENSYU-SEC
      *    
      *    £µ£±¡¥¸øÈñ£²¿©»öÎÅÍÜ²ó¿ô
           MOVE    WRK-KOH-SHOKUJINISSU(2)   TO  WRK-NUM
           MOVE    3                         TO  WRK-NAGASA
           PERFORM 5005-NUM-HENSYU-SEC
      *    
      *    £µ£²¡¥¸øÈñ£²¿©»öÎÅÍÜ¹ç·×¶â³Û
           MOVE    WRK-KOH-SHOKUJIRYOYOHI(2) TO  WRK-NUM
           MOVE    8                         TO  WRK-NAGASA
           PERFORM 5005-NUM-HENSYU-SEC
      *    
      *    £µ£³¡¥¸øÈñ£²¿©»öÎÅÍÜÉ¸½àÉéÃ´³Û
           MOVE    WRK-KOH-SHOKUJIFTN(2)     TO  WRK-NUM
           MOVE    8                         TO  WRK-NAGASA
           PERFORM 5005-NUM-HENSYU-SEC
      *    
      *    £µ£´¡¥¸øÈñ£³¿©»öÎÅÍÜ²ó¿ô
           MOVE    WRK-KOH-SHOKUJINISSU(3)   TO  WRK-NUM
           MOVE    3                         TO  WRK-NAGASA
           PERFORM 5005-NUM-HENSYU-SEC
      *    
      *    £µ£µ¡¥¸øÈñ£³¿©»öÎÅÍÜ¹ç·×¶â³Û
           MOVE    WRK-KOH-SHOKUJIRYOYOHI(3) TO  WRK-NUM
           MOVE    8                         TO  WRK-NAGASA
           PERFORM 5005-NUM-HENSYU-SEC
      *    
      *    £µ£¶¡¥¸øÈñ£³¿©»öÎÅÍÜÉ¸½àÉéÃ´³Û
           MOVE    WRK-KOH-SHOKUJIFTN(3)     TO  WRK-NUM
           MOVE    8                         TO  WRK-NAGASA
           PERFORM 5005-NUM-HENSYU-SEC
      *    
      *    £µ£·¡¥¸øÈñ£´¿©»öÎÅÍÜ²ó¿ô
           MOVE    WRK-KOH-SHOKUJINISSU(4)   TO  WRK-NUM
           MOVE    3                         TO  WRK-NAGASA
           PERFORM 5005-NUM-HENSYU-SEC
      *    
      *    £µ£¸¡¥¸øÈñ£´¿©»öÎÅÍÜ¹ç·×¶â³Û
           MOVE    WRK-KOH-SHOKUJIRYOYOHI(4) TO  WRK-NUM
           MOVE    8                         TO  WRK-NAGASA
           PERFORM 5005-NUM-HENSYU-SEC
      *    
      *    £µ£¹¡¥¸øÈñ£´¿©»öÎÅÍÜÉ¸½àÉéÃ´³Û
           MOVE    WRK-KOH-SHOKUJIFTN(4)     TO  WRK-NUM
           MOVE    8                         TO  WRK-NAGASA
           PERFORM 5005-NUM-HENSYU-SEC
      *    
      *    £¶£°¡¥°ìÉôÉéÃ´¶â¡¦¿©»öÎÅÍÜÈñÉ¸½àÉéÃ´³Û¶èÊ¬
           IF  MF101-NYUGAIKBN  = "1"
             IF  MF101-TEINEN  =  1
      *        Äã½êÆÀI
               MOVE    3                     TO  WRK-NUM
             ELSE
      *        Äã½êÆÀII
               IF  MF101-TEISHO  =  1
                 IF  MF101-JNISSU  >  90
                   MOVE    2                 TO  WRK-NUM
                 ELSE
                   MOVE    1                 TO  WRK-NUM
                 END-IF
               ELSE
                 MOVE    ZERO                TO  WRK-NUM
               END-IF
             END-IF
           ELSE
             MOVE    ZERO                    TO  WRK-NUM
           END-IF
           MOVE    1                         TO  WRK-NAGASA
           PERFORM 5005-NUM-HENSYU-SEC
      *    
      *    £¶£±¡¥¥³¥á¥ó¥È
           MOVE    MF101-COMMENT             TO  WRK-DATA
           MOVE    2                         TO  WRK-NAGASA
           PERFORM 5004-MOJI-HENSYU-SEC
      *    
      *    £¶£²¡¥¸ºÌÈ¶èÊ¬
           MOVE    MF101-GENMEN              TO  WRK-NUM
           MOVE    1                         TO  WRK-NAGASA
           PERFORM 5005-NUM-HENSYU-SEC
      *    
      *    £¶£³¡¥¸º³Û³ä¹ç
           MOVE    MF101-GENMENWARI          TO  WRK-NUM
           MOVE    3                         TO  WRK-NAGASA
           PERFORM 5005-NUM-HENSYU-SEC
      *    
      *    £¶£´¡¥¸º³Û¶â³Û
           MOVE    MF101-GENMENGK            TO  WRK-NUM
           MOVE    8                         TO  WRK-NAGASA
           MOVE    1                         TO  WRK-END
           PERFORM 5005-NUM-HENSYU-SEC
      *    
      *    £¶£µ¡¥Í½È÷¹àÌÜ£±
      *    £¶£¶¡¥Í½È÷¹àÌÜ£²
      *    £¶£·¡¥Í½È÷¹àÌÜ£³
      *    £¶£¸¡¥Í½È÷¹àÌÜ£´
      *    £¶£¹¡¥Í½È÷¹àÌÜ£µ
      *    £·£°¡¥Í½È÷¹àÌÜ£¶
      *    
      *    ²þ¹Ô¥³¡¼¥ÉÊÔ½¸
           STRING  WRK-REC(1:WRK-REC-LENGTH)     DELIMITED  BY  SIZE
                   WRK-KAIGYO                    DELIMITED  BY  SIZE
                   INTO                          WRK-REC
           END-STRING
      *
           MOVE    ZERO                      TO  WRK-SCSVINFO-PTID
           MOVE    SPACE                     TO  WRK-SCSVINFO-NYUGAIKBN
           PERFORM 500-CSVINFO-SEC
      *
           ADD    1                          TO  WRK-GKENSU
      *
      *    °ì»þ¥Õ¥¡¥¤¥ëÆÉ¹þ
           PERFORM  900-TMP-READ-SEC
      *
           .
       330-CSV-HEN-SEC-EXT.
           EXIT.
      *
      *****************************************************************
      *    ¸øÈñ¾ðÊó¥»¥Ã¥È½èÍý
      *****************************************************************
       3301-KOH-SET-SEC                SECTION.
      *
           INITIALIZE                      WRK-KOH-TBL-AREA
      *
           IF  MF101-EKOHFTNJANUM (1) NOT = SPACE
      *      ¤½¤ÎÂ¾¸øÈñ¤¬¤¢¤ë¾ì¹ç
      *      ¸øÈñ£±¡Ê¤½¤ÎÂ¾¸øÈñ¤¢¤ê¡Ë
             MOVE    MF101-EKOHFTNJANUM(1)   TO  WRK-KOH-FTNJANUM(1)
             MOVE    MF101-EKOHJKYSNUM(1)    TO  WRK-KOH-JKYSNUM(1)
             MOVE    MF101-ENISSU(1)         TO  WRK-KOH-JNISSU(1)
             MOVE    MF101-ETENSU(1)         TO  WRK-KOH-TOTALTEN(1)
      *=== ¸øÈñÍó¡Ý°ìÉôÉéÃ´¶â¶â³ÛÃÖ´¹ÂÐ±þ by Yoshikawa(2013/04/03) start
      *       MOVE    MF101-EITBFTN(1)        TO  WRK-KOH-FTNMONEY(1)
             IF  MF101-OKIKAE-FTN(1)  NOT =  ZERO
               MOVE    MF101-EITBFTN(1)      TO  WRK-KOH-FTNMONEY(1)
             ELSE
               MOVE    MF101-EITBFTN(1)      TO  WRK-KOH-FTNMONEY(1)
             END-IF
      *=== ¸øÈñÍó¡Ý°ìÉôÉéÃ´¶â¶â³ÛÃÖ´¹ÂÐ±þ by Yoshikawa(2013/04/03) end
             MOVE    MF101-ESHOKUJIINF(1)    TO  WRK-KOH-SHOKUJIINF(1)
      *
             IF  MF101-EKOHFTNJANUM (2)  NOT = SPACE
      *        ¤½¤ÎÂ¾¸øÈñ£²¤Ä¤Î¾ì¹ç
      *        ¸øÈñ£²
               MOVE    MF101-EKOHFTNJANUM(2) TO  WRK-KOH-FTNJANUM(2)
               MOVE    MF101-EKOHJKYSNUM(2)  TO  WRK-KOH-JKYSNUM(2)
               MOVE    MF101-ENISSU(2)       TO  WRK-KOH-JNISSU(2)
               MOVE    MF101-ETENSU(2)       TO  WRK-KOH-TOTALTEN(2)
      *=== ¸øÈñÍó¡Ý°ìÉôÉéÃ´¶â¶â³ÛÃÖ´¹ÂÐ±þ by Yoshikawa(2013/04/03) start
      *         MOVE    MF101-EITBFTN(2)      TO  WRK-KOH-FTNMONEY(2)
               IF  MF101-OKIKAE-FTN(2)  NOT =  ZERO
                 MOVE    MF101-OKIKAE-FTN(2) TO  WRK-KOH-FTNMONEY(2)
               ELSE
                 MOVE    MF101-EITBFTN(2)    TO  WRK-KOH-FTNMONEY(2)
               END-IF
      *=== ¸øÈñÍó¡Ý°ìÉôÉéÃ´¶â¶â³ÛÃÖ´¹ÂÐ±þ by Yoshikawa(2013/04/03) end
               MOVE    MF101-ESHOKUJIINF(2)  TO  WRK-KOH-SHOKUJIINF(2)
      *
      *        ¸øÈñ£³
               MOVE    MF101-KOHFTNJANUM     TO  WRK-KOH-FTNJANUM(3)
               MOVE    MF101-KOHJKYSNUM      TO  WRK-KOH-JKYSNUM(3)
               MOVE    MF101-JNISSU          TO  WRK-KOH-JNISSU(3)
               MOVE    MF101-TOTALTEN        TO  WRK-KOH-TOTALTEN(3)
      *=== ¸øÈñÍó¡Ý°ìÉôÉéÃ´¶â¶â³ÛÃÖ´¹ÂÐ±þ by Yoshikawa(2013/04/03) start
      *         MOVE    MF101-FTNMONEY        TO  WRK-KOH-FTNMONEY(3)
               IF  MF101-OKIKAE-FTN(3)  NOT =  ZERO
                 MOVE    MF101-OKIKAE-FTN(3) TO  WRK-KOH-FTNMONEY(3)
               ELSE
                 MOVE    MF101-FTNMONEY      TO  WRK-KOH-FTNMONEY(3)
               END-IF
      *=== ¸øÈñÍó¡Ý°ìÉôÉéÃ´¶â¶â³ÛÃÖ´¹ÂÐ±þ by Yoshikawa(2013/04/03) end
               MOVE    MF101-SHOKUJIINF      TO  WRK-KOH-SHOKUJIINF(3)
      *
             ELSE
      *        ¸øÈñ£²
               MOVE    MF101-KOHFTNJANUM     TO  WRK-KOH-FTNJANUM(2)
               MOVE    MF101-KOHJKYSNUM      TO  WRK-KOH-JKYSNUM(2)
               MOVE    MF101-JNISSU          TO  WRK-KOH-JNISSU(2)
               MOVE    MF101-TOTALTEN        TO  WRK-KOH-TOTALTEN(2)
      *=== ¸øÈñÍó¡Ý°ìÉôÉéÃ´¶â¶â³ÛÃÖ´¹ÂÐ±þ by Yoshikawa(2013/04/03) start
      *         MOVE    MF101-FTNMONEY        TO  WRK-KOH-FTNMONEY(2)
               IF  MF101-OKIKAE-FTN(2)  NOT =  ZERO
                 MOVE    MF101-OKIKAE-FTN(2) TO  WRK-KOH-FTNMONEY(2)
               ELSE
                 MOVE    MF101-FTNMONEY      TO  WRK-KOH-FTNMONEY(2)
               END-IF
      *=== ¸øÈñÍó¡Ý°ìÉôÉéÃ´¶â¶â³ÛÃÖ´¹ÂÐ±þ by Yoshikawa(2013/04/03) end
               MOVE    MF101-SHOKUJIINF      TO  WRK-KOH-SHOKUJIINF(2)
             END-IF
      *
           ELSE
      *      ¤½¤ÎÂ¾¸øÈñ¤¬¤Ê¤¤¾ì¹ç
      *      ¸øÈñ£±
             MOVE    MF101-KOHFTNJANUM       TO  WRK-KOH-FTNJANUM(1)
             MOVE    MF101-KOHJKYSNUM        TO  WRK-KOH-JKYSNUM(1)
             MOVE    MF101-JNISSU            TO  WRK-KOH-JNISSU(1)
             MOVE    MF101-TOTALTEN          TO  WRK-KOH-TOTALTEN(1)
      *=== ¸øÈñÍó¡Ý°ìÉôÉéÃ´¶â¶â³ÛÃÖ´¹ÂÐ±þ by Yoshikawa(2013/04/03) start
      *       MOVE    MF101-FTNMONEY          TO  WRK-KOH-FTNMONEY(1)
             IF  MF101-OKIKAE-FTN(1)  NOT =  ZERO
               MOVE    MF101-OKIKAE-FTN(1)   TO  WRK-KOH-FTNMONEY(1)
             ELSE
               MOVE    MF101-FTNMONEY        TO  WRK-KOH-FTNMONEY(1)
             END-IF
      *=== ¸øÈñÍó¡Ý°ìÉôÉéÃ´¶â¶â³ÛÃÖ´¹ÂÐ±þ by Yoshikawa(2013/04/03) end
             MOVE    MF101-SHOKUJIINF        TO  WRK-KOH-SHOKUJIINF(1)
           END-IF
      *
           .
       3301-KOH-SET-SEC-EXT.
           EXIT.
      *
      *****************************************************************
      *    £Ã£Ó£Ö<¥È¥ì¡¼¥é¥ì¥³¡¼¥É>½èÍý
      *****************************************************************
       350-END-HEN-SEC          SECTION.
      *
           INITIALIZE                            WRK-REC
                                                 WRK-REC-LENGTH
      *
      *    £±¡¥¥ì¥³¡¼¥É¼±ÊÌ¾ðÊó
           MOVE    "T1"                      TO  WRK-DATA
           MOVE    2                         TO  WRK-NAGASA
           PERFORM 5004-MOJI-HENSYU-SEC
      *    
      *    £²¡¥ÀÁµáÇ¯·î
           MOVE    LNK-PRTKANRI-SKYYMD(1:6)  TO  WRK-SYMD (1:6)
           MOVE    "01"                      TO  WRK-SYMD (7:2)
           PERFORM   31011-SEIWA-HEN-SEC
           EVALUATE  LNK-DAY1-GENKIGO
             WHEN  "M"
               MOVE    1                     TO  WRK-WGEN
             WHEN  "T"
               MOVE    2                     TO  WRK-WGEN
             WHEN  "S"
               MOVE    3                     TO  WRK-WGEN
             WHEN  "H"
               MOVE    4                     TO  WRK-WGEN
           END-EVALUATE
           MOVE    LNK-DAY1-WYMD(2:2)        TO  WRK-WYY
           MOVE    LNK-DAY1-WYMD(4:2)        TO  WRK-WMM
           MOVE    WRK-WYMD(1:5)             TO  WRK-DATA
           MOVE    5                         TO  WRK-NAGASA
           PERFORM 5004-MOJI-HENSYU-SEC
      *    
      *    £³¡¥ÅÔÆ»ÉÜ¸©
           MOVE    "06"                      TO  WRK-DATA
           MOVE    2                         TO  WRK-NAGASA
           PERFORM 5004-MOJI-HENSYU-SEC
      *    
      *    £´¡¥°åÎÅµ¡´Ø¥³¡¼¥É
           MOVE    SYS-1001-HOSPCD           TO  WRK-DATA
           MOVE    7                         TO  WRK-NAGASA
           PERFORM 5004-MOJI-HENSYU-SEC
      *    
      *    £µ¡¥ÅÀ¿ôÉ½
           MOVE    SYS-1001-TENHYOKBN        TO  WRK-DATA
           MOVE    1                         TO  WRK-NAGASA
           PERFORM 5004-MOJI-HENSYU-SEC
      *
      *    £¶¡¥¥Ç¡¼¥¿¥ì¥³¡¼¥É·ï¿ô
           MOVE    WRK-GKENSU                TO  WRK-NUM
           MOVE    7                         TO  WRK-NAGASA
           MOVE    1                         TO  WRK-END
           PERFORM 5005-NUM-HENSYU-SEC
      *
      *    ²þ¹Ô¥³¡¼¥ÉÊÔ½¸
           STRING  WRK-REC(1:WRK-REC-LENGTH)  DELIMITED  BY  SIZE
                   WRK-KAIGYO                 DELIMITED  BY  SIZE
                   INTO                       WRK-REC
           END-STRING
      *
           MOVE    ZERO                    TO  WRK-SCSVINFO-PTID
           MOVE    SPACE                   TO  WRK-SCSVINFO-NYUGAIKBN
           PERFORM 500-CSVINFO-SEC
      *
           .
       350-END-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    £Ã£Ó£Ö¡²£É£Î£Æ£Ï½ÐÎÏ½èÍý
      *****************************************************************
       500-CSVINFO-SEC                SECTION.
      *
           ADD     1                   TO  WRK-SCSVINFO-SEQ-NO
      *
           INITIALIZE                  ORCSCSVINFOAREA
           MOVE    "INS"               TO  SCSVINFO-MODE
           MOVE    WRK-PARA-SHELLID    TO  SCSVINFO-TBL-KEY
           MOVE    LNK-PRTKANRI-SHELLID 
                                       TO  SCSVINFO-SHELLID
           MOVE    LNK-PRTKANRI-SHORI-RENNUM
                                       TO  SCSVINFO-SHORI-RENNUM
           MOVE    LNK-PRTKANRI-RENNUM TO  SCSVINFO-RENNUM
           MOVE    LNK-PRTKANRI-SRYYM  TO  SCSVINFO-SRYYM
           MOVE    LNK-PRTKANRI-SKYYMD TO  SCSVINFO-SKYYMD
           MOVE    WRK-SCSVINFO-SEQ-NO TO  SCSVINFO-SEQ-NO
           MOVE    WRK-SCSVINFO-NYUGAIKBN
                                       TO  SCSVINFO-NYUGAIKBN
           MOVE    WRK-SCSVINFO-PTID   TO  SCSVINFO-PTID
           MOVE    WRK-REC             TO  SCSVINFO-CSVDATA
           CALL    "ORCSCSVINFO"       USING
                                       ORCSCSVINFOAREA
                                       SPA-AREA
           IF      SCSVINFO-RETURN     =   ZERO
               ADD     1                   TO  CNT-OUT
           ELSE
               MOVE    "£Ã£Ó£ÖÍÑ£Ä£Â¤Ë¹¹¿·¤Ç¤­¤Þ¤»¤ó¤Ç¤·¤¿"
                                          TO  WRK-RECEERR
               PERFORM 500-ERR-HENSYU-SEC
           END-IF
      *
           MOVE    1                   TO  FLG-ERR
           .
       500-CSVINFO-EXT.
           EXIT.
      *****************************************************************
      *    ¥¨¥é¡¼½ÐÎÏ½èÍý
      *****************************************************************
       500-ERR-HENSYU-SEC  SECTION.
      *
           OPEN  INPUT  RECEERR-FILE
           IF  STS-RECEERR  =  ZERO
             CONTINUE
           ELSE
             OPEN  OUTPUT  RECEERR-FILE
      *
             MOVE  WRK-RECEERR  TO  RECEERR-REC
             WRITE RECEERR-REC
           END-IF
      *
           CLOSE  RECEERR-FILE
      *
           .
       500-ERR-HENSYU-EXT.
           EXIT.
      *
      *****************************************************************
      *    À¾Îñ¡¦ÏÂÎñÊÑ´¹½èÍý
      *****************************************************************
       31011-SEIWA-HEN-SEC        SECTION.
      *
           INITIALIZE                      STS-AREA-DAY
           INITIALIZE                      LNK-DAY1-AREA
           MOVE    "11"                TO  LNK-DAY1-IRAI
           MOVE    WRK-SYMD            TO  LNK-DAY1-YMD
           CALL    "ORCSDAY"           USING   STS-AREA-DAY
                                               LNK-DAY1-AREA
           .
       31011-SEIWA-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    À¾ÎñÆüËÜ¸ìÊÑ´¹½èÍý
      *****************************************************************
       31012-SEIWA-HEN-SEC        SECTION.
      *
           INITIALIZE                      STS-AREA-DAY
           INITIALIZE                      LNK-DAY2-AREA
           MOVE    "21"                TO  LNK-DAY2-IRAI
           MOVE    WRK-SYMD            TO  LNK-DAY2-YMD
           CALL    "ORCSDAY"           USING   STS-AREA-DAY
                                               LNK-DAY2-AREA
           MOVE    LNK-DAY2-EDTYMD3    TO  WRK-HENYMDG
           INSPECT WRK-HENYMDG    REPLACING  ALL "  "  BY  "¡¡"
           .
       31012-SEIWA-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    ½ªÎ»¡¡¡¡½èÍý
      *****************************************************************
       300-END-SEC   SECTION.
      *
           CLOSE  MF101-FILE
           MOVE   WRK-GKENSU  TO  WRK-PARA-PAGE
      *
           DISPLAY "*** SEIKYU0611 IN  "  CNT-RECE02
           DISPLAY "*** SEIKYU0611 OUT "  CNT-MF101
           DISPLAY "*** SEIKYU0611 END ***"
      *
           IF  CNT-MF101  =  0
             DISPLAY "DATA NOT FOUND. PRINT JOB CANCEL!!"
           END-IF
      *
      *    ¥Õ¥¡¥¤¥ëÊÝÂ¸¾ðÊó¹¹¿·
           PERFORM 3001-FILE-INFO-INSERT-SEC
      *
      *    ¥¹¥Æ¥Ã¥×½ªÎ»½èÍý
           MOVE    "STE"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
           MOVE    WRK-PARA-PAGE   TO  JOB-UPDCNT
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA
                                   JOBKANRI-REC
                                   SPA-AREA
      *
           PERFORM 900-DBDISCONNECT-SEC
           .
       300-END-EXT.
           EXIT.
      *
      *****************************************************************
      *    ¥Õ¥¡¥¤¥ëÊÝÂ¸¾ðÊó¹¹¿·½èÍý
      *****************************************************************
       3001-FILE-INFO-INSERT-SEC             SECTION.
      *
           INITIALIZE                  ORCSFILESVAREA
           MOVE    "I"             TO  SFILESV-MODE
           MOVE    WRK-PARA-SHELLID
                                   TO  SFILESV-TBL-KEY
           MOVE    LNK-PRTKANRI-SHELLID
                                   TO  SFILESV-SHELLID  (1)
           MOVE    LNK-PRTKANRI-SHORI-RENNUM
                                   TO  SFILESV-SHORI-RENNUM
                                                        (1)
           MOVE    LNK-PRTKANRI-RENNUM
                                   TO  SFILESV-RENNUM   (1)
           MOVE    LNK-PRTKANRI-SRYYM
                                   TO  SFILESV-SRYYM    (1)
           MOVE    LNK-PRTKANRI-SKYYMD
                                   TO  SFILESV-SKYYMD   (1)
      *    ÀÁµáÇ¯·î¡ÊÏÂÎñ¡ËÊÑ´¹
           MOVE    LNK-PRTKANRI-SKYYMD(1:6)  TO  WRK-SYMD (1:6)
           MOVE    "01"                      TO  WRK-SYMD (7:2)
           PERFORM   31011-SEIWA-HEN-SEC
           EVALUATE  LNK-DAY1-GENKIGO
             WHEN  "M"
               MOVE    1                     TO  WRK-WGEN
             WHEN  "T"
               MOVE    2                     TO  WRK-WGEN
             WHEN  "S"
               MOVE    3                     TO  WRK-WGEN
             WHEN  "H"
               MOVE    4                     TO  WRK-WGEN
           END-EVALUATE
           MOVE    LNK-DAY1-WYMD(2:2)        TO  WRK-WYY
           MOVE    LNK-DAY1-WYMD(4:2)        TO  WRK-WMM
      *    ¥Õ¥¡¥¤¥ëÌ¾
           STRING  "KENTAN_S_"             DELIMITED  BY  SIZE
                   SYS-1001-TENHYOKBN      DELIMITED  BY  SIZE
                   SYS-1001-HOSPCD         DELIMITED  BY  SIZE
                   "_"                     DELIMITED  BY  SIZE
                   WRK-WYMD(1:5)           DELIMITED  BY  SIZE
                   "_1.csv"                DELIMITED  BY  SIZE
                   INTO                    WRK-FILENAME
           END-STRING
           MOVE    WRK-FILENAME    TO  SFILESV-TO-DATA  (1)
           MOVE    WRK-GKENSU   TO  SFILESV-CNT-ALL  (1)
           MOVE    "Ê¡»ã°åÎÅÈñ£Ã£Ó£Ö"    TO  SFILESV-TITLE    (1)
           IF      WRK-GKENSU   >   ZERO
               MOVE    "1"         TO  SFILESV-DATA-TYPE(1)
           END-IF 
           MOVE    WRK-RECEERR     TO  SFILESV-ERR-MSG  (1)
           IF      WRK-RECEERR NOT =   SPACE
               MOVE    "1"         TO  SFILESV-ERR-CODE (1)
           END-IF
           MOVE    "1"             TO  SFILESV-CODE-TYPE (1)
      *
           CALL    "ORCSFILESV"        USING
                                       ORCSFILESVAREA
                                       SPA-AREA
           .
       3001-FILE-INFO-INSERT-EXT.
           EXIT.
      *
      *****************************************************************
      *    ½ÐÎÏ¥ì¥³¡¼¥É½èÍý¡ÊÊ¸»ú¡Ë
      *****************************************************************
       5004-MOJI-HENSYU-SEC          SECTION.
      *
           IF      WRK-DATA        =   SPACE
               CONTINUE
           ELSE
               PERFORM VARYING IDW    FROM    WRK-NAGASA  BY  -1
                       UNTIL   IDW    <       1
                   IF      WRK-DATA (IDW:1)   NOT =   SPACE
                       STRING  WRK-REC(1:WRK-REC-LENGTH) DELIMITED
                                                             BY  SIZE
                               WRK-DATA(1:IDW)           DELIMITED
                                                             BY  SIZE
                               INTO        WRK-REC
                       END-STRING
                       ADD     IDW                 TO  WRK-REC-LENGTH
                       MOVE    1                   TO  IDW
                   END-IF
               END-PERFORM
           END-IF
      *     
           IF      WRK-END         =   ZERO
               STRING  WRK-REC(1:WRK-REC-LENGTH) DELIMITED  BY  SIZE
                       WRK-KUGIRI                DELIMITED  BY  SIZE
                       INTO        WRK-REC
               END-STRING
               ADD     1                   TO  WRK-REC-LENGTH
           END-IF
      *
           INITIALIZE                      WRK-HENSYU-AREA
           .
       5004-MOJI-HENSYU-EXT.
           EXIT.
      *
      *****************************************************************
      *    ½ÐÎÏ¥ì¥³¡¼¥É½èÍý¡Ê¿ô»ú¡ËZZZZZZZZZZ.999¤ÎÊÔ½¸
      *****************************************************************
       5005-NUM-HENSYU-SEC          SECTION.
      *
           IF      WRK-NAGASA          =   ZERO
               CONTINUE
           ELSE                   
      *        ³«»Ï°ÌÃÖ
               COMPUTE WRK-ST  =   11      -   WRK-NAGASA
               IF      WRK-SYOSUU          >   ZERO
                   COMPUTE WRK-ST  =   WRK-ST  +   WRK-SYOSUU
                                               +   1
               END-IF                                
      *     
               PERFORM VARYING IDW    FROM    WRK-ST    BY  1
                       UNTIL   IDW    >       10
                   IF      WRK-NUM (IDW:1)   NOT =   SPACE
                        COMPUTE IDZ     =    11  +   WRK-SYOSUU
                                                 -   IDW
                        IF      WRK-SYOSUU       >   ZERO
                            ADD     1                TO  IDZ
                        END-IF     
                        STRING  WRK-REC(1:WRK-REC-LENGTH)
                                                 DELIMITED  BY  SIZE
                               WRK-NUM(IDW:IDZ)  DELIMITED  BY  SIZE
                               INTO        WRK-REC
                        END-STRING
                        COMPUTE WRK-REC-LENGTH    =   WRK-REC-LENGTH   +
                                                      IDZ
                        MOVE    10                TO  IDW
                   END-IF
               END-PERFORM
           END-IF    
      *     
           IF      WRK-END         =   ZERO
               STRING  WRK-REC(1:WRK-REC-LENGTH) DELIMITED  BY  SIZE
                       WRK-KUGIRI                DELIMITED  BY  SIZE
                       INTO        WRK-REC
               END-STRING        
               ADD     1                   TO  WRK-REC-LENGTH
           END-IF
      *
           INITIALIZE                      WRK-HENSYU-AREA
           .
       5005-NUM-HENSYU-EXT.
           EXIT.
      *
      *****************************************************************
      *    ½ÐÎÏ¥ì¥³¡¼¥É½èÍý¡Ê¿ô»ú¡¦¸ÇÄêÄ¹¡Ë
      *****************************************************************
       5006-NUM-HENSYU-SEC          SECTION.
      *
           IF  WRK-NUM9  =  ZERO
             MOVE    SPACE                  TO  WRK-DATA
             PERFORM  5004-MOJI-HENSYU-SEC
           ELSE
             STRING  WRK-REC(1:WRK-REC-LENGTH)  DELIMITED  BY  SIZE
                     WRK-NUM9(1:WRK-NAGASA)     DELIMITED  BY  SIZE
                     WRK-KUGIRI                 DELIMITED  BY  SIZE
                     INTO        WRK-REC
             END-STRING
             ADD     WRK-NAGASA             TO  WRK-REC-LENGTH
      *       
             INITIALIZE                      WRK-HENSYU-AREA
           END-IF
      *
           .
       5006-NUM-HENSYU-EXT.
           EXIT.
      *
      *****************************************************************
      *    °ì»þ¥Õ¥¡¥¤¥ëÆÉ¹þ
      *****************************************************************
       900-TMP-READ-SEC                SECTION.
      *
           READ  MF101-FILE   NEXT
               AT  END
                   MOVE  1  TO  FLG-PRINT
           END-READ
           .
       900-TMP-READ-EXT.
           EXIT.
      *      
      *****************************************************************
      *    ½¸·×¥Õ¥¡¥¤¥ëÆÉ¹þ
      *****************************************************************
       800-SKTTMP-READ-SEC             SECTION.
      *
           READ    MF101-FILE
               INVALID    KEY
                   MOVE    1           TO  FLG-MF101
               NOT INVALID  KEY
                   MOVE    ZERO        TO  FLG-MF101
           END-READ
           .
       800-SKTTMP-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    ¸øÈñÀÁµá½ñ¥Þ¥¹¥¿ÆÉ¹þ
      *****************************************************************
       900-KOHSKY-START-SEC            SECTION.
      *
           INITIALIZE                  RECE02-REC
           MOVE    SPA-HOSPNUM         TO  RECE02-HOSPNUM
           MOVE    LNK-PRTKANRI-SRYYM  TO  RECE02-SKYYM
           MOVE    RECE02-REC          TO  MCPDATA-REC
      *
           MOVE    "DBSELECT"                 TO  MCP-FUNC
           MOVE    "tbl_kohsky"        TO  MCP-TABLE
           MOVE    "key2"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
           IF      MCP-RC              =   ZERO
               PERFORM 900-KOHSKY-READ-SEC
           ELSE
               MOVE    1                   TO  FLG-END
               PERFORM  900-KOHSKY-CLOSE-SEC
           END-IF
           .
       900-KOHSKY-START-EXT.
           EXIT.
      *      
      *****************************************************************
      *    ¸øÈñÀÁµá½ñ¥Þ¥¹¥¿£Ò£Å£Á£Ä
      *****************************************************************
       900-KOHSKY-READ-SEC         SECTION.
      *
           MOVE    "DBFETCH"                  TO  MCP-FUNC
           MOVE    "tbl_kohsky"        TO  MCP-TABLE
           MOVE    "key2"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
           IF      MCP-RC              =   ZERO
               MOVE    ZERO            TO  FLG-END
               MOVE    MCPDATA-REC     TO  RECE02-REC
               IF  RECE02-KOHNUM(1) = "181" OR "182" OR "183"
                                   OR "184" OR "185" OR
                   RECE02-KOHNUM(2) = "181" OR "182" OR "183"
                                   OR "184" OR "185" OR
                   RECE02-KOHNUM(3) = "181" OR "182" OR "183"
                                   OR "184" OR "185" OR
                   RECE02-KOHNUM(4) = "181" OR "182" OR "183"
                                   OR "184" OR "185"
      *
      *        ¥Æ¥¹¥È´µ¼Ô¤Î¤È¤­¤ÏÆÉ¤ßÈô¤Ð¤¹
                   MOVE    SPACE               TO  PTINF-REC
                   INITIALIZE                      PTINF-REC
                   MOVE    SPA-HOSPNUM         TO  PTINF-HOSPNUM
                   MOVE    RECE02-PTID         TO  PTINF-PTID
                   MOVE    PTINF-REC           TO  MCPDATA-REC
                   PERFORM 800-PTINF-READ-SEC
                   IF      FLG-PTINF           =   ZERO
                   AND     PTINF-TSTPTNUMKBN   =   "1"
                       GO  TO  900-KOHSKY-READ-SEC
                   END-IF   
      *
      *        ¸ÄÊÌÈ¯¹Ô¤Ç´µ¼ÔÈÖ¹æ»ØÄê¤Î¾ì¹ç¡¢ÂÐ¾ÝÈ½Äê¤ò¹Ô¤¦
                   MOVE  ZERO                TO  FLG-ERR
                   IF      WRK-PARA-SYORIFLG   =   "1"
                   AND     FLG-SYORI           =    2
                     MOVE  1                   TO  FLG-ERR
                     PERFORM VARYING IDXX    FROM    1   BY  1
                             UNTIL   IDXX    >   WRK-CONS-PARA-MAX
                             OR      TBL-PARA-PTID(IDXX) =   ZERO
                         IF      RECE02-PTID =   TBL-PARA-PTID(IDXX)
                           MOVE    ZERO                TO  FLG-ERR
                           MOVE    WRK-CONS-PARA-MAX   TO  IDXX
                         END-IF
                     END-PERFORM 
                   END-IF
      *
                   IF      FLG-ERR           =   1
                     GO  TO  900-KOHSKY-READ-SEC
                   END-IF
      *
                   ADD  1  TO  CNT-RECE02
               ELSE
                 GO  TO  900-KOHSKY-READ-SEC
               END-IF
           ELSE
               MOVE    1               TO  FLG-END
               PERFORM  900-KOHSKY-CLOSE-SEC
           END-IF
           .
       900-KOHSKY-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    ¸øÈñÀÁµá¥Þ¥¹¥¿CLOSE
      *****************************************************************
       900-KOHSKY-CLOSE-SEC           SECTION.
      *
           MOVE    "DBCLOSECURSOR"         TO  MCP-FUNC
           MOVE    "tbl_kohsky"          TO  MCP-TABLE
           MOVE    "key2"                TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"           USING
                                         MCPAREA
                                         MCPDATA-REC
                                         SPA-AREA
      *
           .
       900-KOHSKY-CLOSE-EXT.
           EXIT.
      *
      *****************************************************************
      *    ´µ¼Ô¥Þ¥¹¥¿ÆÉ¹þ
      *****************************************************************
       800-PTINF-READ-SEC         SECTION.
      *
           MOVE    "DBSELECT"                 TO  MCP-FUNC
           MOVE    "tbl_ptinf"           TO  MCP-TABLE
           MOVE    "key"                 TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"           USING
                                         MCPAREA
                                         MCPDATA-REC
                                         SPA-AREA
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                  TO  MCP-FUNC
               MOVE    "tbl_ptinf"         TO  MCP-TABLE
               MOVE    "key"               TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"         USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
               IF      MCP-RC              =   ZERO
                   MOVE    ZERO                TO  FLG-PTINF
                   MOVE    MCPDATA-REC         TO  PTINF-REC
               ELSE
                   MOVE    1                   TO  FLG-PTINF
                   INITIALIZE                  PTINF-REC
               END-IF
           ELSE
               MOVE    1                   TO  FLG-PTINF
               INITIALIZE                  PTINF-REC
           END-IF
      *
           MOVE    "DBCLOSECURSOR"            TO  MCP-FUNC
           MOVE    "tbl_ptinf"            TO  MCP-TABLE
           MOVE    "key"                  TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"            USING
                                          MCPAREA
                                          MCPDATA-REC
                                          SPA-AREA
      *
           .
       800-PTINF-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    ÊÝ¸±ÁÈ¹ç¤»¥Þ¥¹¥¿¡¼ÆÉ¤ß¹þ¤ß
      *****************************************************************
       910-HKNCOMBI-READ-SEC         SECTION.
      *
           INITIALIZE                      HKNCOMBI-REC
           MOVE    SPA-HOSPNUM                TO  COMB-HOSPNUM
           MOVE    SYU-PTID                   TO  COMB-PTID
           MOVE    SYU-HKNCOMBINUM            TO  COMB-HKNCOMBINUM
           MOVE    HKNCOMBI-REC               TO  MCPDATA-REC
           MOVE    "DBSELECT"                 TO  MCP-FUNC
           MOVE    "tbl_hkncombi"          TO  MCP-TABLE
           MOVE    "key"                   TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                  TO  MCP-FUNC
               MOVE    "tbl_hkncombi"      TO  MCP-TABLE
               MOVE    "key"               TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"         USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
               IF      MCP-RC              =   ZERO
                   MOVE    MCPDATA-REC     TO  HKNCOMBI-REC
                   MOVE    ZERO            TO  FLG-HKNCOMBI
               ELSE
                   INITIALIZE                  HKNCOMBI-REC
                   MOVE    1               TO  FLG-HKNCOMBI
               END-IF
           ELSE
               INITIALIZE                  HKNCOMBI-REC
               MOVE    1               TO  FLG-HKNCOMBI
           END-IF
      *
           MOVE    "DBCLOSECURSOR"            TO  MCP-FUNC
           MOVE    "tbl_hkncombi"        TO  MCP-TABLE
           MOVE    "key"                 TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"           USING
                                         MCPAREA
                                         MCPDATA-REC
                                         SPA-AREA
      *
           .
       910-HKNCOMBI-READ-EXT.
           EXIT.
      *****************************************************************
      *    ÀÁµáÅÀ¿ô½¸·×½èÍý
      *****************************************************************
       800-SEIKYU-SEC  SECTION.
      *
           PERFORM  VARYING  IDX  FROM  1  BY  1
                    UNTIL    IDX  >     4  OR
                    SYU-KOH-HKNNUM(IDX) =  SPACE
      *
               IF   SYU-KOH-HKNNUM(IDX)  NOT =  "027"  AND
                    SYU-KOH-HKNNUM(IDX)(1:1) =  "0"
                 IF  WRK-ETC-KOHNUM(1)       =  SPACE
                 OR                             SYU-KOH-HKNNUM(IDX)
                   MOVE  1                    TO  IDY
                 ELSE
                   MOVE  2                    TO  IDY
                 END-IF
                 DISPLAY "IDY=" IDY
                 MOVE  SYU-KOH-HKNNUM(IDX)  TO  WRK-ETC-KOHNUM(IDY)
                 ADD   SYU-TOTAL-HKNTEN     TO  WRK-ETC-TENSU(IDY)
                 IF   (RECE02-FTNMONEY(1)    >  ZERO)
                 OR   (SYU-KOH-HKNNUM(IDX)  NOT =  "010" AND "011"
                                            AND    "021" AND "020")
                   ADD     SYU-KOH-COMPFTN(IDX)
                                            TO  WRK-ETC-ITBFTN(IDY)
                 END-IF
               END-IF
      *
      *    ·×»»ÉéÃ´¶â¤Ëº¹¤¬Í­¤ë¾ì¹ç¡¢ÃÏÊý¸øÈñ¤Î½õÀ®¤¬¤¢¤Ã¤¿¤ÈÈ½Äê¤¹¤ë
               IF   SYU-KOH-HKNNUM(IDX) = WRK-KOHNUM
                 IF     IDX             =  1
                   IF  SYU-SYUCOMPFTN-ENTANI   
                                        >  SYU-KOH-COMPFTN-ENTANI(IDX)
                     MOVE     ZERO         TO  FLG-ERR
                   END-IF
                 ELSE
                   IF  SYU-KOH-COMPFTN-ENTANI(IDX - 1)
                                        >  SYU-KOH-COMPFTN-ENTANI(IDX)
                     MOVE     ZERO         TO  FLG-ERR
                   END-IF
                 END-IF
               END-IF
      *
               IF  SYU-KOH-HKNNUM(IDX) = "972" OR "974"
                 MOVE    1     TO      MF101-TYOKI
               END-IF
      *
           END-PERFORM
      *
           IF  RECE02-FTNMONEY(1)       >  ZERO
             IF  RECE02-RJNHKNNUM  NOT  =  SPACE
               ADD  SYU-KOH-COMPFTN(1) TO WRK-FTNMONEY-G
             ELSE
               ADD  SYU-SYUCOMPFTN     TO WRK-FTNMONEY-G
             END-IF
           END-IF
      *
           .
       800-SEIKYU-SEC-EXT.
           EXIT.
      *
      *****************************************************************
      *    Äã½êÆÀ¥Þ¥¹¥¿ÆÉ¹þ
      *****************************************************************
       800-TSYRRK-FETCH-SEC         SECTION.
      *
           MOVE    "DBFETCH"               TO  MCP-FUNC
           MOVE    "tbl_tsyrrk"        TO  MCP-TABLE
           MOVE    "key3"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
           IF      MCP-RC   =   ZERO
               MOVE    ZERO                TO  FLG-TSYRRK
               MOVE    MCPDATA-REC         TO  TSYRRK-REC
           ELSE
               MOVE    1                   TO  FLG-TSYRRK
               INITIALIZE                  TSYRRK-REC
           END-IF
      *
           .
       800-TSYRRK-FETCH-EXT.
           EXIT.
      *****************************************************************
      *    ÄãÇ¯¶â¥Þ¥¹¥¿ÆÉ¹þ
      *****************************************************************
       800-TNKRRK-FETCH-SEC         SECTION.
      *
           MOVE    "DBFETCH"               TO  MCP-FUNC
           MOVE    "tbl_tnkrrk"        TO  MCP-TABLE
           MOVE    "key3"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
           IF      MCP-RC   =   ZERO
               MOVE    ZERO                TO  FLG-TNKRRK
               MOVE    MCPDATA-REC         TO  TNKRRK-REC
           ELSE
               MOVE    1                   TO  FLG-TNKRRK
               INITIALIZE                  TNKRRK-REC
           END-IF
      *
           .
       800-TNKRRK-FETCH-EXT.
           EXIT.
      *****************************************************************
      *  ¼ýÇ¼¾ðÊó¥»¥Ã¥È
      *****************************************************************
       920-SYUNOU-SET-SEC  SECTION.
      *
             INITIALIZE  SYUNOU-REC
             MOVE  SPA-HOSPNUM        TO  SYU-HOSPNUM
             MOVE  RECE02-NYUGAIKBN   TO  SYU-NYUGAIKBN
             MOVE  RECE02-PTID        TO  SYU-PTID
             MOVE  RECE02-SRYYM(1:6)  TO  SYU-SRYYMD(1:6)
             MOVE  "__"               TO  SYU-SRYYMD(7:2)
             MOVE  WRK-KOHNUM         TO  SYU-KOH-HKNNUM(1)
                                          SYU-KOH-HKNNUM(2)
                                          SYU-KOH-HKNNUM(3)
                                          SYU-KOH-HKNNUM(4)
             MOVE  SYUNOU-REC         TO  MCPDATA-REC
             MOVE  "DBSELECT"         TO  MCP-FUNC
             MOVE  "tbl_syunou"       TO  MCP-TABLE
             MOVE  WRK-PATH           TO  MCP-PATHNAME
             CALL  "ORCDBMAIN"        USING
                                      MCPAREA
                                      MCPDATA-REC
                                      SPA-AREA
             IF  MCP-RC  =  ZERO
               MOVE  "tbl_syunou"       TO  MCP-TABLE
               MOVE  WRK-PATH           TO  MCP-PATHNAME
               PERFORM  925-SYUNOU-READ-SEC
      *
               PERFORM  UNTIL  FLG-SYUNOU  =  1
                 IF  SYU-DENPJTIKBN   NOT = "3"
                   IF    SYU-HKNCOMBINUM  =  RECE02-HKNCOMBI(1) OR
                                             RECE02-HKNCOMBI(2) OR
                                             RECE02-HKNCOMBI(3) OR
                                             RECE02-HKNCOMBI(4) OR
                                             RECE02-HKNCOMBI(5) OR
                                             RECE02-HKNCOMBI(6) OR
                                             RECE02-HKNCOMBI(7) OR
                                             RECE02-HKNCOMBI(8) OR
                                             RECE02-HKNCOMBI(9) OR
                                             RECE02-HKNCOMBI(10) 
                     PERFORM  910-HKNCOMBI-READ-SEC
                     IF  COMB-KOHID(1)    =  WRK-KOHID   OR
                         COMB-KOHID(2)    =  WRK-KOHID   OR
                         COMB-KOHID(3)    =  WRK-KOHID   OR
                         COMB-KOHID(4)    =  WRK-KOHID
                       PERFORM  800-SEIKYU-SEC
                     END-IF
                   END-IF
                 END-IF
      *
                 MOVE  "tbl_syunou"       TO  MCP-TABLE
                 MOVE  WRK-PATH           TO  MCP-PATHNAME
                 PERFORM   925-SYUNOU-READ-SEC
               END-PERFORM
             ELSE
               DISPLAY  "SYUNOU SELECT ERR"
             END-IF
      *
             INITIALIZE  MCPAREA
             MOVE  "DBCLOSECURSOR"   TO  MCP-FUNC
             MOVE  "tbl_syunou"       TO  MCP-TABLE
             MOVE  WRK-PATH           TO  MCP-PATHNAME
             CALL  "ORCDBMAIN"        USING
                                      MCPAREA
                                      MCPDATA-REC
                                      SPA-AREA
      *
           .
       920-SYUNOU-SET-EXT.
           EXIT.
      *
      *****************************************************************
      *    ¼ýÇ¼ÆÉ¹þ
      *****************************************************************
       925-SYUNOU-READ-SEC  SECTION.
      *
           MOVE  "DBFETCH"  TO  MCP-FUNC
           CALL  "ORCDBMAIN"        USING
                                    MCPAREA
                                    MCPDATA-REC
                                    SPA-AREA
           IF  MCP-RC  =  ZERO
             MOVE  MCPDATA-REC  TO  SYUNOU-REC
             MOVE  ZERO         TO  FLG-SYUNOU
           ELSE
             INITIALIZE  SYUNOU-REC
             MOVE  1  TO  FLG-SYUNOU
           END-IF
      *
           .
       925-SYUNOU-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    ÀÁµá´ÉÍý¾ðÊóÆÉ¤ß¹þ¤ß
      *****************************************************************
       900-SEIKYU-READ-SEC         SECTION.
      *
           INITIALIZE                  RECE10-REC
           MOVE    RECE02-KEY                  TO  RECE10-KEY
           MOVE    RECE10-REC                  TO  MCPDATA-REC
           MOVE    "DBSELECT"                  TO  MCP-FUNC
           MOVE    "tbl_seikyu"            TO  MCP-TABLE
           MOVE    "key"                   TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                 TO  MCP-FUNC
               MOVE    "tbl_seikyu"            TO  MCP-TABLE
               MOVE    "key"                   TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"             USING
                                               MCPAREA
                                               MCPDATA-REC
                                               SPA-AREA
               IF      MCP-RC              =   ZERO
                   MOVE    ZERO                TO  FLG-RECE10
                   MOVE    MCPDATA-REC         TO  RECE10-REC
               ELSE
                   MOVE    1                   TO  FLG-RECE10
                   INITIALIZE                  RECE10-REC
               END-IF
           ELSE
               MOVE    1                   TO  FLG-RECE10
               INITIALIZE                  RECE10-REC
           END-IF
      *
           MOVE    "DBCLOSECURSOR"           TO  MCP-FUNC
           MOVE    "tbl_seikyu"            TO  MCP-TABLE
           MOVE    "key"                   TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *
           .
       900-SEIKYU-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    ¸øÈñ¤ÎÉéÃ´¼ÔÈÖ¹æ¼èÆÀ
      *****************************************************************
       930-PTKOHINF-SET-SEC  SECTION.
      *
           INITIALIZE  PTKOHINF-REC
           MOVE  SPA-HOSPNUM        TO  PTKOH-HOSPNUM
           MOVE  RECE02-PTID        TO  PTKOH-PTID
           MOVE  WRK-KOHNUM         TO  PTKOH-KOHNUM
      *
           MOVE  PTKOHINF-REC              TO  MCPDATA-REC
           MOVE  "DBSELECT"                TO  MCP-FUNC
           MOVE    "tbl_ptkohinf"          TO  MCP-TABLE
           MOVE    "key4"                  TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
           IF  MCP-RC  =  ZERO
             MOVE    "tbl_ptkohinf"          TO  MCP-TABLE
             MOVE    "key4"                  TO  MCP-PATHNAME
             PERFORM  935-PTKOHINF-READ-SEC
             PERFORM  UNTIL  FLG-PTKOHINF = 1
               IF  PTKOH-SAKJOKBN  NOT = "1"
                 IF  PTKOH-TEKSTYMD(1:6) <= RECE02-SRYYM(1:6)  AND 
                     PTKOH-TEKEDYMD(1:6) >= RECE02-SRYYM(1:6)
                     MOVE  PTKOH-FTNJANUM  TO  WRK-ETC-FTNJANUM
                     MOVE  PTKOH-JKYSNUM   TO  WRK-ETC-JKYSNUM
                 END-IF
               END-IF
                 MOVE    "tbl_ptkohinf"          TO  MCP-TABLE
                 MOVE    "key4"                  TO  MCP-PATHNAME
                 PERFORM  935-PTKOHINF-READ-SEC
             END-PERFORM
           END-IF
      *
           INITIALIZE  MCPAREA
           MOVE  "DBCLOSECURSOR"         TO  MCP-FUNC
           MOVE    "tbl_ptkohinf"          TO  MCP-TABLE
           MOVE    "key4"                  TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *
           .
       930-PTKOHINF-SET-EXT.
           EXIT.
      *
      *****************************************************************
      *    ¸øÈñ¤ÎÉéÃ´¼ÔÈÖ¹æ¼èÆÀ
      *****************************************************************
       935-PTKOHINF-READ-SEC  SECTION.
      *
           MOVE  "DBFETCH"    TO  MCP-FUNC
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
           IF  MCP-RC  =  ZERO
             MOVE  MCPDATA-REC  TO  PTKOHINF-REC
             MOVE  ZERO         TO  FLG-PTKOHINF
           ELSE
             INITIALIZE  PTKOHINF-REC
             MOVE  1  TO  FLG-PTKOHINF
           END-IF
      *
           .
       935-PTKOHINF-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *  ¿ÇÎÅ¾ðÊó¥»¥Ã¥È
      *****************************************************************
       940-SRYACT-SET-SEC  SECTION.
      *
             INITIALIZE  SRYACT-REC
             MOVE  SPA-HOSPNUM           TO  SRY-HOSPNUM
             MOVE  RECE02-NYUGAIKBN      TO  SRY-NYUGAIKBN
             MOVE  RECE02-PTID           TO  SRY-PTID
             MOVE  RECE02-SRYYM          TO  SRY-SRYYM
             MOVE  SRYACT-REC            TO  MCPDATA-REC
             MOVE  "DBSELECT"            TO  MCP-FUNC
             MOVE  "tbl_sryact"          TO  MCP-TABLE
             MOVE  "key4"                TO  MCP-PATHNAME
             CALL  "ORCDBMAIN"           USING
                                         MCPAREA
                                         MCPDATA-REC
                                         SPA-AREA
             IF  MCP-RC  =  ZERO
               MOVE  "tbl_sryact"        TO  MCP-TABLE
               MOVE  "key4"              TO  MCP-PATHNAME
               PERFORM  945-SRYACT-READ-SEC
      *
               PERFORM  UNTIL  FLG-SRYACT  =  1
                 PERFORM  VARYING  IDX3  FROM  1  BY  1
                          UNTIL   (IDX3  >     5) OR
                                  (SRY-SRYCD(IDX3)  =  SPACE)
                   PERFORM  VARYING  IDX4  FROM  1  BY  1
                            UNTIL    IDX4  >  5
                     IF  SRY-SRYCD(IDX3)  =  WRK-COMMENTCD(IDX4)
                       MOVE  WRK-COMMENTKBN(IDX4)   TO  MF101-COMMENT
                       MOVE  5                      TO  IDX3
                       MOVE  5                      TO  IDX4
                     END-IF
                   END-PERFORM
                 END-PERFORM
      *
                 MOVE  "tbl_sryact"      TO  MCP-TABLE
                 MOVE  "key4"            TO  MCP-PATHNAME
                 PERFORM  945-SRYACT-READ-SEC
               END-PERFORM
             ELSE
               DISPLAY  "SRYACT SELECT ERR"
             END-IF
      *
             INITIALIZE  MCPAREA
             MOVE  "DBCLOSECURSOR"       TO  MCP-FUNC
             MOVE  "tbl_sryact"          TO  MCP-TABLE
             MOVE  "key4"                TO  MCP-PATHNAME
             CALL  "ORCDBMAIN"           USING
                                         MCPAREA
                                         MCPDATA-REC
                                         SPA-AREA
      *
           .
       940-SRYACT-SET-EXT.
           EXIT.
      *
      *****************************************************************
      *    ¿ÇÎÅ¾ðÊóÆÉ¹þ
      *****************************************************************
       945-SRYACT-READ-SEC  SECTION.
      *
           MOVE  "DBFETCH"      TO  MCP-FUNC
           CALL  "ORCDBMAIN"        USING
                                    MCPAREA
                                    MCPDATA-REC
                                    SPA-AREA
           IF  MCP-RC  =  ZERO
             MOVE  MCPDATA-REC  TO  SRYACT-REC
             MOVE  ZERO         TO  FLG-SRYACT
           ELSE
             INITIALIZE   SRYACT-REC
             MOVE  1  TO  FLG-SRYACT
           END-IF
      *
           .
       945-SRYACT-READ-EXT.
           EXIT.
      *
      *=== ¸øÈñÍó¡Ý°ìÉôÉéÃ´¶â¶â³ÛÃÖ´¹ÂÐ±þ by Yoshikawa(2013/04/03) start
      *****************************************************************
      *    ¿ÇÎÅ¾ðÊó¥»¥Ã¥È
      *****************************************************************
       940-SRYACT2-SET-SEC  SECTION.
      *
             INITIALIZE                      SRYACT-REC
      *
             MOVE  SPA-HOSPNUM           TO  SRY-HOSPNUM
             MOVE  RECE02-NYUGAIKBN      TO  SRY-NYUGAIKBN
             MOVE  RECE02-PTID           TO  SRY-PTID
             MOVE  RECE02-SRYYM          TO  SRY-SRYYM
             MOVE  WRK-SRYCD             TO  SRY-SRYCD(1)
                                             SRY-SRYCD(2)
                                             SRY-SRYCD(3)
                                             SRY-SRYCD(4)
                                             SRY-SRYCD(5)
             MOVE  SRYACT-REC            TO  MCPDATA-REC
             MOVE  "DBSELECT"            TO  MCP-FUNC
             MOVE  "tbl_sryact"          TO  MCP-TABLE
             MOVE  "key7"                TO  MCP-PATHNAME
             CALL  "ORCDBMAIN"           USING
                                         MCPAREA
                                         MCPDATA-REC
                                         SPA-AREA
      *
             IF  MCP-RC  =  ZERO
               MOVE  "tbl_sryact"        TO  MCP-TABLE
               MOVE  "key7"              TO  MCP-PATHNAME
               PERFORM  945-SRYACT-READ-SEC
             ELSE
               DISPLAY  "SRYACT SELECT ERR"
             END-IF
      *
             INITIALIZE  MCPAREA
             MOVE  "DBCLOSECURSOR"       TO  MCP-FUNC
             MOVE  "tbl_sryact"          TO  MCP-TABLE
             MOVE  "key7"                TO  MCP-PATHNAME
             CALL  "ORCDBMAIN"           USING
                                         MCPAREA
                                         MCPDATA-REC
                                         SPA-AREA
      *
           .
       940-SRYACT2-SET-EXT.
           EXIT.
      *
      *****************************************************************
      *    ´µ¼Ô¥³¥á¥ó¥È¾ðÊó¥»¥Ã¥È
      *****************************************************************
       950-PTCOM-READ-SEC  SECTION.
      *
             INITIALIZE                      PTCOM-REC
      *
             MOVE  SPA-HOSPNUM           TO  PTCOM-HOSPNUM
             MOVE  SRY-PTID              TO  PTCOM-PTID
             MOVE  SRY-ZAINUM            TO  PTCOM-ZAINUM
             MOVE  SRY-SRYCD(IDX4)       TO  PTCOM-SRYCD
             MOVE  SRY-INPUTNUM(IDX4)    TO  PTCOM-RENNUM
             MOVE  PTCOM-REC             TO  MCPDATA-REC
             MOVE  "DBSELECT"            TO  MCP-FUNC
             MOVE  "tbl_ptcom"           TO  MCP-TABLE
             MOVE  "key"                 TO  MCP-PATHNAME
             CALL  "ORCDBMAIN"           USING
                                         MCPAREA
                                         MCPDATA-REC
                                         SPA-AREA
      *
             IF  MCP-RC  =  ZERO
               MOVE  "tbl_ptcom"         TO  MCP-TABLE
               MOVE  "key"               TO  MCP-PATHNAME
               MOVE  "DBFETCH"           TO  MCP-FUNC
               CALL  "ORCDBMAIN"         USING
                                         MCPAREA
                                         MCPDATA-REC
                                         SPA-AREA
               IF  MCP-RC  =  ZERO
                 MOVE  MCPDATA-REC       TO  PTCOM-REC
                 MOVE  ZERO              TO  FLG-PTCOM
               ELSE
                 INITIALIZE                  PTCOM-REC
                 MOVE    1               TO  FLG-PTCOM
               END-IF
             ELSE
               DISPLAY  "PTCOM SELECT ERR"
             END-IF
      *
             INITIALIZE  MCPAREA
             MOVE  "DBCLOSECURSOR"       TO  MCP-FUNC
             MOVE  "tbl_ptcom"           TO  MCP-TABLE
             MOVE  "key"                 TO  MCP-PATHNAME
             CALL  "ORCDBMAIN"           USING
                                         MCPAREA
                                         MCPDATA-REC
                                         SPA-AREA
      *
           .
       950-PTCOM-SET-EXT.
           EXIT.
      *
      *=== ¸øÈñÍó¡Ý°ìÉôÉéÃ´¶â¶â³ÛÃÖ´¹ÂÐ±þ by Yoshikawa(2013/04/03) end
      *****************************************************************
      *    ´µ¼Ô¸øÈñ¾ðÊó¥Þ¥¹¥¿ÆÉ¹þ
      *****************************************************************
       800-PTKOHINF-FETCH-SEC         SECTION.
      *
           MOVE    "DBFETCH"               TO  MCP-FUNC
           MOVE    "tbl_ptkohinf"      TO  MCP-TABLE
           MOVE    "key2"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
           IF      MCP-RC   =   ZERO
               MOVE    ZERO                TO  FLG-PTKOHINF
               MOVE    MCPDATA-REC         TO  PTKOHINF-REC
           ELSE
               MOVE    1                   TO  FLG-PTKOHINF
               INITIALIZE                  PTKOHINF-REC
           END-IF
      *
           .
       800-PTKOHINF-FETCH-EXT.
           EXIT.
      *****************************************************************
      *    ´µ¼Ô¸øÈñÉéÃ´¾ðÊóÆÉ¹þ½èÍý
      *****************************************************************
       930-PTKOHFTN-READ-SEC         SECTION.
      *
           INITIALIZE                          PTKOHFTN-REC
      *
           MOVE    SPA-HOSPNUM             TO  PTKOHFTN-HOSPNUM
           MOVE    MF101-PTID              TO  PTKOHFTN-PTID
           MOVE    PTKOHFTN-REC            TO  MCPDATA-REC
           MOVE    "DBSELECT"              TO  MCP-FUNC
           MOVE    "tbl_ptkohftn"          TO  MCP-TABLE
           MOVE    "key2"                  TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"           TO  MCP-FUNC
               MOVE    "tbl_ptkohftn"      TO  MCP-TABLE
               MOVE    "key2"              TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"         USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
               IF      MCP-RC              =   ZERO
                   MOVE    MCPDATA-REC         TO  PTKOHFTN-REC
                   MOVE    ZERO                TO  FLG-PTKOHFTN
               ELSE
                   MOVE    1                   TO  FLG-PTKOHFTN
                   INITIALIZE                  PTKOHFTN-REC
               END-IF
           ELSE
               MOVE    1                   TO  FLG-PTKOHFTN
               INITIALIZE                  PTKOHFTN-REC
           END-IF
      *
           MOVE    "DBCLOSECURSOR"         TO  MCP-FUNC
           MOVE    "tbl_ptkohftn"          TO  MCP-TABLE
           MOVE    "key2"                  TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *
           .
       930-PTKOHFTN-READ-EXT.
           EXIT.
      *****************************************************************
      *    ·îËöÆü»»½Ð½èÍý
      *****************************************************************
       31012-LASTDAY-GET-SEC        SECTION.
      *
           INITIALIZE                      STS-AREA-DAY
           INITIALIZE                      LNK-DAY7-AREA
           MOVE    "71"                   TO  LNK-DAY7-IRAI
           MOVE    WRK-SYMD     TO  LNK-DAY7-YM
           CALL    "ORCSDAY"       USING   STS-AREA-DAY
                                                  LNK-DAY7-AREA
           MOVE LNK-DAY7-KOYOMI  TO  WRK-SYMD
           .
       31012-LASTDAY-GET-EXT.
           EXIT.
      *
      *****************************************************************
      *    ´ÉÍý¥Þ¥¹¥¿ÆÉ¤ß¹þ¤ß
      *****************************************************************
       800-SYSKANRI-READ-SEC  SECTION.
      *
           MOVE  "DBSELECT"                TO  MCP-FUNC
           MOVE    "tbl_syskanri"          TO  MCP-TABLE
           MOVE    "key10"                 TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
           IF  MCP-RC  =  ZERO
             MOVE  "DBFETCH"                TO  MCP-FUNC
             MOVE  "tbl_syskanri"          TO  MCP-TABLE
             MOVE  "key10"                 TO  MCP-PATHNAME
             CALL  "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
             IF  MCP-RC  =  ZERO
               MOVE  ZERO  TO  FLG-SYSKANRI
             ELSE
               MOVE  1  TO  FLG-SYSKANRI
             END-IF
           ELSE
             MOVE  1  TO  FLG-SYSKANRI
           END-IF
      *
           MOVE  "DBCLOSECURSOR"          TO  MCP-FUNC
           MOVE  "tbl_syskanri"          TO  MCP-TABLE
           MOVE  "key10"                 TO  MCP-PATHNAME
           CALL  "ORCDBMAIN"             USING
                                         MCPAREA
                                         MCPDATA-REC
                                         SPA-AREA
      *
           .
       800-SYSKANRI-READ-EXT.
           EXIT.
      *      
      *****************************************************************
      *    Á´³ÑÊÑ´¹½èÍý
      *****************************************************************
       2009-HENKAN-SEC                 SECTION.
      *
           INITIALIZE                  WRK-OUT-INPUT
      *
           INITIALIZE                  ORCSKANACHKAREA
           MOVE    "2"                 TO  KANACHK-SYORI
           MOVE    WRK-MAE-INPUT       TO  KANACHK-MAE-INPUT
           CALL    "ORCSKANACHK"       USING
                                       ORCSKANACHKAREA
           IF      KANACHK-RC          =   ZERO
               MOVE    KANACHK-OUT-INPUT
                                           TO  WRK-OUT-INPUT
           ELSE
               MOVE    WRK-MAE-INPUT       TO  WRK-OUT-INPUT
           END-IF
      *
           .
       2009-HENKAN-EXT.
           EXIT.
      *****************************************************************
      *    °åÎÅµ¡´ØÊÔ½¸¾ðÊóÆÉ¤ß¹þ¤ß
      *****************************************************************
       900-1900-READ-SEC           SECTION.
      *
      *    °åÎÅµ¡´ØÊÔ½¸¾ðÊóÆÉ¤ß¹þ¤ß
           MOVE    SPACE                   TO  SYS-1900-REC
           INITIALIZE                          SYS-1900-REC
           MOVE    "1900"                  TO  SYS-1900-KANRICD
           MOVE    "*"                     TO  SYS-1900-KBNCD
           MOVE    SPA-HOSPNUM             TO  SYS-1900-HOSPNUM
           MOVE    LNK-PRTKANRI-SRYYM      TO  SYS-1900-STYUKYMD(1:6)
           MOVE    "01"                    TO  SYS-1900-STYUKYMD(7:2)
           MOVE    LNK-PRTKANRI-SRYYM      TO  SYS-1900-EDYUKYMD(1:6)
           MOVE    "01"                    TO  SYS-1900-EDYUKYMD(7:2)
           MOVE    SYS-1900-REC            TO  MCPDATA-REC
           PERFORM 800-SYSKANRI-READ-SEC
           IF      FLG-SYSKANRI        =   ZERO
               MOVE    MCPDATA-REC         TO  SYS-1900-REC
               IF      SYS-1900-PRTKBN(8) NOT =   SPACE
      *            °åÎÅµ¡´ØÌ¾¾ÎÊÔ½¸¾ðÊó
                   PERFORM 900-1901-READ-SEC
      *            °åÎÅµ¡´Ø½»½êÊÔ½¸¾ðÊó
                   PERFORM 900-1902-READ-SEC
               END-IF
           ELSE
               INITIALIZE                  SYS-1900-REC
           END-IF
           .
      *
       900-1900-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    °åÎÅµ¡´ØÌ¾¾ÎÊÔ½¸¾ðÊóÆÉ¤ß¹þ¤ß
      *****************************************************************
       900-1901-READ-SEC           SECTION.
      *
      *    °åÎÅµ¡´ØÌ¾¾ÎÊÔ½¸¾ðÊóÆÉ¤ß¹þ¤ß
           MOVE    SPACE               TO  SYS-1901-REC
           INITIALIZE                      SYS-1901-REC
           MOVE    "1901"              TO  SYS-1901-KANRICD
           MOVE    SYS-1900-PRTKBN(8)  TO  SYS-1901-KBNCD
           MOVE    SPA-HOSPNUM         TO  SYS-1901-HOSPNUM
           MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1901-STYUKYMD(1:6)
           MOVE    "01"                TO  SYS-1901-STYUKYMD(7:2)
           MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1901-EDYUKYMD(1:6)
           MOVE    "01"                TO  SYS-1901-EDYUKYMD(7:2)
           MOVE    SYS-1901-REC        TO  MCPDATA-REC
           PERFORM 800-SYSKANRI-READ-SEC
           IF      FLG-SYSKANRI        =   ZERO
               MOVE    MCPDATA-REC         TO  SYS-1901-REC
               MOVE    SYS-1901-HOSPNAME1  TO  WRK-HOSPNAME1
               MOVE    SYS-1901-HOSPNAME2  TO  WRK-HOSPNAME2
           ELSE
               INITIALIZE                  SYS-1901-REC
           END-IF
           .
      *
       900-1901-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    °åÎÅµ¡´Ø½»½êÊÔ½¸¾ðÊóÆÉ¤ß¹þ¤ß
      *****************************************************************
       900-1902-READ-SEC           SECTION.
      *
      *    °åÎÅµ¡´Ø½»½êÊÔ½¸¾ðÊóÆÉ¤ß¹þ¤ß
           MOVE    SPACE               TO  SYS-1902-REC
           INITIALIZE                      SYS-1902-REC
           MOVE    "1902"              TO  SYS-1902-KANRICD
           MOVE    SYS-1900-PRTKBN(8)  TO  SYS-1902-KBNCD
           MOVE    SPA-HOSPNUM         TO  SYS-1902-HOSPNUM
           MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1902-STYUKYMD(1:6)
           MOVE    "01"                TO  SYS-1902-STYUKYMD(7:2)
           MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1902-EDYUKYMD(1:6)
           MOVE    "01"                TO  SYS-1902-EDYUKYMD(7:2)
           MOVE    SYS-1902-REC        TO  MCPDATA-REC
           PERFORM 800-SYSKANRI-READ-SEC
           IF      FLG-SYSKANRI        =   ZERO
               MOVE    MCPDATA-REC     TO  SYS-1902-REC
               MOVE    SYS-1902-ADRS1  TO  WRK-HOSPADRS1
               MOVE    SYS-1902-ADRS2  TO  WRK-HOSPADRS2
               MOVE    SYS-1902-TEL    TO  WRK-HOSPTEL
           ELSE
               INITIALIZE                  SYS-1902-REC
           END-IF
           .
      *
       900-1902-READ-EXT.
           EXIT.
      *****************************************************************
      *    ¥Ñ¥é¥á¥¿ÆÉ¹þ
      *****************************************************************
       900-BTPARA-READ-N-SEC          SECTION.
      *
           MOVE    "DBFETCH"           TO  MCP-FUNC
           CALL  "ORCDBMAIN"           USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
           IF      MCP-RC              =   ZERO
               MOVE    MCPDATA-REC         TO  BTPARA-REC
               MOVE    ZERO                TO  FLG-BTPARA
           ELSE
               MOVE    1                   TO  FLG-BTPARA
               INITIALIZE                      BTPARA-REC
           END-IF
      *
           .
       900-BTPARA-READ-N-EXT.
           EXIT.
      *
      *****************************************************************
      *    £Ä£Â¡¡¥ª¡¼¥×¥ó½èÍý
      *****************************************************************
       100-DBOPEN-SEC  SECTION.
      *
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
           MOVE  "DBOPEN"   TO  MCP-FUNC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
           MOVE  "DBSTART"  TO  MCP-FUNC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
           .
       100-DBOPEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    £Ä£Â¡¡¥¯¥í¡¼¥º½èÍý
      *****************************************************************
       900-DBDISCONNECT-SEC  SECTION.
      *
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
           MOVE  "DBCOMMIT"      TO  MCP-FUNC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
           MOVE  "DBDISCONNECT"  TO  MCP-FUNC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
           .
       900-DBDISCONNECT-EXT.
           EXIT.
      *
