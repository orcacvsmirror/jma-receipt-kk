      *******************************************************************
      * Project code name "ORCA"
      * ŽÆŽ°êËŽ¸Ž½à§Ž¥Ž»Ž¥Ž×Ž¥ŽÈŽ¥Ž½Ž¥ŽÕŽ¥ŽÈŽ¡ŽÊJMA standard receipt softwareŽ¡ŽË
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
      * this licence along with this program. If not, stop using this
      * program and contact JMA, 2-28-16 Honkomagome, Bunkyo-ku, Tokyo,
      * 113-8621, Japan.
      ********************************************************************
       IDENTIFICATION          DIVISION.
       PROGRAM-ID.             SOKATU0525.
      *****************************************************************
      *  Ž¥Ž·Ž¥Ž¹Ž¥ŽÆŽ¥àÎŽ¾        : Ž£ŽÏŽ£ŽÒŽ£ŽÃŽ£ŽÁ
      *  Ž¥ŽµŽ¥ŽÖŽ¥Ž·Ž¥Ž¹Ž¥ŽÆŽ¥àÎŽ¾    : Ž·ý·Ž¡ŽÄŽ¢ŽÉŽ¼
      *  Ž¥Ž³Ž¥Ž¥ŽÝŽ¡Ž¼Ž¥ŽÍŽ¥Ž¥ŽÈŽÌŽ¾  : Ž¼Ž¯Ž»ŽÅî£Ž¦Ž¹Ž­Ž°ðÑŽ¢Ž¹î£Ž¦Ž¿ŽÇŽÎŽÅŽÊŽ½Ž·ŽÀŽÁŽµâ¿
      *  Ž´ŽÉŽÍŽ¼ŽÔ            : 
      *  Žºý´Ž®ŽÆŽÉŽÕ    ŽºúøŽÈŽ¼ŽÔ        ŽµŽ­Ž½ŽÒ
      *  08/04/30    ŽÅŽÄŽÃ          Ž¿Ž·ŽµŽ¬Žºý´Ž®
      *****************************************************************
      *  Ž¥Ž×Ž¥Ž¥Ž°Ž¥ò§à¿Ž¤ŽÀŽµŽÍõ¬
      * Maj/Min/Rev  Ž½Ž¤ŽÀŽµŽ¼ŽÔ  ŽÆŽÉŽÕ        ŽÆäÏŽÆ
      *  01.00.01    ŽµŽÈŽÀ    2008/05/14  Ž¸ŽÈŽ¤ŽÏŽ°Ž²ŽÕŽ½ô¦ŽËŽ½Ž¸Ž·Ž×Ž¤Ž¹Ž¤
      *  01.00.02    ŽÆäÇŽÄ    2009/04/02  ŽÅŽÀŽ¿ŽÉŽ½Ž¶ðÌŽ¬ŽÄŽÉŽ²ŽÃ
      *****************************************************************
      *
       ENVIRONMENT                 DIVISION.
       CONFIGURATION               SECTION.
       INPUT-OUTPUT                SECTION.
       FILE-CONTROL.
      *
      *    ŽÀŽÁŽµâ¥ŽÄŽ£ŽÂŽ¹Ž¹Ž¿Ž·ŽÍŽÑŽ¥ŽÕŽ¥Ž¡Ž¥Ž¤Ž¥
           SELECT  UPD-FILE        ASSIGN  RECEUPD
                                   ORGANIZATION    IS  LINE
                                                       SEQUENTIAL 
                                   FILE    STATUS  IS  STS-RECEUPD.
      *
      *    Ž¥Ž¨Ž¥ò£Ž¼Ž¥ŽÕŽ¥Ž¡Ž¥Ž¤Ž¥
           SELECT  RECEERR-FILE    ASSIGN  RECEERR
                                   FILE    STATUS  IS  STS-RECEERR.
      *
       DATA                        DIVISION.
       FILE                        SECTION.
      *
      *    ŽÀŽÁŽµâ¥ŽÄŽ£ŽÂŽ¹Ž¹Ž¿Ž·ŽÍŽÑŽ¥ŽÕŽ¥Ž¡Ž¥Ž¤Ž¥
       FD  UPD-FILE.
           COPY    "CPRCF010.INC"  REPLACING  //RECE10//
                                   BY         //RECE10X//.
      *
      *    Ž¥Ž¨Ž¥ò£Ž¼Ž¥ŽÕŽ¥Ž¡Ž¥Ž¤Ž¥
       FD  RECEERR-FILE.
       01  RECEERR-REC             PIC X(200). 
      *
       WORKING-STORAGE             SECTION.
      *
      *    ŽÀŽÁŽµâ¥ŽÄŽ£ŽÂŽ¹Ž¹Ž¿Ž·ŽÍŽÑŽ¥ŽÕŽ¥Ž¡Ž¥Ž¤Ž¥ ŽÌŽ¾Ž¾ŽÎŽÎŽÎŽ° 
           COPY    "CPCOMMONDAT2.INC"
                                   REPLACING  //RECE01PARA//
                                   BY         //RECEUPD//.
           03  FILLER              PIC X(04)   VALUE   ".dat".
      *
      *    Ž¥Ž¨Ž¥ò£Ž¼Ž¥ŽÕŽ¥Ž¡Ž¥Ž¤Ž¥ ŽÌŽ¾Ž¾ŽÎŽÎŽÎŽ° 
           COPY    "CPERRFL.INC"    REPLACING  //ERRFLPARA//
                                    BY         //RECEERR//.
      *     
      *    Ž¥Ž·Ž¥Ž§Ž¥ŽÍŽÑŽÎŽÎŽ°
           COPY    "CPCOMMONSHELL.INC".
      *
           COPY    "SKT0525.INC".
      *
      *    Ž¥Ž¹Ž¥ŽÑŽÎŽÎŽ°
       01  STS-AREA.
           03  STS-RECEERR         PIC X(02).
           03  STS-RECEUPD         PIC X(02).
      *
      *    Ž¥ŽÕŽ¥ò§Ž°ŽÎŽÎŽ°
       01  FLG-AREA.
           03  FLG-END             PIC 9(01).
           03  FLG-ERR             PIC 9(01).
           03  FLG-KOH-END         PIC 9(01).
           03  FLG-UPD             PIC 9(01).
      *     
           03  FLG-RECE10          PIC 9(01).
           03  FLG-SYSKANRI        PIC 9(01). 
           03  FLG-HKNNUM          PIC 9(01).
           03  FLG-HKNJAINF        PIC 9(01).
           03  FLG-UPDFILE         PIC 9(01).
           03  FLG-SEIKYU          PIC 9(01). 
           03  FLG-PTINF           PIC 9(01).
      *     
           03  FLG-PRTKBN          PIC 9(01).
      *
      *    ŽÅŽºŽ»õ¬ŽÎŽ°
       01  IDX-AREA.
           03  IDX                 PIC 9(04).
           03  IDX1                PIC 9(04).
           03  IDX2                PIC 9(04).
           03  IDX3                PIC 9(04).
           03  IDXX                PIC 9(04).
           03  IDXY                PIC 9(04).
      *
           03  IDY                 PIC 9(04).
           03  IDY2                PIC 9(04).
           03  IDY3                PIC 9(04).
           03  IDY4                PIC 9(04).
      *     
           03  IDZ                 PIC 9(04).
           03  IDZ1                PIC 9(04).
           03  IDZ2                PIC 9(04).
      *
       01  WRK-PARA.
           COPY    "CPORCSPRTLNK.INC".
           03  WRK-PARA-HOSPNUM    PIC 9(02).
           03  WRK-PARA-JOBID      PIC 9(07).
           03  WRK-PARA-SHELLID    PIC X(08).
           03  WRK-PARA-HKNJANUM   PIC X(08).
           03  WRK-PARA-PAGE       PIC 9(10).
           03  WRK-PARA-SYOKBN     PIC X(01).
           03  WRK-PARA-SYOKBN1    PIC X(01).
      *
      *    Ž°Ž»ŽÎŽÎŽ°
       01  WRK-AREA.
           03  WRK-SEIYMD          PIC X(08).
           03  WRK-SEIYMDWH        PIC X(22).
           03  WRK-SRYYMWH         PIC X(16).
           03  WRK-SRYYMD          PIC X(08).
      *  
           03  WRK-SYMD.
               05  WRK-SYY         PIC 9(04).
               05  WRK-SMM         PIC 9(02).
               05  WRK-SDD         PIC 9(02).
           03  WRK-HENYMDG         PIC X(22).
      *
           03  WRK-CNT             PIC 9(02).
           03  WRK-KOHNUM          PIC X(03).
           03  WRK-HKNJANUM        PIC X(06).
      *
           03  WRK-Z4              PIC ZZZZ.
           03  WRK-Z5              PIC Z,ZZZ.
           03  WRK-Z7              PIC ZZZ,ZZZ.
           03  WRK-Z9              PIC Z,ZZZ,ZZZ.
           03  WRK-KOHNUM9         PIC Z9.
           03  WRK-PAGE            PIC ZZZ9.
      *
           03  WRK-MAE-INPUT       PIC X(200).
           03  WRK-OUT-INPUT       PIC X(200).
      *
           03  WRK-RECEERR         PIC X(200). 
           03  WRK-ERRMSG          PIC X(300). 
      *
           03  WRK-PATH            PIC X(50).
           03  WRK-MCP-TABLE       PIC X(64).
           03  WRK-MCP-PATHNAME    PIC X(64).
      *
           03  WRK-SYOKBN          PIC X(01).
           03  WRK-INDEX           PIC 9(02).
           03  WRK-HKNJANAME       PIC X(20).
      *
      *    Ž¸ŽÈŽÌŽ¾Ž¾ŽÎŽÊŽÔŽ½Ž¸
           03  WRK-KOHKBN.
               05  WRK-KOHNUM        PIC X(03).
               05  WRK-HKNNAME       PIC X(20). 
           03  WRK-MEISYO          PIC X(44).
      *
      *    Ž°êÐŽÅŽµŽ¡Ž´ŽØŽ¾ŽÊ
           03  WRK-HOSPNAME        PIC X(100).
           03  WRK-HOSPNAME-R      REDEFINES   WRK-HOSPNAME.
               05  WRK-HOSPNAME1   PIC X(50).
               05  WRK-HOSPNAME2   PIC X(50).
           03  WRK-HOSPADRS        PIC X(100).
           03  WRK-HOSPADRS-R      REDEFINES   WRK-HOSPADRS.
               05  WRK-HOSPADRS1   PIC X(50).
               05  WRK-HOSPADRS2   PIC X(50).
           03  WRK-HOSPTEL         PIC X(15).
      *
       01  WRK-2007-AREA.
           03  WRK-2007-TBL        OCCURS  100.
               05  WRK-2007-MEISYO PIC X(44).
               05  WRK-2007-KOH-AREA.
                   07  WRK-2007-KOHNUM
                                   PIC X(03)   OCCURS  10.
           03  WRK-2007-MAX        PIC 9(03).
      *    Ž¥Ž«Ž¥Ž¦Ž¥Ž¥ŽÈŽÎŽÎŽ°
       01  CNT-AREA.
           03  CNT-PAGE            PIC 9(03).
           03  CNT-RECE10          PIC 9(06).
           03  CNT-UPDFILE         PIC 9(06).
           03  CNT-KOH             PIC 9(02).
      *
      *    Ž½Ž¸Ž·Ž×ŽÎŽÎŽ°
       01  SUM-AREA.
           03  SUM-TBL-SRYKA       PIC X(02).
           03  SUM-TABLE.
      *        Ž¸ê¶Ž¹äÐŽ¼ŽÔ
               05  SUM-TBL             OCCURS  2.
                   07  SUM-NYUGAI-TBL       OCCURS  2.
                       09  SUM-KENSU           PIC  9(06).
                       09  SUM-NISSU           PIC  9(06).
                       09  SUM-TENSU           PIC  9(10).
                       09  SUM-ITBFTN          PIC  9(10).
                   07  SUM-S-KENSU             PIC  9(06).
                   07  SUM-S-NISSU             PIC  9(06).
                   07  SUM-S-KINGK             PIC  9(10).
                   07  SUM-S-FTNGK             PIC  9(10).
      *
      *        Ž¸ŽÈŽÉòÅŽ´ 
               05  SUM-KOH-TBL         OCCURS  100.
                   07  SUM-KOHNUM              PIC  X(03).
                   07  SUM-KOH-NYUGAI-TBL   OCCURS  2.
                       09  SUM-KKENSU          PIC  9(06).
                       09  SUM-KNISSU          PIC  9(06).
                       09  SUM-KTENSU          PIC  9(10).
                       09  SUM-KITBFTN         PIC  9(10).
                   07  SUM-S-KKENSU            PIC  9(06).
                   07  SUM-S-KNISSU            PIC  9(06).
                   07  SUM-S-KKINGK            PIC  9(10).
                   07  SUM-S-KFTNGK            PIC  9(10).
                   07  SUM-KOH-MEISYO          PIC  X(44).
      *
      *    Ž¥Ž­Ž¡Ž¼ŽÎŽÎŽ°
       01  KEY-AREA                    VALUE   LOW-VALUE.
           03  KEY-NEW.
               05  KEY-N-HKNJANUM      PIC X(08).
           03  KEY-OLD.
               05  KEY-O-HKNJANUM      PIC X(08). 
      *
      *    Ž¸ŽÇŽÄŽ¹àÎŽÜ
       01  WRK-CONS-AREA.
           03  WRK-CONS-SRYYM-200804   PIC X(06)   VALUE   "200804".
      *
           COPY    "COMMON-SPA".
      *
      *****************************************************************
      *    Ž¥ŽÕŽ¥Ž¡Ž¥Ž¤Ž¥Ž¥Ž¥Ž¤Ž¥Ž¢Ž¥Ž¦Ž¥ŽÈ
      *****************************************************************
      *
      *    Ž´ŽµŽ¼ŽÔ
       01  PTINF-REC.
           COPY    "CPPTINF.INC".
      *
      *    ŽÊŽÝŽ¸Ž±ŽÈŽÖŽ¹
       01  HKNNUM-REC.
           COPY    "CPHKNNUM.INC".
      *
      *    ŽÊŽÝŽ¸Ž±Ž¼ŽÔŽ¾ŽÊ
       01  HKNJAINF-REC.
           COPY    "CPHKNJAINF.INC".
      *
      *    Ž°êÐŽÅŽµŽ¡Ž´ŽØŽ¾ŽÊŽ¾ŽÊ
           COPY    "CPSK1001.INC".
      *
      *    Ž°êÐŽÅŽµŽ¡Ž´ŽØŽ¾ŽÊŽ¡ŽÝŽ½ŽºŽßŽÃŽÏŽ¡Ž¢ŽÏŽ¢ŽÍõÅ 
           COPY    "CPSK1002.INC".
      *
      *    Ž¿ŽÇŽÎŽÅŽ²ŽÊŽÌŽÜŽ¾ŽÊ
           COPY    "CPSK1005.INC".
      *
      *    Ž°êÐŽÅŽµŽ¡Ž´ŽØŽÊŽÔŽ½Ž¸Ž¾ŽÊ
           COPY    "CPSK1900.INC".
      *
      *    Ž°êÐŽÅŽµŽ¡Ž´ŽØŽÌŽ¾Ž¾ŽÎŽÊŽÔŽ½Ž¸Ž¾ŽÊ
           COPY    "CPSK1901.INC".
      *
      *    Ž°êÐŽÅŽµŽ¡Ž´ŽØŽ½Ž»Ž½ŽÊŽÔŽ½Ž¸Ž¾ŽÊ
           COPY    "CPSK1902.INC".
      *
      *    Ž¸ŽÈŽÈŽÖŽ¹ì¦ŽÞŽ¤ŽÈŽ¤âÀŽÊ
           COPY    "CPSK2007.INC".
      *
           COPY    "CPRCF010.INC".
      *
      *    Ž¥Ž¸Ž¥î§ŽÖŽ´ŽÉŽÍŽ¥ŽÞŽ¥Ž¹Ž¥Ž¿
       01  JOBKANRI-REC.
           COPY    "CPJOBKANRI.INC".
      * 
      ******************************************************************
      *    Ž¥ŽµŽ¥ŽÖŽ¥Ž×Ž¥õøŽÑŽ¡Ž¡ŽÎŽÎŽ°
      *****************************************************************
      *
      *   Ž¥Ž¸Ž¥î§ŽÖŽ´ŽÉŽÍŽ£ŽÄŽ£ŽÂŽÀŽ©Ž¸ì§ŽµŽ¥ŽÖ
           COPY    "CPORCSJOBKANRI.INC".
      *
      *    Ž°ŽºŽ£ŽÄŽ£ŽÂŽ¹Ž¹Ž¿Ž·Ž¥ŽµŽ¥ŽÖ
           COPY    "CPORCSPRT.INC".
      *
      *   ŽÆŽÉŽÕŽÊŽÑŽ´Ž¹Ž¥ŽµŽ¥ŽÖ
           COPY    "CPORCSDAY.INC".
           COPY    "CPORCSLNK.INC".
      *
      *    Ž¶Ž¦ŽÄŽÌŽ¥ŽÑŽ¥ò§â§Ž¿
           COPY    "MCPAREA".
      *
           COPY    "MCPDATA.INC".
      *
      *   ŽÈŽ¾Ž³ŽÑŽ¥ŽÁŽ¥Ž§Ž¥ŽÃŽ¥Ž¯Ž¥ŽµŽ¥ŽÖ
           COPY  "CPORCSKANACHK.INC".
      *
      ****************************************************************
       LINKAGE                 SECTION.
       01  COMMAND-PARAM.
           02  FILLER      PIC X(256).
      ****************************************************************
       PROCEDURE           DIVISION
               USING
           COMMAND-PARAM.
      *****************************************************************
      *    Ž¼î£Ž¡Ž¡Ž¡Ž½ðÏ
      *****************************************************************
       000-PROC-SEC                SECTION.
      *
           PERFORM 100-INIT-SEC
      *
           PERFORM 200-MAIN-SEC
                   UNTIL       FLG-END     =   1
      *
           PERFORM 300-END-SEC
      *
           STOP    RUN
           .
      *****************************************************************
      *    Ž½ò¶Ž¡Ž¡Ž½ðÏ
      *****************************************************************
       100-INIT-SEC                SECTION.
      *
           INITIALIZE                  FLG-AREA
           INITIALIZE                  STS-AREA
           INITIALIZE                  WRK-AREA
           INITIALIZE                  CNT-AREA
           INITIALIZE                  SPA-AREA
      *
           DISPLAY  "START"
      *
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
                                               WRK-PARA-HOSPNUM
                                               WRK-PARA-JOBID
                                               WRK-PARA-SHELLID
                                               WRK-PARA-HKNJANUM
                                               WRK-PARA-SYOKBN
                                               WRK-PARA-SYOKBN1
                                               RECEERR
           END-UNSTRING
           MOVE    WRK-PARA-HOSPNUM    TO  SPA-HOSPNUM
      *
      *    Ž¥Ž¹Ž¥ŽÆŽ¥ŽÃŽ¥Ž×Ž´ŽÉŽÍŽ³Ž«Ž»ŽÏŽ½ðÏ
           MOVE    "STS"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           MOVE    "SOKATU0525"    TO  JOB-PGID
           MOVE    "Ž¹Ž­Ž°ðÑŽ¢Ž¹î£Ž¦Ž¿ŽÇŽÎŽÅŽÊŽ½Ž·ŽÀŽÁŽµâ¿"
                                   TO  JOB-SHELLMSG
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA
                                   JOBKANRI-REC
                                   SPA-AREA
      *
           MOVE    "RECEUPD"           TO  RECEUPD-FILE-ID
           MOVE    LNK-PRTKANRI-TERMID TO  RECEUPD-TERMID
           MOVE    WRK-PARA-HOSPNUM    TO  RECEUPD-HOSPNUM
      *
           MOVE    LNK-PRTKANRI-SRYYM  TO  WRK-SRYYMD (1:6)
           MOVE    "01"                TO  WRK-SRYYMD (7:2)
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
      *    Ž°êÐŽÅŽµŽ¡Ž´ŽØŽ£ŽÉŽ£ŽÄŽÊŽÔŽ½Ž¸
           INITIALIZE                  SYS-1001-REC
           MOVE    "1001"              TO  SYS-1001-KANRICD
           MOVE    "*"                 TO  SYS-1001-KBNCD
           MOVE    LNK-PRTKANRI-SRYYM(1:6)
                                       TO  SYS-1001-STYUKYMD(1:6)
                                           SYS-1001-EDYUKYMD(1:6)
           MOVE    "01"                TO  SYS-1001-STYUKYMD(7:2)
                                           SYS-1001-EDYUKYMD(7:2)
           MOVE    SPA-HOSPNUM         TO  SYS-1001-HOSPNUM
           MOVE    SYS-1001-REC        TO  MCPDATA-REC
           PERFORM 910-SYSKANRI-KEY10-SEC
           IF      FLG-SYSKANRI        =   ZERO
               MOVE    MCPDATA-REC         TO  SYS-1001-REC
               IF      SYS-1001-HOSPNAME   =   LOW-VALUE
                   MOVE    SPACE               TO  SYS-1001-HOSPNAME
               END-IF    
               IF      SYS-1001-KAISETUNAME    =   LOW-VALUE
                   MOVE    SPACE               TO  SYS-1001-KAISETUNAME
               END-IF    
           ELSE
               MOVE    "Ž°êÐŽÅŽµŽ¡Ž´ŽØŽ¾ŽÊŽ¤Ž¬Ž¼ðÈŽÀŽ¤ŽÇŽ¤Ž­Ž¤ŽÞŽ¤Ž»Ž¤Ž¤ŽÇŽ¤Ž·Ž¤Ž¿"
                                           TO  WRK-RECEERR
               PERFORM 500-ERR-HENSYU-SEC
               MOVE    1                   TO  FLG-END
           END-IF
      *
      *    Ž°êÐŽÅŽµŽ¡Ž´ŽØŽ¾ŽÊŽ¡ŽÝŽ½ŽºŽßŽÃŽÏŽ¡Ž¢ŽÏŽ¢ŽÍõÅ
           INITIALIZE                  SYS-1002-REC
           MOVE    "1002"              TO  SYS-1002-KANRICD
           MOVE    "*"                 TO  SYS-1002-KBNCD
           MOVE    LNK-PRTKANRI-SRYYM(1:6)
                                       TO  SYS-1002-STYUKYMD(1:6)
                                           SYS-1002-EDYUKYMD(1:6)
           MOVE    "01"                TO  SYS-1002-STYUKYMD(7:2)
                                           SYS-1002-EDYUKYMD(7:2)
           MOVE    SPA-HOSPNUM         TO  SYS-1002-HOSPNUM
           MOVE    SYS-1002-REC        TO  MCPDATA-REC
           PERFORM 910-SYSKANRI-KEY10-SEC
           IF      FLG-SYSKANRI        =   ZERO
               MOVE    MCPDATA-REC        TO  SYS-1002-REC
               IF      SYS-1002-ADRS       =   LOW-VALUE
                   MOVE    SPACE               TO  SYS-1002-ADRS
               END-IF    
           ELSE
               MOVE    "Ž°êÐŽÅŽµŽ¡Ž´ŽØŽ¾ŽÊŽ¡ŽÊŽ½ŽºŽßŽÃŽÏŽ¡ŽËŽ¤Ž¬Ž¼ðÈŽÀŽ¤ŽÇŽ¤Ž­Ž¤ŽÞŽ¤Ž»Ž¤Ž¤ŽÇŽ¤Ž·Ž¤Ž¿"
                                           TO  WRK-RECEERR
               PERFORM 500-ERR-HENSYU-SEC
               MOVE    1                   TO  FLG-END
           END-IF 
      *
           MOVE    SYS-1001-HOSPNAME   TO  WRK-HOSPNAME
           MOVE    SYS-1002-ADRS       TO  WRK-HOSPADRS
           MOVE    SYS-1002-TEL        TO  WRK-HOSPTEL
      *    Ž°êÐŽÅŽµŽ¡Ž´ŽØŽÊŽÔŽ½Ž¸Ž¾ŽÊ
           PERFORM 900-1900-READ-SEC
      *
      *    Ž¸ŽÈŽÈŽÖŽ¹ì¦ŽÞŽ¤ŽÈŽ¤âÀŽÊ
           INITIALIZE                      WRK-2007-AREA
      *
           INITIALIZE                      SYS-2007-REC
           MOVE    "2007"              TO  SYS-2007-KANRICD
           MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-2007-STYUKYMD (1:6)
           MOVE    "01"                TO  SYS-2007-STYUKYMD (7:2)
           MOVE    SYS-2007-STYUKYMD   TO  SYS-2007-EDYUKYMD
           MOVE    WRK-PARA-HOSPNUM    TO  SYS-2007-HOSPNUM
           MOVE    SYS-2007-REC        TO  MCPDATA-REC
           MOVE    "tbl_syskanri"      TO  MCP-TABLE
           MOVE    "key2"              TO  MCP-PATHNAME
           MOVE    "DBSELECT"          TO  MCP-FUNC
           PERFORM 900-ORCDBMAIN-SEC
           IF      MCP-RC          =   ZERO
               MOVE    "tbl_syskanri"  TO  WRK-MCP-TABLE
               MOVE    "key2"          TO  WRK-MCP-PATHNAME
               PERFORM 900-SYSKANRI-READ-N-SEC
           ELSE
               MOVE    1               TO  FLG-SYSKANRI
           END-IF
      *
           MOVE    ZERO            TO  IDX
           PERFORM         UNTIL   FLG-SYSKANRI   =   1
                           OR      IDX            >=  100
               MOVE    MCPDATA-REC         TO  SYS-2007-REC
      *
               ADD     1                   TO  IDX
               MOVE    SYS-2007-MEISYO(1) TO  WRK-2007-MEISYO(IDX)
               PERFORM VARYING IDY FROM    1   BY  1
                       UNTIL   IDY >       10
                       OR      SYS-2007-KOHNUM (IDY)   =   SPACE
                   MOVE    SYS-2007-KOHNUM (IDY)
                                           TO WRK-2007-KOHNUM(IDX IDY)
               END-PERFORM
      *
               MOVE    "tbl_syskanri"      TO  WRK-MCP-TABLE
               MOVE    "key2"              TO  WRK-MCP-PATHNAME
               PERFORM 900-SYSKANRI-READ-N-SEC
           END-PERFORM
      *
           MOVE    "tbl_syskanri"          TO  MCP-TABLE
           MOVE    "key2"                  TO  MCP-PATHNAME
           PERFORM 900-CLOSE-SEC
      *
           MOVE    IDX                     TO  WRK-2007-MAX
      *
           .
       100-INIT-EXT.
           EXIT.
      *
      *****************************************************************
      *    Ž¼î£Ž¡Ž¡Ž¡Ž½ðÏ
      *****************************************************************
       200-MAIN-SEC                SECTION.
      *
           OPEN    OUTPUT  UPD-FILE
      *
      *    Ž½ðÏŽ¶ðÌŽ¬(0=ŽÁŽ´ŽÂŽÎ 1=ŽÅŽ·ý¢Ž¦Ž·ý¿ŽÙŽ¤ 2=ŽÊŽÖŽÌâÌŽ¬)Ž¤ŽÇŽÊŽ¬Ž¤Ž±Ž¤
           EVALUATE    WRK-PARA-SYOKBN
               WHEN    ZERO
               WHEN    "2"
                   MOVE    "2"         TO  WRK-SYOKBN
                   PERFORM 2001-SYOKBN-SYUKEI-SEC
           END-EVALUATE
           EVALUATE    WRK-PARA-SYOKBN
               WHEN    ZERO
               WHEN    "1"
                   MOVE    "1"         TO  WRK-SYOKBN
                   PERFORM 2001-SYOKBN-SYUKEI-SEC
           END-EVALUATE
      *
           CLOSE   UPD-FILE
      *
      *    ŽÀŽÁŽµâ¥ŽÄŽ£ŽÂŽ¹Ž¹Ž¿Ž·
           IF      FLG-UPD        =   1
           AND     FLG-ERR        =   ZERO 
               IF      CNT-UPDFILE    >   ZERO
                   PERFORM 310-SEIKYU-UPD-SEC
               END-IF
           END-IF
      *
           .
       200-MAIN-EXT.
           EXIT.
      *
      *****************************************************************
      *    Ž½ðÏŽ¶ðÌŽ¬Ž½Ž¸Ž·Ž×Ž½ðÏ
      *****************************************************************
       2001-SYOKBN-SYUKEI-SEC         SECTION.
      *
      *    ŽÆŽ±Ž¡Ž³Ž°Ž¡ŽÊŽ¤Ž½Ž¤ŽÎŽÂŽ¾Ž¤ŽÎŽ¥Ž¥Ž»Ž¡ŽËŽ¡Ž¦ŽÆŽ±Ž¡Ž½Ž¸Ž·Ž×
      *    
           MOVE    LOW-VALUE           TO  KEY-AREA
           MOVE    1                   TO  WRK-INDEX
      *
      *    Ž½ðÏŽ¶ðÌŽ¬Ž¤ŽËŽ¤ð¦ŽÃŽ¤ŽÆŽ¥Ž­Ž¡Ž¼Ž¤ŽÊŽ¬Ž¤Ž±Ž¤(SYOKBN1=2Ž¢ŽªŽÆŽÃŽÊŽÌŽÎŽÅŽÍŽÜŽÈ)
           EVALUATE    WRK-SYOKBN      ALSO    WRK-PARA-SYOKBN1
               WHEN    "1"             ALSO    "1"
                   MOVE    "key62"         TO  WRK-MCP-PATHNAME
               WHEN    "2"             ALSO    "1"
                   MOVE    "key61"         TO  WRK-MCP-PATHNAME
               WHEN    "1"             ALSO    "2"
                   MOVE    "key66"         TO  WRK-MCP-PATHNAME
               WHEN    "2"             ALSO    "2"
                   MOVE    "key65"         TO  WRK-MCP-PATHNAME
           END-EVALUATE  
           MOVE    "tbl_seikyu"        TO  WRK-MCP-TABLE
           PERFORM 900-SEIKYU-SELECT-SEC
      *
           PERFORM 200-HENSYU-SEC  UNTIL   FLG-RECE10   =   1 
                                   OR      FLG-ERR      =   1
      *
           MOVE    WRK-MCP-TABLE       TO  MCP-TABLE
           MOVE    WRK-MCP-PATHNAME    TO  MCP-PATHNAME
           PERFORM 900-CLOSE-SEC
      *
      *    ŽÆŽ±Ž¡Ž³Ž°Ž½Ž¸Ž·Ž×Ž¡ŽÊŽºŽßŽÁõÄŽÇŽ¤ŽÞŽ¤Ž¿Ž¤ŽÏŽºŽßŽ°êÃôÕŽ»Ž»ŽÄô¦Ž·Ž¤Ž¿Ž¥Ž¥Ž»Ž¡ŽË
      *    ŽÆŽÃŽÊŽÌŽÎŽÅŽÍŽÜŽÈŽ¤ŽÎŽ¾Ž¹î¦ŽÏŽºŽßŽÁõÄŽÇŽ¤ŽÏŽ¤ŽÊŽ¤Ž·
           IF    ( FLG-ERR             =   ZERO )
           AND   ( WRK-PARA-SYOKBN1    =   "1"  )
               MOVE    LOW-VALUE           TO  KEY-AREA
               MOVE    2                   TO  WRK-INDEX
      *         
               EVALUATE    WRK-SYOKBN
                   WHEN    "1"
                       MOVE    "key64"     TO  WRK-MCP-PATHNAME
                   WHEN    "2"
                       MOVE    "key63"     TO  WRK-MCP-PATHNAME
               END-EVALUATE  
               MOVE    "tbl_seikyu"        TO  WRK-MCP-TABLE
               PERFORM 900-SEIKYU-SELECT-SEC
      *
               PERFORM 200-HENSYU-SEC  UNTIL   FLG-RECE10   =  1
                                       OR      FLG-ERR      =  1
      *
           MOVE    WRK-MCP-TABLE       TO  MCP-TABLE
           MOVE    WRK-MCP-PATHNAME    TO  MCP-PATHNAME
           PERFORM 900-CLOSE-SEC
           END-IF
      *     
           MOVE    1                   TO  FLG-END
      *
           .
       2001-SYOKBN-SYUKEI-EXT.
           EXIT.
      *
      *****************************************************************
      *    Ž½Ž¸Ž·Ž×Ž½ðÏ
      *****************************************************************
       200-HENSYU-SEC                SECTION.
      *
           INITIALIZE                  SUM-AREA
      *
      *    Ž¥Ž­Ž¡Ž¼ŽËð¦ŽËŽ½Ž¸Ž·Ž×
           MOVE    KEY-NEW             TO  KEY-OLD
           PERFORM             UNTIL   FLG-END     =   1
                               OR      KEY-NEW NOT =   KEY-OLD
      *        ŽÊŽÝŽ¸Ž±Ž¼ŽÔŽÊŽÌŽ½Ž¸Ž·Ž×Ž½ðÏ
               PERFORM 2001-KOUKI-SYUKEI-SEC
           END-PERFORM
      *
      *   Ž°ŽºŽ½ðÏ
          IF      FLG-UPD        =   1
          AND     FLG-ERR        =   ZERO
               PERFORM 2002-PRINT-SEC
          END-IF
           .
       200-HENSYU-EXT.
           EXIT.
      *
      *****************************************************************
      *    ŽÊŽÝŽ¸Ž±Ž¼ŽÔŽÊŽÌŽ½Ž¸Ž·Ž×Ž½ðÏ
      *****************************************************************
       2001-KOUKI-SYUKEI-SEC                SECTION.
      *
           INITIALIZE                       IDX-AREA
                                            FLG-UPD
                                            WRK-HKNJANUM
      *    ŽÊŽÝŽ¸Ž±Ž¼ŽÔŽÈŽÖŽ¹
           IF  RECE10-HKNJANUM(7:2)  =  SPACE
             MOVE  RECE10-HKNJANUM(1:6)  TO  WRK-HKNJANUM(1:6)
           ELSE
             MOVE  RECE10-HKNJANUM(3:6)  TO  WRK-HKNJANUM(1:6)
           END-IF
      *    ŽÂêËŽ½ŽÈŽÖŽ¹ì§Ž»Ž¥ŽÃŽ¥ŽÈ
           PERFORM  200101-HKNJANUM-SET-SEC
      *
      *    ŽÆŽ³Ž°Ž¶ðÌŽ¬
           EVALUATE    RECE10-NYUGAIKBN
               WHEN    "1"
                   MOVE    1                   TO  IDX3
               WHEN    "2"
                   MOVE    2                   TO  IDX3
           END-EVALUATE
      *
      *    ŽµŽÉŽÕŽ³è»
           EVALUATE    RECE10-KYURATE
               WHEN    9
                   MOVE    1                   TO  IDX1
               WHEN    7
                   MOVE    2                   TO  IDX1
           END-EVALUATE
      *
           PERFORM 20011-HKN-SYUKEI-SEC
      *
      *    Ž¸ŽÈŽÉòÅŽ´ŽÊŽ¬
           IF      RECE10-KOHNUM (1)   NOT =   SPACE  OR
                   RECE10-KOHNUM (2)   NOT =   SPACE  OR
                   RECE10-KOHNUM (3)   NOT =   SPACE  OR
                   RECE10-KOHNUM (4)   NOT =   SPACE
               PERFORM 20012-KOH-SYUKEI-SEC
           END-IF
      *
      *    Ž½Ž¸Ž·Ž×Ž¤ŽÎŽÂŽÐŽ¾ŽÝŽ¤ŽËŽ¤ŽÊŽ¤ò¦ŽÊŽ¤Ž«Ž¤ŽÃŽ¤Ž¿Ž¤ŽÈŽ¤Ž­
           IF      FLG-UPD             =   1
               PERFORM 20013-UPD-FILE-HENSYU-SEC
      *
               MOVE    WRK-MCP-TABLE       TO  MCP-TABLE
               MOVE    WRK-MCP-PATHNAME    TO  MCP-PATHNAME
               PERFORM 900-SEIKYU-READ-SEC
           ELSE
               MOVE    SPACE               TO  WRK-RECEERR
               STRING "Ž½Ž¸Ž·Ž×ŽÂŽÐŽ¾ŽÝŽ³Ž°Ž¡Ž¡Ž´ŽµŽ¼ŽÔŽÈŽÖŽ¹ì£"     DELIMITED  BY  SIZE
                       RECE10-PTNUM                DELIMITED  BY  SPACE
                       " Ž¿ŽÇŽÎŽÅŽÇŽ¯Ž·ý¢"               DELIMITED  BY  SIZE
                       RECE10-SRYYM                DELIMITED  BY  SIZE
                       " Ž¥Ž¥Ž»Ž¼ŽÊŽÌŽ¡"               DELIMITED  BY  SIZE
                       RECE10-RECESYUBETU          DELIMITED  BY  SIZE
                                           INTO    WRK-RECEERR
               END-STRING
               PERFORM 500-ERR-HENSYU-SEC
               PERFORM 500-COBABORT-SEC
           END-IF 
           .
       2001-KOUKI-SYUKEI-EXT.
           EXIT.
      *
      *****************************************************************
      *    Ž¹Ž­Ž°ðÑŽ¢Ž¹î£Ž¦ŽÂêËŽ½ŽÈŽÖŽ¹ì§Ž»Ž¥ŽÃŽ¥ŽÈ
      *****************************************************************
       200101-HKNJANUM-SET-SEC                SECTION.
      *
           EVALUATE  WRK-HKNJANUM(1:2)
      *      ŽËŽÌŽ³Ž¤ŽÆŽ»
             WHEN  "01"
                 MOVE  "010004"  TO  WRK-HKNJANUM
                 MOVE  "ŽËŽÌŽ³Ž¤ŽÆŽ»"  TO  WRK-HKNJANAME
      *      ŽÀŽÄŽ¿Ž¹Ž¸Ž©
             WHEN  "02"
                 MOVE  "020003"  TO  WRK-HKNJANUM
                 MOVE  "ŽÀŽÄŽ¿Ž¹Ž¸Ž©"  TO  WRK-HKNJANAME
      *      Ž´è¾Ž¸Ž©
             WHEN  "03"
                 MOVE  "030002"  TO  WRK-HKNJANUM
                 MOVE  "Ž´è¾Ž¸Ž©"  TO  WRK-HKNJANAME
      *      ŽµŽÜŽ¾Ž¸Ž©
             WHEN  "04"
                 MOVE  "040001"  TO  WRK-HKNJANUM
                 MOVE  "ŽµŽÜŽ¾Ž¸Ž©"  TO  WRK-HKNJANAME
      *      Ž½Ž©ŽÅŽÄŽ¸Ž©
             WHEN  "05"
                 MOVE  "050000"  TO  WRK-HKNJANUM
                 MOVE  "Ž½Ž©ŽÅŽÄŽ¸Ž©"  TO  WRK-HKNJANAME
      *      Ž»Ž³Ž·ŽÁŽ¸Ž©
             WHEN  "06"
                 MOVE  "060009"  TO  WRK-HKNJANUM
                 MOVE  "Ž»Ž³Ž·ŽÁŽ¸Ž©"  TO  WRK-HKNJANAME
      *      ŽÊŽ¡ŽÅîºŽ©
             WHEN  "07"
                 MOVE  "070008"  TO  WRK-HKNJANUM
                 MOVE  "ŽÊŽ¡ŽÅîºŽ©"  TO  WRK-HKNJANAME
      *      Ž°Ž¾Ž¸Ž©
             WHEN  "08"
                 MOVE  "080007"  TO  WRK-HKNJANUM
                 MOVE  "Ž°Ž¾Ž¸Ž©"  TO  WRK-HKNJANAME
      *      ŽÆŽÊŽÌŽÚŽ¸Ž©
             WHEN  "09"
                 MOVE  "090006"  TO  WRK-HKNJANUM
                 MOVE  "ŽÆŽÊŽÌŽÚŽ¸Ž©"  TO  WRK-HKNJANAME
      *      Ž·Ž²ŽÇŽÏŽ¸Ž©
             WHEN  "10"
                 MOVE  "100003"  TO  WRK-HKNJANUM
                 MOVE  "Ž·Ž²ŽÇŽÏŽ¸Ž©"  TO  WRK-HKNJANAME
      *      ŽºŽ¶ŽÌŽ¸Ž©
             WHEN  "11"
                 MOVE  "110002"  TO  WRK-HKNJANUM
                 MOVE  "ŽºŽ¶ŽÌŽ¸Ž©"  TO  WRK-HKNJANAME
      *      ŽÀòÏŽÕŽ¸Ž©
             WHEN  "12"
                 MOVE  "120001"  TO  WRK-HKNJANUM
                 MOVE  "ŽÀòÏŽÕŽ¸Ž©"  TO  WRK-HKNJANAME
      *      ŽÅŽµŽÅŽÔ
             WHEN  "13"
                 MOVE  "130000"  TO  WRK-HKNJANUM
                 MOVE  "ŽÅŽµŽÅŽÔ"  TO  WRK-HKNJANAME
      *      Ž¿ŽÀŽÆàÂŽ¸Ž©
             WHEN  "14"
                 MOVE  "140009"  TO  WRK-HKNJANUM
                 MOVE  "Ž¿ŽÀŽÆàÂŽ¸Ž©"  TO  WRK-HKNJANAME
      *      Ž¿Ž·Ž³æºŽ©
             WHEN  "15"
                 MOVE  "150008"  TO  WRK-HKNJANUM
                 MOVE  "Ž¿Ž·Ž³æºŽ©"  TO  WRK-HKNJANAME
      *      ŽÉŽÙŽ»Ž³Ž¸Ž©
             WHEN  "16"
                 MOVE  "160007"  TO  WRK-HKNJANUM
                 MOVE  "ŽÉŽÙŽ»Ž³Ž¸Ž©"  TO  WRK-HKNJANAME
      *      ŽÀŽÐŽÀŽ¸Ž©
             WHEN  "17"
                 MOVE  "170006"  TO  WRK-HKNJANUM
                 MOVE  "ŽÀŽÐŽÀŽ¸Ž©"  TO  WRK-HKNJANAME
      *      ŽÊŽ¡Ž°ìºŽ©
             WHEN  "18"
                 MOVE  "180005"  TO  WRK-HKNJANUM
                 MOVE  "ŽÊŽ¡Ž°ìºŽ©"  TO  WRK-HKNJANAME
      *      Ž»Ž³ŽÍŽ¸Ž©
             WHEN  "19"
                 MOVE  "190004"  TO  WRK-HKNJANUM
                 MOVE  "Ž»Ž³ŽÍŽ¸Ž©"  TO  WRK-HKNJANAME
      *      ŽÄŽ¹ŽÌŽ¸Ž©
             WHEN  "20"
                 MOVE  "200001"  TO  WRK-HKNJANUM
                 MOVE  "ŽÄŽ¹ŽÌŽ¸Ž©"  TO  WRK-HKNJANAME
      *      Ž´ŽÉŽ¸Ž©
             WHEN  "21"
                 MOVE  "210000"  TO  WRK-HKNJANUM
                 MOVE  "Ž´ŽÉŽ¸Ž©"  TO  WRK-HKNJANAME
      *      ŽÀŽÅŽ²Ž¬Ž¸Ž©
             WHEN  "22"
                 MOVE  "220009"  TO  WRK-HKNJANUM
                 MOVE  "ŽÀŽÅŽ²Ž¬Ž¸Ž©"  TO  WRK-HKNJANAME
      *      Ž°Ž¦ŽÃŽÎŽ¸Ž©
             WHEN  "23"
                 MOVE  "230008"  TO  WRK-HKNJANUM
                 MOVE  "Ž°Ž¦ŽÃŽÎŽ¸Ž©"  TO  WRK-HKNJANAME
      *      Ž»Ž°Ž½ŽÅŽ¸Ž©
             WHEN  "24"
                 MOVE  "240007"  TO  WRK-HKNJANUM
                 MOVE  "Ž»Ž°Ž½ŽÅŽ¸Ž©"  TO  WRK-HKNJANAME
      *      Ž¼Ž¢Ž²Ž¸Ž©
             WHEN  "25"
                 MOVE  "250006"  TO  WRK-HKNJANUM
                 MOVE  "Ž¼Ž¢Ž²Ž¸Ž©"  TO  WRK-HKNJANAME
      *      ŽµŽÅŽÔŽÉŽÜ
             WHEN  "26"
                 MOVE  "260005"  TO  WRK-HKNJANUM
                 MOVE  "ŽµŽÅŽÔŽÉŽÜ"  TO  WRK-HKNJANAME
      *      ŽÂî¼êËŽÜ
             WHEN  "27"
                 MOVE  "270004"  TO  WRK-HKNJANUM
                 MOVE  "ŽÂî¼êËŽÜ"  TO  WRK-HKNJANAME
      *      ŽÊŽ¼Ž¸ŽËŽ¸Ž©
             WHEN  "28"
                 MOVE  "280003"  TO  WRK-HKNJANUM
                 MOVE  "ŽÊŽ¼Ž¸ŽËŽ¸Ž©"  TO  WRK-HKNJANAME
      *      ŽÆàÐŽÉŽ¸Ž©
             WHEN  "29"
                 MOVE  "290002"  TO  WRK-HKNJANUM
                 MOVE  "ŽÆàÐŽÉŽ¸Ž©"  TO  WRK-HKNJANAME
      *      ŽÏŽÂŽ²ŽÎŽ»Ž³Ž¸Ž©
             WHEN  "30"
                 MOVE  "300009"  TO  WRK-HKNJANUM
                 MOVE  "ŽÏŽÂŽ²ŽÎŽ»Ž³Ž¸Ž©"  TO  WRK-HKNJANAME
      *      ŽÄŽ»Ž¼ðºŽ©
             WHEN  "31"
                 MOVE  "310008"  TO  WRK-HKNJANUM
                 MOVE  "ŽÄŽ»Ž¼ðºŽ©"  TO  WRK-HKNJANAME
      *      ŽÅî¼Ž¬Ž¸Ž©
             WHEN  "32"
                 MOVE  "320007"  TO  WRK-HKNJANUM
                 MOVE  "ŽÅî¼Ž¬Ž¸Ž©"  TO  WRK-HKNJANAME
      *      Ž²Ž¬Ž»Ž³Ž¸Ž©
             WHEN  "33"
                 MOVE  "330006"  TO  WRK-HKNJANUM
                 MOVE  "Ž²Ž¬Ž»Ž³Ž¸Ž©"  TO  WRK-HKNJANAME
      *      Ž¹Ž­ŽÅîºŽ©
             WHEN  "34"
                 MOVE  "340005"  TO  WRK-HKNJANUM
                 MOVE  "Ž¹Ž­ŽÅîºŽ©"  TO  WRK-HKNJANAME
      *      Ž»Ž³Ž¸Ž¸Ž©
             WHEN  "35"
                 MOVE  "350004"  TO  WRK-HKNJANUM
                 MOVE  "Ž»Ž³Ž¸Ž¸Ž©"  TO  WRK-HKNJANAME
      *      ŽÆŽÁŽÅîºŽ©
             WHEN  "36"
                 MOVE  "360003"  TO  WRK-HKNJANUM
                 MOVE  "ŽÆŽÁŽÅîºŽ©"  TO  WRK-HKNJANAME
      *      Ž¹âÂŽ¸Ž©
             WHEN  "37"
                 MOVE  "370002"  TO  WRK-HKNJANUM
                 MOVE  "Ž¹âÂŽ¸Ž©"  TO  WRK-HKNJANAME
      *      Ž°Ž¦ŽÉŽ²Ž¸Ž©
             WHEN  "38"
                 MOVE  "380001"  TO  WRK-HKNJANUM
                 MOVE  "Ž°Ž¦ŽÉŽ²Ž¸Ž©"  TO  WRK-HKNJANAME
      *      Ž¹äÅŽÎŽ¸Ž©
             WHEN  "39"
                 MOVE  "390000"  TO  WRK-HKNJANUM
                 MOVE  "Ž¹äÅŽÎŽ¸Ž©"  TO  WRK-HKNJANAME
      *      ŽÊŽ¡Ž²Ž¬Ž¸Ž©
             WHEN  "40"
                 MOVE  "400007"  TO  WRK-HKNJANUM
                 MOVE  "ŽÊŽ¡Ž²Ž¬Ž¸Ž©"  TO  WRK-HKNJANAME
      *      ŽºŽ´Ž²Ž¸Ž©
             WHEN  "41"
                 MOVE  "410006"  TO  WRK-HKNJANUM
                 MOVE  "ŽºŽ´Ž²Ž¸Ž©"  TO  WRK-HKNJANAME
      *      ŽÄŽ¹ŽºŽ¸Ž©
             WHEN  "42"
                 MOVE  "420005"  TO  WRK-HKNJANUM
                 MOVE  "ŽÄŽ¹ŽºŽ¸Ž©"  TO  WRK-HKNJANAME
      *      Ž·Ž§ŽËŽÜŽ¸Ž©
             WHEN  "43"
                 MOVE  "430004"  TO  WRK-HKNJANUM
                 MOVE  "Ž·Ž§ŽËŽÜŽ¸Ž©"  TO  WRK-HKNJANAME
      *      ŽÂîÌŽ¬Ž¸Ž©
             WHEN  "44"
                 MOVE  "440003"  TO  WRK-HKNJANUM
                 MOVE  "ŽÂîÌŽ¬Ž¸Ž©"  TO  WRK-HKNJANAME
      *      ŽµŽÜŽºŽ¸Ž©
             WHEN  "45"
                 MOVE  "450002"  TO  WRK-HKNJANUM
                 MOVE  "ŽµŽÜŽºŽ¸Ž©"  TO  WRK-HKNJANAME
      *      Ž¼Ž¯Ž»ŽÅîºŽ©
             WHEN  "46"
                 MOVE  "460001"  TO  WRK-HKNJANUM
                 MOVE  "Ž¼Ž¯Ž»ŽÅîºŽ©"  TO  WRK-HKNJANAME
      *      Ž²Ž­ŽÆŽ¸Ž©
             WHEN  "47"
                 MOVE  "470000"  TO  WRK-HKNJANUM
                 MOVE  "Ž²Ž­ŽÆŽ¸Ž©"  TO  WRK-HKNJANAME
           END-EVALUATE
      *
           .
       200101-HKNJANUM-SET-EXT.
           EXIT.
      *
      *****************************************************************
      *    Ž½Ž¸Ž·Ž×Ž½ðÏ
      *****************************************************************
       20011-HKN-SYUKEI-SEC          SECTION.
      *
           IF      IDX1             =   ZERO
           OR      IDX3            =   ZERO 
               PERFORM  20011-HKN-SYUKEI-EXT
           END-IF
      *
      *    ŽÎŽÅŽÍŽÜŽ¤ŽÎŽµŽÉŽÕŽ¡Ž§Ž·Ž¿
           ADD  1                  TO  SUM-KENSU(IDX1 IDX3)
      *    ŽÎŽÅŽÍŽÜŽ¤ŽÎŽµŽÉŽÕŽ¡Ž§Ž¿ŽÇŽÎŽÅŽ¼ŽÂŽÆŽ¿
           ADD  RECE10-JNISSU(1)   TO  SUM-NISSU(IDX1 IDX3)
      *    ŽÎŽÅŽÍŽÜŽ¤ŽÎŽµŽÉŽÕŽ¡Ž§ŽÅŽÀŽ¿
           ADD  RECE10-TOTALTEN(1) TO  SUM-TENSU(IDX1 IDX3)
      *    ŽÎŽÅŽÍŽÜŽ¤ŽÎŽµŽÉŽÕŽ¡Ž§Ž°ŽÉŽÉòÅŽ´Ž¶
           ADD  RECE10-FTNMONEY(1) TO  SUM-ITBFTN(IDX1 IDX3)
      *
           IF      IDX3                   =   1 
             IF      RECE10-SHOKUJINISSU(1)   >   ZERO
      *    Ž¿Ž©Ž»ŽÎŽÅŽÍŽÜŽ¡Ž§Ž·Ž¿
               ADD     1                   TO  SUM-S-KENSU(IDX1)
             END-IF
      *    Ž¿Ž©Ž»ŽÎŽÅŽÍŽÜŽ¡Ž§ŽÆŽ¿
             ADD  RECE10-SHOKUJINISSU(1)   TO  SUM-S-NISSU(IDX1)
      *    Ž¿Ž©Ž»ŽÎŽÅŽÍŽÜŽ¡Ž§Ž¶äµŽÛ
             ADD  RECE10-SHOKUJIRYOYOHI(1) TO  SUM-S-KINGK(IDX1)
      *    Ž¿Ž©Ž»ŽÎŽÅŽÍŽÜŽ¡Ž§ŽÉŽ¸Ž½àËòÅŽ´Ž³ŽÛ
             ADD  RECE10-SHOKUJIFTN(1)     TO  SUM-S-FTNGK(IDX1)
           END-IF    
      *
           MOVE    1               TO  FLG-UPD 
           .
       20011-HKN-SYUKEI-EXT.
           EXIT.
      *
      *****************************************************************
      *    Ž¸ŽÈŽÉòÅŽ´ŽÊŽ¬Ž½Ž¸Ž·Ž×Ž½ðÏ
      *****************************************************************
       20012-KOH-SYUKEI-SEC        SECTION.
      *
           PERFORM VARYING IDZ     FROM    1   BY  1
                   UNTIL   IDZ     >       4
                   OR  RECE10-KOHNUM (IDZ) =   SPACE
      *
      *===Ž¸ŽÈŽ¤ŽÏŽ°Ž²ŽÕŽ½ô¦ŽËŽ½Ž¸Ž·Ž× by Yoshikawa(2008/05/14) start
      **      Ž£Ž°Ž£ŽµŽ£Ž±Ž¤ŽÈŽ£Ž°Ž£Ž¹Ž£Ž±Ž¤ŽÏŽÆŽ±Ž¤Ž¸Ž¾Ž½ô¦ŽËŽ½Ž¸Ž·Ž×Ž¤Ž¹Ž¤
      *       IF      RECE10-KOHNUM (IDZ) =   "091"
      *         MOVE    "051"               TO  RECE10-KOHNUM (IDZ)
      *       END-IF
      **
      **      Ž¸ŽÈŽÈŽÖŽ¹ì¦ŽÞŽ¤ŽÈŽ¤âÀŽÊŽ¤Ž¬Ž¤Ž¢Ž¤Ž¤ŽÈŽ¤Ž­
      *       IF        WRK-2007-MAX    >       ZERO
      *         PERFORM VARYING IDZ1    FROM    1   BY  1
      *                 UNTIL   IDZ1    >       WRK-2007-MAX
      *           PERFORM VARYING IDZ2  FROM    1   BY  1
      *                   UNTIL   IDZ2  >       5
      *                   OR WRK-2007-KOHNUM(IDZ1 IDZ2)  =  SPACE
      *             IF  RECE10-KOHNUM(IDZ)  
      *                                 =   WRK-2007-KOHNUM(IDZ1 IDZ2)
      *               MOVE  WRK-2007-KOHNUM(IDZ1 1)
      *                                   TO  RECE10-KOHNUM (IDZ)
      *               MOVE  WRK-2007-MEISYO (IDZ1)
      *                                   TO  WRK-MEISYO
      *               MOVE  5             TO  IDZ2
      *               MOVE  WRK-2007-MAX  TO  IDZ1
      *             END-IF
      *           END-PERFORM
      *         END-PERFORM
      *       END-IF
      **
      **      Ž¸ŽÈŽÈŽÖŽ¹ìµŽÊŽÇŽ¼
      *       PERFORM VARYING   IDX2    FROM    1   BY  1
      *               UNTIL     IDX2 >          100
      *         IF  SUM-KOHNUM (IDX2)   =   SPACE
      *           MOVE  RECE10-KOHNUM(IDZ) TO  SUM-KOHNUM(IDX2)
      *           MOVE  WRK-MEISYO        TO  SUM-KOH-MEISYO(IDX2)
      *         END-IF
      *         IF   RECE10-KOHNUM(IDZ) =  SUM-KOHNUM (IDX2)
             MOVE   1                    TO  IDX2
      *===Ž¸ŽÈŽ¤ŽÏŽ°Ž²ŽÕŽ½ô¦ŽËŽ½Ž¸Ž·Ž× by Yoshikawa(2008/05/14) end
                  PERFORM 200121-KOH-SYUKEI-01-SEC
      *===Ž¸ŽÈŽ¤ŽÏŽ°Ž²ŽÕŽ½ô¦ŽËŽ½Ž¸Ž·Ž× by Yoshikawa(2008/05/14) start
      *           MOVE    100             TO  IDX2
      *         END-IF
      *       END-PERFORM
      *===Ž¸ŽÈŽ¤ŽÏŽ°Ž²ŽÕŽ½ô¦ŽËŽ½Ž¸Ž·Ž× by Yoshikawa(2008/05/14) end
           END-PERFORM
           .
       20012-KOH-SYUKEI-EXT.
           EXIT.
      *
      *****************************************************************
      *    Ž¸ŽÈŽ½Ž¸Ž·Ž×Ž½ðÏ
      *****************************************************************
       200121-KOH-SYUKEI-01-SEC        SECTION.
      *
           COMPUTE IDY     =   IDZ     +   1
      *    
      *    Ž¸ŽÈŽºŽÆŽ·ŽÇŽÍŽ¡Ž§ŽÎŽÅŽÍŽÜŽ¤ŽÎŽµŽÉŽÕŽ¡Ž§Ž·Ž¿
           ADD  1                    TO  SUM-KKENSU(IDX2 IDX3)
      *    Ž¸ŽÈŽºŽÆŽ·ŽÇŽÍŽ¡Ž§ŽÎŽÅŽÍŽÜŽ¤ŽÎŽµŽÉŽÕŽ¡Ž§ŽÆŽ¿
           ADD  RECE10-JNISSU(IDY)   TO  SUM-KNISSU(IDX2 IDX3)
      *    Ž¸ŽÈŽºŽÆŽ·ŽÇŽÍŽ¡Ž§ŽÎŽÅŽÍŽÜŽ¤ŽÎŽµŽÉŽÕŽ¡Ž§ŽÅŽÀŽ¿
           ADD  RECE10-TOTALTEN(IDY) TO  SUM-KTENSU(IDX2 IDX3)
      *    Ž¸ŽÈŽºŽÆŽ·ŽÇŽÍŽ¡Ž§ŽÎŽÅŽÍŽÜŽ¤ŽÎŽµŽÉŽÕŽ¡Ž§Ž°ŽÉŽÉòÅŽ´Ž¶
           ADD  RECE10-FTNMONEY(IDY) TO  SUM-KITBFTN(IDX2 IDX3)
      *
           IF      IDX3              =   1 
      *===Ž¸ŽÈŽ¤ŽÏŽ°Ž²ŽÕŽ½ô¦ŽËŽ½Ž¸Ž·Ž× by Yoshikawa(2008/05/14) start
      *      Ž·Ž³ŽËŽ£Ž±Ž£Ž°ŽÀŽºŽ¿ŽÀŽ£Ž²Ž£Ž±ŽÊŽ¡Ž»æ¦ŽÏŽ¿Ž©Ž»ŽÎŽÅŽÍŽÜŽ¤Ž½Ž¸Ž·Ž×Ž¤Ž·Ž¤ŽÊŽ¤Ž¤
             IF  RECE10-KOHNUM(IDZ)  NOT  = "010" AND "021" AND "174"
                                       AND  "173" AND "175" AND "172"
                                       AND  "176" AND "177" AND "178"
                                       AND  "374"
      *===Ž¸ŽÈŽ¤ŽÏŽ°Ž²ŽÕŽ½ô¦ŽËŽ½Ž¸Ž·Ž× by Yoshikawa(2008/05/14) end
               IF    RECE10-SHOKUJINISSU(IDY)   >   ZERO
      *    Ž¸ŽÈŽºŽÆŽ·ŽÇŽÍŽ¡Ž§Ž¿Ž©Ž»ŽÎŽÅŽÍŽÜŽ¡Ž§Ž·Ž¿
                 ADD     1                     TO SUM-S-KKENSU(IDX2)
               END-IF
      *    Ž¸ŽÈŽºŽÆŽ·ŽÇŽÍŽ¡Ž§Ž¿Ž©Ž»ŽÎŽÅŽÍŽÜŽ¡Ž§ŽÆŽ¿
               ADD  RECE10-SHOKUJINISSU(IDY)   TO SUM-S-KNISSU(IDX2)
      *    Ž¸ŽÈŽºŽÆŽ·ŽÇŽÍŽ¡Ž§Ž¿Ž©Ž»ŽÎŽÅŽÍŽÜŽ¡Ž§Ž¶äµŽÛ
               ADD  RECE10-SHOKUJIRYOYOHI(IDY) TO SUM-S-KKINGK(IDX2)
      *    Ž¸ŽÈŽºŽÆŽ·ŽÇŽÍŽ¡Ž§Ž¿Ž©Ž»ŽÎŽÅŽÍŽÜŽ¡Ž§ŽÉŽ¸Ž½àËòÅŽ´Ž³ŽÛ
               ADD  RECE10-SHOKUJIFTN(IDY)     TO SUM-S-KFTNGK(IDX2)
      *===Ž¸ŽÈŽ¤ŽÏŽ°Ž²ŽÕŽ½ô¦ŽËŽ½Ž¸Ž·Ž× by Yoshikawa(2008/05/14) start
             END-IF
      *===Ž¸ŽÈŽ¤ŽÏŽ°Ž²ŽÕŽ½ô¦ŽËŽ½Ž¸Ž·Ž× by Yoshikawa(2008/05/14) end
           END-IF    
      *
           MOVE    1               TO  FLG-UPD 
           .
       200121-KOH-SYUKEI-01-EXT.
           EXIT.
      *
      *****************************************************************
      *    ŽÀŽÁŽµâ¥ŽÄŽ£ŽÂŽ¹Ž¹Ž¿Ž·ŽÍŽÑŽ¥ŽÕŽ¥Ž¡Ž¥Ž¤Ž¥Ž½ŽÐŽÎŽÏŽ½ðÏ
      *****************************************************************
       20013-UPD-FILE-HENSYU-SEC         SECTION.
      *
           MOVE    RECE10-REC          TO  RECE10X-REC
           INITIALIZE                      RECE10X-UPHKNJANUM
                                           RECE10X-XXPREFNUM
                                           RECE10X-XXSRYYM
                                           RECE10X-XXSTHKNJANUM
                                           RECE10X-XXEDHKNJANUM
                                           RECE10X-XXTEISYUTUSAKI
           WRITE   RECE10X-REC
      *
           IF      STS-RECEUPD         =   "00"
               CONTINUE
           ELSE
               MOVE    SPACE               TO  WRK-RECEERR
               STRING "Ž¹Ž¹Ž¿Ž·ŽÍŽÑŽ¥ŽÕŽ¥Ž¡Ž¥Ž¤Ž¥ Ž½Ž¤Ž­Ž¹Ž¤ŽßŽ¥Ž¨Ž¥ò£Ž¼ STS="
                                                   DELIMITED  BY  SIZE
                       STS-RECEUPD                 DELIMITED  BY  SIZE
                                           INTO    WRK-RECEERR
               END-STRING                                
               PERFORM 500-ERR-HENSYU-SEC
               PERFORM 500-COBABORT-SEC
           END-IF 
           ADD     1                   TO  CNT-UPDFILE
           .
       20013-UPD-FILE-HENSYU-EXT.
           EXIT.
      *
      *****************************************************************
      *    ŽÄŽ¢ŽÉŽ¼Ž¥ŽÕŽ¥Ž¡Ž¥Ž¤Ž¥Ž½ŽÐŽÎŽÏŽ½ðÏ
      *****************************************************************
       2002-PRINT-SEC                SECTION.
      *
      *    ŽÄŽ¢ŽÉŽ¼ŽÊŽÔŽ½Ž¸<Ž¸Ž«Ž½ŽÐŽ¤Ž·>Ž½ðÏ
           PERFORM 20021-HEAD-HEN-SEC
      *    ŽÄŽ¢ŽÉŽ¼ŽÊŽÔŽ½Ž¸<ŽÌŽÀŽºŽÙ>Ž½ðÏ
           PERFORM 20023-BODY-HEN-SEC
      *    ŽÄŽ¢ŽÉŽ¼Ž°ŽºŽ½ðÏ
           PERFORM 20024-PRINT-OUT-SEC
      *
           .
       2002-PRINT-EXT.
           EXIT.
      *
      *****************************************************************
      *    ŽÄŽ¢ŽÉŽ¼ŽÊŽÔŽ½Ž¸<Ž¸Ž«Ž½ŽÐŽ¤Ž·>Ž½ðÏ
      *****************************************************************
       20021-HEAD-HEN-SEC          SECTION.
      *
           INITIALIZE                      SKT0525
      *    ŽÀŽÁŽµâÉŽ¯Ž·ýÃ
           MOVE    WRK-SEIYMDWH        TO  SKT0525-SEIYMD
      *    Ž¿ŽÇŽÎŽÅŽÇŽ¯Ž·
           MOVE    WRK-SRYYMWH         TO  SKT0525-SRYYM
      *=== ŽÅŽÀŽ¿ŽÉŽ½Ž¶ðÌŽ¬ŽÄŽÉŽ²ŽÃ by Uchida(2009/04/02) start
      *    ŽÅŽÀŽ¿ŽÉŽ½Ž¶ðÌŽ¬
           EVALUATE SYS-1001-TENHYOKBN
             WHEN    1
               MOVE    "Ž¡"            TO  SKT0525-TENHYOKBN(1)
             WHEN    3
               MOVE    "Ž¡"            TO  SKT0525-TENHYOKBN(2)
           END-EVALUATE
      *=== ŽÅŽÀŽ¿ŽÉŽ½Ž¶ðÌŽ¬ŽÄŽÉŽ²ŽÃ by Uchida(2009/04/02) end
      *    Ž°êÐŽÅŽµŽ¡Ž´ŽØŽ½Ž»Ž½
           MOVE    WRK-HOSPADRS        TO  SKT0525-ADRS
      *    Ž°êÐŽÅŽµŽ¡Ž´ŽØŽÌŽ¾
           MOVE    WRK-HOSPNAME        TO  SKT0525-HOSPNAME
      *    Ž³Ž«ŽÀŽßŽ¼ŽÔŽÌŽ¾
           MOVE    SYS-1001-KAISETUNAME
                                       TO  SKT0525-KAISETUNAME
      *    ŽÅŽÅŽÏŽÃŽÈŽÖŽ¹
      *     MOVE    WRK-HOSPTEL         TO  SKT0525-TEL
      *    Ž°êÐŽÅŽµŽ¡Ž´ŽØŽ¥Ž³Ž¡Ž¼Ž¥ŽÉ
           MOVE     SYS-1001-HOSPCD    TO  WRK-MAE-INPUT
           PERFORM  2009-HENKAN-SEC
           MOVE     WRK-OUT-INPUT      TO  SKT0525-HOSPCD
      *    ŽÊŽÝŽ¸Ž±Ž¼ŽÔŽÈŽÖŽ¹
           MOVE     WRK-HKNJANUM(1:2)       TO  WRK-MAE-INPUT
           PERFORM  2009-HENKAN-SEC
           MOVE     WRK-OUT-INPUT      TO  SKT0525-HKNJANUM
      *    ŽÊŽÝŽ¸Ž±Ž¼ŽÔŽÌŽ¾(ŽÅŽÔŽÆŽ»ŽÉŽÜŽ¸Ž©ŽÌŽ¾)
           MOVE     WRK-HKNJANAME      TO  SKT0525-HKNJANAME
      *    ŽºŽßŽÁõÄŽÇŽ¡Ž¦ŽºŽßŽ°êÃ
           IF    WRK-INDEX  =  2
             MOVE    "ŽºŽß"              TO  SKT0525-ZAI1
             MOVE    "Ž¢"              TO  SKT0525-ZAI2
           END-IF
      *
           .
       20021-HEAD-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    ŽÄŽ¢ŽÉŽ¼ŽÊŽÔŽ½Ž¸<ŽÌŽÀŽºŽÙŽ¹ŽÔ>Ž½ðÏ
      *****************************************************************
       20023-BODY-HEN-SEC      SECTION.
      *
           MOVE    ZERO                TO  IDZ
      *
      *    ŽÊŽÔŽ½Ž¸Ž½ðÏ
           PERFORM VARYING IDX FROM    1   BY  1
                   UNTIL   IDX >       2
             ADD     1                   TO  IDZ    
             PERFORM VARYING IDY FROM    1   BY  1
                     UNTIL   IDY >       2
      *    ŽÎŽÅŽÍŽÜŽ¤ŽÎŽµŽÉŽÕŽ¡Ž§Ž·Ž¿
               MOVE  SUM-KENSU(IDX IDY)  TO  WRK-Z5
               MOVE  WRK-Z5              TO  SKT0525-KENSU(IDZ IDY)
      *    ŽÎŽÅŽÍŽÜŽ¤ŽÎŽµŽÉŽÕŽ¡Ž§Ž¿ŽÇŽÎŽÅŽ¼ŽÂŽÆŽ¿
               MOVE  SUM-NISSU(IDX IDY)  TO  WRK-Z5 
               MOVE  WRK-Z5              TO  SKT0525-NISSU(IDZ IDY)
      *    ŽÎŽÅŽÍŽÜŽ¤ŽÎŽµŽÉŽÕŽ¡Ž§ŽÅŽÀŽ¿
               MOVE  SUM-TENSU(IDX IDY)  TO  WRK-Z9
               MOVE  WRK-Z9              TO  SKT0525-TENSU(IDZ IDY)
      *    ŽÎŽÅŽÍŽÜŽ¤ŽÎŽµŽÉŽÕŽ¡Ž§Ž°ŽÉŽÉòÅŽ´Ž¶
               MOVE  SUM-ITBFTN(IDX IDY) TO  WRK-Z9
               MOVE  WRK-Z9              TO  SKT0525-ITBFTN(IDZ IDY)
             END-PERFORM
      *
      *    Ž¿Ž©Ž»ŽÎŽÅŽÍŽÜŽ¡Ž§Ž·Ž¿
             MOVE  SUM-S-KENSU(IDX)      TO  WRK-Z5
             MOVE  WRK-Z5                TO  SKT0525-S-KENSU(IDZ)
      *    Ž¿Ž©Ž»ŽÎŽÅŽÍŽÜŽ¡Ž§ŽÆŽ¿
             MOVE  SUM-S-NISSU(IDX)      TO  WRK-Z5
             MOVE  WRK-Z5                TO  SKT0525-S-NISSU(IDZ)
      *    Ž¿Ž©Ž»ŽÎŽÅŽÍŽÜŽ¡Ž§Ž¶äµŽÛ
             MOVE  SUM-S-KINGK(IDX)      TO  WRK-Z9
             MOVE  WRK-Z9                TO  SKT0525-S-KINGK(IDZ)
      *    Ž¿Ž©Ž»ŽÎŽÅŽÍŽÜŽ¡Ž§ŽÉŽ¸Ž½àËòÅŽ´Ž³ŽÛ
             MOVE  SUM-S-FTNGK(IDX)      TO  WRK-Z9
             MOVE  WRK-Z9                TO  SKT0525-S-FTNGK(IDZ)
           END-PERFORM
      *     
      *    Ž¸ŽÈŽÉòÅŽ´ŽÊŽ¬ŽÊŽÔŽ½Ž¸Ž½ðÏ
           MOVE    ZERO                  TO  FLG-KOH-END
           MOVE    1                     TO  IDX2
      * 
           PERFORM 200231-KOH-HENSYU-SEC
      *===Ž¸ŽÈŽ¤ŽÏŽ°Ž²ŽÕŽ½ô¦ŽËŽ½Ž¸Ž·Ž× by Yoshikawa(2008/05/14) start
      *                             UNTIL   FLG-KOH-END   =   1
      *===Ž¸ŽÈŽ¤ŽÏŽ°Ž²ŽÕŽ½ô¦ŽËŽ½Ž¸Ž·Ž× by Yoshikawa(2008/05/14) end
      *
           .
       20023-BODY-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    ŽÄŽ¢ŽÉŽ¼ŽÊŽÔŽ½Ž¸<Ž¸ŽÈŽÉòÅŽ´ŽÊŽ¬>Ž½ðÏ
      *****************************************************************
       200231-KOH-HENSYU-SEC         SECTION.
      *
      *===Ž¸ŽÈŽ¤ŽÏŽ°Ž²ŽÕŽ½ô¦ŽËŽ½Ž¸Ž·Ž× by Yoshikawa(2008/05/14) start
      *     IF      SUM-KOHNUM (IDX2)   =   SPACE
      *       MOVE    1                     TO  FLG-KOH-END
      *     ELSE    
      *       PERFORM 2002311-HKNNUM-HENSYU-SEC     
      *===Ž¸ŽÈŽ¤ŽÏŽ°Ž²ŽÕŽ½ô¦ŽËŽ½Ž¸Ž·Ž× by Yoshikawa(2008/05/14) end
             PERFORM VARYING IDZ FROM    1   BY  1
                     UNTIL   IDZ >       2
      *    Ž¸ŽÈŽºŽÆŽ·ŽÇŽÍŽ¡Ž§ŽÎŽÅŽÍŽÜŽ¤ŽÎŽµŽÉŽÕŽ¡Ž§Ž·Ž¿
               MOVE  SUM-KKENSU(IDX2 IDZ)  TO WRK-Z5
               MOVE  WRK-Z5                TO SKT0525-KKENSU(IDZ)
      *    Ž¸ŽÈŽºŽÆŽ·ŽÇŽÍŽ¡Ž§ŽÎŽÅŽÍŽÜŽ¤ŽÎŽµŽÉŽÕŽ¡Ž§ŽÆŽ¿
               MOVE  SUM-KNISSU(IDX2 IDZ)  TO WRK-Z5
               MOVE  WRK-Z5                TO SKT0525-KNISSU(IDZ)
      *    Ž¸ŽÈŽºŽÆŽ·ŽÇŽÍŽ¡Ž§ŽÎŽÅŽÍŽÜŽ¤ŽÎŽµŽÉŽÕŽ¡Ž§ŽÅŽÀŽ¿
               MOVE  SUM-KTENSU(IDX2 IDZ)  TO WRK-Z9
               MOVE  WRK-Z9                TO SKT0525-KTENSU(IDZ)
      *    Ž¸ŽÈŽºŽÆŽ·ŽÇŽÍŽ¡Ž§ŽÎŽÅŽÍŽÜŽ¤ŽÎŽµŽÉŽÕŽ¡Ž§Ž°ŽÉŽÉòÅŽ´Ž¶
               MOVE  SUM-KITBFTN(IDX2 IDZ) TO WRK-Z9
               MOVE  WRK-Z9                TO SKT0525-KITBFTN(IDZ)
             END-PERFORM
      *
      *    Ž¸ŽÈŽºŽÆŽ·ŽÇŽÍŽ¡Ž§Ž¿Ž©Ž»ŽÎŽÅŽÍŽÜŽ¡Ž§Ž·Ž¿
             MOVE  SUM-S-KKENSU(IDX2)      TO  WRK-Z5
             MOVE  WRK-Z5                  TO  SKT0525-S-KKENSU
      *    Ž¸ŽÈŽºŽÆŽ·ŽÇŽÍŽ¡Ž§Ž¿Ž©Ž»ŽÎŽÅŽÍŽÜŽ¡Ž§ŽÆŽ¿
             MOVE  SUM-S-KNISSU(IDX2)      TO  WRK-Z5
             MOVE  WRK-Z5                  TO  SKT0525-S-KNISSU
      *    Ž¸ŽÈŽºŽÆŽ·ŽÇŽÍŽ¡Ž§Ž¿Ž©Ž»ŽÎŽÅŽÍŽÜŽ¡Ž§Ž¶äµŽÛ
             MOVE  SUM-S-KKINGK(IDX2)      TO  WRK-Z9
             MOVE  WRK-Z9                  TO  SKT0525-S-KKINGK
      *    Ž¸ŽÈŽºŽÆŽ·ŽÇŽÍŽ¡Ž§Ž¿Ž©Ž»ŽÎŽÅŽÍŽÜŽ¡Ž§ŽÉŽ¸Ž½àËòÅŽ´Ž³ŽÛ
             MOVE  SUM-S-KFTNGK(IDX2)      TO  WRK-Z9
             MOVE  WRK-Z9                  TO  SKT0525-S-KFTNGK
      *
      *===Ž¸ŽÈŽ¤ŽÏŽ°Ž²ŽÕŽ½ô¦ŽËŽ½Ž¸Ž·Ž× by Yoshikawa(2008/05/14) start
      *       ADD     1                     TO  IDX2   
      *     END-IF        
      *
      *    Ž£Ž±ŽÊŽÇŽ½ŽÐŽÎŽÏŽ¤Ž·Ž¤ŽÆŽ¤äºŽÈŽ¤ŽÏŽ¤ŽÞŽ¤ŽÀŽ»ŽÄŽ¤ŽÃŽ¤ŽÆŽ¤Ž¤Ž¤Ž¤Ž«
      *     IF      SUM-KOHNUM (IDX2)  =   SPACE
      *         MOVE    1                   TO  FLG-KOH-END
      *     ELSE    
      **        ŽÄŽ¢ŽÉŽ¼Ž°ŽºŽ½ðÏŽ¡ŽÊŽ£Ž²ŽÊŽÇŽ°ŽÊŽ¹ŽßŽ¡ŽË
      *         PERFORM 20024-PRINT-OUT-SEC
      **        ŽÄŽ¢ŽÉŽ¼ŽÊŽÔŽ½Ž¸<Ž¸Ž«Ž½ŽÐŽ¤Ž·>Ž½ðÏ
      *         PERFORM 20021-HEAD-HEN-SEC
      *     END-IF     
      *===Ž¸ŽÈŽ¤ŽÏŽ°Ž²ŽÕŽ½ô¦ŽËŽ½Ž¸Ž·Ž× by Yoshikawa(2008/05/14) end
      *
           .
       200231-KOH-HENSYU-EXT.
           EXIT.
      *
      *****************************************************************
      *    Ž¸ŽÈŽÊŽÝŽ¸Ž±Ž¶ðÌŽ¬ŽÊŽÔŽ½Ž¸Ž½ðÏ
      *****************************************************************
       2002311-HKNNUM-HENSYU-SEC         SECTION.
      *
           MOVE    SPACE               TO  WRK-KOHKBN
      *
           MOVE    SUM-KOHNUM (IDX2)   TO  WRK-KOHNUM9
           MOVE    WRK-KOHNUM9         TO  SKT0525-HBTNUM
      *
      *    ŽÆŽÃŽÄŽ¼ŽÀŽ´ŽµŽ¤ŽÎŽ¤ŽÈŽ¤Ž­ 
           IF      SUM-KOHNUM (IDX2)  =   "051"
               MOVE    "51"            TO   SKT0525-HBTNUM
               MOVE    "ŽÆŽÃŽÄŽ¼ŽÀŽ´Žµ"      TO   WRK-HKNNAME
           ELSE
      *      Ž¸ŽÈŽÈŽÖŽ¹ì¦ŽÞŽ¤ŽÈŽ¤âÀŽÊŽ¤Ž«Ž¤ò¦ŽÎŽ½Ž¸Ž·Ž×Ž¤Ž«
             IF      SUM-KOH-MEISYO(IDX2)  =   SPACE
      *        ŽÊŽÝŽ¸Ž±ŽÈŽÖŽ¹ìÈŽÉŽ¹Ž¤Žß  
               INITIALIZE                     HKNNUM-REC
               MOVE  SPA-HOSPNUM          TO  HKN-HOSPNUM
               MOVE  SUM-KOHNUM (IDX2)    TO  HKN-HKNNUM
               MOVE  HKNNUM-REC           TO  MCPDATA-REC
               MOVE  "tbl_hknnum"         TO  MCP-TABLE
               MOVE  "key2"               TO  MCP-PATHNAME
                 PERFORM 900-DBSELECT-SEC
                 IF      MCP-RC              =   ZERO
                   MOVE  "tbl_hknnum"     TO  MCP-TABLE
                   MOVE  "key2"           TO  MCP-PATHNAME
                   PERFORM 900-HKNNUM-READ-SEC
                 ELSE
                   MOVE    1              TO  FLG-HKNNUM
                 END-IF
      *
                 PERFORM UNTIL       FLG-HKNNUM      =   1
                   IF      HKN-TEKSTYMD            <=  WRK-SRYYMD
                   AND     HKN-TEKEDYMD            >=  WRK-SRYYMD
                     MOVE  HKN-TANSEIDONAME   TO  WRK-HKNNAME
                     MOVE  1                  TO  FLG-HKNNUM   
                   END-IF
      *
                   IF      FLG-HKNNUM           =   ZERO
                     MOVE  "tbl_hknnum"       TO  MCP-TABLE
                     MOVE  "key2"             TO  MCP-PATHNAME
                     PERFORM 900-HKNNUM-READ-SEC
                   END-IF
                 END-PERFORM
                 MOVE  "tbl_hknnum"       TO  MCP-TABLE
                 MOVE  "key2"             TO  MCP-PATHNAME
                 PERFORM  900-CLOSE-SEC
      *
      *          ŽËŽ¡ŽÊŽÌŽÈŽÖŽ¹
                 MOVE  HKN-HBTNUM         TO  SKT0525-HBTNUM
             ELSE
      *          Ž¸ŽÈŽÈŽÖŽ¹ì¦ŽÞŽ¤ŽÈŽ¤âÀŽÊŽ¤Ž«Ž¤òºŽÈŽÌŽ¾Ž¤ŽØ
                 MOVE SUM-KOH-MEISYO(IDX2)    TO  WRK-HKNNAME
             END-IF
           END-IF
      *
      *    Ž¸ŽÈŽÌŽ¾
           MOVE  WRK-HKNNAME        TO  SKT0525-KOHNAME
      *
           . 
       2002311-HKNNUM-HENSYU-EXT.
           EXIT.
      *
      *****************************************************************
      *    ŽÄŽ¢ŽÉŽ¼Ž°ŽºŽ½ðÏ
      *****************************************************************
       20024-PRINT-OUT-SEC                SECTION.
      *
           DISPLAY  "PRINT"
           ADD     1                   TO  CNT-PAGE
           MOVE    CNT-PAGE            TO  WRK-PAGE
      *
           INITIALIZE                  ORCSPRTAREA
           MOVE    "INS"               TO  SPRT-MODE
           MOVE    LNK-PRTKANRI-RENNUM TO  SPRT-RENNUM
           MOVE    LNK-PRTKANRI-TBL-KEY
                                       TO  SPRT-TBL-KEY
           MOVE    LNK-PRTKANRI-TBL-GROUP
                                       TO  SPRT-TBL-GROUP
           MOVE    LNK-PRTKANRI-SRYYM  TO  SPRT-SRYYM
           MOVE    LNK-PRTKANRI-SKYYMD TO  SPRT-SKYYMD
           MOVE    LNK-PRTKANRI-SHELLID 
                                       TO  SPRT-SHELLID
           MOVE    LNK-PRTKANRI-SHORI-RENNUM
                                       TO  SPRT-SHORI-RENNUM
           MOVE    LNK-PRTKANRI-PRIORITY
                                       TO  SPRT-PRIORITY
           MOVE    WRK-PAGE            TO  SKT0525-NO
           MOVE    "SKT0525.red"         TO  SPRT-PRTID
           MOVE    SKT0525               TO  SPRT-PRTDATA
           EVALUATE    WRK-INDEX    ALSO    WRK-SYOKBN
                                            ALSO    WRK-PARA-SYOKBN1
               WHEN    1            ALSO    "1"     
                                            ALSO   "1"
                   MOVE    "Ž¸ê¶Ž¹äÐŽ¼ŽÔŽÀŽÁŽµâ¿"        TO  SPRT-TITLE
               WHEN    2            ALSO    "1"
                                            ALSO   "1"
                   MOVE    "Ž¸ê¶Ž¹äÐŽ¼ŽÔŽÀŽÁŽµâ¿Ž¡ŽÊŽºŽßŽ°êÃõÐŽ¡ŽË"
                                               TO  SPRT-TITLE
               WHEN    1            ALSO    "2"
                                            ALSO   "1"
                   MOVE    "Ž¸ê¶Ž¹äÐŽ¼ŽÔŽÀŽÁŽµâ¿Ž¡ŽÎŽÊŽÖŽÌâÌŽ¬Ž¡ŽÏ" 
                                               TO  SPRT-TITLE
               WHEN    2            ALSO    "2"
                                            ALSO   "1"
                   MOVE    "Ž¸ê¶Ž¹äÐŽ¼ŽÔŽÀŽÁŽµâ¿Ž¡ŽÊŽºŽßŽ°êÃõÐŽ¡ŽËŽ¡ŽÎŽÊŽÖŽÌâÌŽ¬Ž¡ŽÏ"
                                               TO  SPRT-TITLE
               WHEN    1            ALSO    "1"     
                                            ALSO   "2"
                   MOVE    "Ž¸ê¶Ž¹äÐŽ¼ŽÔŽÀŽÁŽµâ¿Ž¡ŽÎŽÆŽÃŽÊŽÌŽÎŽÅŽÍŽÜŽÈŽ¡ŽÏ"
                                               TO  SPRT-TITLE
               WHEN    1            ALSO    "2"
                                            ALSO   "2"
                   MOVE    "Ž¸ê¶Ž¹äÐŽ¼ŽÔŽÀŽÁŽµâ¿Ž¡ŽÎŽÊŽÖŽÌâÌŽ¬Ž¡ŽÏŽ¡ŽÎŽÆŽÃŽÊŽÌŽÎŽÅŽÍŽÜŽÈŽ¡ŽÏ" 
                                               TO  SPRT-TITLE
           END-EVALUATE
           MOVE    LNK-PRTKANRI-TERMID TO  SPRT-TERMID
           MOVE    LNK-PRTKANRI-OPID   TO  SPRT-OPID
           MOVE    LNK-PRTKANRI-PRTNM  TO  SPRT-PRTNM
      *     MOVE    "1"                 TO  SPRT-SITEKBN
      *     
           CALL    "ORCSPRT"           USING
                                       ORCSPRTAREA
                                       SPA-AREA
           IF      SPRT-RETURN         =   ZERO
               CONTINUE
           ELSE
               MOVE    "Ž°ŽºŽ£ŽÄŽ£ŽÂŽ¤ŽËŽ¹Ž¹Ž¿Ž·Ž¤ŽÇŽ¤Ž­Ž¤ŽÞŽ¤Ž»Ž¤Ž¤ŽÇŽ¤Ž·Ž¤Ž¿"
                                          TO  WRK-RECEERR
               PERFORM 500-ERR-HENSYU-SEC
               PERFORM 500-COBABORT-SEC
           END-IF
           .
       20024-PRINT-OUT-EXT.
           EXIT.
      *
      *****************************************************************
      *    ŽÁŽ´Ž³ŽÑŽÊŽÑŽ´Ž¹Ž½ðÏ
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
      * 
      *****************************************************************
      *    Ž¥Ž¨Ž¥ò£Ž¼Ž½ŽÐŽÎŽÏŽ½ðÏ
      *****************************************************************
       500-ERR-HENSYU-SEC                SECTION.
      *
           OPEN    INPUT   RECEERR-FILE
           IF      STS-RECEERR         =   ZERO
               CLOSE   RECEERR-FILE
           ELSE
               OPEN    OUTPUT              RECEERR-FILE
      *
               MOVE    WRK-RECEERR         TO  RECEERR-REC
               WRITE   RECEERR-REC
               CLOSE   RECEERR-FILE
      *         
      *        Ž¥Ž¸Ž¥î§ŽÖŽ´ŽÉŽÍŽ³Ž«Ž»ŽÏŽ½ðÏ
               MOVE    "JBE"           TO  SJOBKANRI-MODE
               INITIALIZE                  JOBKANRI-REC
               MOVE    WRK-RECEERR     TO  JOB-YOBI
               MOVE    "9999"          TO  JOB-ERRCD
               PERFORM 900-CALL-ORCSJOB-SEC
           END-IF
      *
           MOVE    1                   TO  FLG-END     
                                           FLG-ERR
      *
           .
       500-ERR-HENSYU-EXT.
           EXIT.
      *
      *****************************************************************
      *    Ž¥Ž¨Ž¥ò£Ž¼Ž»Ž½ŽªŽÎŽ»Ž½ðÏ
      *****************************************************************
       500-COBABORT-SEC                SECTION.
      *
           MOVE    SPACE               TO  WRK-ERRMSG
           STRING  "SOKATU0525 "         DELIMITED  BY  SIZE
                   WRK-RECEERR         DELIMITED  BY  SIZE
                   LOW-VALUE           DELIMITED  BY  SIZE
                                       INTO    WRK-ERRMSG
           END-STRING   
           CALL    "cobabort"          USING   WRK-ERRMSG
      *
           .
       500-COBABORT-EXT.
           EXIT.
      *
      *****************************************************************
      *    Ž½ŽªŽÎŽ»Ž½ðÏ
      *****************************************************************
       300-END-SEC                 SECTION.
      *
      *     
      *    Ž¥Ž¹Ž¥ŽÆŽ¥ŽÃŽ¥Ž×Ž´ŽÉŽÍŽ½ŽªŽÎŽ»Ž½ðÏ
           MOVE    "STE"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
           MOVE    CNT-PAGE        TO  JOB-UPDCNT
           PERFORM 900-CALL-ORCSJOB-SEC
      *                              
           PERFORM 900-DBDISCONNECT-SEC
           .
       300-END-EXT.
           EXIT.
      *
      *****************************************************************
      *   ŽÀŽÁŽµâ¶ŽÉŽÍŽ£ŽÄŽ£ŽÂŽ¹Ž¹Ž¿Ž·Ž½ðÏ
      *****************************************************************
       310-SEIKYU-UPD-SEC              SECTION.
      *
           OPEN    INPUT    UPD-FILE
      *
           PERFORM 900-UPD-FILE-READ-SEC
           PERFORM             UNTIL   FLG-UPDFILE    =   1
               MOVE    RECE10X-KEY         TO  RECE10-KEY
               MOVE    RECE10-REC          TO  MCPDATA-REC
               PERFORM 910-SEIKYU-INV-SEC
               IF      FLG-SEIKYU          =   ZERO
                   MOVE    "2"             TO  RECE10-SKYKBN
                   MOVE    LNK-PRTKANRI-SRYYM  TO  RECE10-SKYYM
                   MOVE    LNK-PRTKANRI-SKYYMD TO  RECE10-UPDYMD  
                   MOVE    RECE10-REC      TO  MCPDATA-REC
                   MOVE    "DBUPDATE"      TO  MCP-FUNC
                   MOVE    "tbl_seikyu"    TO  MCP-TABLE
                   MOVE    "key"           TO  MCP-PATHNAME
                   PERFORM 900-ORCDBMAIN-SEC
                   IF      MCP-RC          =   ZERO
                       PERFORM 900-UPD-FILE-READ-SEC
                   ELSE
                       STRING "ŽÀŽÁŽµâ¶ŽÉŽÍŽ£ŽÄŽ£ŽÂŽ¡Ž¡Ž¹Ž¹Ž¿Ž·Ž¥Ž¨Ž¥ò£Ž¼Ž¡Ž¡"
                                               DELIMITED  BY  SIZE
                               RECE10-KEY      DELIMITED  BY  SIZE
                                               INTO    WRK-RECEERR
                       END-STRING                                
                       PERFORM 500-ERR-HENSYU-SEC
                       PERFORM 500-COBABORT-SEC
                   END-IF
               ELSE
                   STRING "ŽÀŽÁŽµâ¶ŽÉŽÍŽ£ŽÄŽ£ŽÂŽ¡Ž¡ŽÆŽÉŽ¹Ž¤ŽßŽ¹Ž¹Ž¿Ž·Ž¥Ž¨Ž¥ò£Ž¼Ž¡Ž¡"
                                               DELIMITED  BY  SIZE
                           RECE10X-KEY         DELIMITED  BY  SIZE
                                               INTO    WRK-RECEERR
                   END-STRING                                
                   PERFORM 500-ERR-HENSYU-SEC
                   PERFORM 500-COBABORT-SEC
               END-IF
           END-PERFORM  
      *
           CLOSE   UPD-FILE
           .
       310-SEIKYU-UPD-EXT.
           EXIT.
      *
      *****************************************************************
      *    ŽÀŽ¾ŽÎŽÆŽËŽÜŽ¸ŽÊŽÑŽ´Ž¹Ž½ðÏ
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
           INSPECT WRK-HENYMDG    REPLACING  ALL "  "  BY  "Ž¡Ž¡"
           .
       31012-SEIWA-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    ŽÀŽÁŽµâ¶ŽÉŽÍŽÆŽÉŽ¹
      *****************************************************************
       900-SEIKYU-SELECT-SEC             SECTION.
      *
           MOVE    ZERO                TO  FLG-RECE10
      *     
      *    ŽÀŽÁŽµâ¶ŽÉŽÍŽ£ŽÄŽ£ŽÂŽ¸Ž¡Žº
           MOVE    SPACE               TO  RECE10-REC
           INITIALIZE                      RECE10-REC
           MOVE    WRK-PARA-HOSPNUM    TO  RECE10-HOSPNUM
           MOVE    LNK-PRTKANRI-SRYYM  TO  RECE10-SKYYM
           MOVE    WRK-CONS-SRYYM-200804
                                       TO  RECE10-SRYYM
           MOVE    999999              TO  RECE10-XXSRYYM
           IF      WRK-PARA-HKNJANUM   NOT =   ZERO
               MOVE    WRK-PARA-HKNJANUM   TO  RECE10-XXSTHKNJANUM
                                               RECE10-XXEDHKNJANUM
           ELSE
               MOVE    SPACE               TO  RECE10-XXSTHKNJANUM
               MOVE    "99999999"          TO  RECE10-XXEDHKNJANUM
           END-IF
           IF      WRK-PARA-SYOKBN1    =   "1"
               MOVE    "039"               TO  RECE10-HKNNUM-S
                                               RECE10-HKNNUM
           ELSE 
               MOVE    "040"               TO  RECE10-HKNNUM-S
                                               RECE10-HKNNUM
           END-IF
      *

      *
           MOVE    RECE10-REC          TO  MCPDATA-REC
           MOVE    WRK-MCP-TABLE       TO  MCP-TABLE
           MOVE    WRK-MCP-PATHNAME    TO  MCP-PATHNAME
           PERFORM 900-DBSELECT-SEC
           IF      MCP-RC              =   ZERO
               MOVE    WRK-MCP-TABLE       TO  MCP-TABLE
               MOVE    WRK-MCP-PATHNAME    TO  MCP-PATHNAME
               PERFORM 900-SEIKYU-READ-SEC
           ELSE
               MOVE    1                   TO  FLG-RECE10
               MOVE    HIGH-VALUE      TO  KEY-NEW
           END-IF
           .
       900-SEIKYU-SELECT-EXT.
           EXIT.
      *
      *****************************************************************
      *    ŽÀŽÁŽµâ§ŽÞŽ¥Ž¹Ž¥Ž¿Ž¡Ž¼ŽÆŽÉŽ¹
      *****************************************************************
       900-SEIKYU-READ-SEC           SECTION.
      *
           MOVE    WRK-MCP-TABLE       TO  MCP-TABLE
           MOVE    WRK-MCP-PATHNAME    TO  MCP-PATHNAME
           PERFORM 900-DBFETCH-SEC
           IF      MCP-RC              =   ZERO
               MOVE    ZERO            TO  FLG-RECE10
               MOVE    MCPDATA-REC         TO  RECE10-REC
      *
      *        Ž¥ŽÆŽ¥Ž¹Ž¥ŽÈŽ´ŽµŽ¼ŽÔŽ¤ŽÎŽ¤ŽÈŽ¤Ž­Ž¤ŽÏŽÆŽÉŽ¤ŽßŽÈŽ¤ŽÐŽ¤Ž¹
               MOVE    SPACE               TO  PTINF-REC
               INITIALIZE                      PTINF-REC
               MOVE    RECE10-HOSPNUM      TO  PTINF-HOSPNUM
               MOVE    RECE10-PTID         TO  PTINF-PTID
               MOVE    PTINF-REC           TO  MCPDATA-REC
               PERFORM 800-PTINF-READ-SEC
               IF      FLG-PTINF           =   ZERO
               AND     PTINF-TSTPTNUMKBN   =   "1"
                   PERFORM  900-SEIKYU-READ-SEC
               END-IF   
      *        Ž¥Ž­Ž¡Ž¼Ž¤ŽËŽ¸Ž©ŽÈŽÖŽ¹ì¦Ž³ŽÊŽÇŽ¼
               MOVE    RECE10-HKNJANUM(1:4)  TO  KEY-N-HKNJANUM
               ADD     1                     TO  CNT-RECE10   
      *         
           ELSE
               MOVE    HIGH-VALUE      TO  KEY-NEW
               MOVE    1               TO  FLG-RECE10
           END-IF
      *
           .
       900-SEIKYU-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    Ž´ŽµŽ¼ŽÔŽ¥ŽÞŽ¥Ž¹Ž¥Ž¿ŽÆŽÉŽ¹
      *****************************************************************
       800-PTINF-READ-SEC         SECTION.
      *
           MOVE    "tbl_ptinf"         TO  MCP-TABLE
           MOVE    "key"               TO  MCP-PATHNAME
           PERFORM 900-DBSELECT-SEC
           IF      MCP-RC              =   ZERO
               MOVE    "tbl_ptinf"         TO  MCP-TABLE
               MOVE    "key"               TO  MCP-PATHNAME
               PERFORM 900-DBFETCH-SEC
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
           MOVE    "tbl_ptinf"         TO  MCP-TABLE
           MOVE    "key"               TO  MCP-PATHNAME
           PERFORM 900-CLOSE-SEC
      *
           .
       800-PTINF-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    ŽÀŽÁŽµâ¶ŽÉŽÍŽ£ŽÄŽ£ŽÂŽ¹Ž¹Ž¿Ž·ŽÍŽÑŽ¥ŽÕŽ¥Ž¡Ž¥Ž¤Ž¥ŽÆŽÉŽ¹
      *****************************************************************
       900-UPD-FILE-READ-SEC             SECTION.
      *
           READ    UPD-FILE
               AT  END
                   MOVE    1           TO  FLG-UPDFILE
               NOT AT  END
                   MOVE    ZERO        TO  FLG-UPDFILE
           END-READ
           .
       900-UPD-FILE-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    Ž°êÐŽÅŽµŽ¡Ž´ŽØŽÊŽÔŽ½Ž¸Ž¾ŽÊŽÆŽÉŽ¤ŽßŽ¹Ž¤Žß
      *****************************************************************
       900-1900-READ-SEC           SECTION.
      *
      *    Ž°êÐŽÅŽµŽ¡Ž´ŽØŽÊŽÔŽ½Ž¸Ž¾ŽÊŽÆŽÉŽ¤ŽßŽ¹Ž¤Žß
           MOVE    SPACE           TO  SYS-1900-REC
           INITIALIZE                  SYS-1900-REC
           MOVE    "1900"          TO  SYS-1900-KANRICD
           MOVE    "*"             TO  SYS-1900-KBNCD
           MOVE    LNK-PRTKANRI-SRYYM
                                   TO  SYS-1900-STYUKYMD (1:6)
           MOVE    "01"            TO  SYS-1900-STYUKYMD (7:2)
           MOVE    SYS-1900-STYUKYMD
                                   TO  SYS-1900-EDYUKYMD
           MOVE    SPA-HOSPNUM     TO  SYS-1900-HOSPNUM
           MOVE    SYS-1900-REC    TO  MCPDATA-REC
           PERFORM 910-SYSKANRI-KEY10-SEC
           IF      FLG-SYSKANRI        =   ZERO
               MOVE    MCPDATA-REC     TO  SYS-1900-REC
               IF      SYS-1900-PRTKBN(8)  NOT =   SPACE
      *            Ž°êÐŽÅŽµŽ¡Ž´ŽØŽÌŽ¾Ž¾ŽÎŽÊŽÔŽ½Ž¸Ž¾ŽÊ
                   PERFORM 900-1901-READ-SEC
      *            Ž°êÐŽÅŽµŽ¡Ž´ŽØŽ½Ž»Ž½ŽÊŽÔŽ½Ž¸Ž¾ŽÊ
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
      *    Ž°êÐŽÅŽµŽ¡Ž´ŽØŽÌŽ¾Ž¾ŽÎŽÊŽÔŽ½Ž¸Ž¾ŽÊŽÆŽÉŽ¤ŽßŽ¹Ž¤Žß
      *****************************************************************
       900-1901-READ-SEC           SECTION.
      *
      *    Ž°êÐŽÅŽµŽ¡Ž´ŽØŽÌŽ¾Ž¾ŽÎŽÊŽÔŽ½Ž¸Ž¾ŽÊŽÆŽÉŽ¤ŽßŽ¹Ž¤Žß
           MOVE    SPACE           TO  SYS-1901-REC
           INITIALIZE                  SYS-1901-REC
           MOVE    "1901"          TO  SYS-1901-KANRICD
           MOVE    SYS-1900-PRTKBN(17)
                                   TO  SYS-1901-KBNCD
           MOVE    LNK-PRTKANRI-SRYYM
                                   TO  SYS-1901-STYUKYMD (1:6)
           MOVE    "01"            TO  SYS-1901-STYUKYMD (7:2)
           MOVE    SYS-1901-STYUKYMD
                                   TO  SYS-1901-EDYUKYMD
           MOVE    SPA-HOSPNUM     TO  SYS-1901-HOSPNUM
           MOVE    SYS-1901-REC    TO  MCPDATA-REC
           PERFORM 910-SYSKANRI-KEY10-SEC
           IF      FLG-SYSKANRI        =   ZERO
               MOVE    MCPDATA-REC     TO  SYS-1901-REC
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
      *    Ž°êÐŽÅŽµŽ¡Ž´ŽØŽ½Ž»Ž½ŽÊŽÔŽ½Ž¸Ž¾ŽÊŽÆŽÉŽ¤ŽßŽ¹Ž¤Žß
      *****************************************************************
       900-1902-READ-SEC           SECTION.
      *
      *    Ž°êÐŽÅŽµŽ¡Ž´ŽØŽ½Ž»Ž½ŽÊŽÔŽ½Ž¸Ž¾ŽÊŽÆŽÉŽ¤ŽßŽ¹Ž¤Žß
           MOVE    SPACE           TO  SYS-1902-REC
           INITIALIZE                  SYS-1902-REC
           MOVE    "1902"          TO  SYS-1902-KANRICD
           MOVE    SYS-1900-PRTKBN(17)
                                   TO  SYS-1902-KBNCD
           MOVE    LNK-PRTKANRI-SRYYM
                                   TO  SYS-1902-STYUKYMD (1:6)
           MOVE    "01"            TO  SYS-1902-STYUKYMD (7:2)
           MOVE    SYS-1902-STYUKYMD
                                   TO  SYS-1902-EDYUKYMD
           MOVE    SPA-HOSPNUM     TO  SYS-1902-HOSPNUM
           MOVE    SYS-1902-REC    TO  MCPDATA-REC
           PERFORM 910-SYSKANRI-KEY10-SEC
           IF      FLG-SYSKANRI        =   ZERO
               MOVE    MCPDATA-REC     TO  SYS-1902-REC
               MOVE    SYS-1902-ADRS1  TO  WRK-HOSPADRS1
               MOVE    SYS-1902-ADRS2  TO  WRK-HOSPADRS2
           ELSE
               INITIALIZE                  SYS-1902-REC
           END-IF
           .
      *
       900-1902-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    Ž¥Ž·Ž¥Ž¹Ž¥ŽÆŽ¥à¶ŽÉŽÍŽ¥ŽÞŽ¥Ž¹Ž¥Ž¿ŽÆŽÉŽ¹
      *****************************************************************
       910-SYSKANRI-KEY10-SEC         SECTION.
      *
           MOVE    "tbl_syskanri"      TO  MCP-TABLE
           MOVE    "key10"             TO  MCP-PATHNAME
           PERFORM 900-DBSELECT-SEC
           IF      MCP-RC          =   ZERO
               MOVE    "tbl_syskanri"  TO  MCP-TABLE
               MOVE    "key10"         TO  MCP-PATHNAME
               PERFORM 900-DBFETCH-SEC
               IF          MCP-RC      =   ZERO
                   MOVE    ZERO            TO  FLG-SYSKANRI
               ELSE
                   MOVE    1               TO  FLG-SYSKANRI
               END-IF
           ELSE
               MOVE    1               TO  FLG-SYSKANRI
           END-IF
      *
           MOVE    "tbl_syskanri"      TO  MCP-TABLE
           MOVE    "key10"             TO  MCP-PATHNAME
           PERFORM 900-CLOSE-SEC
      *
           .
       910-SYSKANRI-KEY10-EXT.
           EXIT.
      *
      *****************************************************************
      *    Ž¥Ž·Ž¥Ž¹Ž¥ŽÆŽ¥à¶ŽÉŽÍŽ¥ŽÞŽ¥Ž¹Ž¥Ž¿ŽÆŽÉŽ¹Ž¡ŽÊŽ£ŽÎŽ£ŽÅŽ£ŽØŽ£ŽÔŽ¡ŽË
      *****************************************************************
       900-SYSKANRI-READ-N-SEC         SECTION.
      *
           MOVE    WRK-MCP-TABLE       TO  MCP-TABLE
           MOVE    WRK-MCP-PATHNAME    TO  MCP-PATHNAME
           PERFORM 900-DBFETCH-SEC
           IF      MCP-RC              =   ZERO
               MOVE    ZERO                TO  FLG-SYSKANRI
           ELSE
               MOVE    1                   TO  FLG-SYSKANRI
           END-IF
           .
       900-SYSKANRI-READ-N-EXT.
           EXIT.
      *
      *****************************************************************
      *    ŽÀŽÁŽµâ¶ŽÉŽÍŽ¥ŽÞŽ¥Ž¹Ž¥Ž¿ŽÆŽÉŽ¹
      *****************************************************************
       910-SEIKYU-INV-SEC         SECTION.
      *
           MOVE    "tbl_seikyu"        TO  MCP-TABLE
           MOVE    "key"               TO  MCP-PATHNAME
           PERFORM 900-DBSELECT-SEC
           IF      MCP-RC              =   ZERO
               MOVE    "tbl_seikyu"        TO  MCP-TABLE
               MOVE    "key"               TO  MCP-PATHNAME
               PERFORM 900-DBFETCH-SEC
               IF      MCP-RC              =   ZERO
                   MOVE    ZERO                TO  FLG-SEIKYU
                   MOVE    MCPDATA-REC         TO  RECE10-REC
               ELSE
                   MOVE    1                   TO  FLG-SEIKYU
               END-IF
           ELSE
               MOVE    1                   TO  FLG-SEIKYU
           END-IF
      *
           MOVE    "tbl_seikyu"        TO  MCP-TABLE
           MOVE    "key"               TO  MCP-PATHNAME
           PERFORM 900-CLOSE-SEC
      *
           .
       910-SEIKYU-INV-EXT.
           EXIT.
      *
      *****************************************************************
      *    ŽÊŽÝŽ¸Ž±ŽÈŽÖŽ¹ì§ŽÞŽ¥Ž¹Ž¥Ž¿Ž¡Ž¼ŽÆŽÉŽ¹
      *****************************************************************
       900-HKNNUM-READ-SEC         SECTION.
      *
           PERFORM 900-DBFETCH-SEC
           IF      MCP-RC              =   ZERO
               MOVE    MCPDATA-REC     TO  HKNNUM-REC
               MOVE    ZERO            TO  FLG-HKNNUM
           ELSE
               INITIALIZE                  HKNNUM-REC
               MOVE    1               TO  FLG-HKNNUM
           END-IF
      *
           .
       900-HKNNUM-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    ŽÊŽÝŽ¸Ž±Ž¼ŽÔŽ¥ŽÞŽ¥Ž¹Ž¥Ž¿Ž¡Ž¼ŽÆŽÉŽ¹Ž¡ŽÊŽ¥Ž­Ž¡Ž¼Ž¡ŽË
      *****************************************************************
       900-HKNJAINF-INV-SEC         SECTION.
      *
           MOVE    "tbl_hknjainf"      TO  MCP-TABLE
           MOVE    "key"               TO  MCP-PATHNAME
           PERFORM 900-DBSELECT-SEC
           IF      MCP-RC              =   ZERO
               MOVE    "tbl_hknjainf"      TO  MCP-TABLE
               MOVE    "key"               TO  MCP-PATHNAME
               PERFORM 900-DBFETCH-SEC
               IF      MCP-RC              =   ZERO
                   MOVE    ZERO                TO  FLG-HKNJAINF
                   MOVE    MCPDATA-REC         TO  HKNJAINF-REC
               ELSE
                   MOVE    1                   TO  FLG-HKNJAINF
               END-IF
           ELSE
               MOVE    1                   TO  FLG-HKNJAINF
           END-IF
      *
           MOVE    "tbl_hknjainf"      TO  MCP-TABLE
           MOVE    "key"               TO  MCP-PATHNAME
           PERFORM 900-CLOSE-SEC
      *
           .
       900-HKNJAINF-INV-EXT.
           EXIT.
      *
      *****************************************************************
      *    Ž¥Ž¸Ž¥î§ŽÖŽ´ŽÉŽÍŽ£ŽÄŽ£ŽÂŽÀŽ©Ž¸ì¿ðÏ
      *****************************************************************
       900-CALL-ORCSJOB-SEC            SECTION.
      *
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA 
                                   JOBKANRI-REC
                                   SPA-AREA
           .
       900-CALL-ORCSJOB-EXT.
           EXIT.
      *
      *****************************************************************
      *    Ž£ŽÄŽ£ŽÂŽ£ŽÓŽ£ŽÅŽ£ŽÌŽ£ŽÅŽ£ŽÃŽ£ŽÔŽ½ðÏ
      *****************************************************************
       900-DBSELECT-SEC                SECTION.
      *
           MOVE    "DBSELECT"          TO  MCP-FUNC
           PERFORM 900-ORCDBMAIN-SEC
           IF      MCP-RC              =   ZERO
               CONTINUE
           ELSE
               DISPLAY " SELECT ERR table=" MCP-TABLE
                       " pathname="        MCP-PATHNAME
           END-IF
           .
       900-DBSELECT-EXT.
           EXIT.
      *
      *****************************************************************
      *    Ž£ŽÄŽ£ŽÂŽ£ŽÆŽ£ŽÅŽ£ŽÔŽ£ŽÃŽ£ŽÈŽ½ðÏ
      *****************************************************************
       900-DBFETCH-SEC                SECTION.
      *
           MOVE    "DBFETCH"           TO  MCP-FUNC
           PERFORM 900-ORCDBMAIN-SEC
      *
           .
       900-DBFETCH-EXT.
           EXIT.
      *
      *****************************************************************
      *    Ž¥ŽÆŽ¡Ž¼Ž¥ŽÖŽ¥Ž¥Ž¯Ž¥Ž¡Ž¼Ž¥ŽºŽ½ðÏ
      *****************************************************************
       900-CLOSE-SEC               SECTION.
      *
           MOVE    "DBCLOSECURSOR"     TO  MCP-FUNC
           PERFORM 900-ORCDBMAIN-SEC
      *
           .
       900-CLOSE-EXT.
           EXIT.
      *
      *****************************************************************
      *    Ž¥ŽÆŽ¡Ž¼Ž¥ŽÖŽ¥Ž¥Ž¢Ž¥Ž¯Ž¥Ž»Ž¥Ž¹Ž½ðÏ
      *****************************************************************
       900-ORCDBMAIN-SEC               SECTION.
      *
           CALL    "ORCDBMAIN"         USING   MCPAREA
                                               MCPDATA-REC
                                               SPA-AREA
           .
      *
       900-ORCDBMAIN-EXT.
           EXIT.
      *      
      *****************************************************************
      *    Ž£ŽÄŽ£ŽÂŽ¥ŽªŽ¡Ž¼Ž¥Ž×Ž¥Ž½ðÏ
      *****************************************************************
       100-DBOPEN-SEC                SECTION.
      *
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
           MOVE    "DBOPEN"            TO  MCP-FUNC
           PERFORM 900-ORCDBMAIN-SEC
      *
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
           MOVE    "DBSTART"           TO  MCP-FUNC
           PERFORM 900-ORCDBMAIN-SEC
           .
       100-DBOPEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    Ž£ŽÄŽ£ŽÂŽ¥Ž¯Ž¥Ž¡Ž¼Ž¥ŽºŽ½ðÏ
      *****************************************************************
       900-DBDISCONNECT-SEC            SECTION.
      *
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
           MOVE    "DBCOMMIT"          TO  MCP-FUNC
           PERFORM 900-ORCDBMAIN-SEC
      *
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
           MOVE    "DBDISCONNECT"      TO  MCP-FUNC
           PERFORM 900-ORCDBMAIN-SEC
           .
       900-DBDISCONNECT-EXT.
           EXIT.
