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
      * this licence along with this program. If not, stop using this
      * program and contact JMA, 2-28-16 Honkomagome, Bunkyo-ku, Tokyo,
      * 113-8621, Japan.
      ********************************************************************
       IDENTIFICATION          DIVISION.
       PROGRAM-ID.             SOKATU3410.
      *****************************************************************
      *  ¥·¥¹¥Æ¥àÌ¾        : £Ï£Ò£Ã£Á
      *  ¥µ¥Ö¥·¥¹¥Æ¥àÌ¾    : ·î¼¡Ä¢É¼
      *  ¥³¥ó¥Ý¡¼¥Í¥ó¥ÈÌ¾  : ¿ÇÎÅÊó½·ÀÁµá½ñ
      *  ´ÉÍý¼Ô            : 
      *  ºîÀ®ÆüÉÕ    ºî¶È¼Ô        µ­½Ò
      *  05/04/15    Í­Â¼          ºÆºîÀ®(2.5.0ÂÐ±þ)
      *****************************************************************
      *  ¥×¥í¥°¥é¥à½¤ÀµÍúÎò
      * Maj/Min/Rev	½¤Àµ¼Ô	ÆüÉÕ		ÆâÍÆ
      *  01.00.01    Í­Â¼    05/05/06    °åÎÅµ¡´Ø¾ðÊó¼èÆÀ¾ò·ï½¤Àµ
      *  01.00.02    ÃæÀî    06/08/16    °ìÉôÉéÃ´¶âÈóÉ½¼¨ÂÐ±þ
      *  01.00.03    ÆâÅÄ    06/09/29    »ÔÄ®Â¼¸øÈñÊÝ¸±ÈÖ¹æ¤â°õ»úÂÐ¾Ý¤È¤¹¤ë
      *  01.00.04    ÆâÅÄ    06/11/22    Ä¢É¼ÍÍ¼°¤ÎÊÑ¹¹¤ËÈ¼¤¦½¤Àµ
      *  01.00.05    ÆâÅÄ    07/07/10    ÆÃÊÌÎÅÍÜÈñ¹ñÊÝÂÐ±þ
      *                                  Ï·¿Í¸¶Çú¤Î¥«¥¦¥ó¥È½¤Àµ
      *                                  ¡ÊÏ·¿Í¸¶Çú¤ÏÊ»ÍÑ¤È¤·¤Æ°·¤¦¡Ë
      *  01.00.06    ÆâÅÄ    07/09/07    Æü¥ì¥»ver4.0ÂÐ±þ
      *                                  ¥·¥¹¥Æ¥à´ÉÍý¥Þ¥¹¥¿¡Ö1901¡×¤Î
      *                                  °åÎÅµ¡´Ø¾ðÊó¤ò»²¾È
      *  01.00.07    Ä¹²°    08/04/24    Ä¢É¼ÍÍ¼°¤ËÈ¼¤¦½¤Àµ
      *****************************************************************
      *
       ENVIRONMENT                 DIVISION.
       CONFIGURATION               SECTION.
       INPUT-OUTPUT                SECTION.
       FILE-CONTROL.

      *    ÀÁµá½ñ°ì»þ¥Õ¥¡¥¤¥ë  
           SELECT  SKT3410TMP-FILE ASSIGN    SKT3410TP
                                   ORGANIZATION    IS  INDEXED
                                   ACCESS  MODE    IS  DYNAMIC
                                   RECORD  KEY     IS  SKT3410TMP-KEY
                                   FILE    STATUS  IS  STS-SKT3410.
      *
006900*    ÀÁµá£Ä£Â¹¹¿·ÍÑ¥Õ¥¡¥¤¥ë
           SELECT  UPD-FILE        ASSIGN  RECEUPD
                                   ORGANIZATION    IS  LINE
                                                       SEQUENTIAL 
                                   FILE    STATUS  IS  STS-RECEUPD.
      *
006900*    ¥¨¥é¡¼¥Õ¥¡¥¤¥ë
           SELECT  RECEERR-FILE    ASSIGN  RECEERR
                                   FILE    STATUS  IS  STS-RECEERR.
      *
           SELECT  YUSEN-FILE    ASSIGN FILE-NAME
                                 ORGANIZATION   IS  LINE SEQUENTIAL
                                 ACCESS MODE    IS  SEQUENTIAL
                                 FILE   STATUS  IS  STS-YUSEN.
      *
      *
       DATA                        DIVISION.
       FILE                        SECTION.
      *
      *    ÀÁµá½ñ°ì»þ¥Õ¥¡¥¤¥ë  
       FD  SKT3410TMP-FILE.
           COPY    "CPSKT3410TMP.INC".
      *
006900*    ÀÁµá£Ä£Â¹¹¿·ÍÑ¥Õ¥¡¥¤¥ë
       FD  UPD-FILE.
           COPY    "CPRCF010.INC"  REPLACING  //RECE10//
                                   BY         //RECE10X//.
      *
006900*    ¥¨¥é¡¼¥Õ¥¡¥¤¥ë
       FD  RECEERR-FILE.
       01  RECEERR-REC             PIC X(200). 
      *
      *    Í¥ÀèÊÝ¸±¼ÔÈÖ¹æ¥Õ¥¡¥¤¥ë
       FD  YUSEN-FILE.
       01  YUSEN-HKNJANUM             PIC X(06). 
      *
      *
       WORKING-STORAGE             SECTION.
      *
      *    ÀÁµá½ñ°ì»þ¥Õ¥¡¥¤¥ë Ì¾¾ÎÎÎ°è 
           COPY    "CPCOMMONDAT2.INC"
                                   REPLACING  //RECE01PARA//
                                   BY         //SKT3410TP//.
      *
006900*    ÀÁµá£Ä£Â¹¹¿·ÍÑ¥Õ¥¡¥¤¥ë Ì¾¾ÎÎÎ°è 
           COPY    "CPCOMMONDAT2.INC"
                                   REPLACING  //RECE01PARA//
                                   BY         //RECEUPD//.
           03  FILLER              PIC X(04)   VALUE   ".dat".
      *
      *    ¥¨¥é¡¼¥Õ¥¡¥¤¥ë Ì¾¾ÎÎÎ°è 
      *---(01.00.06) LINE ADD START ------------------------------------
      *     COPY    "CPCOMMONDAT2.INC"
      *                             REPLACING  //RECE01PARA//
      *                             BY         //RECEERR//.
      *     03  FILLER              PIC X(04)   VALUE   ".dat".
           COPY    "CPERRFL.INC"    REPLACING  //ERRFLPARA//
                                    BY         //RECEERR//.
      *---(01.00.06) LINE ADD END   ------------------------------------
      *     
      *    ¥·¥§¥ëÍÑÎÎ°è
           COPY    "CPCOMMONSHELL.INC".
      *
           COPY    "SKT3410.INC".
           COPY    "SKT3420.INC".
           COPY    "SKT3430.INC".
      *
      *    ¥¹¥ÑÎÎ°è
       01  STS-AREA.
           03  STS-SKT3410         PIC X(02).
           03  STS-RECE10          PIC X(02).
           03  STS-RECEERR         PIC X(02).
           03  STS-RECEUPD         PIC X(02).
           03  STS-YUSEN           PIC X(02).
      *
      *    ¥Õ¥é¥°ÎÎ°è
       01  FLG-AREA.
           03  FLG-END             PIC 9(01).
           03  FLG-SKT3410TMP      PIC 9(01).
           03  FLG-RECE10          PIC 9(01).
           03  FLG-SYSKANRI        PIC 9(01).
           03  FLG-HKNNUM          PIC 9(01).
           03  FLG-SYUNOU          PIC 9(01).
           03  FLG-HKNJAINF        PIC 9(01).
           03  FLG-UPD             PIC 9(01).
           03  FLG-UPDFILE         PIC 9(01).
           03  FLG-SEIKYU          PIC 9(01).
           03  FLG-PTINF           PIC 9(01).
           03  FLG-PRINT           PIC 9(01).
           03  FLG-PASS            PIC 9(01).
      *
      *    Åº»úÎÎ°è
       01  IDX-AREA.
           03  IDX1                PIC 9(04).
           03  IDX2                PIC 9(04).
           03  IDX3                PIC 9(04).
           03  IDX4                PIC 9(04).
           03  IDX5                PIC 9(04).
           03  IDX-MAX             PIC 9(02).
           03  IDX-MIN             PIC 9(02).
           03  IDX-MAX-RJNKOH      PIC 9(02).
      *
      *##  ¥Ñ¥é¥á¥¿ÎÎ°è¡ÊÃÏÊý¸øÈñ»ÅÍÍ¡Ë
       01  WRK-PARA.
           COPY    "CPORCSPRTLNK.INC".
           03  WRK-PARA-JOBID      PIC 9(07).
           03  WRK-PARA-SHELLID    PIC X(08).
      *---(01.00.06) LINE ADD START ------------------------------------
      *     03  WRK-PARA-HOSPID     PIC X(24).
           03  WRK-PARA-HOSPNUM    PIC 9(02).
      *---(01.00.06) LINE ADD END   ------------------------------------
           03  WRK-PARA-HKNJANUM   PIC X(08).
           03  WRK-PARA-PAGE       PIC 9(10).
           03  WRK-PARA-SYOKBN     PIC X(01).
      *---(01.00.05) LINE ADD START ------------------------------------
           03  WRK-PARA-TOKUBETU   PIC X(01).
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *    °ì»þÎÎ°è
       01  WRK-AREA.
           03  WRK-SEIYMD          PIC X(08).
           03  WRK-SEIYMDWH        PIC X(22).
           03  WRK-SRYYMWH         PIC X(16).
           03  WRK-SRYYMD          PIC X(08).
      *
      *    ¥Õ¥¡¥¤¥ëÌ¾¾ÎÍÑ¥¨¥ê¥¢
           03  FILE-NAME        PIC X(512).
           03  WRK-HKNJANUM     PIC X(06).
           03  WRK-HKNJANAME    PIC X(40).
      *
      *  
           03  WRK-SYMD.
               05  WRK-SYY         PIC 9(04).
               05  WRK-SMM         PIC 9(02).
               05  WRK-SDD         PIC 9(02).
           03  WRK-HENYMDG         PIC X(22).
      *
           03  WRK-CNT             PIC 9(02).
           03  WRK-CNT2            PIC 9(02).
           03  WRK-KOHNUM          PIC X(03).
      *
           03  WRK-Z3              PIC ZZZ.
           03  WRK-Z4              PIC ZZZZ.
           03  WRK-Z5              PIC Z,ZZZ.
           03  WRK-Z6              PIC ZZ,ZZZ.
           03  WRK-Z7              PIC ZZZ,ZZZ.
           03  WRK-Z9              PIC Z,ZZZ,ZZZ.
           03  WRK-Z10             PIC ZZ,ZZZ,ZZZ.
           03  WRK-Z11             PIC ZZZ,ZZZ,ZZZ.
           03  WRK-Z13             PIC Z,ZZZ,ZZZ,ZZZ.
      *
           03  WRK-RECEERR         PIC X(200).
      *
      *---(01.00.06) LINE ADD START ------------------------------------
      *     03  WRK-PATH.
      *         05  FILLER          PIC S9(09)  BINARY.
      *         05  FILLER          PIC S9(09)  BINARY.
      *         05  FILLER          PIC S9(09)  BINARY.
           03  WRK-PATH              PIC X(50).
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
      *---(01.00.06) LINE ADD END   ------------------------------------
      *
      *    ¸øÈñ¥½¡¼¥ÈÍÑÎÎ°è
      *    °ìÈÌ¡¦Âà¿¦ÍÑ
       01  SORT-AREA.
           03  SORT-KOH-TBL OCCURS 20.
               05  SORT-KOHNUM                PIC  X(03).
               05  SORT-KNYUGAI-TBL  OCCURS  2.
                   07  SORT-KKENSU             PIC  9(05).
                   07  SORT-KNISSU             PIC  9(05).
                   07  SORT-KTENSU             PIC  9(11).
                   07  SORT-KITBFTN            PIC  9(07).
               05  SORT-S-KKENSU               PIC  9(05).
               05  SORT-S-KNISSU               PIC  9(05).
               05  SORT-S-KKINGK               PIC  9(11).
               05  SORT-S-KFTNGK               PIC  9(09).
      *    Ï·¿ÍÍÑ
       01  SORT-AREA2.
           03  SORT-KOH-TBL2   OCCURS  20.
               05  SORT-KOHNUM2                PIC  X(03).
               05  SORT-KNYUGAI-TBL2  OCCURS  2.
                   07  SORT-KKENSU2             PIC  9(05).
                   07  SORT-KNISSU2             PIC  9(05).
                   07  SORT-KTENSU2             PIC  9(11).
                   07  SORT-KITBFTN2            PIC  9(07).
               05  SORT-S-KKENSU2               PIC  9(05).
               05  SORT-S-KNISSU2               PIC  9(05).
               05  SORT-S-KKINGK2               PIC  9(11).
               05  SORT-S-KFTNGK2               PIC  9(09).
      *    °ì»þÂàÈòÍÑ
       01  WRK-TMP-AREA.
           03  WRK-TMP-TBL.
               05  WRK-TMP-KOHNUM                PIC  X(03).
           
      *    ¥«¥¦¥ó¥ÈÎÎ°è
       01  CNT-AREA.
           03  CNT-LINE            PIC 9(02).
           03  CNT-PAGE            PIC 9(03).
           03  CNT-RECE10          PIC 9(06).
           03  CNT-UPDFILE         PIC 9(06).
           03  CNT-IN              PIC 9(02).
           03  CNT-KOH             PIC 9(02).
           03  CNT-PRINTKOH        PIC 9(02).
           03  CNT-GENBAKU         PIC 9(01).
      *
           COPY    "CPSHELLTBL.INC".
      *     
      *---(01.00.06) LINE ADD START ------------------------------------
      *     COPY    "ORCA-DBPATH".
           COPY    "COMMON-SPA".
      *---(01.00.06) LINE ADD END   ------------------------------------
      *---(01.00.07) LINE ADD START ------------------------------------
      *    ¸ÇÄê¹àÌÜ
       01  WRK-CONS-AREA.
           03  WRK-CONS-SRYYM-200804   PIC X(06)   VALUE   "200804".
      *---(01.00.07) LINE ADD END   ------------------------------------
      *
      *****************************************************************
      *    ¥Õ¥¡¥¤¥ë¥ì¥¤¥¢¥¦¥È
      *****************************************************************
      *
      *    ´µ¼Ô
       01  PTINF-REC.
           COPY    "CPPTINF.INC".
      *
      *    ÊÝ¸±¼Ô¾ðÊó
       01  HKNJAINF-REC.
           COPY    "CPHKNJAINF.INC".
      *
      *    ÊÝ¸±ÈÖ¹æ
       01  HKNNUM-REC.
           COPY    "CPHKNNUM.INC".
      *
      *    ¼ýÇ¼
       01  SYUNOU-REC.
           COPY    "CPSYUNOU.INC".
      *
      *    ¥·¥¹¥Æ¥à´ÉÍý¥Þ¥¹¥¿
           COPY    "CPSYSKANRI.INC".
      *
      *    °åÎÅµ¡´Ø¾ðÊó¾ðÊó
           COPY    "CPSK1001.INC".
      *
      *    °åÎÅµ¡´Ø¾ðÊó¡Ý½êºßÃÏ¡¢Ï¢ÍíÀè 
           COPY    "CPSK1002.INC".
      *
      *---(01.00.06) LINE ADD START ------------------------------------
      *    °åÎÅµ¡´ØÊÔ½¸¾ðÊó
           COPY    "CPSK1900.INC".
      *
      *    °åÎÅµ¡´ØÌ¾¾ÎÊÔ½¸¾ðÊó
           COPY    "CPSK1901.INC".
      *
      *    °åÎÅµ¡´Ø½»½êÊÔ½¸¾ðÊó
           COPY    "CPSK1902.INC".
      *---(01.00.06) LINE ADD END   ------------------------------------
      *
           COPY    "CPRCF010.INC".
      *
      *    ¥¸¥ç¥Ö´ÉÍý¥Þ¥¹¥¿
       01  JOBKANRI-REC.
           COPY    "CPJOBKANRI.INC".
      *
       01  PRTKANRI-REC.
           COPY    "CPPRTKANRI.INC".
      *
       01  PRTDATA-REC.
           COPY    "CPPRTDATA.INC".
      * 
      ******************************************************************
      *    ¥µ¥Ö¥×¥íÍÑ¡¡ÎÎ°è
      *****************************************************************
      *
      *   ¥¸¥ç¥Ö´ÉÍý£Ä£ÂÀ©¸æ¥µ¥Ö
           COPY    "CPORCSJOBKANRI.INC".
      *
      *    °õºþ£Ä£Â¹¹¿·¥µ¥Ö
           COPY    "CPORCSPRT.INC".
      *
      *   ÆüÉÕÊÑ´¹¥µ¥Ö
           COPY    "CPORCSDAY.INC".
           COPY    "CPORCSLNK.INC".
      *
      *    ¶¦ÄÌ¥Ñ¥é¥á¥¿
           COPY    "MCPAREA".
      *
           COPY    "MCPDATA.INC".
      *
      *    ¥Õ¥¡¥¤¥ë¥Ç¥£¥ì¥¯¥È¥ê°ÌÃÖ»ØÄê¥µ¥Ö
           COPY    "CPMKPASS.INC".
      *
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
      *    ¼ç¡¡¡¡½èÍý
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
      *    ½é´ü¡¡½èÍý
      *****************************************************************
       100-INIT-SEC                SECTION.
      *
           INITIALIZE                  FLG-AREA
           INITIALIZE                  STS-AREA
           INITIALIZE                  WRK-AREA
           INITIALIZE                  CNT-AREA
           INITIALIZE                  SORT-AREA
           INITIALIZE                  SORT-AREA2
           INITIALIZE                  IDX-AREA
      *
           DISPLAY  "START"
      *
           PERFORM 100-DBOPEN-SEC
      *
      *###¡ÊÃÏÊý¸øÈñ»ÅÍÍ¡Ë
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
      *---(01.00.06) LINE ADD START ------------------------------------
      *                                         WRK-PARA-HOSPID
                                               WRK-PARA-HOSPNUM
      *---(01.00.06) LINE ADD END   ------------------------------------
                                               WRK-PARA-JOBID
                                               WRK-PARA-SHELLID
                                               WRK-PARA-HKNJANUM
                                               WRK-PARA-SYOKBN
      *---(01.00.05) LINE ADD START ------------------------------------
                                               WRK-PARA-TOKUBETU
      *---(01.00.05) LINE ADD END   ------------------------------------
      *---(01.00.06) LINE ADD START ------------------------------------
                                               RECEERR
      *---(01.00.06) LINE ADD END   ------------------------------------
           END-UNSTRING
      *---(01.00.06) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  SPA-HOSPNUM
      *---(01.00.06) LINE ADD END   ------------------------------------
      *
      *    ¥¹¥Æ¥Ã¥×´ÉÍý³«»Ï½èÍý
           MOVE    "STS"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
      *---(01.00.06) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.06) LINE ADD END   ------------------------------------
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           MOVE    "SOKATU3410"    TO  JOB-PGID
           MOVE    "¹ñÊÝ¿ÇÎÅÊó½·ÀÁµá½ñ"
                                   TO  JOB-SHELLMSG
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA
                                   JOBKANRI-REC
      *---(01.00.06) LINE ADD START ------------------------------------
                                   SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
      *
           MOVE    "SKT3410"           TO  SKT3410TP-FILE-ID
           MOVE    LNK-PRTKANRI-TERMID TO  SKT3410TP-TERMID
      *---(01.00.06) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  SKT3410TP-HOSPNUM
      *---(01.00.06) LINE ADD END   ------------------------------------
      *
           MOVE    "RECEUPD"           TO  RECEUPD-FILE-ID
           MOVE    LNK-PRTKANRI-TERMID TO  RECEUPD-TERMID
      *---(01.00.06) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  RECEUPD-HOSPNUM
      *---(01.00.06) LINE ADD END   ------------------------------------
      *
      *---(01.00.06) LINE ADD START ------------------------------------
      *     MOVE    "RECEERR"           TO  RECEERR-FILE-ID
      *     MOVE    LNK-PRTKANRI-TERMID TO  RECEERR-TERMID
      *---(01.00.06) LINE ADD END   ------------------------------------
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
      *    °åÎÅµ¡´Ø£É£ÄÊÔ½¸
           INITIALIZE                  SYS-1001-REC
           MOVE    "1001"              TO  SYS-1001-KANRICD
           MOVE    "*"                 TO  SYS-1001-KBNCD
      ***** 05/05/06 DEL
      *     MOVE    "99999999"          TO  SYS-1001-STYUKYMD
      *     MOVE    "00000000"          TO  SYS-1001-EDYUKYMD
      ***** 05/05/06 INS
           MOVE    LNK-PRTKANRI-SRYYM(1:6)
                                       TO  SYS-1001-STYUKYMD(1:6)
                                           SYS-1001-EDYUKYMD(1:6)
           MOVE    "01"                TO  SYS-1001-STYUKYMD(7:2)
                                           SYS-1001-EDYUKYMD(7:2)
      *****
      *---(01.00.06) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM         TO  SYS-1001-HOSPNUM
      *---(01.00.06) LINE ADD END   ------------------------------------
           MOVE    SYS-1001-REC        TO  MCPDATA-REC
           PERFORM 910-SYSKANRI-INV-SEC
           IF      FLG-SYSKANRI        =   ZERO
               MOVE    MCPDATA-REC         TO  SYS-1001-REC
               IF      SYS-1001-HOSPNAME   =   LOW-VALUE
                   MOVE    SPACE               TO  SYS-1001-HOSPNAME
               END-IF    
               IF      SYS-1001-KAISETUNAME    =   LOW-VALUE
                   MOVE    SPACE               TO  SYS-1001-KAISETUNAME
               END-IF    
           ELSE
               MOVE    "°åÎÅµ¡´Ø¾ðÊó¤¬¼èÆÀ¤Ç¤­¤Þ¤»¤ó¤Ç¤·¤¿"
                                           TO  WRK-RECEERR
               PERFORM 500-ERR-HENSYU-SEC
               MOVE    1                   TO  FLG-END
           END-IF
      *
      *    °åÎÅµ¡´Ø¾ðÊó¡Ý½êºßÃÏ¡¢Ï¢ÍíÀè
           INITIALIZE                  SYS-1002-REC
           MOVE    "1002"              TO  SYS-1002-KANRICD
           MOVE    "*"                 TO  SYS-1002-KBNCD
      ***** 05/05/06 DEL
      *     MOVE    "99999999"          TO  SYS-1002-STYUKYMD
      *     MOVE    "00000000"          TO  SYS-1002-EDYUKYMD
      ***** 05/05/06 INS
           MOVE    LNK-PRTKANRI-SRYYM(1:6)
                                       TO  SYS-1002-STYUKYMD(1:6)
                                           SYS-1002-EDYUKYMD(1:6)
           MOVE    "01"                TO  SYS-1002-STYUKYMD(7:2)
                                           SYS-1002-EDYUKYMD(7:2)
      *****
      *---(01.00.06) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM         TO  SYS-1002-HOSPNUM
      *---(01.00.06) LINE ADD END   ------------------------------------
           MOVE    SYS-1002-REC        TO  MCPDATA-REC
           PERFORM 910-SYSKANRI-INV-SEC
           IF      FLG-SYSKANRI        =   ZERO
               MOVE    MCPDATA-REC        TO  SYS-1002-REC
               IF      SYS-1002-ADRS       =   LOW-VALUE
                   MOVE    SPACE               TO  SYS-1002-ADRS
               END-IF
           ELSE
               MOVE    "°åÎÅµ¡´Ø¾ðÊó¡Ê½êºßÃÏ¡Ë¤¬¼èÆÀ¤Ç¤­¤Þ¤»¤ó¤Ç¤·¤¿"
                                           TO  WRK-RECEERR
               PERFORM 500-ERR-HENSYU-SEC
               MOVE    1                   TO  FLG-END
           END-IF
      *
      *---(01.00.06) LINE ADD START ------------------------------------
           MOVE    SYS-1001-HOSPNAME   TO  WRK-HOSPNAME
           MOVE    SYS-1002-ADRS       TO  WRK-HOSPADRS
           MOVE    SYS-1002-TEL        TO  WRK-HOSPTEL
      *    °åÎÅµ¡´ØÊÔ½¸¾ðÊó
           PERFORM 900-1900-READ-SEC
      *---(01.00.06) LINE ADD END   ------------------------------------
      *
      *    INI¥Õ¥¡¥¤¥ëÆÉ¤ß¹þ¤ß
           PERFORM  110-INI-FILE-SEC
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *     EVALUATE    WRK-PARA-SYOKBN 
      *         WHEN    "2"
      *             MOVE    PATH-TBL-SEIKYU-KEY37    TO  WRK-PATH
      *         WHEN    "1"
      *             MOVE    PATH-TBL-SEIKYU-KEY38    TO  WRK-PATH
      *     END-EVALUATE
           EVALUATE    WRK-PARA-SYOKBN  ALSO  WRK-PARA-TOKUBETU
               WHEN   "2"               ALSO  "1"
      *---(01.00.06) LINE ADD START ------------------------------------
      *               MOVE   PATH-TBL-SEIKYU-KEY37  TO  WRK-PATH
                   MOVE    "key37"        TO  WRK-PATH
      *---(01.00.06) LINE ADD END   ------------------------------------
               WHEN   "1"               ALSO  "1"
      *---(01.00.06) LINE ADD START ------------------------------------
      *               MOVE   PATH-TBL-SEIKYU-KEY38  TO  WRK-PATH
                   MOVE    "key38"        TO  WRK-PATH
      *---(01.00.06) LINE ADD END   ------------------------------------
               WHEN   "2"               ALSO  "2"
      *---(01.00.06) LINE ADD START ------------------------------------
      *               MOVE   PATH-TBL-SEIKYU-KEY39  TO  WRK-PATH
                   MOVE    "key39"        TO  WRK-PATH
      *---(01.00.06) LINE ADD END   ------------------------------------
               WHEN   "1"               ALSO  "2"
      *---(01.00.06) LINE ADD START ------------------------------------
      *               MOVE   PATH-TBL-SEIKYU-KEY40  TO  WRK-PATH
                   MOVE    "key40"        TO  WRK-PATH
      *---(01.00.06) LINE ADD END   ------------------------------------
           END-EVALUATE
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
           OPEN    OUTPUT  UPD-FILE
      *  
           PERFORM 900-SEIKYU-SELECT-SEC
      *
           .
       100-INIT-EXT.
           EXIT.
      *
      *****************************************************************
      *    Í¥ÀèÊÝ¸±¼ÔÈÖ¹æINI¥Õ¥¡¥¤¥ëÆÉ¤ß¹þ¤ß½èÍý
      *****************************************************************
       110-INI-FILE-SEC                SECTION.
      *
      *
      *    ¥Õ¥¡¥¤¥ë¥Ç¥£¥ì¥¯¥È¥ê°ÌÃÖ»ØÄê
           INITIALIZE           ORCSMKPASSAREA
           MOVE  "data/YUSEN.INI"     TO  MKPASS-IN-01
           CALL  "ORCSMKPASSSITE"  USING  ORCSMKPASSAREA
           MOVE  MKPASS-OT-01  TO  FILE-NAME
      *
           DISPLAY "¥Õ¥¡¥¤¥ëÌ¾="  FILE-NAME
      *
           INITIALIZE   YUSEN-HKNJANUM
      *
           OPEN  INPUT  YUSEN-FILE
      *
           READ YUSEN-FILE
             AT END
               INITIALIZE        YUSEN-HKNJANUM
             DISPLAY "ÆÉ¤ß¹þ¤ß¼ºÇÔ"  
           END-READ
      *
           DISPLAY "Í¥ÀèÊÝ¸±¼ÔÈÖ¹æ="  YUSEN-HKNJANUM
      *
           CLOSE YUSEN-FILE
      *
           .
       110-INI-FILE-EXT.
           EXIT.
      *
      *****************************************************************
      *    ¼ç¡¡¡¡½èÍý
      *****************************************************************
       200-MAIN-SEC                SECTION.
      *
           OPEN     OUTPUT  SKT3410TMP-FILE
           CLOSE            SKT3410TMP-FILE
           OPEN     I-O     SKT3410TMP-FILE
      *
           MOVE     ZERO    TO      FLG-END
           MOVE     ZERO    TO      FLG-UPD
      *
           PERFORM  2001-KOKUHO-SYUKEI-SEC
                    UNTIL   FLG-END   =   1
      *
           CLOSE   UPD-FILE
           CLOSE   SKT3410TMP-FILE
      *
           IF       FLG-UPD   =       1
                    PERFORM   2002-PRINT-SEC
           END-IF
      *
           .
       200-MAIN-EXT.
           EXIT.
      *
      *****************************************************************
      *    ½ªÎ»    ½èÍý
      *****************************************************************
       300-END-SEC                     SECTION.
      *
           IF      CNT-RECE10          =   ZERO 
                   CONTINUE
           ELSE
                   IF      FLG-UPD     =   1
                           PERFORM     310-SEIKYU-UPD-SEC
                   END-IF
           END-IF
           MOVE  CNT-PAGE  TO  WRK-PARA-PAGE
      *
           DISPLAY "*** SOKATU3410 IN  "  CNT-RECE10 
           DISPLAY "*** SOKATU3410 END ***"
      *
      *    ¥¹¥Æ¥Ã¥×½ªÎ»½èÍý
           MOVE    "STE"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
      *
      *
           MOVE    WRK-PARA-PAGE   TO  JOB-UPDCNT
      *---(01.00.06) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.06) LINE ADD END   ------------------------------------
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA  
                                   JOBKANRI-REC
      *---(01.00.06) LINE ADD START ------------------------------------
                                   SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------

           PERFORM 900-DBDISCONNECT-SEC
           .
       300-END-EXT.
           EXIT.
      *
      *****************************************************************
      *    ÊÝ¸±¼ÔÈÖ¹æÊÌ½¸·×½èÍý
      *****************************************************************
       2001-KOKUHO-SYUKEI-SEC              SECTION.
      * 
      *TMP-FILE ¥­¡¼¥»¥Ã¥È
      *
           INITIALIZE       SKT3410TMP-REC
           INITIALIZE       SKT3410TMP-HKNJANUM
      *
           IF  RECE10-HKNJANUM(7:2)  =  SPACE
             MOVE  RECE10-HKNJANUM(1:6)  TO  SKT3410TMP-HKNJANUM(1:6)
           ELSE
             MOVE  RECE10-HKNJANUM(3:6)  TO  SKT3410TMP-HKNJANUM(1:6)
           END-IF
      *
           MOVE    RECE10-PREFKBN    TO    SKT3410TMP-KENKBN
      * 
      *    »ØÄê¤·¤¿ÊÝ¸±¼Ô¢ª¹­Åç»ÔÆâÊÝ¸±¼Ô¢ª¸©Æâ»ÔÄ®Â¼¢ª¸©Æâ¹ñÊÝÁÈ¹ç¢ª
      *    ¢ª¸©Æâ°·¤¤¹ñÊÝÁÈ¹ç¢ª¸©³°ÊÝ¸±¼Ô¤Î½ç¤Ë°õºþ
           IF    YUSEN-HKNJANUM   =  SKT3410TMP-HKNJANUM
             MOVE          1   TO    SKT3410TMP-SYUTURYOKU
           ELSE
             IF  SKT3410TMP-HKNJANUM (1:3) = "344"
               MOVE          2   TO    SKT3410TMP-SYUTURYOKU
             ELSE
               IF  RECE10-PREFKBN          = "1"
                 IF  SKT3410TMP-HKNJANUM(3:1)  =  "3"
                   IF  RECE10-PREFNUM      = "34"
                     MOVE    4   TO    SKT3410TMP-SYUTURYOKU
                   ELSE
                     MOVE    5   TO    SKT3410TMP-SYUTURYOKU
                   END-IF
                 ELSE
                   MOVE      3   TO    SKT3410TMP-SYUTURYOKU
                 END-IF
               ELSE
                 MOVE        6   TO    SKT3410TMP-SYUTURYOKU
               END-IF
             END-IF
           END-IF
      *
      *
           PERFORM  900-SKTTMP-READ-SEC
      *
           PERFORM  210-HKN-SYUKEI-SEC
      *
      *    ½¸·×¤ÎÂÐ¾Ý¤Ë¤Ê¤é¤Ê¤«¤Ã¤¿¤È¤­
           IF      FLG-UPD             =   1
               PERFORM 230-UPD-FILE-HENSYU-SEC
      *
               PERFORM 900-SEIKYU-READ-SEC
           ELSE
               MOVE    SPACE               TO  WRK-RECEERR
               STRING "½¸·×ÂÐ¾Ý³°¡¡´µ¼ÔÈÖ¹æ¡á"     DELIMITED  BY  SIZE
                       RECE10-PTNUM                DELIMITED  BY  SPACE
                       " ¿ÇÎÅÇ¯·î¡á"               DELIMITED  BY  SIZE
                       RECE10-SRYYM                DELIMITED  BY  SIZE
                       " ¥ì¥»¼ïÊÌ¡á"               DELIMITED  BY  SIZE
                       RECE10-RECESYUBETU          DELIMITED  BY  SIZE
                                           INTO    WRK-RECEERR
               END-STRING                                
               PERFORM 500-ERR-HENSYU-SEC
               MOVE    1                   TO  FLG-END
           END-IF 
           .
       2001-KOKUHO-SYUKEI-EXT.
           EXIT.
      *
      *****************************************************************
      *    °åÎÅÊÝ¸±¡¦Ï·¿ÍÊÝ·òÊ¬½¸·×½èÍý
      *****************************************************************
       210-HKN-SYUKEI-SEC          SECTION.
      *
      *    Æþ³°¶èÊ¬
           IF  RECE10-NYUGAIKBN  =  "1"
             MOVE  1      TO   IDX2
           ELSE
             MOVE  2      TO   IDX2
           END-IF
      *
      *---(01.00.04) LINE ADD START -----------------------------------
      *    Ï·¿ÍÊÝ·ò¤«
      *     IF  RECE10-RJNHKNNUM  NOT  =  SPACE
      *       IF  RECE10-KYURATE  =  9
      *         MOVE  10   TO   IDX1
      *       ELSE
      *         MOVE  11   TO   IDX1
      *       END-IF
      *
      *    Ï·¿Í¸øÈñÊ»ÍÑ
      *    ¸øÈñÉéÃ´Ê¬
      *       IF  RECE10-KOHNUM (1)   NOT =   SPACE  OR
      *           RECE10-KOHNUM (2)   NOT =   SPACE  OR
      *           RECE10-KOHNUM (3)   NOT =   SPACE  OR
      *           RECE10-KOHNUM (4)   NOT =   SPACE
      *         PERFORM 220-RKOH-SYUKEI-SEC
      *       END-IF
      *
      *    Ï·¿Í ¡Ü ½ÅÅÙ¿´¿È¾ã³²Ê»ÍÑ
      *---(01.00.03) LINE ADD START -----------------------------------
      **       IF  RECE10-KOHNUM (1)    =   "191"  OR
      **           RECE10-KOHNUM (2)    =   "191"  OR
      **           RECE10-KOHNUM (3)    =   "191"  OR
      **           RECE10-KOHNUM (4)    =   "191"
      *       IF  RECE10-KOHNUM (1)  =  "191" OR "291" OR "391" OR
      *           RECE10-KOHNUM (2)  =  "191" OR "291" OR "391" OR
      *           RECE10-KOHNUM (3)  =  "191" OR "291" OR "391" OR
      *           RECE10-KOHNUM (4)  =  "191" OR "291" OR "391"
      *---(01.00.03) LINE ADD END   -----------------------------------
      *    ÎÅÍÜ¤ÎµëÉÕ¡§·ï¿ô
      *         ADD   1  TO  SKT3410TMP-JRKENSU(IDX2)
      *       END-IF
      *
      *    Ï·¿Í ¡Ü ¸¶Çú¸øÈñÊ»ÍÑ
      *       IF  RECE10-ETC-KOHNUM (1) =   "019"  OR
      *           RECE10-ETC-KOHNUM (2) =   "019"  OR
      *          RECE10-ETC-KOHNUM (3) =   "019"  OR
      *           RECE10-ETC-KOHNUM (4) =   "019"
      *    ÎÅÍÜ¤ÎµëÉÕ¡§·ï¿ô
      *         ADD   1  TO  SKT3410TMP-GRKENSU(IDX2)
      *       END-IF
      *
      *     ELSE
      *    Âà¿¦¼Ô¤«¤É¤¦¤«
      *       IF  RECE10-HKNNUM  =  "060"
      *         IF  RECE10-AGE  >= 70
      *          IF  RECE10-KYURATE  =  9
      *             MOVE    1     TO    IDX1
      *           ELSE
      *             MOVE    2     TO    IDX1
      *           END-IF
      *         ELSE
      *           IF  RECE10-AGE  >= 3
      *             MOVE    3     TO    IDX1
      *           ELSE
      *             MOVE    4     TO    IDX1
      *           END-IF
      *         END-IF
      *
      *       ELSE
      *         IF  RECE10-AGE  >=  70
      *           IF  RECE10-KYURATE  =  9
      *             MOVE  6    TO  IDX1
      *           ELSE
      *             MOVE  7    TO  IDX1
      *           END-IF
      *         ELSE
      *           IF  RECE10-HONKZKKBN  =  1
      *             MOVE  5    TO   IDX1
      *           ELSE
      *             IF  RECE10-AGE  <  3
      *               MOVE  9  TO  IDX1
      *             ELSE
      *               MOVE  8  TO  IDX1
      *             END-IF
      *           END-IF
      *         END-IF
      *       END-IF
      *    °ìÈÌ¡¦Âà¿¦¸øÈñÊ»ÍÑ
      *    ¸øÈñÉéÃ´Ê¬
      *       IF  RECE10-KOHNUM (1)   NOT =   SPACE  OR
      *           RECE10-KOHNUM (2)   NOT =   SPACE  OR
      *           RECE10-KOHNUM (3)   NOT =   SPACE  OR
      *           RECE10-KOHNUM (4)   NOT =   SPACE
      *           PERFORM 220-KOH-SYUKEI-SEC
      *       END-IF
      *    °ìÈÌ¡¦Âà¿¦Ê¡»ãÊ»ÍÑ
      *---(01.00.03) LINE ADD START -----------------------------------
      **       IF  RECE10-KOHNUM (1) = "141" OR "241" OR "191" OR "192"
      **                            OR "190" OR "290" OR "390" OR
      **           RECE10-KOHNUM (2) = "141" OR "241" OR "191" OR "192"
      **                            OR "190" OR "290" OR "390" OR
      **           RECE10-KOHNUM (2) = "141" OR "241" OR "191" OR "192"
      **                            OR "190" OR "290" OR "390" OR
      **           RECE10-KOHNUM (2) = "141" OR "241" OR "191" OR "192"
      **                            OR "190" OR "290" OR "390"
      *       IF  RECE10-KOHNUM (1) = "141" OR "241"
      *                            OR "190" OR "290" OR "390"
      *                            OR "191" OR "291" OR "391"
      *                           OR "192" OR "292" OR "392" OR
      *           RECE10-KOHNUM (2) = "141" OR "241"
      *                            OR "190" OR "290" OR "390"
      *                            OR "191" OR "291" OR "391"
      *                            OR "192" OR "292" OR "392" OR
      *           RECE10-KOHNUM (3) = "141" OR "241" 
      *                            OR "190" OR "290" OR "390"
      *                            OR "191" OR "291" OR "391"
      *                            OR "192" OR "292" OR "392" OR
      *           RECE10-KOHNUM (4) = "141" OR "241"
      *                            OR "190" OR "290" OR "390"
      *                            OR "191" OR "291" OR "391"
      *                            OR "192" OR "292" OR "392"
      *---(01.00.03) LINE ADD END   -----------------------------------
      *         PERFORM 220-FKOH-SYUKEI-SEC
      *       END-IF
      *     END-IF
      *     PERFORM  2101-SYUKEI-SEC
      *    Ï·¿ÍÊÝ·ò¤«
           IF  RECE10-RJNHKNNUM  NOT  =  SPACE
             IF  RECE10-KYURATE  =  9
               MOVE  10   TO   IDX1
             ELSE
               MOVE  11   TO   IDX1
             END-IF
           ELSE
      *    Âà¿¦¼Ô¤«¤É¤¦¤«
      *---(01.00.05) LINE ADD START ------------------------------------
      *       IF  RECE10-HKNNUM  =  "060"
             IF  RECE10-HKNNUM  =  "060"  OR  "068"
      *---(01.00.05) LINE ADD END   ------------------------------------
               IF  RECE10-AGE  >= 70
                IF  RECE10-KYURATE  =  9
                   MOVE    1     TO    IDX1
                ELSE
                   MOVE    2     TO    IDX1
                END-IF
               ELSE
      *---(01.00.07) LINE ADD START ------------------------------------
                   IF  (RECE10-SRYYM  >=  WRK-CONS-SRYYM-200804)
                   AND  (RECE10-FLG (1)   =  1)
                       MOVE  4     TO  IDX1
                   ELSE
      *---(01.00.07) LINE ADD END   ------------------------------------
                     IF  RECE10-AGE  >= 3
                        MOVE    3     TO    IDX1
                     ELSE
                        MOVE    4     TO    IDX1
                     END-IF
      *---(01.00.07) LINE ADD START ------------------------------------
                   END-IF
      *---(01.00.07) LINE ADD END   ------------------------------------
               END-IF
             ELSE
               IF  RECE10-AGE  >=  70
                 IF  RECE10-KYURATE  =  9
                   MOVE  6    TO  IDX1
                 ELSE
                   MOVE  7    TO  IDX1
                 END-IF
               ELSE
                 IF  RECE10-HONKZKKBN  =  1
                   MOVE  5    TO   IDX1
                 ELSE
      *---(01.00.07) LINE ADD START ------------------------------------
                   IF  (RECE10-SRYYM  >=  WRK-CONS-SRYYM-200804)
                   AND  (RECE10-FLG (1)   =  1)
                       MOVE  9     TO  IDX1
                   ELSE
      *---(01.00.07) LINE ADD END   ------------------------------------
                       IF  RECE10-AGE  <  3
                         MOVE  9  TO  IDX1
                       ELSE
                         MOVE  8  TO  IDX1
                       END-IF
      *---(01.00.07) LINE ADD START ------------------------------------
                   END-IF
      *---(01.00.07) LINE ADD END   ------------------------------------
                 END-IF
               END-IF
             END-IF
           END-IF
      *
           PERFORM  2101-SYUKEI-SEC
      *
      *    ¸¶Çú¸øÈñ¡ÊÏ·¿Í°Ê³°¡Ë
           IF  RECE10-RJNHKNNUM  =  SPACE
               PERFORM  2102-GENBAKU-SEC
           END-IF
      *
      *    Ê¡»ã°åÎÅ
           IF  RECE10-KOHNUM (1) = "141" OR "241"
                                OR "190" OR "290" OR "390"
                                OR "191" OR "291" OR "391"
                                OR "192" OR "292" OR "392" OR
               RECE10-KOHNUM (2) = "141" OR "241"
                                OR "190" OR "290" OR "390"
                                OR "191" OR "291" OR "391"
                                OR "192" OR "292" OR "392" OR
               RECE10-KOHNUM (3) = "141" OR "241" 
                                OR "190" OR "290" OR "390"
                                OR "191" OR "291" OR "391"
                                OR "192" OR "292" OR "392" OR
               RECE10-KOHNUM (4) = "141" OR "241"
                                OR "190" OR "290" OR "390"
                                OR "191" OR "291" OR "391"
                                OR "192" OR "292" OR "392"
               PERFORM 220-FKOH-SYUKEI-SEC
           END-IF
      *
      *    ¸øÈñ°åÎÅ
           IF  RECE10-KOHNUM (1)   NOT =   SPACE  OR
               RECE10-KOHNUM (2)   NOT =   SPACE  OR
               RECE10-KOHNUM (3)   NOT =   SPACE  OR
               RECE10-KOHNUM (4)   NOT =   SPACE
               PERFORM 220-KOH-SYUKEI-SEC
           END-IF
      *---(01.00.04) LINE ADD END   -----------------------------------
      *
           IF  FLG-SKT3410TMP  =  1
               WRITE    SKT3410TMP-REC
           ELSE
               REWRITE  SKT3410TMP-REC
           END-IF
      *
           MOVE    1    TO  FLG-UPD 
      *
           .
       210-HKN-SYUKEI-EXT.
           EXIT.
      *
      *****************************************************************
      *    °åÎÅÊÝ¸±¡¦°ìÈÌ¹ñÊÝÊ¬½¸·×½èÍý
      *****************************************************************
       2101-SYUKEI-SEC         SECTION.
      *
      *    ÎÅÍÜ¤ÎµëÉÕ¡§·ï¿ô
           ADD   1                  TO  SKT3410TMP-KENSU (IDX1 IDX2)
      *    ÎÅÍÜ¤ÎµëÉÕ:¿ÇÎÅ¼ÂÆü¿ô
           ADD  RECE10-JNISSU(1)    TO  SKT3410TMP-NISSU(IDX1 IDX2)
      *    ÎÅÍÜ¤ÎµëÉÕ¡§ÅÀ¿ô
           ADD  RECE10-TOTALTEN(1)  TO  SKT3410TMP-TENSU(IDX1 IDX2)
      *
      *=== °ìÉôÉéÃ´¶âÈóÉ½¼¨ÂÐ±þ DEL By NAKAGAWA (2006/08/16) start
      *    ÎÅÍÜ¤ÎµëÉÕ¡§°ìÉôÉéÃ´¶â
      *    Á´¹ñ¡¢ÃÏÊýÌä¤ï¤º¸øÈñ¤Î°ìÉôÉéÃ´¶â¤òºÆ·Ç¤¹¤ë
      *    PERFORM     VARYING     IDX3    FROM    1   BY  1
      *                UNTIL       IDX3    >       4   OR
      *                RECE10-KOHNUM(IDX3) =       SPACE
      *        ADD     RECE10-FTNMONEY(IDX3 + 1)
      *                            TO  SKT3410TMP-ITBFTN(IDX1 IDX2)
      *    END-PERFORM
      *=== °ìÉôÉéÃ´¶âÈóÉ½¼¨ÂÐ±þ DEL By NAKAGAWA (2006/08/16) end
           ADD  RECE10-FTNMONEY(1)  TO  SKT3410TMP-ITBFTN(IDX1 IDX2)
      *
           IF  RECE10-SHOKUJINISSU(1)  >  0
      *    ¿©»öÎÅÍÜ:·ï¿ô
             ADD   1  TO  SKT3410TMP-S-KENSU(IDX1)
           END-IF
      *    ¿©»öÎÅÍÜ:Æü¿ô
           ADD  RECE10-SHOKUJINISSU(1)  TO  SKT3410TMP-S-NISSU(IDX1)
      *    ¿©»öÎÅÍÜ¡§¶â³Û
           ADD  RECE10-SHOKUJIRYOYOHI(1) TO SKT3410TMP-S-KINGK(IDX1)
      *    ¿©»öÎÅÍÜ¡§É¸½àÉéÃ´³Û
           ADD  RECE10-SHOKUJIFTN(1)    TO  SKT3410TMP-S-FTNGK(IDX1)
      *
      *---(01.00.04) LINE ADD START -----------------------------------
      *    Ï·¿Í¸¶Çú·ï¿ô
           IF  IDX1  =  10  OR  11
             IF  RECE10-ETC-KOHNUM (1)  =  "019"
             OR  RECE10-ETC-KOHNUM (2)  =  "019"
             OR  RECE10-ETC-KOHNUM (3)  =  "019"
             OR  RECE10-ETC-KOHNUM (4)  =  "019"
               ADD  1           TO  SKT3410TMP-GENBAKU(IDX1 IDX2)
             END-IF
      *---(01.00.05) LINE ADD START ------------------------------------
             IF  RECE10-KOHNUM (1)  =  "019"
             OR  RECE10-KOHNUM (2)  =  "019"
             OR  RECE10-KOHNUM (3)  =  "019"
             OR  RECE10-KOHNUM (4)  =  "019"
               ADD  1           TO  SKT3410TMP-GENBAKU(IDX1 IDX2)
             END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
           END-IF
      *---(01.00.04) LINE ADD END   -----------------------------------
           MOVE    1               TO  FLG-UPD 
           .
       2101-SYUKEI-EXT.
           EXIT.
      *
      *****************************************************************
      *    ¸¶Çú½¸·×½èÍý
      *****************************************************************
       2102-GENBAKU-SEC         SECTION.
      *
           PERFORM VARYING IDX3     FROM    1   BY  1
                   UNTIL   IDX3     >       4
                   OR  RECE10-KOHNUM (IDX3) =   SPACE
             IF  RECE10-KOHNUM (IDX3)  =  "019"
      *    ÎÅÍÜ¤ÎµëÉÕ¡§·ï¿ô
               ADD   1                  TO  SKT3410TMP-GKENSU(IDX2)
      *    ÎÅÍÜ¤ÎµëÉÕ:¿ÇÎÅ¼ÂÆü¿ô
               ADD  RECE10-JNISSU(IDX3 + 1)
                                        TO  SKT3410TMP-GNISSU(IDX2)
      *    ÎÅÍÜ¤ÎµëÉÕ¡§ÅÀ¿ô
               ADD  RECE10-TOTALTEN(IDX3 + 1)
                                        TO  SKT3410TMP-GTENSU(IDX2)
      *
               ADD  RECE10-FTNMONEY(IDX3 + 1)
                                        TO  SKT3410TMP-GITBFTN(IDX2)
      *
               IF  RECE10-SHOKUJINISSU(IDX3 + 1)  >  0
      *    ¿©»öÎÅÍÜ:·ï¿ô
                 ADD   1  TO  SKT3410TMP-S-GKENSU
               END-IF
      *    ¿©»öÎÅÍÜ:Æü¿ô
               ADD  RECE10-SHOKUJINISSU(IDX3 + 1)
                                        TO  SKT3410TMP-S-GNISSU
      *    ¿©»öÎÅÍÜ¡§¶â³Û
               ADD  RECE10-SHOKUJIRYOYOHI(IDX3 + 1)
                                        TO SKT3410TMP-S-GKINGK
      *    ¿©»öÎÅÍÜ¡§É¸½àÉéÃ´³Û
               ADD  RECE10-SHOKUJIFTN(IDX3 + 1)
                                        TO  SKT3410TMP-S-GFTNGK
             END-IF
           END-PERFORM
      *
           .
       2102-GENBAKU-EXT.
           EXIT.
      *
      *****************************************************************
      *    °ìÈÌ¡¦Âà¿¦ ¡Ü ¸øÈñÉéÃ´Ê¬½¸·×½èÍý
      *****************************************************************
       220-KOH-SYUKEI-SEC        SECTION.
      *
           PERFORM VARYING IDX3     FROM    1   BY  1
                   UNTIL   IDX3     >       4
                   OR  RECE10-KOHNUM (IDX3) =   SPACE
      * £µ£±¡¢£¹£±¤Ï£±¤Ä¤Ë¤Þ¤È¤á¤ë
            IF    RECE10-KOHNUM(IDX3)  =  "091"
              MOVE    "051"       TO    RECE10-KOHNUM(IDX3)
            END-IF
      *    Á´¹ñ¶¦ÄÌ¸øÈñ¤Î¤ßÂÐ¾Ý
             IF  RECE10-KOHNUM(IDX3)(1:1) = "0"
      *    ¸øÈñÈ½ÊÌ
               PERFORM  VARYING  IDX4  FROM  1  BY  1
                        UNTIL    IDX4  >     20
                        OR       SKT3410TMP-KOHNUM (IDX4) = SPACE
                 IF  RECE10-KOHNUM (IDX3)  =  SKT3410TMP-KOHNUM (IDX4)
                     MOVE  IDX4  TO  CNT-KOH
                     MOVE  20    TO  IDX4
                 END-IF
               END-PERFORM
      *
      *    ³ºÅö¸øÈñ¤¬¤Ê¤«¤Ã¤¿¾ì¹ç
               IF  IDX4  < 20
                 MOVE  IDX4  TO  CNT-KOH
               END-IF
      *
      *    ¸¶Çú¤ÏÊÌ½¸·×
      *---(01.00.04) LINE ADD START -----------------------------------
      *         IF  RECE10-KOHNUM(IDX3)  =  "019" OR "010" OR "011"
      *           PERFORM  2201-GEN-KESE-SEC
               IF  RECE10-KOHNUM(IDX3)  =  "019"
                 CONTINUE
      *---(01.00.04) LINE ADD END   -----------------------------------
               ELSE
      *    ¸øÈñÌ¾
                 MOVE  RECE10-KOHNUM(IDX3)
                                   TO  SKT3410TMP-KOHNUM(CNT-KOH)
      *    ÎÅÍÜ¤ÎµëÉÕ¡§·ï¿ô
                 ADD   1  TO  SKT3410TMP-KKENSU (CNT-KOH IDX2)
      *    ÎÅÍÜ¤ÎµëÉÕ:¿ÇÎÅ¼ÂÆü¿ô
                 ADD  RECE10-JNISSU(IDX3 + 1)  TO
                                   SKT3410TMP-KNISSU(CNT-KOH IDX2)
      *    ÎÅÍÜ¤ÎµëÉÕ¡§ÅÀ¿ô
                 ADD  RECE10-TOTALTEN(IDX3 + 1)  TO
                                   SKT3410TMP-KTENSU(CNT-KOH IDX2)
      *    ÎÅÍÜ¤ÎµëÉÕ¡§°ìÉôÉéÃ´¶â
                 ADD  RECE10-FTNMONEY(IDX3 + 1)  TO
                                   SKT3410TMP-KITBFTN(CNT-KOH IDX2)
      *
                 IF  RECE10-SHOKUJINISSU(1)  >  0
      *    ¿©»öÎÅÍÜ:·ï¿ô
                   ADD   1  TO  SKT3410TMP-S-KKENSU(CNT-KOH)
                 END-IF
      *    ¿©»öÎÅÍÜ:Æü¿ô
                 ADD  RECE10-SHOKUJINISSU(IDX3 + 1)  TO
                                 SKT3410TMP-S-KNISSU(CNT-KOH)
      *    ¿©»öÎÅÍÜ¡§¶â³Û
                 ADD  RECE10-SHOKUJIRYOYOHI(IDX3 + 1)  TO
                                 SKT3410TMP-S-KKINGK(CNT-KOH)
      *    ¿©»öÎÅÍÜ¡§É¸½àÉéÃ´³Û
                 ADD  RECE10-SHOKUJIFTN(IDX3 + 1)  TO
                                 SKT3410TMP-S-KFTNGK(CNT-KOH)
               END-IF
             END-IF
           END-PERFORM
      *
           .
       220-KOH-SYUKEI-EXT.
           EXIT.
057400*
      *****************************************************************
      *    Ê¡»ã½¸·×½èÍý
      *****************************************************************
       220-FKOH-SYUKEI-SEC        SECTION.
      *
           PERFORM VARYING IDX3     FROM    1   BY  1
                   UNTIL   IDX3     >       4
                   OR  RECE10-KOHNUM (IDX3) =   SPACE
             EVALUATE  RECE10-KOHNUM (IDX3)
             WHEN "141"
             WHEN "241"
               ADD    1    TO    SKT3410TMP-FKENSU (1 IDX2)
               ADD    RECE10-FTNMONEY(IDX3 + 1)
                           TO    SKT3410TMP-FITBFTN(1 IDX2)
             WHEN "190"
             WHEN "290"
             WHEN "390"
               ADD    1    TO    SKT3410TMP-FKENSU(2 IDX2)
               ADD    RECE10-FTNMONEY(IDX3 + 1)
                           TO    SKT3410TMP-FITBFTN(2 IDX2)
             WHEN "191"
      *---(01.00.03) LINE ADD START -----------------------------------
             WHEN "291"
             WHEN "391"
      *---(01.00.03) LINE ADD END   -----------------------------------
               ADD    1    TO    SKT3410TMP-FKENSU(3 IDX2)
               ADD    RECE10-FTNMONEY(IDX3 + 1)
                           TO    SKT3410TMP-FITBFTN(3 IDX2)
             WHEN "192"
      *---(01.00.03) LINE ADD START -----------------------------------
             WHEN "292"
             WHEN "392"
      *---(01.00.03) LINE ADD END   -----------------------------------
               ADD    1    TO    SKT3410TMP-FKENSU(4 IDX2)
               ADD    RECE10-FTNMONEY(IDX3 + 1)
                           TO    SKT3410TMP-FITBFTN(4 IDX2)
             END-EVALUATE
           END-PERFORM
      *
      *
           .
       220-FKOH-SYUKEI-EXT.
           EXIT.
057400*
      *****************************************************************
      *    °ìÈÌ¡¦Âà¿¦ ¡Ü ¸¶Çú¡¦·ë³Ë¸øÈñ
      *****************************************************************
       2201-GEN-KESE-SEC        SECTION.
      *
           EVALUATE  RECE10-KOHNUM(IDX3)
      *    ¸¶Çú
           WHEN "019"
      *    ÎÅÍÜ¤ÎµëÉÕ¡§·ï¿ô
               ADD   1  TO  SKT3410TMP-GKKENSU(IDX2)
      *    ÎÅÍÜ¤ÎµëÉÕ:¿ÇÎÅ¼ÂÆü¿ô
               ADD  RECE10-JNISSU(IDX3 + 1)  TO
                                 SKT3410TMP-GKNISSU(IDX2)
      *    ÎÅÍÜ¤ÎµëÉÕ¡§ÅÀ¿ô
               ADD  RECE10-TOTALTEN(IDX3 + 1)  TO
                                 SKT3410TMP-GKTENSU(IDX2)
      *    ÎÅÍÜ¤ÎµëÉÕ¡§°ìÉôÉéÃ´¶â
               ADD  RECE10-FTNMONEY(IDX3 + 1)  TO
                                 SKT3410TMP-GKITBFTN(IDX2)
      *
               IF  RECE10-SHOKUJINISSU(1)  >  0
      *    ¿©»öÎÅÍÜ:·ï¿ô
                 ADD   1  TO  SKT3410TMP-S-GKKENSU
               END-IF
      *    ¿©»öÎÅÍÜ:Æü¿ô
               ADD  RECE10-SHOKUJINISSU(IDX3 + 1)  TO
                               SKT3410TMP-S-GKNISSU
      *    ¿©»öÎÅÍÜ¡§¶â³Û
               ADD  RECE10-SHOKUJIRYOYOHI(IDX3 + 1)  TO
                               SKT3410TMP-S-GKKINGK
      *    ¿©»öÎÅÍÜ¡§É¸½àÉéÃ´³Û
               ADD  RECE10-SHOKUJIFTN(IDX3 + 1)  TO
                               SKT3410TMP-S-GKFTNGK
      *    ·ë³Ë£³£´¾ò
           WHEN "010"
      *    ÎÅÍÜ¤ÎµëÉÕ¡§·ï¿ô
               ADD   1  TO  SKT3410TMP-34KENSU(IDX2)
      *    ÎÅÍÜ¤ÎµëÉÕ:¿ÇÎÅ¼ÂÆü¿ô
               ADD  RECE10-JNISSU(IDX3 + 1)  TO
                                 SKT3410TMP-34NISSU(IDX2)
      *    ÎÅÍÜ¤ÎµëÉÕ¡§ÅÀ¿ô
               ADD  RECE10-TOTALTEN(IDX3 + 1)  TO
                                 SKT3410TMP-34TENSU(IDX2)
      *
               IF  RECE10-SHOKUJINISSU(1)  >  0
      *    ¿©»öÎÅÍÜ:·ï¿ô
                 ADD   1  TO  SKT3410TMP-S-34KENSU
               END-IF
      *    ¿©»öÎÅÍÜ:Æü¿ô
               ADD  RECE10-SHOKUJINISSU(IDX3 + 1)  TO
                               SKT3410TMP-S-34NISSU
      *    ·ë³Ë£³£µ¾ò
           WHEN "011"
      *
      *    ÎÅÍÜ¤ÎµëÉÕ¡§·ï¿ô
               ADD   1  TO  SKT3410TMP-35KENSU
      *    ÎÅÍÜ¤ÎµëÉÕ:¿ÇÎÅ¼ÂÆü¿ô
               ADD  RECE10-JNISSU(IDX3 + 1)  TO
                                 SKT3410TMP-35NISSU
      *    ÎÅÍÜ¤ÎµëÉÕ¡§ÅÀ¿ô
               ADD  RECE10-TOTALTEN(IDX3 + 1)  TO
                                 SKT3410TMP-35TENSU
      *    ÎÅÍÜ¤ÎµëÉÕ¡§°ìÉôÉéÃ´¶â
               ADD  RECE10-FTNMONEY(IDX3 + 1)  TO
                                 SKT3410TMP-35ITBFTN
      *
               IF  RECE10-SHOKUJINISSU(1)  >  0
      *    ¿©»öÎÅÍÜ:·ï¿ô
                 ADD   1  TO  SKT3410TMP-S-35KENSU
               END-IF
      *    ¿©»öÎÅÍÜ:Æü¿ô
               ADD  RECE10-SHOKUJINISSU(IDX3 + 1)  TO
                               SKT3410TMP-S-35NISSU
      *    ¿©»öÎÅÍÜ¡§¶â³Û
               ADD  RECE10-SHOKUJIRYOYOHI(IDX3 + 1)  TO
                               SKT3410TMP-S-35KINGK
           END-EVALUATE
      *
           .
       2201-GEN-KESE-EXT.
           EXIT.
057400*
      *****************************************************************
      *    Ï·¿Í ¡Ü ¸øÈñÉéÃ´Ê¬½¸·×½èÍý
      *****************************************************************
       220-RKOH-SYUKEI-SEC        SECTION.
      *
           PERFORM VARYING IDX3     FROM    1   BY  1
                   UNTIL   IDX3     >       4
                   OR  RECE10-KOHNUM (IDX3) =   SPACE
      *    £µ£±¡¢£¹£±¤Ï£±¤Ä¤Ë¤Þ¤È¤á¤ë
            IF    RECE10-KOHNUM(IDX3)  =  "091"
              MOVE    "051"       TO    RECE10-KOHNUM(IDX3)
            END-IF
      *
      *    Á´¹ñ¶¦ÄÌ¸øÈñ¤Î¤ßÂÐ¾Ý
             IF  RECE10-KOHNUM(IDX3)(1:1) = "0"
      *    ¸øÈñÈ½ÊÌ
               DISPLAY "Ï·¿Í¸øÈñÈÖ¹æ=" RECE10-KOHNUM (IDX3)
               PERFORM  VARYING  IDX4  FROM  1  BY  1
                        UNTIL    IDX4  >     20
                        OR       SKT3410TMP-RKOHNUM (IDX4) = SPACE
                 IF  RECE10-KOHNUM (IDX3)  =  SKT3410TMP-RKOHNUM (IDX4)
                     MOVE  IDX4  TO  CNT-KOH
                     MOVE  20    TO  IDX4
                 END-IF
               END-PERFORM
      *
      *    ³ºÅö¸øÈñ¤¬¤Ê¤«¤Ã¤¿¾ì¹ç
               IF  IDX4  < 20
                 MOVE  IDX4  TO  CNT-KOH
               END-IF
      *
      *    ¸øÈñÌ¾
                 MOVE  RECE10-KOHNUM(IDX3)  
                                  TO  SKT3410TMP-RKOHNUM(CNT-KOH)
      *    ÎÅÍÜ¤ÎµëÉÕ¡§·ï¿ô
                 ADD   1  TO  SKT3410TMP-RKKENSU (CNT-KOH IDX2)
      *    ÎÅÍÜ¤ÎµëÉÕ:¿ÇÎÅ¼ÂÆü¿ô
                 ADD  RECE10-JNISSU(IDX3 + 1)  TO
                                 SKT3410TMP-RKNISSU(CNT-KOH IDX2)
      *    ÎÅÍÜ¤ÎµëÉÕ¡§ÅÀ¿ô
                 ADD  RECE10-TOTALTEN(IDX3 + 1)  TO
                                 SKT3410TMP-RKTENSU(CNT-KOH IDX2)
      *    ÎÅÍÜ¤ÎµëÉÕ¡§°ìÉôÉéÃ´¶â
                 ADD  RECE10-FTNMONEY(IDX3 + 1)  TO
                                 SKT3410TMP-RKITBFTN(CNT-KOH IDX2)
      *
                 IF  RECE10-SHOKUJINISSU(1)  >  0
      *    ¿©»öÎÅÍÜ:·ï¿ô
                   ADD   1  TO  SKT3410TMP-S-RKKENSU(CNT-KOH)
                 END-IF
      *    ¿©»öÎÅÍÜ:Æü¿ô
                 ADD  RECE10-SHOKUJINISSU(IDX3 + 1)  TO
                               SKT3410TMP-S-RKNISSU(CNT-KOH)
      *    ¿©»öÎÅÍÜ¡§¶â³Û
                 ADD  RECE10-SHOKUJIRYOYOHI(IDX3 + 1)  TO
                               SKT3410TMP-S-RKKINGK(CNT-KOH)
      *    ¿©»öÎÅÍÜ¡§É¸½àÉéÃ´³Û
                 ADD  RECE10-SHOKUJIFTN(IDX3 + 1)  TO
                               SKT3410TMP-S-RKFTNGK(CNT-KOH)
             END-IF
           END-PERFORM
      *
      *
           .
       220-RKOH-SYUKEI-EXT.
           EXIT.
057400*
      *****************************************************************
006900*    ÀÁµá£Ä£Â¹¹¿·ÍÑ¥Õ¥¡¥¤¥ë½ÐÎÏ½èÍý
      *****************************************************************
       230-UPD-FILE-HENSYU-SEC         SECTION.
      *
           MOVE    RECE10-REC          TO  RECE10X-REC
           WRITE   RECE10X-REC
           ADD     1                   TO  CNT-UPDFILE
           .
       230-UPD-FILE-HENSYU-EXT.
           EXIT.
057400*
      *****************************************************************
      *    Ä¢É¼¥Õ¥¡¥¤¥ë½ÐÎÏ½èÍý
      *****************************************************************
       2002-PRINT-SEC                SECTION.
      *
           OPEN     INPUT       SKT3410TMP-FILE
      *
           MOVE     ZERO        TO       FLG-PRINT
           MOVE     1           TO       WRK-CNT
                                         WRK-CNT2
      *
      *    °ì»þ¥Õ¥¡¥¤¥ëÆÉ¹þ
           PERFORM  900-TMP-READ-SEC
      *
           PERFORM  UNTIL     FLG-PRINT   =   1
      *
      *    £±ËçÌÜÄ¢É¼ÊÔ½¸<¸«½Ð¤·>½èÍý
               PERFORM 310-HEAD-HEN-SEC
      *    £±ËçÌÜÄ¢É¼ÊÔ½¸<ÌÀºÙ>½èÍý
               PERFORM 320-BODY-HEN-SEC
      *    £±ËçÌÜÄ¢É¼°õºþ½èÍý
               PERFORM 330-PRINT-OUT-SEC
      *    ¸øÈñ¥½¡¼¥È½èÍý
               PERFORM KOH-SORT-SEC
      *---(01.00.04) LINE ADD START -----------------------------------
      *         PERFORM RKOH-SORT-SEC
      *---(01.00.04) LINE ADD END   -----------------------------------
      *---(01.00.04) LINE ADD START -----------------------------------
      *    £²ËçÌÜÄ¢É¼ÊÔ½¸<¸«½Ð¤·>½èÍý
      *         PERFORM 311-HEAD-HEN-SEC
      *    £²ËçÌÜÄ¢É¼ÊÔ½¸<ÌÀºÙ>½èÍý
      *         PERFORM 321-BODY-HEN-SEC
      *    £²ËçÌÜÄ¢É¼°õºþ½èÍý
      *         PERFORM 331-PRINT-OUT-SEC
      *    ¸øÈñ¤¬»Ä¤Ã¤Æ¤¤¤ë¤«
      *       PERFORM  UNTIL  SKT3410TMP-KOHNUM (WRK-CNT) = SPACE
      *                AND    SKT3410TMP-RKOHNUM(WRK-CNT2) = SPACE
      *                AND    FLG-PASS  =  1
      *    Ä¢É¼ÊÔ½¸<¸«½Ð¤·>½èÍý
      *         PERFORM 312-HEAD-HEN-SEC
      *    Ä¢É¼ÊÔ½¸<ÌÀºÙ>½èÍý
      *         PERFORM 322-BODY-HEN-SEC
      *    Ä¢É¼°õºþ½èÍý
      *         PERFORM 332-PRINT-OUT-SEC
      *
      *    ¸øÈñ¤¬»Ä¤Ã¤Æ¤¤¤ë¤«
               PERFORM  UNTIL  SKT3410TMP-KOHNUM (WRK-CNT)  =  SPACE
                        AND    FLG-PASS  =  1
      *    £²ËçÌÜÄ¢É¼ÊÔ½¸<¸«½Ð¤·>½èÍý
                 PERFORM 311-HEAD-HEN-SEC
      *    £²ËçÌÜÄ¢É¼ÊÔ½¸<ÌÀºÙ>½èÍý
                 PERFORM 321-BODY-HEN-SEC
      *    £²ËçÌÜÄ¢É¼°õºþ½èÍý
                 PERFORM 331-PRINT-OUT-SEC
                 MOVE  1  TO  FLG-PASS
               END-PERFORM
      *         MOVE  1  TO  FLG-PASS
      *       END-PERFORM
      *---(01.00.04) LINE ADD END   -----------------------------------
               MOVE  ZERO  TO  FLG-PASS
      *    °ì»þ¥Õ¥¡¥¤¥ëÆÉ¹þ
               PERFORM  900-TMP-READ-SEC
               MOVE  1  TO  WRK-CNT
                            WRK-CNT2
           END-PERFORM
      *
           CLOSE    SKT3410TMP-FILE
      *
           .
       2002-PRINT-EXT.
           EXIT.
      *
      *****************************************************************
      *    £±ËçÌÜÄ¢É¼ÊÔ½¸<¥Ø¥Ã¥À¡¼Éô>½èÍý
      *****************************************************************
       310-HEAD-HEN-SEC          SECTION.
      *
           ADD     1                     TO  CNT-PAGE
      *
           INITIALIZE                    SKT3410
      *
      *    ¥Ú¡¼¥¸ÈÖ¹æ
           MOVE    CNT-PAGE              TO  WRK-Z4
           MOVE    WRK-Z4                TO  SKT3410-NO
      *
      *    ¿ÇÎÅÇ¯·î
           MOVE    WRK-SRYYMWH           TO  SKT3410-SRYYM
      *
      *    ÀÁµáÇ¯·îÆü
           MOVE    WRK-SEIYMDWH          TO  SKT3410-SEIYMD
      *
      *---(01.00.06) LINE ADD START ------------------------------------
      *    °åÎÅµ¡´Ø½»½ê
      *     MOVE    SYS-1002-ADRS         TO  SKT3410-ADRS
      *
      *    °åÎÅµ¡´ØÌ¾
      *     MOVE    SYS-1001-HOSPNAME     TO  SKT3410-HOSPNAME
      *    °åÎÅµ¡´Ø½»½ê
           MOVE    WRK-HOSPADRS          TO  SKT3410-ADRS
      *
      *    °åÎÅµ¡´ØÌ¾
           MOVE    WRK-HOSPNAME          TO  SKT3410-HOSPNAME
      *---(01.00.06) LINE ADD END   ------------------------------------
      *
      *    ³«Àß¼ÔÌ¾
           MOVE    SYS-1001-KAISETUNAME  TO  SKT3410-KAISETUNAME
      *
      *    ÊÝ¸±¼ÔÌ¾
           PERFORM 920-HKNJAINF-SET-SEC
           MOVE    HKNJA-HKNJANAME       TO  SKT3410-HKNJANAME
           MOVE    SKT3410TMP-HKNJANUM   TO  SKT3410-HKNJANUM
      *
      *    °åÎÅµ¡´Ø¥³¡¼¥É
           MOVE    SYS-1001-HOSPCDN      TO  SKT3410-HOSPCD
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *    ÆÃÊÌÎÅÍÜÈñ
           IF  WRK-PARA-TOKUBETU  =  "2"
             MOVE  "ÆÃÊÌÎÅÍÜÈñ"          TO  SKT3410-TOKUBETU
           END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
           .
       310-HEAD-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    £±ËçÌÜÄ¢É¼ÊÔ½¸<ÌÀºÙ¹Ô>½èÍý
      *****************************************************************
       320-BODY-HEN-SEC      SECTION.
      *
      *    ÊÔ½¸½èÍý
           PERFORM  VARYING  IDX1  FROM    1   BY  1
                    UNTIL    IDX1  >  9
             PERFORM  VARYING  IDX2  FROM  1  BY  1
                      UNTIL    IDX2  >     2
      *    ÎÅÍÜ¤ÎµëÉÕ¡§·ï¿ô
               MOVE  SKT3410TMP-KENSU(IDX1 IDX2)  TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT3410-KENSU(IDX1 IDX2)
      *    ÎÅÍÜ¤ÎµëÉÕ¡§Æü¿ô
               MOVE  SKT3410TMP-NISSU(IDX1 IDX2)  TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT3410-NISSU(IDX1 IDX2)
      *    ÎÅÍÜ¤ÎµëÉÕ¡§ÅÀ¿ô
               MOVE  SKT3410TMP-TENSU(IDX1 IDX2)  TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT3410-TENSU(IDX1 IDX2)
      *    ÎÅÍÜ¤ÎµëÉÕ¡§°ìÉôÉéÃ´¶â
               MOVE  SKT3410TMP-ITBFTN (IDX1 IDX2)  TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT3410-ITBFTN(IDX1 IDX2)
             END-PERFORM
      *    ¿©»öÎÅÍÜ¡§·ï¿ô
             MOVE  SKT3410TMP-S-KENSU(IDX1)  TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT3410-S-KENSU(IDX1)
      *    ¿©»öÎÅÍÜ¡§Æü¿ô
             MOVE  SKT3410TMP-S-NISSU(IDX1)  TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT3410-S-NISSU(IDX1)
      *    ¿©»öÎÅÍÜ¡§¶â³Û
             MOVE  SKT3410TMP-S-KINGK(IDX1)  TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT3410-S-KINGK(IDX1)
      *    ¿©»öÎÅÍÜ¡§É¸½àÉéÃ´³Û
             MOVE  SKT3410TMP-S-FTNGK(IDX1)  TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT3410-S-FTNGK(IDX1)
           END-PERFORM
      *
           .
       320-BODY-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    £±ËçÌÜÄ¢É¼°õºþ½èÍý
      *****************************************************************
       330-PRINT-OUT-SEC                SECTION.
      *
           DISPLAY  "£±ËçÌÜ"
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
           MOVE   "SKT3410.red"        TO  SPRT-PRTID
           MOVE    "¹ñÊÝÀÁµá½ñ"  TO  SPRT-TITLE
           MOVE    SKT3410             TO  SPRT-PRTDATA
           MOVE    LNK-PRTKANRI-TERMID TO  SPRT-TERMID
           MOVE    LNK-PRTKANRI-OPID   TO  SPRT-OPID
           MOVE    LNK-PRTKANRI-PRTNM  TO  SPRT-PRTNM
           CALL    "ORCSPRT"           USING
                                       ORCSPRTAREA
      *---(01.00.06) LINE ADD START ------------------------------------
                                       SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
           IF      SPRT-RETURN         =   ZERO
               CONTINUE
           ELSE
               MOVE    "°õºþ£Ä£Â¤Ë¹¹¿·¤Ç¤­¤Þ¤»¤ó¤Ç¤·¤¿"
                                          TO  WRK-RECEERR
               PERFORM 500-ERR-HENSYU-SEC
           END-IF
           .
       330-PRINT-OUT-EXT.
           EXIT.
      *
      *****************************************************************
      *    ¸øÈñ¥½¡¼¥È½èÍý
      *****************************************************************
       KOH-SORT-SEC          SECTION.
      *
      *
           INITIALIZE  SORT-AREA
           INITIALIZE  SORT-AREA2
      *    ¸øÈñ¿ô¤ò¼èÆÀ
           MOVE    ZERO    TO    IDX-MAX
           PERFORM  VARYING  IDX1  FROM  1  BY  1
                    UNTIL    IDX1  >  20
             IF  SKT3410TMP-KOHNUM(IDX1)  =  SPACE
               MOVE  20    TO    IDX1
             ELSE
               ADD   1     TO    IDX-MAX
             END-IF
           END-PERFORM
      *
           DISPLAY "°ìÈÌ¥½¡¼¥ÈÁ°£±" SKT3410TMP-KOHNUM(1)
           DISPLAY "°ìÈÌ¥½¡¼¥ÈÁ°£²" SKT3410TMP-KOHNUM(2)
           DISPLAY "°ìÈÌ¥½¡¼¥ÈÁ°£³" SKT3410TMP-KOHNUM(3)
      *
           IF      IDX-MAX    >     ZERO
             MOVE    1    TO    IDX1
             MOVE    1    TO    IDX2
             MOVE    1    TO    IDX3
             MOVE   "999" TO    WRK-TMP-KOHNUM
             MOVE   ZERO  TO    SORT-KOHNUM(1)
             PERFORM    UNTIL    IDX1  >    IDX-MAX
               PERFORM  UNTIL    IDX2  >    IDX-MAX
                 IF  SKT3410TMP-KOHNUM(IDX2)  >   SORT-KOHNUM(IDX1 - 1)
                   IF  SKT3410TMP-KOHNUM(IDX2)  <  WRK-TMP-KOHNUM
                     MOVE  SKT3410TMP-KOHNUM(IDX2)  TO WRK-TMP-KOHNUM
                     MOVE  IDX2          TO    IDX3
                   END-IF
                 END-IF
                 ADD    1    TO    IDX2
               END-PERFORM
               MOVE  SKT3410TMP-KOH-AREA(IDX3)  TO  SORT-KOH-TBL(IDX1)
               MOVE  "999"  TO    WRK-TMP-KOHNUM
               ADD   1    TO    IDX1
               MOVE  1    TO    IDX2
             END-PERFORM
      *
           END-IF
      *
           INITIALIZE             SKT3410TMP-KOH-TBL
           MOVE  SORT-AREA  TO    SKT3410TMP-KOH-TBL
      *
           DISPLAY "°ìÈÌ¥½¡¼¥È¸å£±" SKT3410TMP-KOHNUM(1)
           DISPLAY "°ìÈÌ¥½¡¼¥È¸å£²" SKT3410TMP-KOHNUM(2)
           DISPLAY "°ìÈÌ¥½¡¼¥È¸å£³" SKT3410TMP-KOHNUM(3)
      *
           .
       KOH-SORT-EXT.
           EXIT.
      *
      *****************************************************************
      *    Ï·¿ÍÊ»ÍÑ¸øÈñ¥½¡¼¥È½èÍý
      *****************************************************************
       RKOH-SORT-SEC          SECTION.
      *
      *
           INITIALIZE  SORT-AREA
           INITIALIZE  SORT-AREA2
           MOVE    ZERO    TO  WRK-TMP-KOHNUM
      *    ¸øÈñ¿ô¤ò¼èÆÀ
           MOVE    ZERO    TO    IDX-MAX
           PERFORM  VARYING  IDX1  FROM  1  BY  1
                    UNTIL    IDX1  >  20
             IF  SKT3410TMP-RKOHNUM(IDX1)  =  SPACE
               MOVE  20    TO    IDX1
             ELSE
               ADD   1     TO    IDX-MAX
               IF    WRK-TMP-KOHNUM  <  SKT3410TMP-RKOHNUM(IDX1)
                 MOVE  SKT3410TMP-RKOHNUM(IDX1)  TO  WRK-TMP-KOHNUM
                 MOVE  IDX1    TO    IDX5
               END-IF
             END-IF
           END-PERFORM
      *
           DISPLAY "Ï·¿Í¥½¡¼¥ÈÁ°£±" SKT3410TMP-RKOHNUM(1)
           DISPLAY "Ï·¿Í¥½¡¼¥ÈÁ°£²" SKT3410TMP-RKOHNUM(2)
           DISPLAY "Ï·¿Í¥½¡¼¥ÈÁ°£³" SKT3410TMP-RKOHNUM(3)
      *
           MOVE  IDX-MAX     TO     IDX-MAX-RJNKOH
      *
           IF      IDX-MAX    >     ZERO
             MOVE    SKT3410TMP-RKOH-AREA(IDX5)  TO
                                   SORT-KOH-TBL2(1)
             MOVE    2    TO    IDX1
             DISPLAY "OK1"
             MOVE    1    TO    IDX2
             MOVE    1    TO    IDX3
             MOVE   WRK-TMP-KOHNUM  TO  SORT-KOHNUM2(1)
             MOVE   ZERO    TO    WRK-TMP-KOHNUM
             PERFORM    UNTIL    IDX1  >    IDX-MAX
               PERFORM  UNTIL    IDX2  >    IDX-MAX
                 IF  SKT3410TMP-RKOHNUM(IDX2) < SORT-KOHNUM2(IDX1 - 1)
                   IF  SKT3410TMP-RKOHNUM(IDX2)  >  WRK-TMP-KOHNUM
                     MOVE  SKT3410TMP-RKOHNUM(IDX2)  TO WRK-TMP-KOHNUM
                     MOVE  IDX2          TO    IDX3
                   END-IF
                 END-IF
                 ADD    1    TO    IDX2
               END-PERFORM
               MOVE  SKT3410TMP-RKOH-AREA(IDX3) TO SORT-KOH-TBL2(IDX1)
               MOVE  ZERO   TO    WRK-TMP-KOHNUM
               ADD   1    TO    IDX1
               MOVE  1    TO    IDX2
             END-PERFORM
           END-IF
      *
           INITIALIZE             SKT3410TMP-RKOH-TBL
           MOVE  SORT-AREA2  TO    SKT3410TMP-RKOH-TBL
      *
           DISPLAY "Ï·¿Í¥½¡¼¥È¸å£±" SKT3410TMP-RKOHNUM(1)
           DISPLAY "Ï·¿Í¥½¡¼¥È¸å£²" SKT3410TMP-RKOHNUM(2)
           DISPLAY "Ï·¿Í¥½¡¼¥È¸å£³" SKT3410TMP-RKOHNUM(3)
      *
           .
       RKOH-SORT-EXT.
           EXIT.
      *
      *****************************************************************
      *    £²ËçÌÜÄ¢É¼ÊÔ½¸<¥Ø¥Ã¥À¡¼Éô>½èÍý
      *****************************************************************
       311-HEAD-HEN-SEC          SECTION.
      *
           ADD     1                     TO  CNT-PAGE
      *
           INITIALIZE                    SKT3420
      *    ¥Ú¡¼¥¸ÈÖ¹æ
           MOVE    CNT-PAGE              TO  WRK-Z4
           MOVE    WRK-Z4                TO  SKT3420-NO
      *
      *    °åÎÅµ¡´Ø¥³¡¼¥É
           MOVE    SYS-1001-HOSPCDN      TO  SKT3420-HOSPCD
      *
      *    ÊÝ¸±¼ÔÈÖ¹æ
           MOVE    SKT3410TMP-HKNJANUM   TO  SKT3420-HKNJANUM
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *    ÆÃÊÌÎÅÍÜÈñ
           IF  WRK-PARA-TOKUBETU  =  "2"
             MOVE  "ÆÃÊÌÎÅÍÜÈñ"          TO  SKT3420-TOKUBETU
           END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
           .
       311-HEAD-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    £²ËçÌÜÄ¢É¼ÊÔ½¸<ÌÀºÙ¹Ô>½èÍý
      *****************************************************************
       321-BODY-HEN-SEC      SECTION.
      *
      *---(01.00.04) LINE ADD START -----------------------------------
      *    ¸øÈñ¤Î¤¿¤á¤Î£²ËçÌÜ°Ê¾å¤«
           IF  WRK-CNT  =  1
      *---(01.00.04) LINE ADD END   -----------------------------------
      *      Ï·¿ÍÊÝ·òÊ¬
      *      ÊÔ½¸½èÍý
             PERFORM  VARYING  IDX1  FROM    10   BY  1
                      UNTIL    IDX1  >  11
               COMPUTE  IDX3 = IDX1 - 9
               PERFORM  VARYING  IDX2  FROM  1  BY  1
                        UNTIL    IDX2  >     2
      *    ÎÅÍÜ¤ÎµëÉÕ¡§·ï¿ô
                 MOVE  SKT3410TMP-KENSU(IDX1 IDX2)  TO  WRK-Z5
                 MOVE  WRK-Z5   TO  SKT3420-KENSU(IDX3 IDX2)
                 DISPLAY "Ï·¿Í·ï¿ô=" SKT3420-KENSU(IDX3 IDX2)
      *    ÎÅÍÜ¤ÎµëÉÕ¡§Æü¿ô
                 MOVE  SKT3410TMP-NISSU(IDX1 IDX2)  TO  WRK-Z5
                 MOVE  WRK-Z5   TO  SKT3420-NISSU(IDX3 IDX2)
      *    ÎÅÍÜ¤ÎµëÉÕ¡§ÅÀ¿ô
                 MOVE  SKT3410TMP-TENSU(IDX1 IDX2)  TO  WRK-Z9
                 MOVE  WRK-Z9   TO  SKT3420-TENSU(IDX3 IDX2)
      *    ÎÅÍÜ¤ÎµëÉÕ¡§°ìÉôÉéÃ´¶â
                 MOVE  SKT3410TMP-ITBFTN (IDX1 IDX2)  TO  WRK-Z9
                 MOVE  WRK-Z9   TO  SKT3420-ITBFTN(IDX3 IDX2)
      *---(01.00.04) LINE ADD START -----------------------------------
      *    ÎÅÍÜ¤ÎµëÉÕ¡§¸¶Çú·ï¿ô
                 MOVE  SKT3410TMP-GENBAKU (IDX1 IDX2)  TO  WRK-Z3
                 MOVE  WRK-Z3   TO  SKT3420-GENBAKU(IDX3 IDX2)
      *---(01.00.04) LINE ADD END   -----------------------------------
               END-PERFORM
      *    ¿©»öÎÅÍÜ¡§·ï¿ô
               MOVE  SKT3410TMP-S-KENSU(IDX1)  TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT3420-S-KENSU(IDX3)
      *    ¿©»öÎÅÍÜ¡§Æü¿ô
               MOVE  SKT3410TMP-S-NISSU(IDX1)  TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT3420-S-NISSU(IDX3)
      *    ¿©»öÎÅÍÜ¡§¶â³Û
               MOVE  SKT3410TMP-S-KINGK(IDX1)  TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT3420-S-KINGK(IDX3)
      *    ¿©»öÎÅÍÜ¡§É¸½àÉéÃ´³Û
               MOVE  SKT3410TMP-S-FTNGK(IDX1)  TO  WRK-Z7
               MOVE  WRK-Z7   TO  SKT3420-S-FTNGK(IDX3)
               MOVE  SKT3410TMP-S-FTNGK(IDX1)  TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT3420-S-FTNGK(IDX3)
             END-PERFORM
      *
      *---(01.00.04) LINE ADD START -----------------------------------
      *    Ï·¿Í ¡Ü ¸¶ÇúÊ¬
      *    Ï·¿Í ¡Ü ½ÅÅÙ¿´¿È¾ã³²Ê¬
      *     PERFORM  VARYING  IDX2  FROM    1   BY  1
      *              UNTIL    IDX2  >  2
      *    ÎÅÍÜ¤ÎµëÉÕ¡§·ï¿ô
      *         MOVE  SKT3410TMP-GRKENSU(IDX2)  TO  WRK-Z5
      *         MOVE  WRK-Z5   TO  SKT3420-RGKENSU(IDX2)
      *    ÎÅÍÜ¤ÎµëÉÕ¡§·ï¿ô
      *         MOVE  SKT3410TMP-JRKENSU(IDX2)  TO  WRK-Z5
      *         MOVE  WRK-Z5   TO  SKT3420-RJKENSU(IDX2)
      *     END-PERFORM
      *---(01.00.04) LINE ADD END   -----------------------------------
      *
      *    ¸¶ÇúÊ¬
             PERFORM  VARYING  IDX2  FROM  1  BY  1
                      UNTIL    IDX2  >     2
      *    ÎÅÍÜ¤ÎµëÉÕ¡§·ï¿ô
               MOVE  SKT3410TMP-GKENSU(IDX2)  TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT3420-GKENSU(IDX2)
      *    ÎÅÍÜ¤ÎµëÉÕ¡§Æü¿ô
               MOVE  SKT3410TMP-GNISSU(IDX2)  TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT3420-GNISSU(IDX2)
      *    ÎÅÍÜ¤ÎµëÉÕ¡§ÅÀ¿ô
               MOVE  SKT3410TMP-GTENSU(IDX2)  TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT3420-GTENSU(IDX2)
      *    ÎÅÍÜ¤ÎµëÉÕ¡§°ìÉôÉéÃ´¶â
               MOVE  SKT3410TMP-GITBFTN(IDX2)  TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT3420-GITBFTN(IDX2)
             END-PERFORM
      *    ¿©»öÎÅÍÜ¡§·ï¿ô
             MOVE  SKT3410TMP-S-GKENSU  TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT3420-S-GKENSU
      *    ¿©»öÎÅÍÜ¡§Æü¿ô
             MOVE  SKT3410TMP-S-GNISSU  TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT3420-S-GNISSU
      *    ¿©»öÎÅÍÜ¡§¶â³Û
             MOVE  SKT3410TMP-S-GKINGK  TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT3420-S-GKINGK
      *    ¿©»öÎÅÍÜ¡§É¸½àÉéÃ´³Û
             MOVE  SKT3410TMP-S-GFTNGK  TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT3420-S-GFTNGK
      *
      *    ÃÏÊý¸øÈñ·ï¿ôºÆ·Ç
             PERFORM  VARYING  IDX1  FROM    1   BY  1
                      UNTIL    IDX1  >  5
               PERFORM  VARYING  IDX2  FROM  1  BY  1
                        UNTIL    IDX2  >     2
      *    ÎÅÍÜ¤ÎµëÉÕ¡§·ï¿ô
                 MOVE  SKT3410TMP-FKENSU(IDX1 IDX2)  TO  WRK-Z5
                 MOVE  WRK-Z5   TO  SKT3420-FKENSU(IDX1 IDX2)
      *    ÎÅÍÜ¤ÎµëÉÕ¡§°ìÉôÉéÃ´¶â
                 MOVE  SKT3410TMP-FITBFTN(IDX1 IDX2)  TO  WRK-Z9
                 MOVE  WRK-Z9   TO  SKT3420-FITBFTN(IDX1 IDX2)
               END-PERFORM
             END-PERFORM
      *---(01.00.04) LINE ADD START -----------------------------------
           END-IF
      *---(01.00.04) LINE ADD END   -----------------------------------
      *
      *    °ìÈÌ¡¦Âà¿¦¸øÈñ¤Î°õ»ú
           PERFORM  VARYING  IDX3  FROM  1  BY  1
      *---(01.00.04) LINE ADD START -----------------------------------
      *              UNTIL    IDX3  >     4
                    UNTIL    IDX3  >     3
      *---(01.00.04) LINE ADD END   -----------------------------------
                    OR  WRK-CNT    >     20
                    OR  SKT3410TMP-KOHNUM(WRK-CNT) = SPACE
             PERFORM  VARYING  IDX2  FROM  1  BY  1
                      UNTIL    IDX2  >  2
      *
      *    ÎÅÍÜ¤ÎµëÉÕ¡§·ï¿ô
               MOVE  SKT3410TMP-KKENSU (WRK-CNT IDX2) TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT3420-KKENSU(IDX3 IDX2)
      *    ÎÅÍÜ¤ÎµëÉÕ¡§Æü¿ô
               MOVE  SKT3410TMP-KNISSU (WRK-CNT IDX2) TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT3420-KNISSU(IDX3 IDX2)
      *    ÎÅÍÜ¤ÎµëÉÕ¡§ÅÀ¿ô
               MOVE  SKT3410TMP-KTENSU (WRK-CNT IDX2) TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT3420-KTENSU(IDX3 IDX2)
      *    ÎÅÍÜ¤ÎµëÉÕ¡§°ìÉôÉéÃ´¶â
               MOVE  SKT3410TMP-KITBFTN(WRK-CNT IDX2) TO WRK-Z9
               MOVE  WRK-Z9   TO  SKT3420-KITBFTN(IDX3 IDX2)
             END-PERFORM
      *    ¿©»öÎÅÍÜ¡§·ï¿ô
             MOVE  SKT3410TMP-S-KKENSU (WRK-CNT)        TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT3420-S-KKENSU(IDX3)
      *    ¿©»öÎÅÍÜ¡§Æü¿ô
             MOVE  SKT3410TMP-S-KNISSU (WRK-CNT)        TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT3420-S-KNISSU(IDX3)
      *    ¿©»öÎÅÍÜ¡§¶â³Û
             MOVE  SKT3410TMP-S-KKINGK(WRK-CNT)      TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT3420-S-KKINGK(IDX3)
      *    ¿©»öÎÅÍÜ¡§É¸½àÉéÃ´³Û
             MOVE  SKT3410TMP-S-KFTNGK (WRK-CNT)      TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT3420-S-KFTNGK(IDX3)
      *    ¸øÈñÌ¾
             MOVE  SKT3410TMP-KOHNUM (WRK-CNT)  TO  WRK-KOHNUM
             PERFORM  950-HKNNUM-SET-SEC
             MOVE  HKN-TANSEIDONAME   TO  SKT3420-KNAME(IDX3)
             MOVE  HKN-HBTNUM         TO  SKT3420-HBTNUM(IDX3)
      *
             ADD  1  TO  WRK-CNT
           END-PERFORM
      *
      *---(01.00.04) LINE ADD START -----------------------------------
      *     MOVE    IDX3    TO    IDX4
      *     IF  (IDX3  +  IDX-MAX-RJNKOH)  >=  5
      *       MOVE  IDX3    TO    IDX4
      *     ELSE
      *       COMPUTE  IDX4  =  5  -  IDX-MAX-RJNKOH
      *     END-IF
      *
      *    °ìÈÌ¡¦Âà¿¦¸øÈñ¤òÁ´Éô°õ»ú¤·¤Æ¤«¤éÏ·¿Í¸øÈñÊ¬¤ò°õ»ú¤¹¤ë
      *     IF  SKT3410TMP-KOHNUM(WRK-CNT) = SPACE
      *       PERFORM  UNTIL    IDX4  >     4
      *                OR  WRK-CNT2    >     20
      *                OR  SKT3410TMP-RKOHNUM(WRK-CNT2) = SPACE
      *         PERFORM  VARYING  IDX2  FROM  1  BY  1
      *                  UNTIL    IDX2  >  2
      *    ÎÅÍÜ¤ÎµëÉÕ¡§·ï¿ô
      *           MOVE  SKT3410TMP-RKKENSU(WRK-CNT2 IDX2) TO WRK-Z5
      *           MOVE  WRK-Z5   TO  SKT3420-KKENSU(IDX4 IDX2)
      *    ÎÅÍÜ¤ÎµëÉÕ¡§Æü¿ô
      *           MOVE  SKT3410TMP-RKNISSU(WRK-CNT2 IDX2) TO WRK-Z5
      *           MOVE  WRK-Z5   TO  SKT3420-KNISSU(IDX4 IDX2)
      *    ÎÅÍÜ¤ÎµëÉÕ¡§ÅÀ¿ô
      *           MOVE  SKT3410TMP-RKTENSU(WRK-CNT2 IDX2) TO WRK-Z9
      *           MOVE  WRK-Z9   TO  SKT3420-KTENSU(IDX4 IDX2)
      *    ÎÅÍÜ¤ÎµëÉÕ¡§°ìÉôÉéÃ´¶â
      *           MOVE  SKT3410TMP-RKITBFTN(WRK-CNT2 IDX2) TO WRK-Z9
      *           MOVE  WRK-Z9   TO  SKT3420-KITBFTN(IDX4 IDX2)
      *         END-PERFORM
      *    ¿©»öÎÅÍÜ¡§·ï¿ô
      *         MOVE  SKT3410TMP-S-RKKENSU (WRK-CNT2)        TO  WRK-Z5
      *         MOVE  WRK-Z5   TO  SKT3420-S-KKENSU(IDX4)
      *    ¿©»öÎÅÍÜ¡§Æü¿ô
      *         MOVE  SKT3410TMP-S-RKNISSU (WRK-CNT2)        TO  WRK-Z5
      *         MOVE  WRK-Z5   TO  SKT3420-S-KNISSU(IDX4)
      *    ¿©»öÎÅÍÜ¡§¶â³Û
      *         MOVE  SKT3410TMP-S-RKKINGK (WRK-CNT2)      TO  WRK-Z9
      *         MOVE  WRK-Z9   TO  SKT3420-S-KKINGK(IDX4)
      *    ¿©»öÎÅÍÜ¡§É¸½àÉéÃ´³Û
      *         MOVE  SKT3410TMP-S-RKFTNGK (WRK-CNT2)      TO  WRK-Z9
      *         MOVE  WRK-Z9   TO  SKT3420-S-KFTNGK(IDX4)
      *    ¸øÈñÌ¾
      *         MOVE  SKT3410TMP-RKOHNUM (WRK-CNT2)  TO  WRK-KOHNUM
      *         PERFORM  950-HKNNUM-SET-SEC
      *         MOVE  HKN-TANSEIDONAME   TO  SKT3420-KNAME(IDX4)
      *         MOVE  HKN-HBTNUM          TO  SKT3420-RHBTNUM1(IDX4)
      *         MOVE  "27"                TO  SKT3420-RHBTNUM2(IDX4)
      *         MOVE  "¡Ý"                TO  SKT3420-RSEN(IDX4)
      *
      *         ADD  1  TO  WRK-CNT2
      *                     IDX4
      *       END-PERFORM
      *     END-IF
      *
      *    ·ë³Ë¤Î¥Ç¡¼¥¿¤¬¤¢¤ë»þ¤ÏÉ¬¤º£³ËçÌÜ¤ò°õ»ú¤¹¤ë
      *     IF  SKT3410TMP-34KENSU(1)  >  0  OR
      *         SKT3410TMP-34KENSU(2)  >  0  OR
      *         SKT3410TMP-35KENSU     >  0
      *       MOVE  ZERO  TO  FLG-PASS
      *     ELSE
      *       MOVE  1     TO  FLG-PASS
      *     END-IF
      *---(01.00.04) LINE ADD END   -----------------------------------
      *
           .
       321-BODY-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    £²ËçÌÜÄ¢É¼°õºþ½èÍý
      *****************************************************************
       331-PRINT-OUT-SEC                SECTION.
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
           MOVE   "SKT3420.red"        TO  SPRT-PRTID
           MOVE    "¹ñÊÝÀÁµá½ñ"        TO  SPRT-TITLE
           MOVE    SKT3420             TO  SPRT-PRTDATA
           MOVE    LNK-PRTKANRI-TERMID TO  SPRT-TERMID
           MOVE    LNK-PRTKANRI-OPID   TO  SPRT-OPID
           MOVE    LNK-PRTKANRI-PRTNM  TO  SPRT-PRTNM
           CALL    "ORCSPRT"           USING
                                       ORCSPRTAREA
      *---(01.00.06) LINE ADD START ------------------------------------
                                       SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
           IF      SPRT-RETURN         =   ZERO
               CONTINUE
           ELSE
               MOVE    "°õºþ£Ä£Â¤Ë¹¹¿·¤Ç¤­¤Þ¤»¤ó¤Ç¤·¤¿"
                                          TO  WRK-RECEERR
               PERFORM 500-ERR-HENSYU-SEC
           END-IF
           .
       331-PRINT-OUT-EXT.
           EXIT.
      *
      *****************************************************************
      *    £³ËçÌÜÄ¢É¼ÊÔ½¸<¥Ø¥Ã¥À¡¼Éô>½èÍý¡ÊÏ·¿Í¡¦¸øÈñÅù¡Ë
      *****************************************************************
       312-HEAD-HEN-SEC          SECTION.
      *
           ADD     1                     TO  CNT-PAGE
      *
           INITIALIZE                    SKT3430
           INITIALIZE                    IDX4
      *    ¥Ú¡¼¥¸ÈÖ¹æ
           MOVE    CNT-PAGE              TO  WRK-Z4
           MOVE    WRK-Z4                TO  SKT3430-NO
      *
      *    °åÎÅµ¡´Ø¥³¡¼¥É
           MOVE    SYS-1001-HOSPCDN      TO  SKT3430-HOSPCD
      *
      *    ÊÝ¸±¼ÔÈÖ¹æ
           MOVE    SKT3410TMP-HKNJANUM   TO  SKT3430-HKNJANUM
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *    ÆÃÊÌÎÅÍÜÈñ
           IF  WRK-PARA-TOKUBETU  =  "2"
             MOVE  "ÆÃÊÌÎÅÍÜÈñ"          TO  SKT3430-TOKUBETU
           END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
           .
       312-HEAD-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    Ä¢É¼ÊÔ½¸<ÌÀºÙ¹Ô>½èÍý¡Ê¸øÈñÅù¡Ë
      *****************************************************************
       322-BODY-HEN-SEC      SECTION.
      *
      *    ¸øÈñ¤Î°Ù¤Î£²ËçÌÜ°Ê¾å¤«
           IF  FLG-PASS  =  ZERO
      *
      *
      *    ·ë³Ë£³£´¾òÊ¬
             PERFORM  VARYING  IDX2  FROM  1  BY  1
                      UNTIL    IDX2  >     2
      *    ÎÅÍÜ¤ÎµëÉÕ¡§·ï¿ô
               MOVE  SKT3410TMP-34KENSU(IDX2)  TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT3430-34KENSU(IDX2)
      *    ÎÅÍÜ¤ÎµëÉÕ¡§Æü¿ô
               MOVE  SKT3410TMP-34NISSU(IDX2)  TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT3430-34NISSU(IDX2)
      *    ÎÅÍÜ¤ÎµëÉÕ¡§ÅÀ¿ô
               MOVE  SKT3410TMP-34TENSU(IDX2)  TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT3430-34TENSU(IDX2)
             END-PERFORM
      *    ¿©»öÎÅÍÜ¡§·ï¿ô
             MOVE  SKT3410TMP-S-34KENSU  TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT3430-S-34KENSU
      *    ¿©»öÎÅÍÜ¡§Æü¿ô
             MOVE  SKT3410TMP-S-34NISSU  TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT3430-S-34NISSU
      *
      *
      *    ·ë³Ë£³£µ¾òÊ¬
      *    ÎÅÍÜ¤ÎµëÉÕ¡§·ï¿ô
             MOVE  SKT3410TMP-35KENSU  TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT3430-35KENSU
      *    ÎÅÍÜ¤ÎµëÉÕ¡§Æü¿ô
             MOVE  SKT3410TMP-35NISSU  TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT3430-35NISSU
      *    ÎÅÍÜ¤ÎµëÉÕ¡§ÅÀ¿ô
             MOVE  SKT3410TMP-35TENSU  TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT3430-35TENSU
      *    ÎÅÍÜ¤ÎµëÉÕ¡§°ìÉôÉéÃ´¶â
             MOVE  SKT3410TMP-35ITBFTN  TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT3430-35ITBFTN
      *    ¿©»öÎÅÍÜ¡§·ï¿ô
             MOVE  SKT3410TMP-S-35KENSU  TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT3430-S-35KENSU
      *    ¿©»öÎÅÍÜ¡§Æü¿ô
             MOVE  SKT3410TMP-S-35NISSU  TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT3430-S-35NISSU
      *    ¿©»öÎÅÍÜ¡§¶â³Û
             MOVE  SKT3410TMP-S-35KINGK  TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT3430-S-35KINGK
           END-IF
      *
      *    °ìÈÌ¡¦Âà¿¦¸øÈñ¤Î°õ»ú
           PERFORM  VARYING  IDX3  FROM  1  BY  1
                    UNTIL    IDX3  >     6
                    OR  WRK-CNT    >     20
                    OR  SKT3410TMP-KOHNUM(WRK-CNT) = SPACE
             PERFORM  VARYING  IDX2  FROM  1  BY  1
                      UNTIL    IDX2  >  2
      *
      *    ÎÅÍÜ¤ÎµëÉÕ¡§·ï¿ô
               MOVE  SKT3410TMP-KKENSU (WRK-CNT IDX2) TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT3430-KKENSU(IDX3 IDX2)
      *    ÎÅÍÜ¤ÎµëÉÕ¡§Æü¿ô
               MOVE  SKT3410TMP-KNISSU (WRK-CNT IDX2) TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT3430-KNISSU(IDX3 IDX2)
      *    ÎÅÍÜ¤ÎµëÉÕ¡§ÅÀ¿ô
               MOVE  SKT3410TMP-KTENSU (WRK-CNT IDX2) TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT3430-KTENSU(IDX3 IDX2)
      *    ÎÅÍÜ¤ÎµëÉÕ¡§°ìÉôÉéÃ´¶â
               MOVE  SKT3410TMP-KITBFTN(WRK-CNT IDX2) TO WRK-Z9
               MOVE  WRK-Z9   TO  SKT3430-KITBFTN(IDX3 IDX2)
             END-PERFORM
      *    ¿©»öÎÅÍÜ¡§·ï¿ô
             MOVE  SKT3410TMP-S-KKENSU (WRK-CNT)        TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT3430-S-KKENSU(IDX3)
      *    ¿©»öÎÅÍÜ¡§Æü¿ô
             MOVE  SKT3410TMP-S-KNISSU (WRK-CNT)        TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT3430-S-KNISSU(IDX3)
      *    ¿©»öÎÅÍÜ¡§¶â³Û
             MOVE  SKT3410TMP-S-KKINGK(WRK-CNT)      TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT3430-S-KKINGK(IDX3)
      *    ¿©»öÎÅÍÜ¡§É¸½àÉéÃ´³Û
             MOVE  SKT3410TMP-S-KFTNGK (WRK-CNT)      TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT3430-S-KFTNGK(IDX3)
      *    ¸øÈñÌ¾
             MOVE  SKT3410TMP-KOHNUM (WRK-CNT)  TO  WRK-KOHNUM
             PERFORM  950-HKNNUM-SET-SEC
             MOVE  HKN-TANSEIDONAME   TO  SKT3430-KNAME(IDX3)
             MOVE  HKN-HBTNUM         TO  SKT3430-HBTNUM(IDX3)
      *
             ADD  1  TO  WRK-CNT
           END-PERFORM
      *
           MOVE    IDX3    TO    IDX4
      *
      *    °ìÈÌ¡¦Âà¿¦¸øÈñ¤òÁ´Éô°õ»ú¤·¤Æ¤«¤éÏ·¿Í¸øÈñÊ¬¤ò°õ»ú¤¹¤ë
           IF  SKT3410TMP-KOHNUM(WRK-CNT) = SPACE
             PERFORM  UNTIL    IDX4  >     6
                      OR  WRK-CNT2    >     20
                      OR  SKT3410TMP-RKOHNUM(WRK-CNT2) = SPACE
               PERFORM  VARYING  IDX2  FROM  1  BY  1
                        UNTIL    IDX2  >  2
      *    ÎÅÍÜ¤ÎµëÉÕ¡§·ï¿ô
                 MOVE  SKT3410TMP-RKKENSU(WRK-CNT2 IDX2) TO WRK-Z5
                 MOVE  WRK-Z5   TO  SKT3430-KKENSU(IDX4 IDX2)
      *    ÎÅÍÜ¤ÎµëÉÕ¡§Æü¿ô
                 MOVE  SKT3410TMP-RKNISSU(WRK-CNT2 IDX2) TO WRK-Z5
                 MOVE  WRK-Z5   TO  SKT3430-KNISSU(IDX4 IDX2)
      *    ÎÅÍÜ¤ÎµëÉÕ¡§ÅÀ¿ô
                 MOVE  SKT3410TMP-RKTENSU(WRK-CNT2 IDX2) TO WRK-Z9
                 MOVE  WRK-Z9   TO  SKT3430-KTENSU(IDX4 IDX2)
      *    ÎÅÍÜ¤ÎµëÉÕ¡§°ìÉôÉéÃ´¶â
                 MOVE  SKT3410TMP-RKITBFTN(WRK-CNT2 IDX2) TO WRK-Z9
                 MOVE  WRK-Z9   TO  SKT3430-KITBFTN(IDX4 IDX2)
               END-PERFORM
      *    ¿©»öÎÅÍÜ¡§·ï¿ô
               MOVE  SKT3410TMP-S-RKKENSU (WRK-CNT2)        TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT3430-S-KKENSU(IDX4)
      *    ¿©»öÎÅÍÜ¡§Æü¿ô
               MOVE  SKT3410TMP-S-RKNISSU (WRK-CNT2)        TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT3430-S-KNISSU(IDX4)
      *    ¿©»öÎÅÍÜ¡§¶â³Û
               MOVE  SKT3410TMP-S-RKKINGK (WRK-CNT2)      TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT3430-S-KKINGK(IDX4)
      *    ¿©»öÎÅÍÜ¡§É¸½àÉéÃ´³Û
               MOVE  SKT3410TMP-S-RKFTNGK (WRK-CNT2)      TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT3430-S-KFTNGK(IDX4)
      *    ¸øÈñÌ¾
               MOVE  SKT3410TMP-RKOHNUM (WRK-CNT2)  TO  WRK-KOHNUM
               PERFORM  950-HKNNUM-SET-SEC
               MOVE  HKN-TANSEIDONAME   TO  SKT3430-KNAME(IDX4)
               MOVE  HKN-HBTNUM          TO  SKT3430-RHBTNUM1(IDX4)
               MOVE  "27"                TO  SKT3430-RHBTNUM2(IDX4)
               MOVE  "¡Ý"                TO  SKT3430-RSEN(IDX4)
               ADD  1  TO  WRK-CNT2
               ADD  1  TO  IDX4
             END-PERFORM
           END-IF
      *
           .
       322-BODY-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    £³ËçÌÜÄ¢É¼°õºþ½èÍý¡Ê¸øÈñ¡Ë
      *****************************************************************
       332-PRINT-OUT-SEC                SECTION.
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
           MOVE   "SKT3430.red"        TO  SPRT-PRTID
           MOVE    "¹ñÊÝÀÁµá½ñ"  TO  SPRT-TITLE
           MOVE    SKT3430             TO  SPRT-PRTDATA
           MOVE    LNK-PRTKANRI-TERMID TO  SPRT-TERMID
           MOVE    LNK-PRTKANRI-OPID   TO  SPRT-OPID
           MOVE    LNK-PRTKANRI-PRTNM  TO  SPRT-PRTNM
           CALL    "ORCSPRT"           USING
                                       ORCSPRTAREA
      *---(01.00.06) LINE ADD START ------------------------------------
                                       SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
           IF      SPRT-RETURN         =   ZERO
               CONTINUE
           ELSE
               MOVE    "°õºþ£Ä£Â¤Ë¹¹¿·¤Ç¤­¤Þ¤»¤ó¤Ç¤·¤¿"
                                          TO  WRK-RECEERR
               PERFORM 500-ERR-HENSYU-SEC
           END-IF
           .
       332-PRINT-OUT-EXT.
           EXIT.
057400*
      *****************************************************************
      *    ¥¨¥é¡¼½ÐÎÏ½èÍý
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
      *        ¥¸¥ç¥Ö´ÉÍý³«»Ï½èÍý
               MOVE    "JBE"           TO  SJOBKANRI-MODE
               INITIALIZE                  JOBKANRI-REC
      *---(01.00.06) LINE ADD START ------------------------------------
               MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.06) LINE ADD END   ------------------------------------
               MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
               MOVE    WRK-PARA-SHELLID
                                       TO  JOB-SHELLID
               MOVE    WRK-RECEERR     TO  JOB-YOBI
               MOVE    "9999"          TO  JOB-ERRCD
               CALL    "ORCSJOB"       USING
                                       ORCSJOBKANRIAREA  
                                       JOBKANRI-REC
      *---(01.00.06) LINE ADD START ------------------------------------
                                       SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
           END-IF
      *
           MOVE    1                   TO  FLG-END     
      *
           .
       500-ERR-HENSYU-EXT.
           EXIT.
      *
      *****************************************************************
      *   ÀÁµá´ÉÍý£Ä£Â¹¹¿·½èÍý
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
      *
                   MOVE    LNK-PRTKANRI-SRYYM
                                           TO  RECE10-SKYYM
                   MOVE    LNK-PRTKANRI-SKYYMD
                                           TO  RECE10-UPDYMD
      *
                   MOVE    RECE10-REC      TO  MCPDATA-REC
                   MOVE    "DBUPDATE"      TO  MCP-FUNC
      *---(01.00.06) LINE ADD START ------------------------------------
      *             MOVE    PATH-TBL-SEIKYU-KEY
      *                                     TO  MCP-PATH
      *             CALL    "MCPSUB"        USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
                   MOVE    "tbl_seikyu"    TO  MCP-TABLE
                   MOVE    "key"           TO  MCP-PATHNAME
                   CALL    "ORCDBMAIN"     USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
                   IF      MCP-RC          =   ZERO
                       PERFORM 900-UPD-FILE-READ-SEC
                   ELSE
                       DISPLAY "UPD ERR KEY="  RECE10-KEY 
                       MOVE  "*** SOKATU3410 SEIKYU UPD ERR ***"
                                           TO  WRK-RECEERR
                       MOVE    RECE10-KEY  TO  WRK-RECEERR(33:)
                       PERFORM 500-ERR-HENSYU-SEC
                       MOVE    1           TO  FLG-UPDFILE
                   END-IF
               ELSE
                       DISPLAY "INV ERR KEY="  RECE10-KEY 
                   MOVE  "*** SOKATU3410 SEIKYU INVALID ***"
                                           TO  WRK-RECEERR
                   MOVE    RECE10-KEY      TO  WRK-RECEERR(33:)
                   PERFORM 500-ERR-HENSYU-SEC
                   MOVE    1               TO  FLG-UPDFILE
               END-IF
           END-PERFORM  
      *
           CLOSE   UPD-FILE
           .
       310-SEIKYU-UPD-EXT.
           EXIT.
      *
      *****************************************************************
      *   ÊÝ¸±¼Ô¾ðÊó¥»¥Ã¥È
      *****************************************************************
       920-HKNJAINF-SET-SEC  SECTION.
      *
           INITIALIZE  HKNJAINF-REC
      *---(01.00.06) LINE ADD START ------------------------------------
      *     MOVE    SYS-1001-HOSPID         TO  HKNJA-HOSPID
           MOVE    SPA-HOSPNUM             TO  HKNJA-HOSPNUM
      *---(01.00.06) LINE ADD END   ------------------------------------
           MOVE    SKT3410TMP-HKNJANUM     TO  HKNJA-HKNJANUM
           MOVE    HKNJAINF-REC            TO  MCPDATA-REC
           MOVE    "DBSELECT"              TO  MCP-FUNC
      *---(01.00.06) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-HKNJAINF-KEY   TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
           MOVE    "tbl_hknjainf"       TO  MCP-TABLE
           MOVE    "key"                TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
      *---(01.00.06) LINE ADD START ------------------------------------
      *         MOVE  PATH-TBL-HKNJAINF-KEY       TO  MCP-PATH
               MOVE    "tbl_hknjainf"     TO  MCP-TABLE
               MOVE    "key"              TO  MCP-PATHNAME
      *---(01.00.06) LINE ADD END   ------------------------------------
               PERFORM 925-HKNJAINF-READ-SEC
           ELSE
               DISPLAY "HKNJAINF SELECT ERR"
           END-IF
      *
           INITIALIZE  MCPAREA
           MOVE    "DBCLOSECURSOR"         TO  MCP-FUNC
      *---(01.00.06) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-HKNJAINF-KEY   TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
           MOVE    "tbl_hknjainf"       TO  MCP-TABLE
           MOVE    "key"                TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
      *
           .
       920-HKNJAINF-SET-EXT.
           EXIT.
      *
      *****************************************************************
      *    ÊÝ¸±¼Ô¾ðÊóÆÉ¹þ
      *****************************************************************
       925-HKNJAINF-READ-SEC  SECTION.
      *
           MOVE    "DBFETCH"           TO  MCP-FUNC
      *---(01.00.06) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
           IF      MCP-RC  =   ZERO
               MOVE    MCPDATA-REC  TO  HKNJAINF-REC
               MOVE    ZERO         TO  FLG-HKNJAINF
           ELSE
               INITIALIZE  HKNJAINF-REC
               MOVE    1            TO  FLG-HKNJAINF
           END-IF
      *
           .
       925-HKNJAINF-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *   ÊÝ¸±ÈÖ¹æ¾ðÊó¥»¥Ã¥È
      *****************************************************************
       950-HKNNUM-SET-SEC  SECTION.
      *
           INITIALIZE  HKNNUM-REC
      *---(01.00.06) LINE ADD START ------------------------------------
      *     MOVE    SYS-1001-HOSPID             TO  HKN-HOSPID
           MOVE    SPA-HOSPNUM                 TO  HKN-HOSPNUM
      *---(01.00.06) LINE ADD END   ------------------------------------
           MOVE    WRK-KOHNUM                  TO  HKN-HKNNUM
           MOVE    HKNNUM-REC                  TO  MCPDATA-REC
           MOVE    "DBSELECT"                  TO  MCP-FUNC
      *---(01.00.06) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-HKNNUM-KEY2        TO  MCP-PATH
      *     CALL    "MCPSUB"                    USING
      *                                             MCPAREA
      *                                             MCPDATA-REC
           MOVE    "tbl_hknnum"         TO  MCP-TABLE
           MOVE    "key2"               TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
           IF      MCP-RC  =   ZERO
      *---(01.00.06) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-HKNNUM-KEY2    TO  MCP-PATH
               MOVE    "tbl_hknnum"         TO  MCP-TABLE
               MOVE    "key2"               TO  MCP-PATHNAME
      *---(01.00.06) LINE ADD END   ------------------------------------
               PERFORM 955-HKNNUM-READ-SEC
           ELSE
               DISPLAY  "HKNNUM SELECT ERR"
           END-IF
      *
           INITIALIZE  MCPAREA
           MOVE    "DBCLOSECURSOR"             TO  MCP-FUNC
      *---(01.00.06) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-HKNNUM-KEY2        TO  MCP-PATH
      *     CALL    "MCPSUB"                    USING
      *                                             MCPAREA
      *                                             MCPDATA-REC
           MOVE    "tbl_hknnum"         TO  MCP-TABLE
           MOVE    "key2"               TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
      *
           .
       950-HKNNUM-SET-EXT.
           EXIT.
      *
      *****************************************************************
      *    ÊÝ¸±¼Ô¾ðÊóÆÉ¹þ
      *****************************************************************
       955-HKNNUM-READ-SEC  SECTION.
      *
           MOVE    "DBFETCH"           TO  MCP-FUNC
      *---(01.00.06) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
           IF      MCP-RC  =  ZERO
               MOVE    MCPDATA-REC     TO  HKNNUM-REC
               MOVE    ZERO            TO  FLG-HKNNUM
               IF      HKN-HKNNUM      =   "051"
                   INITIALIZE              HKN-TANSEIDONAME
                   MOVE    "ÆÃÄê¼À´µ"  TO  HKN-TANSEIDONAME
               END-IF
           ELSE
               INITIALIZE  HKNNUM-REC
               MOVE    1               TO  FLG-HKNNUM
           END-IF
      *
           .
       955-HKNNUM-READ-EXT.
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
      *    ÀÁµá´ÉÍýÆÉ¹þ
      *****************************************************************
       900-SEIKYU-SELECT-SEC             SECTION.
      *
      *    ÀÁµá´ÉÍý£Ä£Â¸¡º÷
           INITIALIZE                  RECE10-REC
      *
      *---(01.00.06) LINE ADD START ------------------------------------
      *     MOVE   SYS-1001-HOSPID          TO  RECE10-HOSPID.
           MOVE   SPA-HOSPNUM              TO  RECE10-HOSPNUM
      *---(01.00.06) LINE ADD END   ------------------------------------
           MOVE   LNK-PRTKANRI-SRYYM       TO  RECE10-SKYYM.
      *
           IF    WRK-PARA-HKNJANUM     NOT =   ZERO
               MOVE    WRK-PARA-HKNJANUM   TO  RECE10-XXSTHKNJANUM
                                               RECE10-XXEDHKNJANUM
           ELSE
               MOVE    SPACE               TO  RECE10-XXSTHKNJANUM
               MOVE    "99999999"          TO  RECE10-XXEDHKNJANUM
           END-IF
      *---(01.00.05) LINE ADD START ------------------------------------
           IF  WRK-PARA-TOKUBETU  =  2
             MOVE    "000000"          TO  RECE10-SRYYM
             MOVE    "999999"          TO  RECE10-XXSRYYM
           END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
           MOVE    RECE10-REC          TO  MCPDATA-REC
           MOVE    "DBSELECT"          TO  MCP-FUNC
      *---(01.00.06) LINE ADD START ------------------------------------
      *     MOVE    WRK-PATH            TO  MCP-PATH
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           MOVE    "tbl_seikyu"        TO  MCP-TABLE
           MOVE    WRK-PATH            TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               PERFORM 900-SEIKYU-READ-SEC
           ELSE
               MOVE    1                   TO  FLG-END
           END-IF
           .
       900-SEIKYU-SELECT-EXT.
           EXIT.
      *
      *****************************************************************
      *    ÀÁµá¥Þ¥¹¥¿¡¼ÆÉ¹þ
      *****************************************************************
       900-SEIKYU-READ-SEC           SECTION.
      *
      *---(01.00.06) LINE ADD START ------------------------------------
      *     MOVE    WRK-PATH            TO  MCP-PATH
      *     MOVE    "DBFETCH"           TO  MCP-FUNC
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           MOVE    "tbl_seikyu"            TO  MCP-TABLE
           MOVE    WRK-PATH                TO  MCP-PATHNAME
           MOVE    "DBFETCH"               TO  MCP-FUNC
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    ZERO            TO  FLG-END
               MOVE    MCPDATA-REC         TO  RECE10-REC
      *
      *        ¥Æ¥¹¥È´µ¼Ô¤Î¤È¤­¤ÏÆÉ¤ßÈô¤Ð¤¹
               MOVE    SPACE               TO  PTINF-REC
               INITIALIZE                      PTINF-REC
      *---(01.00.06) LINE ADD START ------------------------------------
      *         MOVE    RECE10-HOSPID       TO  PTINF-HOSPID
               MOVE    SPA-HOSPNUM         TO  PTINF-HOSPNUM
      *---(01.00.06) LINE ADD END   ------------------------------------
               MOVE    RECE10-PTID         TO  PTINF-PTID
               MOVE    PTINF-REC           TO  MCPDATA-REC
               PERFORM 800-PTINF-READ-SEC
               IF      FLG-PTINF           =   ZERO
               AND     PTINF-TSTPTNUMKBN   =   "1"
                   GO  TO  900-SEIKYU-READ-SEC
               END-IF   
      *         
               ADD     1                   TO  CNT-RECE10   
           ELSE
               MOVE    1               TO  FLG-END
           END-IF
      *
           .
       900-SEIKYU-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    ´µ¼Ô¥Þ¥¹¥¿ÆÉ¹þ
      *****************************************************************
       800-PTINF-READ-SEC         SECTION.
      *
           MOVE    "DBSELECT"                   TO  MCP-FUNC
      *---(01.00.06) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-PTINF-KEY           TO  MCP-PATH
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           MOVE    "tbl_ptinf"         TO  MCP-TABLE
           MOVE    "key"               TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                    TO  MCP-FUNC
      *---(01.00.06) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-PTINF-KEY           TO  MCP-PATH
      *         CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
               MOVE    "tbl_ptinf"     TO  MCP-TABLE
               MOVE    "key"           TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"     USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
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
           MOVE    "DBCLOSECURSOR"             TO  MCP-FUNC
      *---(01.00.06) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-PTINF-KEY          TO  MCP-PATH
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           MOVE    "tbl_ptinf"         TO  MCP-TABLE
           MOVE    "key"               TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
      *
           .
       800-PTINF-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    ½¸·×¥Õ¥¡¥¤¥ëÆÉ¹þ
      *****************************************************************
       900-SKTTMP-READ-SEC             SECTION.
      *
           READ    SKT3410TMP-FILE
               INVALID    KEY
                   MOVE    1           TO  FLG-SKT3410TMP
               NOT INVALID  KEY
                   MOVE    ZERO        TO  FLG-SKT3410TMP
           END-READ
           .
       900-SKTTMP-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    ÀÁµá´ÉÍý£Ä£Â¹¹¿·ÍÑ¥Õ¥¡¥¤¥ëÆÉ¹þ
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
      *    ¥·¥¹¥Æ¥à´ÉÍý¥Þ¥¹¥¿ÆÉ¹þ
      *****************************************************************
       910-SYSKANRI-INV-SEC         SECTION.
      *
      *
           MOVE    "DBSELECT"                     TO  MCP-FUNC
      *---(01.00.06) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SYSKANRI-KEY10        TO  MCP-PATH
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           MOVE    "tbl_syskanri"           TO  MCP-TABLE
           MOVE    "key10"                  TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"              USING
                                            MCPAREA
                                            MCPDATA-REC
                                            SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                      TO  MCP-FUNC
      *---(01.00.06) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-SYSKANRI-KEY10        TO  MCP-PATH
      *         CALL    "MCPSUB"            USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
               MOVE    "tbl_syskanri"       TO  MCP-TABLE
               MOVE    "key10"              TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"          USING
                                            MCPAREA
                                            MCPDATA-REC
                                            SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
               IF      MCP-RC              =   ZERO
                   MOVE    ZERO                TO  FLG-SYSKANRI
               ELSE
                   MOVE    1                   TO  FLG-SYSKANRI
               END-IF
           ELSE
               MOVE    1                   TO  FLG-SYSKANRI
           END-IF
      *
           MOVE    "DBCLOSECURSOR"                TO  MCP-FUNC
      *---(01.00.06) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SYSKANRI-KEY10        TO  MCP-PATH
      *         CALL    "MCPSUB"            USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
           MOVE    "tbl_syskanri"       TO  MCP-TABLE
           MOVE    "key10"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
      *
           .
       910-SYSKANRI-INV-EXT.
           EXIT.
      *
      *****************************************************************
      *    ÀÁµá´ÉÍý¥Þ¥¹¥¿ÆÉ¹þ
      *****************************************************************
       910-SEIKYU-INV-SEC         SECTION.
      *
           MOVE    "DBSELECT"              TO  MCP-FUNC
      *---(01.00.06) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SEIKYU-KEY     TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
           MOVE    "tbl_seikyu"         TO  MCP-TABLE
           MOVE    "key"                TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
           IF      MCP-RC                  =   ZERO
               MOVE    "DBFETCH"                    TO  MCP-FUNC
      *---(01.00.06) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-SEIKYU-KEY          TO  MCP-PATH
      *         CALL    "MCPSUB"            USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
               MOVE    "tbl_seikyu"         TO  MCP-TABLE
               MOVE    "key"                TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"          USING
                                            MCPAREA
                                            MCPDATA-REC
                                            SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
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
           MOVE    "DBCLOSECURSOR"         TO  MCP-FUNC
      *---(01.00.06) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SEIKYU-KEY     TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
           MOVE    "tbl_seikyu"         TO  MCP-TABLE
           MOVE    "key"                TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
      *
           .
       910-SEIKYU-INV-EXT.
           EXIT.
      *---(01.00.06) LINE ADD START ------------------------------------
      ****************************************************************
      *    ÊÝ¸±ÈÖ¹æ¥Þ¥¹¥¿¡¼ÆÉ¹þ
      *****************************************************************
      * 900-HKNNUM-READ-SEC         SECTION.
      *
      *     MOVE    "DBFETCH"           TO  MCP-FUNC
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
      *     IF      MCP-RC              =   ZERO
      *         MOVE    MCPDATA-REC     TO  HKNNUM-REC
      *         MOVE    ZERO            TO  FLG-HKNNUM
      *     ELSE
      *         INITIALIZE                  HKNNUM-REC
      *         MOVE    1               TO  FLG-HKNNUM
      *     END-IF
      *
      *     .
      * 900-HKNNUM-READ-EXT.
      *     EXIT.
      *---(01.00.06) LINE ADD END   ------------------------------------
      *
      *****************************************************************
      *    °ì»þ¥Õ¥¡¥¤¥ëÆÉ¹þ
      *****************************************************************
       900-TMP-READ-SEC                SECTION.
      *
           READ  SKT3410TMP-FILE   NEXT
               AT  END
                   MOVE  1  TO  FLG-PRINT
           END-READ
           .
       900-TMP-READ-EXT.
           EXIT.
      *---(01.00.06) LINE ADD START ------------------------------------
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
           PERFORM 910-SYSKANRI-INV-SEC
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
           PERFORM 910-SYSKANRI-INV-SEC
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
           PERFORM 910-SYSKANRI-INV-SEC
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
      *---(01.00.06) LINE ADD END   ------------------------------------
      *****************************************************************
      *    £Ä£Â¡¡¥ª¡¼¥×¥ó½èÍý
      *****************************************************************
       100-DBOPEN-SEC                SECTION.
      *
      *---(01.00.06) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.06) LINE ADD END   ------------------------------------
           MOVE    "DBOPEN"            TO  MCP-FUNC.
      *---(01.00.06) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
      *
      *---(01.00.06) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.06) LINE ADD END   ------------------------------------
           MOVE    "DBSTART"           TO  MCP-FUNC.
      *---(01.00.06) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
           .
       100-DBOPEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    £Ä£Â¡¡¥¯¥í¡¼¥º½èÍý
      *****************************************************************
       900-DBDISCONNECT-SEC            SECTION.
      *
      *---(01.00.06) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.06) LINE ADD END   ------------------------------------
           MOVE    "DBCOMMIT"          TO  MCP-FUNC.
      *---(01.00.06) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
      *
      *---(01.00.06) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.06) LINE ADD END   ------------------------------------
           MOVE    "DBDISCONNECT"      TO  MCP-FUNC.
      *---(01.00.06) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
           .                             
       900-DBDISCONNECT-EXT.
           EXIT.
