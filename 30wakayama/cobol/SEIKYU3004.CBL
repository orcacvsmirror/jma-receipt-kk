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
       PROGRAM-ID.     SEIKYU3004.
      *****************************************************************
      *  ¥·¥¹¥Æ¥àÌ¾        : £Ï£Ò£Ã£Á
      *  ¥µ¥Ö¥·¥¹¥Æ¥àÌ¾    : ÃÏÊý¸øÈñ
      *  ¥³¥ó¥Ý¡¼¥Í¥ó¥ÈÌ¾  : ÏÂ²Î»³¤Ò¤È¤ê¿Æ²ÈÄíÅù°åÎÅÈñÀÁµá½ñ(143)
      *  ´ÉÍý¼Ô            :
      *  ºîÀ®ÆüÉÕ    ºî¶È¼Ô        µ­½Ò
      *  02/05/01    ³Þ¸¶
      *****************************************************************
      * wakayama chihou kouhi contribution
      * Special thanks to michiyo noda,motohide takagaki,katsunori yoneda
      * for help in development
      *****************************************************************
      *  ¥×¥í¥°¥é¥à½¤ÀµÍúÎò
      * Maj/Min/Rev 	½¤Àµ¼Ô	ÆüÉÕ		ÆâÍÆ
      *  01.00.00       ³Þ¸¶    02/12/16        ³«Àß¼ÔÌ¾¤ËÊÑ¹¹
      *  01.00.01       ÆïËÜ    03/07/02        ÃÏÊý¸øÈñÂÐ±þ
      *                                       ¡¡Í­ÅÄ»Ô¡¡µÈÈ÷Ä®
      *                                         ÅòÀõÄ®¡¡¶â²°Ä®¡¡´ä½ÐÄ®
      *                                         ÂÇÅÄÄ®¡¡Åí»³Ä®¡¡¶¶ËÜ»Ô
      *                                         ¤«¤Ä¤é¤®Ä®¡¡¶åÅÙ»³Ä®
      *                                         ¸æË·»Ô
      *  01.00.02       ÆïËÜ    04/01/12        ÅÄÊÕ»Ô
      *  01.00.03       ÆïËÜ    05/04/20        À¶¿åÄ®¡¡Ê´²ÏÄ®¡¡Æá²ìÄ®
      *  01.00.04       ÆïËÜ    05/05/30        ¶úËÜÄ®
      *  01.00.05       ÆïËÜ    05/08/25        ¾åÉÙÅÄ
      *  01.00.06       ÆïËÜ    05/10/07        Æü¹âÀîÄ®
      *  01.00.07       ÆïËÜ    05/11/30        Í³ÎÉÄ®¡¡¤ß¤Ê¤ÙÄ®¡¡ÈþÉÍÄ®
      *                                         °õÆîÄ®¡¡Æü¹âÄ®
      *  01.00.08       ÆïËÜ    06/07/07        MONFUNC DBCLOSESURSOR ÂÐ±þ
      *  02.00.00       ÆïËÜ¡¡¡¡07/10/11        ORCA4.0ÂÐ±þ
      *****************************************************************
      *
       ENVIRONMENT    DIVISION.
       CONFIGURATION  SECTION.
       INPUT-OUTPUT   SECTION.
       FILE-CONTROL.
      *
      *    ÀÁµá½ñÍÑ¥Õ¥¡¥¤¥ë  
           SELECT  MF100-FILE   ASSIGN  MF100PARA
                                ORGANIZATION    IS  INDEXED
                                ACCESS  MODE    IS  DYNAMIC
                                RECORD  KEY     IS  MF100-KEY
                                FILE    STATUS  IS  STS-MF100.
      *
      *    ¥¨¥é¡¼¥Õ¥¡¥¤¥ë
           SELECT  RECEERR-FILE ASSIGN  RECEERR
                                FILE    STATUS  IS  STS-RECEERR.
      *
       DATA  DIVISION.
       FILE  SECTION.
      *
      *    ÀÁµá½ñÍÑ¥Õ¥¡¥¤¥ë
       FD  MF100-FILE.
       01  MF100-REC.
           COPY  "SEI3003.INC".
      *
      *    ¥¨¥é¡¼¥Õ¥¡¥¤¥ë
       FD  RECEERR-FILE.
       01  RECEERR-REC  PIC X(200).
      *
       WORKING-STORAGE  SECTION.
      *
      *    ¥·¥§¥ëÍÑÎÎ°è
           COPY  "CPCOMMONSHELL.INC".
      *
           COPY  "CPCOMMONDAT2.INC"
                   REPLACING  //RECE01//
                   BY         //MF100//.
      *
      *    ¥¨¥é¡¼¥Õ¥¡¥¤¥ë Ì¾¾ÎÎÎ°è
           COPY  "CPCOMMONDAT2.INC"
                   REPLACING  //RECE01PARA//
                   BY         //RECEERR//.
           03      PIC X(04)   VALUE   ".dat".
      *
           COPY  "SC3003.INC".
      *
      *    ¥¹¥ÑÎÎ°è
       01  STS-AREA.
           03  STS-PARA     PIC X(02).
           03  STS-MF100    PIC X(02).
           03  STS-RECEERR  PIC X(02).
      *
      *    ¥Õ¥é¥°ÎÎ°è
       01  FLG-AREA.
           03  FLG-END         PIC 9(01).
           03  FLG-SYSKANRI    PIC 9(01).
           03  FLG-HKNJAINF    PIC 9(01). 
           03  FLG-KEY         PIC 9(01).
           03  FLG-KATSURAGI   PIC 9(01).
           03  FLG-HASIMOTO    PIC 9(01).
           03  FLG-KUDOYAMA    PIC 9(01).
      *
      *    ¥«¥¦¥ó¥ÈÎÎ°è
       01  CNT-AREA.
           03  CNT-LINE  PIC 9(02).
           03  CNT-PAGE  PIC 9(03).
           03  CNT-PRINT PIC 9(06).
           03  CNT-MF100  PIC 9(05).
           03  CNT-SUM         PIC 9(03).
      *
       01  SYS-AREA.
           03  SYS-YMD.
               05  SYS-YY  PIC 9(02).
               05  SYS-MM  PIC 9(02).
               05  SYS-DD  PIC 9(02).
           03  SYS-TIME    PIC 9(08).
      *
      *    Åº»úÎÎ°è
       01  IDX-AREA.
           03  IDX  PIC 9(04).
           03  IDY  PIC 9(04).
           03  IDZ  PIC 9(02).
      *
      *    ²þ¥Ú¡¼¥¸È½Äê¥Æ¡¼¥Ö¥ë¡Ê»ÔÄ®Â¼ÄÉ²Ã»þ²þÄêÍ×¡Ë
       01  TBL-KAIP. 
           03  TBL-KAIP-TBL          OCCURS 22
                                     INDEXED  BY  IDX-MEI.
               05  TBL-KAIP-STSCD    PIC X(03). 
               05  TBL-KAIP-PNO      PIC X(03).
               05  TBL-KAIP-GYO      PIC X(02).
               05  TBL-KAIP-GOUKEI   PIC X(01).
       01  TBL-KAIP-VAL.
      *                                            Í­ÅÄ»Ô   
           03  TBL-KAIP-VAL1         PIC X(09) VALUE "004004101". 
      *                                            µÈÈ÷Ä®   
           03  TBL-KAIP-VAL2         PIC X(09) VALUE "025026010".
      *                                            ÅòÀõÄ®   
           03  TBL-KAIP-VAL3         PIC X(09) VALUE "023023010".
      *                                            ¶â²°Ä®   
           03  TBL-KAIP-VAL4         PIC X(09) VALUE "026026010".
      *                                            ´ä½ÐÄ®
           03  TBL-KAIP-VAL5         PIC X(09) VALUE "017017010".
      *                                            µª¤ÎÀî»Ô
           03  TBL-KAIP-VAL6         PIC X(09) VALUE "012012060".
      *                                            ¶¶ËÜ»Ô
           03  TBL-KAIP-VAL7         PIC X(09) VALUE "003003100". 
      *                                        ¤«¤Ä¤é¤®Ä®   
           03  TBL-KAIP-VAL8         PIC X(09) VALUE "018018150".
      *                                       ¡¡ ¶åÅÙ»³Ä®   
           03  TBL-KAIP-VAL9         PIC X(09) VALUE "020020100".
      *                                       ¡¡   ¸æË·»Ô   
           03  TBL-KAIP-VAL10        PIC X(09) VALUE "005005010".
      *                                       ¡¡   ÅÄÊÕ»Ô   
           03  TBL-KAIP-VAL11        PIC X(09) VALUE "006006180".
      *                                            À¶¿åÄ®
           03  TBL-KAIP-VAL12        PIC X(09) VALUE "027026010".
      *                                            ¶úËÜÄ®
           03  TBL-KAIP-VAL13        PIC X(09) VALUE "045045200".
      *                                          ¾åÉÙÅÄÄ®
           03  TBL-KAIP-VAL14        PIC X(09) VALUE "042042120".
      *                                          Æü¹âÀîÄ®
           03  TBL-KAIP-VAL15        PIC X(09) VALUE "031031080".
      *                                          Í³ÎÉÄ®
           03  TBL-KAIP-VAL16        PIC X(09) VALUE "030030010".
      *                                          ¤ß¤Ê¤ÙÄ®
           03  TBL-KAIP-VAL17        PIC X(09) VALUE "035035120".
      *                                          ÈþÉÍÄ®
           03  TBL-KAIP-VAL18        PIC X(09) VALUE "028028010".
      *                                          °õÆîÄ®
           03  TBL-KAIP-VAL19        PIC X(09) VALUE "037037010".
      *                                          Æü¹âÄ®
           03  TBL-KAIP-VAL20        PIC X(09) VALUE "029029010".
      *                                          ¹­ÀîÄ®
           03  TBL-KAIP-VAL21        PIC X(09) VALUE "024024151".
      *                                          ÇòÉÍÄ®
           03  TBL-KAIP-VAL22        PIC X(09) VALUE "038035120".
      *
      *    °ì»þÎÎ°è
       01  WRK-AREA.
      *
           03  WRK-RECEERR      PIC X(200).
           03  WRK-DENPPRTYMWH  PIC X(16).
           03  WRK-SYSYMDWH     PIC X(22).
           03  WRK-SRYYM        PIC X(09).
           03  WRK-STSCD        PIC X(03).
           03  WRK-NYUGAI       PIC X(01).
      *
           03  WRK-SYMD.
               05  WRK-SYY   PIC 9(04).
               05  WRK-SMM   PIC 9(02).
               05  WRK-SDD   PIC 9(02).
           03  WRK-HENYMDG   PIC X(22).
           03  WRK-HENYMDG1  PIC X(09).
           03  WRK-KEISAN1   PIC 9(09).
           03  WRK-KEISAN2   PIC 9(09).
           03  WRK-KEISAN3   PIC 9(09).
           03  WRK-KEISAN4   PIC 9(09).
           03  WRK-KEISAN5   PIC 9(09).
           03  WRK-KEISAN6   PIC 9(09).
           03  WRK-KEISAN7   PIC 9(09).
           03  WRK-KEISAN8   PIC 9(09).
      *
      *    Ä¢É¼¥Ñ¥¿¡¼¥óÈ½ÄêÍÑ¥¨¥ê¥¢
           03  WRK-KAIP.
               05  WRK-KAIP-STSCD      PIC X(03).
               05  WRK-KAIP-PNO        PIC X(03).
               05  WRK-KAIP-GYO        PIC X(02).
               05  WRK-KAIP-GOUKEI     PIC X(01).
      *
      *    ÊÔ½¸ÍÑ¥¨¥ê¥¢
           03  WRK-FTNRATEX    PIC 9.
           03  WRK-GKENSUX     PIC ZZ9.
           03  WRK-GKOHFTNX    PIC ZZZ,ZZ9.
           03  WRK-NYUNISSUX   PIC Z9.
           03  WRK-GTENSUX     PIC ZZ,ZZ9.
           03  WRK-GTEN-WARIX  PIC ZZZ,ZZ9.
           03  WRK-YKZFTNX     PIC ZZ,ZZ9.
           03  WRK-GKINGKX     PIC ZZZ,ZZ9.
           03  WRK-KOHKENSUX   PIC ZZ9.
           03  WRK-YKZKENSUX   PIC ZZ9.
           03  WRK-JNISSUX     PIC Z9.
           03  WRK-SNISUX      PIC ZZ9.
           03  WRK-SKENSUX     PIC ZZ9.
           03  WRK-STENSUX     PIC ZZ,ZZ9.
           03  WRK-SKINX       PIC ZZ,ZZZ,ZZ9.
           03  WRK-SYKZFTNX    PIC ZZ,ZZZ,ZZ9.
           03  WRK-GYKZFTNX    PIC ZZ,ZZZ,ZZ9.
           03  WRK-HIYOUX      PIC ZZ,ZZZ,ZZ9.
           03  WRK-GTESUX      PIC ZZ,ZZZ,ZZ9.
	   03  WRK-GKIN2X      PIC ZZ,ZZZ,ZZ9.
      *
      *    ¹ç·×¥¨¥ê¥¢
           03  WRK-KOHFTN      PIC 9(09).
           03  WRK-YKZFTN      PIC 9(09).
           03  WRK-KOHKENSU    PIC 9(05).
           03  WRK-YKZKENSU    PIC 9(05).
           03  WRK-KOHFTN2     PIC 9(09).
           03  WRK-YKZFTN2     PIC 9(09).
           03  WRK-KOHKENSU2   PIC 9(05).
           03  WRK-YKZKENSU2   PIC 9(05).
           03  WRK-TOTALTEN2   PIC 9(05).
           03  WRK-SNISU       PIC 9(04).
           03  WRK-SNNISU      PIC 9(04).
           03  WRK-SKENSU      PIC 9(04).
           03  WRK-SKENSUK     PIC 9(04).
           03  WRK-SKENSUS     PIC 9(04).
           03  WRK-SKENSUNYU   PIC 9(04).
           03  WRK-SKENSUGAI   PIC 9(04).
           03  WRK-STENSU      PIC 9(10).
           03  WRK-STENSUN     PIC 9(10).
           03  WRK-GKENSU      PIC 9(04).
           03  WRK-SKIN        PIC 9(10).
           03  WRK-SKINN       PIC 9(10).
           03  WRK-GKIN        PIC 9(10).
	   03  WRK-GKIN2       PIC 9(10).
           03  WRK-SYKZFTN     PIC 9(10).
           03  WRK-GTESU       PIC 9(10).
      *
       01  SUM-AREA.
           03  SUM-GOKEI  OCCURS  60
                              INDEXED  BY  IDX-GOU.
               05  SUM-STSCD   PIC X(03).
               05  SUM-GKENSU  PIC 9(10).
               05  SUM-GKOHFTN PIC 9(10).
               05  SUM-TENSU   PIC 9(10).
               05  SUM-GKENSUK PIC 9(10).
               05  SUM-GKENSUS PIC 9(10).
               05  SUM-GYKZFTN PIC 9(10).
               05  SUM-GTESU   PIC 9(10).
               05  SUM-GKENSUGAI PIC 9(10).
               05  SUM-GKENSUNYU PIC 9(10).
       01  WRK-KEY-AREA.
      *    ¥­¡¼¥¨¥ê¥¢
           03  WRK-MF100-KEY.
               05  FILLER                    PIC X(04).
               05  WRK-MF100-STSCD.
                   07  FILLER                PIC X(02).
                   07  WRK-MF100-KOHFTNJA-C  PIC X(03).
                   07  FILLER                PIC X(01).
               05  WRK-NYUGAIKBNP            PIC X(01).
               05  WRK-SRYM                  PIC X(06).
               05  FILLER                    PIC X(59).
      *
      *    £Ò£Å£Ä¥Õ¥¡¥¤¥ë¥¨¥ê¥¢
           03  WRK-PRT-ID.
               05  WRK-ID          PIC X(06).
               05  WRK-PRT-CTV     PIC X(03).
               05  WRK-FILE        PIC X(04).
      *
      *    £Ò£Å£Ä¥Õ¥¡¥¤¥ë¥¨¥ê¥¢
           03  WRK-MPRT-ID.
               05  WRK-MID         PIC X(06).
               05  WRK-MPRT-CTV    PIC X(03).
               05  WRK-MFILE       PIC X(05).
      *
      *    £Ò£Å£Ä¥Õ¥¡¥¤¥ë¥¨¥ê¥¢¡Ê¹ç·×ÍÑ¡Ë
           03  WRK-GPRT-ID.
               05  WRK-GID         PIC X(06).
               05  WRK-GPRT-CTV    PIC X(03).
               05  WRK-GFILE       PIC X(05).
      *
       01  KEY-AREA  VALUE   LOW-VALUE.
           03  KEY-NEW.
               05  KEY-N-STSCD  PIC X(03).
           03  KEY-OLD.
               05  KEY-O-STSCD  PIC X(03).
      *
           COPY  "CPSHELLTBL.INC".
      *
      *     COPY  "ORCA-DBPATH".
           COPY  "COMMON-SPA".
      *
      *****************************************************************
      *    ¥Õ¥¡¥¤¥ë¥ì¥¤¥¢¥¦¥È
      *****************************************************************
      *
      *    ¥·¥¹¥Æ¥à´ÉÍý¥Þ¥¹¥¿
           COPY  "CPSYSKANRI.INC".
      *
      *    °åÎÅµ¡´Ø¾ðÊó¾ðÊó
           COPY  "CPSK1001.INC".
      *
      *    °åÎÅµ¡´Ø¾ðÊó¡¾½êºßÃÏ¡¢Ï¢ÍíÀè
           COPY  "CPSK1002.INC".
      *
      *    ¿ÇÎÅ²ÊÌÜ¾ðÊó¾ðÊó
           COPY  "CPSK1005.INC".
      *
      *    ¥¸¥ç¥Ö´ÉÍý¥Þ¥¹¥¿
       01  JOBKANRI-REC.
           COPY  "CPJOBKANRI.INC".
      *
      *    °õºþ´ÉÍý¥Þ¥¹¥¿
       01  PRTKANRI-REC.
           COPY  "CPPRTKANRI.INC".
      *
      *    °õºþ¥Þ¥¹¥¿
       01  PRTDATA-REC.
           COPY  "CPPRTDATA.INC".
      *
      *    ÊÝ¸±¼Ô¾ðÊó
       01  HKNJAINF-REC.
           COPY  "CPHKNJAINF.INC".
      *
       01  PTHKNINF-REC.
           COPY  "CPPTHKNINF.INC".
      *
      *****************************************************************
      *    ¥µ¥Ö¥×¥íÍÑ¡¡ÎÎ°è
      *****************************************************************
      *
      *    È¾³Ñ¥Á¥§¥Ã¥¯¥µ¥Ö
           COPY  "CPORCSKANACHK.INC".
      *
      *   ÆüÉÕÊÑ´¹¥µ¥Ö
           COPY  "CPORCSDAY.INC".
           COPY  "CPORCSLNK.INC".
      *
      *    ¶¦ÄÌ¥Ñ¥é¥á¥¿
           COPY  "MCPAREA".
      *
           COPY  "MCPDATA.INC".
      *     COPY  "CPORCMCP.INC".
      *
      *   ¥¸¥ç¥Ö´ÉÍý£Ä£ÂÀ©¸æ¥µ¥Ö
           COPY  "CPORCSJOBKANRI.INC".
      *
      *    °õºþ£Ä£ÂÀ©¸æ¥µ¥Ö
           COPY  "CPORCSPRT.INC".
      *
      *    ¸ýºÂ¼èÆÀ¥µ¥Ö
       01  KOUZA-PARA.
           03  KOUZA-GINKO           PIC X(80).
           03  KOUZA-SITEN           PIC X(80).
           03  KOUZA-SYURUI          PIC X(80).
           03  KOUZA-KOUZANO         PIC X(80).
           03  KOUZA-MEIGI           PIC X(80).
           03  KOUZA-KANAMEIGI       PIC X(80).
           03  KOUZA-HENKO           PIC X(80).
      *
      *****************************************************************
      *    Ï¢Íí¡¡ÎÎ°è
      *****************************************************************
       LINKAGE  SECTION.
      *
       01  WRK-PARA.
           COPY    "CPORCSPRTLNK.INC".
           03  WRK-PARA-JOBID      PIC 9(07).
           03  WRK-PARA-SHELLID    PIC X(08).
      *     03  WRK-PARA-HOSPID     PIC X(24).
           03  WRK-PARA-HOSPNUM    PIC 9(02).
           03  WRK-PARA-PAGE       PIC 9(10).
           03  WRK-PARA-SYORIFLG   PIC X(01).
      *
      ******************************************************************
      *
       PROCEDURE  DIVISION
                  USING   WRK-PARA.
      *
      *****************************************************************
      *    ¼ç¡¡¡¡½èÍý
      *****************************************************************
       000-PROC-SEC  SECTION.
      *
           PERFORM 100-INIT-SEC
      *
           PERFORM 200-MAIN-SEC
      *
           PERFORM 300-END-SEC
      *
           EXIT    PROGRAM
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
           INITIALIZE  KOUZA-PARA
           INITIALIZE  WRK-KAIP
           INITIALIZE  SUM-AREA
           INITIALIZE  WRK-KEY-AREA
      *
           ACCEPT  SYS-TIME  FROM  TIME
      *
           MOVE    WRK-PARA-HOSPNUM    TO  SPA-HOSPNUM
           MOVE  LNK-PRTKANRI-SRYYM  TO  WRK-SYMD (1:6)
           MOVE  "01"                TO  WRK-SYMD (7:2)
           PERFORM 31012-SEIWA-HEN-SEC
           MOVE  WRK-HENYMDG(1:16)   TO  WRK-DENPPRTYMWH
           MOVE  WRK-HENYMDG1        TO  WRK-SRYYM 
      *
           MOVE  "MF100ZZ"         TO  MF100PARA-FILE-ID
           MOVE  LNK-PRTKANRI-TERMID(1:16)
                                   TO  MF100PARA-TERMID
           MOVE  WRK-PARA-HOSPNUM    TO  MF100PARA-HOSPNUM
      *
           MOVE  "RECEERR"         TO  RECEERR-FILE-ID
           MOVE  LNK-PRTKANRI-TERMID(1:16)
                                   TO  RECEERR-TERMID
           MOVE  WRK-PARA-HOSPNUM    TO  RECEERR-HOSPNUM
      *
           OPEN  INPUT  MF100-FILE
      *
      *    ¥·¥¹¥Æ¥à´ÉÍý¥Þ¥¹¥¿¡Ê°åÎÅµ¡´Ø¾ðÊó¡Ë
           PERFORM 120-HOSPINF-GET-SEC
      *
      *    ¸ýºÂÌ¾¼èÆÀ
           CALL    "KOUZASUB"          USING
                                       KOUZA-PARA
           .
       100-INIT-EXT.
           EXIT.
      *
      *****************************************************************
      *    °åÎÅµ¡´Ø¾ðÊó¸¡º÷
      *****************************************************************
       120-HOSPINF-GET-SEC  SECTION.
      *
      *    ¥·¥¹¥Æ¥àÆüÉÕ¥»¥Ã¥È
           MOVE  LNK-PRTKANRI-SKYYMD  TO  WRK-SYMD
           PERFORM 31012-SEIWA-HEN-SEC
           MOVE  WRK-HENYMDG  TO  WRK-SYSYMDWH
      *
      *    °åÎÅµ¡´Ø£É£ÄÊÔ½¸
           INITIALIZE  SYS-1001-REC
           MOVE  "1001"        TO  SYS-1001-KANRICD
           MOVE  "*"           TO  SYS-1001-KBNCD
           MOVE    LNK-PRTKANRI-SRYYM(1:6)
                                       TO  SYS-1001-STYUKYMD(1:6)
                                           SYS-1001-EDYUKYMD(1:6)
           MOVE    "01"                TO  SYS-1001-STYUKYMD(7:2)
                                           SYS-1001-EDYUKYMD(7:2)
           MOVE    SPA-HOSPNUM         TO  SYS-1001-HOSPNUM
           MOVE  SYS-1001-REC  TO  MCPDATA-REC
           PERFORM 800-SYSKANRI-READ-SEC
           IF  FLG-SYSKANRI  =  ZERO
             MOVE  MCPDATA-REC  TO  SYS-1001-REC
           ELSE
             DISPLAY "*** SEIKYU3004 SYS 1001 ERR ***" UPON CONSOLE
             MOVE  1            TO  FLG-END
           END-IF
      *
      *    °åÎÅµ¡´Ø¾ðÊó¡¾½êºßÃÏ¡¢Ï¢ÍíÀè
           INITIALIZE  SYS-1002-REC
           MOVE  "1002"        TO  SYS-1002-KANRICD
           MOVE  "*"           TO  SYS-1002-KBNCD
           MOVE    LNK-PRTKANRI-SRYYM(1:6)
                                       TO  SYS-1002-STYUKYMD(1:6)
                                           SYS-1002-EDYUKYMD(1:6)
           MOVE    "01"                TO  SYS-1002-STYUKYMD(7:2)
                                           SYS-1002-EDYUKYMD(7:2)
           MOVE    SPA-HOSPNUM         TO  SYS-1002-HOSPNUM
           MOVE  SYS-1002-REC  TO  MCPDATA-REC
           PERFORM 800-SYSKANRI-READ-SEC
           IF  FLG-SYSKANRI  =  ZERO
             MOVE  MCPDATA-REC  TO  SYS-1002-REC
           ELSE
             DISPLAY "*** SEIKYU3004 SYS 1002 ERR ***" UPON CONSOLE
             MOVE  1            TO  FLG-END
           END-IF
           .
       120-HOSPINF-GET-EXT.
           EXIT.
      *
      *****************************************************************
      *    ¼ç¡¡¡¡½èÍý
      *****************************************************************
       200-MAIN-SEC  SECTION.
      *
      *    ¹ç·×½¸·×
           PERFORM  210-GOKEI-SYUKEI-SEC
      *
           INITIALIZE  CNT-MF100
           INITIALIZE  FLG-END
           INITIALIZE  FLG-KEY
           INITIALIZE  KEY-AREA
           INITIALIZE  FLG-KEY
      *
           OPEN  INPUT  MF100-FILE
      *
      *    ¥ì¥»¥×¥ÈÌÀºÙÆÉ¹þ
           PERFORM 900-MF100-READ-SEC
           MOVE  MF100-KEY         TO  WRK-MF100-KEY
           MOVE  KEY-NEW           TO  KEY-OLD
           MOVE  1                 TO  CNT-SUM
      *
           PERFORM  UNTIL  FLG-END =   1
           IF  KEY-NEW         NOT =   KEY-OLD
               INITIALIZE  FLG-KEY
               MOVE  KEY-NEW       TO  KEY-OLD
           END-IF
      *
      *    Ä¢É¼ÊÔ½¸<¸«½Ð¤·>½èÍý
             PERFORM 310-HEAD-HEN-SEC
      *
      *    Ä¢É¼ÊÔ½¸<ÌÀºÙ>½èÍý
             PERFORM 320-BODY-HEN-SEC
      *¡¡¡¡¤«¤Ä¤é¤®Ä®
             IF  WRK-MF100-KEY (7:3)  =  "018"
                 MOVE   "018018200"    TO  TBL-KAIP-VAL8
             END-IF
      *   ¶¶ËÜ»Ô 
             IF  WRK-MF100-KEY (7:3)  =  "003"
                 MOVE   "003003140"    TO  TBL-KAIP-VAL7
             END-IF
      *   ¶åÅÙ»³Ä® 
             IF  WRK-MF100-KEY (7:3)  =  "020"
                 MOVE   "020020140"    TO  TBL-KAIP-VAL9
             END-IF
      *
      *    Ä¢É¼°õºþ½èÍý
      *    ¹ç·×Ä¢É¼°õºþ
             IF  WRK-MF100-KEY(5:5)   =   "30006"
                IF  (MF100-KEY (1:11) NOT  =   WRK-MF100-KEY (1:11) ) 
                     PERFORM 3951-GOKEI-PRINT-SEC
                ELSE
                    MOVE    SPACE     TO  SC03-GKEN
                                          SC03-GKEN2
                                          SC03-GKENK
  ¡¡                                      SC03-GKENS
                                          SC03-GGTENSU
                                          SC03-GKIN
                                          SC03-GYKZFTN
                END-IF
             END-IF 
             PERFORM 390-PRINT-OUT-SEC
      *
      *    ¹ç·×Ä¢É¼°õºþ
             IF (WRK-KAIP-GOUKEI       =   "1" )  AND
                (MF100-KEY (1:11) NOT  =   WRK-MF100-KEY (1:11) ) 
                 PERFORM 395-GOKEI-PRINT-SEC
             END-IF 
      *
           END-PERFORM
      *
           CLOSE  MF100-FILE
      *
           .
       200-MAIN-EXT.
           EXIT.
      *
      *****************************************************************
      *    ¹ç·×½¸·×½èÍý
      *****************************************************************
       210-GOKEI-SYUKEI-SEC  SECTION.
      
           INITIALIZE  SUM-AREA
           OPEN  INPUT  MF100-FILE
      
      *    ¥ì¥»¥×¥ÈÌÀºÙÆÉ¹þ
           PERFORM 900-MF100-READ-SEC
      *
           MOVE  KEY-NEW           TO  KEY-OLD
           MOVE  1                 TO  CNT-SUM
           MOVE  KEY-N-STSCD       TO  SUM-STSCD  (CNT-SUM)
      *
           PERFORM  UNTIL  FLG-END =   1
      *
             IF  KEY-NEW       NOT =   KEY-OLD
                 MOVE  KEY-NEW     TO  KEY-OLD
                 ADD   1           TO  CNT-SUM
                 MOVE  KEY-N-STSCD TO  SUM-STSCD   (CNT-SUM)
             END-IF
      *
             ADD   1               TO  SUM-GKENSU  (CNT-SUM)
             ADD  MF100-TOTALTEN   TO  SUM-TENSU   (CNT-SUM)
             EVALUATE  MF100-HKNNUM
               WHEN  "060"
                 ADD    1          TO  SUM-GKENSUK (CNT-SUM)
               WHEN  "067"
                 ADD    1          TO  SUM-GKENSUK (CNT-SUM)
               WHEN OTHER
                 ADD    1          TO  SUM-GKENSUS (CNT-SUM)
             END-EVALUATE
             IF  MF100-FTNMONEY  NOT = ZERO 
                 IF  KEY-N-STSCD     =  "017"
                     MOVE   MF100-FTNMONEY TO  WRK-KEISAN6
                 ELSE
                     COMPUTE WRK-KEISAN6 =  MF100-TOTALTEN 
                                         *  MF100-KYURATE
                                         /  10
                 END-IF
             ELSE
                 COMPUTE WRK-KEISAN6 =  MF100-TOTALTEN *  MF100-KYURATE
                                        /  10
             END-IF
             ADD  WRK-KEISAN6      TO  SUM-GKOHFTN (CNT-SUM)
             ADD  MF100-YKZFTN     TO  SUM-GYKZFTN (CNT-SUM)
             IF  SUM-STSCD (CNT-SUM)   =   "012" OR "035" OR "038"
                 ADD  100          TO  SUM-GTESU   (CNT-SUM)
             END-IF
      *    Æþ±¡/Æþ±¡³°
             EVALUATE MF100-NYUGAIKBN
               WHEN "1"
                 ADD     1         TO  SUM-GKENSUNYU (CNT-SUM)
               WHEN "2"
                 ADD     1         TO  SUM-GKENSUGAI (CNT-SUM)
               END-EVALUATE
      *    ¥ì¥»¥×¥ÈÌÀºÙÆÉ¹þ
             PERFORM 900-MF100-READ-SEC
      *
           END-PERFORM
      *
           CLOSE  MF100-FILE
      *
           .
       210-GOKEI-SYUKEI-EXT.
           EXIT.
      *
      *****************************************************************
      *    Ä¢É¼ÊÔ½¸<¥Ø¥Ã¥À¡¼Éô>½èÍý
      *****************************************************************
       310-HEAD-HEN-SEC  SECTION.
      *
           MOVE  ZERO  TO  CNT-LINE
           ADD   1     TO  CNT-PAGE
      *
           INITIALIZE  SC03
      *
      *    »ÔÄ®Â¼¥Ç¡¼¥¿¼è¤ê¹þ¤ß
           PERFORM 31013-KAIP-SEC
      *
      *    »ÔÄ®Â¼Ì¾
      ******* henkou kaisi ******
           MOVE     SPACE               TO  SC03-STSNAME
      *     MOVE     ZERO                TO  IDZ
      *     MOVE     1                   TO  FLG-HKNJAINF
      *     PERFORM UNTIL IDZ            >   9  OR
      *                   FLG-HKNJAINF   =   ZERO
      *       INITIALIZE                     HKNJAINF-REC
      *       MOVE     SYS-1001-HOSPID   TO  HKNJA-HOSPID
      *       MOVE     MF100-KEY(27:5)   TO  HKNJA-HKNJANUM (1:5)
      *       MOVE     IDZ(2:1)          TO  HKNJA-HKNJANUM (6:1)
      *       MOVE     HKNJAINF-REC      TO  MCPDATA-REC
      *       PERFORM  900-HKNJAINF-INV-SEC
      *       IF  FLG-HKNJAINF           =   ZERO
      *           MOVE    HKNJA-HKNJANAME    TO  SC03-STSNAME
      *       END-IF
      *       ADD      1                 TO  IDZ
      *     END-PERFORM
           EVALUATE   MF100-KEY(7:3)
            WHEN "001"
                MOVE "ÏÂ²Î»³»Ô"          TO  SC03-STSNAME
            WHEN "002" 
                MOVE "³¤Æî»Ô"            TO  SC03-STSNAME
            WHEN "003"
                 MOVE "¶¶ËÜ»Ô"           TO  SC03-STSNAME
            WHEN "004"
                  MOVE "Í­ÅÄ»Ô"          TO  SC03-STSNAME
            WHEN "005" 
                 MOVE "¸æË·»Ô"           TO  SC03-STSNAME
            WHEN "006"  
                MOVE "ÅÄÊÕ»Ô"            TO  SC03-STSNAME
            WHEN "007"
                MOVE "¿·µÜ»Ô"            TO  SC03-STSNAME
            WHEN "012" 
                MOVE "µª¤ÎÀî»Ô"          TO  SC03-STSNAME
            WHEN "017"
                 MOVE "´ä½Ð»Ô"           TO  SC03-STSNAME
            WHEN "010"
                MOVE "µªÈþÌîÄ®"          TO  SC03-STSNAME
            WHEN "018" 
                MOVE "¤«¤Ä¤é¤®Ä®"        TO  SC03-STSNAME
            WHEN "020"
                 MOVE "¶åÅÙ»³Ä®"         TO  SC03-STSNAME
            WHEN "021"
                  MOVE "¹âÌîÄ®"          TO  SC03-STSNAME
            WHEN "023" 
                 MOVE "ÅòÀõÄ®"           TO  SC03-STSNAME
            WHEN "024"  
                MOVE "¹­ÀîÄ®"            TO  SC03-STSNAME
            WHEN "025" 
                 MOVE "Í­ÅÄÀîÄ®"         TO  SC03-STSNAME
            WHEN "028" 
                 MOVE "ÈþÉÍÄ®"           TO  SC03-STSNAME
            WHEN "029" 
                 MOVE "Æü¹âÄ®"           TO  SC03-STSNAME
            WHEN "030" 
                 MOVE "Í³ÎÉÄ®"           TO  SC03-STSNAME
            WHEN "031"  
                MOVE "Æü¹âÀîÄ®"          TO  SC03-STSNAME
            WHEN "035"  
                MOVE "¤ß¤Ê¤ÙÄ®"          TO  SC03-STSNAME
            WHEN "037"
                 MOVE "°õÆîÄ®"           TO  SC03-STSNAME
            WHEN "038"
                 MOVE "ÇòÉÍÄ®"           TO  SC03-STSNAME
            WHEN "042" 
                MOVE "¾åÉÙÅÄÄ®"          TO  SC03-STSNAME
            WHEN "044" 
                MOVE "¤¹¤µ¤ßÄ®"          TO  SC03-STSNAME
            WHEN "045" 
                MOVE "¶úËÜÄ®"            TO  SC03-STSNAME
            WHEN "046" 
                MOVE "ÆáÃÒ¾¡±ºÄ®"        TO  SC03-STSNAME
            WHEN "047" 
                MOVE "ÂÀÃÏÄ®"            TO  SC03-STSNAME
            WHEN "049" 
                MOVE "¸ÅºÂÀîÄ®"          TO  SC03-STSNAME
            WHEN "052" 
                MOVE "ËÌ»³Â¼"            TO  SC03-STSNAME
            WHEN "005" 
                MOVE "¸æË·»Ô"            TO  SC03-STSNAME
            WHEN OTHER
                MOVE     ZERO           TO  IDZ
                MOVE     1              TO  FLG-HKNJAINF
                PERFORM UNTIL IDZ            >   9  OR
                         FLG-HKNJAINF   =   ZERO
                INITIALIZE                     HKNJAINF-REC
      *          MOVE     SYS-1001-HOSPID   TO  HKNJA-HOSPID
                MOVE     SYS-1001-HOSPNUM  TO  HKNJA-HOSPNUM
                MOVE     MF100-KEY(5:5)   TO  HKNJA-HKNJANUM (1:5)
                MOVE     IDZ(2:1)          TO  HKNJA-HKNJANUM (6:1)
                MOVE     HKNJAINF-REC      TO  MCPDATA-REC
                PERFORM  900-HKNJAINF-INV-SEC
                IF  FLG-HKNJAINF           =   ZERO
                    MOVE    HKNJA-HKNJANAME    TO  SC03-STSNAME
                END-IF
                ADD      1                 TO  IDZ
                END-PERFORM
           END-EVALUATE
      *
      *    °õºþÆüÉÕ
           MOVE   WRK-DENPPRTYMWH(05:04)  TO  SC03-PRTYY
           MOVE   WRK-DENPPRTYMWH(11:04)  TO  SC03-PRTMM
           MOVE   WRK-DENPPRTYMWH(01:16)  TO  SC03-PRTYM
      *
      *    °åÎÅµ¡´Ø¥³¡¼¥É
           MOVE  SYS-1001-HOSPCDN       TO  SC03-HOSPCDN
      *
      *    ÀÁµáÆüÉÕ
           MOVE  WRK-SYSYMDWH           TO  SC03-SEIYMD
      *
      *    Í¹ÊØÈÖ¹æ
           MOVE  SYS-1002-POST(1:3)     TO  SC03-POST(1:3)
           MOVE  "-"                    TO  SC03-POST(4:1)
           MOVE  SYS-1002-POST(4:7)     TO  SC03-POST(5:8)
      *
      *    ½»½ê
           MOVE  SYS-1002-ADRS          TO  SC03-ADRS
      *
      *    °åÎÅµ¡´ØÌ¾
           MOVE  SYS-1001-HOSPNAME      TO  SC03-HOSPNAME
      *
      *    ´ÉÍý¼ÔÌ¾
           MOVE  SYS-1001-KAISETUNAME   TO  SC03-KANRINAME
      *
      *    ÅÅÏÃÈÖ¹æ
           MOVE  SYS-1002-TEL           TO  SC03-TEL
      *
           IF  FLG-KEY = 0
               MOVE    KEY-N-STSCD     TO  WRK-STSCD
               PERFORM 31014-GOUKEI-GET-SEC
¡¡¡¡           MOVE  1  TO  FLG-KEY
           END-IF
      *
      *    ¿¶¹þ¤ßÀè¶ä¹Ô
           MOVE  KOUZA-GINKO            TO  SC03-BANKNAME
      *
      *    ¿¶¹þ¤ßÀè¶ä¹Ô»ÙÅ¹
           MOVE  KOUZA-SITEN            TO  SC03-SITENNAME
      *
      *    ¸ýºÂ¼ïÎà
           EVALUATE   KOUZA-SYURUI
             WHEN "1"
               MOVE    "ÅöºÂ"           TO  SC03-SYUBETU
               MOVE    "¡û"             TO  SC03-KOUZA2
             WHEN "2"
               MOVE    "ÉáÄÌ"           TO  SC03-SYUBETU
               MOVE    "¡û"             TO  SC03-KOUZA1
           END-EVALUATE
      *
      *    ¿¶¹þ¤ßÀè¸ýºÂÈÖ¹æ
           MOVE  KOUZA-KOUZANO          TO  SC03-KOZANUM
      *
      *    ¿¶¹þ¤ßÀèÌ¾µÁ¿Í
           MOVE  KOUZA-MEIGI            TO  SC03-MEIGI
      *
      *    ¿¶¹þ¤ßÀèÌ¾µÁ¿Í ¥«¥Ê
           MOVE  KOUZA-KANAMEIGI        TO  SC03-KANAMEIGI
      * 
      *    ¸ýºÂÊÑ¹¹
           EVALUATE   KOUZA-HENKO
             WHEN "1"
               MOVE    "¡û"             TO  SC03-HENKO1 
             WHEN "2"
               MOVE    "¡û"             TO  SC03-HENKO2
           END-EVALUATE
           .
       310-HEAD-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    Ä¢É¼ÊÔ½¸<ÌÀºÙ¹Ô>½èÍý
      *****************************************************************
       320-BODY-HEN-SEC  SECTION.
      *
           MOVE  ZERO               TO  CNT-LINE
           MOVE  MF100-KEY          TO  WRK-MF100-KEY 
      *
           PERFORM  UNTIL  FLG-END  =   1
                    OR   CNT-LINE   =   WRK-KAIP-GYO
                    OR   MF100-KEY (1:17) NOT =  WRK-MF100-KEY (1:17) 
      *
             ADD  1  TO  CNT-LINE
      *
      *    Æþ±¡/Æþ±¡³°
             EVALUATE  MF100-NYUGAIKBN
               WHEN "1"
                 MOVE  "¢þ"         TO  SC03-PTENSUKBN  (1)
                 MOVE  "¢þ"         TO  SC03-TENSUKBN   (CNT-LINE 1)
                 MOVE  "¢þ"         TO  SC03-NYUGAI-KBN (CNT-LINE 1)
               WHEN "2"
                 MOVE  "¢þ"         TO  SC03-PTENSUKBN  (2)
                 MOVE  "¢þ"         TO  SC03-TENSUKBN   (CNT-LINE 3)
                 MOVE  "¢þ"         TO  SC03-NYUGAI-KBN (CNT-LINE 2)
             END-EVALUATE
      *
      *    ¼õµë»ñ³Ê¾Úµ­¹æÈÖ¹æ
             MOVE  MF100-KOHJKYSNUM TO  SC03-JKYSNUM (CNT-LINE)
      *
      *    ÊÝ¸±¼ÔÌ¾
           INITIALIZE                       HKNJAINF-REC
      *     MOVE     SYS-1001-HOSPID     TO  HKNJA-HOSPID
           MOVE     SYS-1001-HOSPNUM    TO  HKNJA-HOSPNUM
           MOVE     MF100-HKNJANUM-KEY  TO  HKNJA-HKNJANUM
           MOVE     HKNJAINF-REC        TO  MCPDATA-REC
           PERFORM  900-HKNJAINF-INV-SEC
           IF  FLG-HKNJAINF             =   ZERO
               MOVE    HKNJA-HKNJANAME  TO  SC03-NKJANAME (CNT-LINE)
           ELSE
               MOVE    SPACE            TO  SC03-NKJANAME (CNT-LINE)
           END-IF   
      *
      *    »áÌ¾
             MOVE  MF100-NAME             TO  SC03-NAME (CNT-LINE)
             PERFORM 900-PTHKNDB-SEC
             IF  MF100-KEY(5:5)          =   "30005" OR "30028"
                 MOVE  PTHKN-HIHKNJANAME  TO  SC03-NAME2 (1)
                                              SC03-NAME2 (2)
             ELSE
                 MOVE  PTHKN-HIHKNJANAME  TO  SC03-NAME2 (CNT-LINE)
             END-IF
      *
      *    À­ÊÌ 
             IF  MF100-SEX          =  "1"
                 MOVE  "¢þ"         TO  SC03-SEX-M (CNT-LINE)
             ELSE
                 MOVE  "¢þ"         TO  SC03-SEX-F (CNT-LINE)
             END-IF
      *
      *    À¸Ç¯·îÆü
             MOVE  MF100-BIRTHDAY   TO  SC03-BIRTHDAY (CNT-LINE)
      *
             MOVE  MF100-BIRTHDAY   TO  WRK-SYMD
             PERFORM 31012-SEIWA-HEN-SEC
             MOVE  LNK-DAY2-EDTYMD3 TO  SC03-BIRTHDAYK (CNT-LINE)
      *
      *    ÊÝ¸±¼ÔÈÖ¹æ
             MOVE  MF100-HKNJANUM   TO  SC03-HKNJANUM (CNT-LINE)
      *
      *    ²ÃÆþÊÝ¸±
             EVALUATE  MF100-HKNNUM
               WHEN  "060"
                 MOVE  "¡û"         TO  SC03-HKNKBN-KOK (CNT-LINE)
               WHEN  "067"
                 MOVE  "¡û"         TO  SC03-HKNKBN-KOK (CNT-LINE)
               WHEN OTHER
                 MOVE  "¡û"         TO  SC03-HKNKBN-SYHH (CNT-LINE)
             END-EVALUATE 
             IF  MF100-KEY(5:5)    =   "30024"
                 IF  MF100-HKNNUM   =   "060" OR "067"
                     NEXT SENTENCE
                 ELSE
                     IF  MF100-HONKZKKBN    =  "2"
                         MOVE  SPACE TO  SC03-HKNKBN-SYHH (CNT-LINE)
                         MOVE  "¡û"  TO  SC03-HKNKBN-SYHK (CNT-LINE)
                     END-IF
                 END-IF
             END-IF
      *    ²ÃÆþÊÝ¸±
             EVALUATE  MF100-HKNNUM
               WHEN  "001"
                 MOVE  "¡û"         TO  SC03-HKNSYUBETU (CNT-LINE 1)
               WHEN  "006"
                 MOVE  "¡û"         TO  SC03-HKNSYUBETU (CNT-LINE 2)
               WHEN  "003"
                  MOVE "¡û"         TO  SC03-HKNSYUBETU (CNT-LINE 3)
               WHEN  "004"
                  MOVE "¡û"         TO  SC03-HKNSYUBETU (CNT-LINE 3)
               WHEN  "002"
                 MOVE  "¡û"         TO  SC03-HKNSYUBETU (CNT-LINE 4)
               WHEN  "031"
                 MOVE  "¡û"         TO  SC03-HKNSYUBETU (CNT-LINE 5)
               WHEN  "032"
                 MOVE  "¡û"         TO  SC03-HKNSYUBETU (CNT-LINE 5)
               WHEN  "033"
                 MOVE  "¡û"         TO  SC03-HKNSYUBETU (CNT-LINE 5)
               WHEN  "034"
                 MOVE  "¡û"         TO  SC03-HKNSYUBETU (CNT-LINE 5)
               WHEN  "060"
                 MOVE  "¡û"         TO  SC03-HKNSYUBETU (CNT-LINE 6)
               WHEN  "067"
                 MOVE  "¡û"         TO  SC03-HKNSYUBETU (CNT-LINE 6)
               WHEN OTHER
                 MOVE  "¡û"         TO  SC03-HKNSYUBETU (CNT-LINE 7)
             END-EVALUATE 
      *
             IF  MF100-KEY(5:5)    =   "30045"
                 IF  MF100-HKNNUM   =   "060" OR "067"
                     MOVE   "¹ñÊÝ"  TO  SC03-BIKO (CNT-LINE)
                 ELSE
                     MOVE   "¼ÒÊÝ"  TO  SC03-BIKO (CNT-LINE)
                 END-IF
             END-IF
      *
      *    µ­¹æ¡¦ÈÖ¹æ
             MOVE  MF100-KIGO(1:20) TO  SC03-KIGO (CNT-LINE)
             MOVE  MF100-NUM(1:20)  TO  SC03-NUM  (CNT-LINE)
      *
      *    ËÜ¿Í²ÈÂ²
             EVALUATE  MF100-HONKZKKBN
               WHEN  "1"
                 MOVE  "¡û"         TO  SC03-HONKZKKBN (CNT-LINE 1)
               WHEN  "2"
                 MOVE  "¡û"         TO  SC03-HONKZKKBN (CNT-LINE 2)
             END-EVALUATE 
             IF  (MF100-KEY(5:5)   =   "30003" OR "30020")  AND
                 (MF100-HKNNUM      =   "060" OR "067")
                 MOVE    SPACE      TO  SC03-HONKZKKBN (CNT-LINE 1)
                                        SC03-HONKZKKBN (CNT-LINE 2)
             END-IF
      *
      *    µëÉÕ³ä¹ç
             COMPUTE WRK-FTNRATEX   =   MF100-KYURATE / 10
             EVALUATE  WRK-FTNRATEX
               WHEN  3
                 MOVE  "¡û"         TO  SC03-FTNWARIAI-3   (CNT-LINE)
                 MOVE  "¡û"         TO  SC03-FTNWARIAI1    (CNT-LINE 1)
               WHEN  2
                 MOVE  "¡û"         TO  SC03-FTNWARIAI-2   (CNT-LINE)
                 MOVE  "¡û"         TO  SC03-FTNWARIAI1    (CNT-LINE 2)
               WHEN  1
                 MOVE  "¡û"         TO  SC03-FTNWARIAI-9   (CNT-LINE)
               WHEN OTHER
                 MOVE  WRK-FTNRATEX TO  SC03-FTNWARIAI-ETC (CNT-LINE)
                 MOVE  WRK-FTNRATEX TO  SC03-FTNWARIAI2    (CNT-LINE)
             END-EVALUATE
             IF  MF100-KEY(5:5)    =   "30031" OR "30035" OR "30038"
                 MOVE  WRK-FTNRATEX TO  SC03-FTNWARIAI-ETC (CNT-LINE)
             END-IF
      *
      *    ¿ÇÎÅ·î
             MOVE  SPACE            TO  SC03-SRYM (CNT-LINE)
             MOVE  MF100-SRYYM(5:2) TO  SC03-SRMM (CNT-LINE)
             MOVE  MF100-SRYYM(5:2) TO  SC03-SRYM (CNT-LINE)
      **       MOVE  LNK-PRTKANRI-SRYYM (5:2)
      **                               TO  SC03-SRYM (CNT-LINE)
      *
      *    ÅÀ¿ôÉ½
             EVALUATE  MF100-NYUGAIKBN
               WHEN "1"
                 MOVE  "¡û"         TO  SC03-TENSUKBN (CNT-LINE 1)
               WHEN "2"
                 MOVE  "¡û"         TO  SC03-TENSUKBN (CNT-LINE 3)
             END-EVALUATE
      *
      *    Æþ±¡Æü¿ô
             EVALUATE  MF100-NYUGAIKBN
               WHEN "1"
                 MOVE  MF100-JNISSU   TO  WRK-NYUNISSUX
                 MOVE  WRK-NYUNISSUX  TO  SC03-NYUNISSU (CNT-LINE)
               WHEN "2"
                 MOVE  SPACE          TO  SC03-NYUNISSU (CNT-LINE)
             END-EVALUATE
      *      
      *    ¿ÇÎÅ¼ÂÆü¿ô³«»ÏÆü
             MOVE  MF100-SRYYM         TO  WRK-SYMD (1:6)
             MOVE  "01"                TO  WRK-SYMD (7:2)
             PERFORM 31012-SEIWA-HEN-SEC
             MOVE  WRK-HENYMDG(05:04)  TO SC03-SRNISU-FROM-YY
             MOVE  WRK-HENYMDG(11:04)  TO SC03-SRNISU-FROM-MM
             MOVE "£°£±"                  TO  SC03-SRNISU-FROM-DD
      *    ¿ÇÎÅ¼ÂÆü¿ô½ªÎ»Æü
             MOVE  WRK-HENYMDG(05:04)  TO SC03-SRNISU-TO-YY
             MOVE  WRK-HENYMDG(11:04)  TO SC03-SRNISU-TO-MM
             MOVE "¡¡Ëö"                  TO  SC03-SRNISU-TO-DD
      *    ¼ÂÆü¿ô
             IF  MF100-KEY(5:5)   =   "30003" OR "30020" OR "30031" OR
                                       "30024"
                 IF  MF100-NYUGAIKBN   =   "1"
                     MOVE  SPACE        TO  SC03-SRNISU (CNT-LINE)
                 ELSE
                     MOVE  MF100-JNISSU TO  WRK-JNISSUX
                     MOVE  WRK-JNISSUX  TO  SC03-SRNISU (CNT-LINE)
                 END-IF
             ELSE
                 MOVE  MF100-JNISSU     TO  WRK-JNISSUX
                 MOVE  WRK-JNISSUX      TO  SC03-SRNISU (CNT-LINE)
             END-IF
      *
      *    ÅÀ¿ô
             MOVE  MF100-TOTALTEN      TO  WRK-GTENSUX
             IF  MF100-KEY(5:5)       =   "30031"
                 IF  MF100-NYUGAIKBN   =   "1"
                     MOVE  WRK-GTENSUX TO  SC03-GTENSUN (CNT-LINE)
                   ELSE
                     MOVE  WRK-GTENSUX TO  SC03-GTENSU (CNT-LINE)
                 END-IF
             ELSE
                 MOVE  WRK-GTENSUX     TO  SC03-GTENSU (CNT-LINE)
             END-IF
      *
      *    ÁíÅÀ¿ô¡ß³ä¹ç
             COMPUTE  WRK-GTEN-WARIX    =  MF100-TOTALTEN *
                                           WRK-FTNRATEX
             MOVE  WRK-GTEN-WARIX   TO  SC03-GTEN-WARI (CNT-LINE)
      *
      *    ÌôºÞ°ìÉôÉéÃ´¶â
             MOVE  MF100-YKZFTN     TO  WRK-YKZFTNX
             MOVE  WRK-YKZFTNX      TO  SC03-YKZITBFTN (CNT-LINE)
      *
      *    ¹ç·×¶â³Û
             IF  MF100-FTNMONEY  NOT = ZERO 
                 IF  MF100-KEY(5:5)     =  "30017"
                     MOVE   MF100-FTNMONEY TO  WRK-KEISAN6
                 ELSE
                     COMPUTE WRK-KEISAN6 =  MF100-TOTALTEN 
                                         *  MF100-KYURATE
                                         /  10
                 END-IF
             ELSE
                 COMPUTE WRK-KEISAN6 =  MF100-TOTALTEN *  MF100-KYURATE
                                        /  10
             END-IF
             MOVE  WRK-KEISAN6      TO  WRK-GKINGKX
             IF  MF100-KEY(5:5)       =   "30031"
                 IF  MF100-NYUGAIKBN   =   "1"
                     ADD   WRK-KEISAN6 TO  WRK-SKINN
                 ELSE
                     ADD   WRK-KEISAN6 TO  WRK-SKIN  
                 END-IF
             ELSE
                 ADD   WRK-KEISAN6     TO  WRK-SKIN
             END-IF
             ADD   WRK-KEISAN6         TO  WRK-GKIN
             IF  MF100-KEY(5:5)       =   "30031"
                 IF  MF100-NYUGAIKBN   =   "1"
                     MOVE  WRK-GKINGKX TO  SC03-GKINGKN (CNT-LINE)
                 ELSE
                     MOVE  WRK-GKINGKX TO  SC03-GKINGK (CNT-LINE)
                 END-IF
             ELSE
                 MOVE  WRK-GKINGKX     TO  SC03-GKINGK (CNT-LINE)
             END-IF
      *    ÁíÈñÍÑ
             COMPUTE WRK-KEISAN8    =   MF100-TOTALTEN *  10
             MOVE  WRK-KEISAN8      TO  WRK-HIYOUX
             MOVE  WRK-HIYOUX       TO  SC03-HIYOU (CNT-LINE)
      *
      *    °åÎÅÈñÀÁµá³Û
             MOVE  WRK-GKINGKX      TO  SC03-KOHIITBFTN (CNT-LINE)
      *
      *    ¹ç·×¥¨¥ê¥¢²Ã»»
             IF  WRK-KAIP-GOUKEI       =  "1"
                 COMPUTE  WRK-KOHFTN   =   WRK-KOHFTN   + WRK-KEISAN6
                 COMPUTE  WRK-YKZFTN   =   WRK-YKZFTN   + MF100-YKZFTN
                 COMPUTE  WRK-KOHKENSU =   WRK-KOHKENSU + 1
                 IF  MF100-YKZFTN  NOT =   ZERO
                     COMPUTE  WRK-YKZKENSU =   WRK-YKZKENSU + 1
                 END-IF
             END-IF
      *
             COMPUTE  WRK-TOTALTEN2 =   WRK-TOTALTEN2 + MF100-TOTALTEN
             COMPUTE  WRK-KOHFTN2   =   WRK-KOHFTN2   + WRK-KEISAN6
             COMPUTE  WRK-YKZFTN2   =   WRK-YKZFTN2   + MF100-YKZFTN
             COMPUTE  WRK-KOHKENSU2 =   WRK-KOHKENSU2 + 1
             IF  MF100-YKZFTN   NOT =   ZERO
                 COMPUTE  WRK-YKZKENSU2 =   WRK-YKZKENSU2 + 1
             END-IF
      *
           EVALUATE  MF100-HKNNUM
             WHEN  "060"
               ADD    1             TO  WRK-SKENSUK
             WHEN  "067"
               ADD    1             TO  WRK-SKENSUK
             WHEN OTHER
               ADD    1             TO  WRK-SKENSUS
           END-EVALUATE
      *    Æþ±¡/Æþ±¡³° ·ï¿ô
           EVALUATE MF100-NYUGAIKBN
             WHEN "1"
               ADD     1            TO  WRK-SKENSUNYU
             WHEN "2"
               ADD     1            TO  WRK-SKENSUGAI
           END-EVALUATE
           ADD    1                 TO  WRK-SKENSU
           ADD    1                 TO  WRK-GKENSU
           IF  MF100-KEY(5:5)      =   "30031"
               IF  MF100-NYUGAIKBN      =   "1"
                   ADD    MF100-TOTALTEN   TO  WRK-STENSUN
               ELSE
                   ADD    MF100-TOTALTEN   TO  WRK-STENSU
               END-IF
           ELSE
               ADD    MF100-TOTALTEN       TO  WRK-STENSU 
           END-IF
           ADD    MF100-YKZFTN      TO  WRK-SYKZFTN
           IF  MF100-NYUGAIKBN      =   1
               ADD    MF100-JNISSU  TO  WRK-SNNISU
           ELSE
               ADD    MF100-JNISSU  TO  WRK-SNISU
           END-IF
      *
      *    »ÔÄ®Â¼¥Ö¥ì¥¤¥¯ÍÑ¥­¡¼¥»¥Ã¥È 
             MOVE    MF100-KEY      TO  WRK-MF100-KEY   
      *
      *    ¥ì¥»¥×¥ÈÌÀºÙÆÉ¹þ
             PERFORM 900-MF100-READ-SEC 
           END-PERFORM
           .
       320-BODY-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    Ä¢É¼°õºþ½èÍý
      *****************************************************************
       390-PRINT-OUT-SEC                SECTION.
      *
      *    °åÎÅÈñÀÁµá³Û
           MOVE  WRK-TOTALTEN2         TO  WRK-GTENSUX
           MOVE  WRK-GTENSUX           TO  SC03-GOKEI-GTENSU
      *
      *    °åÎÅÈñÀÁµá³Û
           MOVE  WRK-KOHFTN2           TO  WRK-GKINGKX
           MOVE  WRK-GKINGKX           TO  SC03-GOKEI-GITBFTN
      *
      *    ÌôºÞ°ìÉôÉéÃ´ÀÁµá³Û
           MOVE  WRK-YKZFTN2           TO  WRK-YKZFTNX
           MOVE  WRK-YKZFTNX           TO  SC03-GOKEI-GYKZFTN
      *
      *    °åÎÅÈñÀÁµá·ï¿ô
           MOVE  WRK-KOHKENSU2         TO  WRK-KOHKENSUX
           MOVE  WRK-KOHKENSUX         TO  SC03-GOKEI-GKEN
      *
      *    ÌôºÞ°ìÉôÉéÃ´ÀÁµá·ï¿ô
           MOVE  WRK-YKZKENSU2         TO  WRK-YKZKENSUX
           MOVE  WRK-YKZKENSUX         TO  SC03-GOKEI-GYKZKEN
      *
           MOVE    WRK-SKENSU          TO  WRK-SKENSUX
           MOVE    WRK-SKENSUX         TO  SC03-SKEN
                                           SC03-SKEN2
           MOVE    WRK-SKENSUK         TO  WRK-SKENSUX
           MOVE    WRK-SKENSUX         TO  SC03-SKENK
           MOVE    WRK-SKENSUS         TO  WRK-SKENSUX
           MOVE    WRK-SKENSUX         TO  SC03-SKENS
           MOVE    WRK-SKENSUNYU       TO  WRK-SKENSUX
           MOVE    WRK-SKENSUX         TO  SC03-SKENNYU
           MOVE    WRK-SKENSUGAI       TO  WRK-SKENSUX
           MOVE    WRK-SKENSUX         TO  SC03-SKENGAI
           MOVE    WRK-STENSU          TO  WRK-STENSUX
           MOVE    WRK-STENSUX         TO  SC03-STENSU
           MOVE    WRK-STENSUN         TO  WRK-STENSUX
           MOVE    WRK-STENSUX         TO  SC03-STENSUN
           MOVE    WRK-SKIN            TO  WRK-SKINX
           MOVE    WRK-SKINX           TO  SC03-SKIN
           MOVE    WRK-SKINN           TO  WRK-SKINX
           MOVE    WRK-SKINX           TO  SC03-SKINN
           MOVE    WRK-SYKZFTN         TO  WRK-SYKZFTNX
           MOVE    WRK-SYKZFTNX        TO  SC03-SYKZFTN
           MOVE    WRK-SNISU           TO  WRK-SNISUX
           MOVE    WRK-SNISUX          TO  SC03-SNISU
           MOVE    WRK-SNNISU          TO  WRK-SNISUX
           MOVE    WRK-SNISUX          TO  SC03-SNNISU
      *
           MOVE    ZERO                TO  WRK-SKENSU
                                           WRK-SKENSUK
                                           WRK-SKENSUS
                                           WRK-SKENSUNYU
                                           WRK-SKENSUGAI
                                           WRK-STENSU
                                           WRK-STENSUN
                                           WRK-SKIN
                                           WRK-SKINN
                                           WRK-SYKZFTN
                                           WRK-SNISU
                                           WRK-SNNISU
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
           MOVE    SPACE               TO  SPRT-PRTID
      *
           IF  WRK-KAIP-PNO            =  "000"
               MOVE   "SC3003.red"     TO  SPRT-PRTID
           ELSE
               IF  FLG-KATSURAGI       =   1
                   IF  WRK-KAIP-PNO    =  "018"
                       MOVE   "SC3003"       TO  WRK-MID 
                       MOVE    WRK-KAIP-PNO  TO  WRK-MPRT-CTV
                       MOVE   "1.red"        TO  WRK-MFILE
                       MOVE    WRK-MPRT-ID   TO  SPRT-PRTID
                   ELSE
                       MOVE   "SC3003"       TO  WRK-ID 
                       MOVE    WRK-KAIP-PNO  TO  WRK-PRT-CTV
                       MOVE   ".red"         TO  WRK-FILE
                       MOVE    WRK-PRT-ID    TO  SPRT-PRTID
                   END-IF
               ELSE
                IF  FLG-HASIMOTO        =   1
                    IF  WRK-KAIP-PNO    =  "003"
                        MOVE   "SC3003"       TO  WRK-MID 
                        MOVE    WRK-KAIP-PNO  TO  WRK-MPRT-CTV
                        MOVE   "1.red"        TO  WRK-MFILE
                        MOVE    WRK-MPRT-ID   TO  SPRT-PRTID
                    ELSE
                        MOVE   "SC3003"       TO  WRK-ID 
                        MOVE    WRK-KAIP-PNO  TO  WRK-PRT-CTV
                        MOVE   ".red"         TO  WRK-FILE
                        MOVE    WRK-PRT-ID    TO  SPRT-PRTID
                    END-IF
                ELSE
                 IF  FLG-KUDOYAMA        =   1
                     IF  WRK-KAIP-PNO    =  "020"
                         MOVE   "SC3003"       TO  WRK-MID 
                         MOVE    WRK-KAIP-PNO  TO  WRK-MPRT-CTV
                         MOVE   "1.red"        TO  WRK-MFILE
                         MOVE    WRK-MPRT-ID   TO  SPRT-PRTID
                     ELSE
                         MOVE   "SC3003"       TO  WRK-ID 
                         MOVE    WRK-KAIP-PNO  TO  WRK-PRT-CTV
                         MOVE   ".red"         TO  WRK-FILE
                         MOVE    WRK-PRT-ID    TO  SPRT-PRTID
                     END-IF
                 ELSE
                   MOVE   "SC3003"           TO  WRK-ID 
                   MOVE    WRK-KAIP-PNO      TO  WRK-PRT-CTV
                   MOVE   ".red"             TO  WRK-FILE
                   MOVE    WRK-PRT-ID        TO  SPRT-PRTID
                 END-IF
                END-IF
               END-IF
           END-IF
           IF  WRK-KAIP-PNO            =  "018"
               MOVE    1               TO  FLG-KATSURAGI
           ELSE
               MOVE    ZERO            TO  FLG-KATSURAGI
           END-IF
           IF  WRK-KAIP-PNO            =  "003"
               MOVE    1               TO  FLG-HASIMOTO
           ELSE
               MOVE    ZERO            TO  FLG-HASIMOTO
           END-IF
           IF  WRK-KAIP-PNO            =  "020"
               MOVE    1               TO  FLG-KUDOYAMA
           ELSE
               MOVE    ZERO            TO  FLG-KUDOYAMA
           END-IF
      *
           MOVE    "¤Ò¤È¤ê¿Æ"          TO  SPRT-TITLE
           MOVE    SC03                TO  SPRT-PRTDATA
           MOVE    LNK-PRTKANRI-TERMID TO  SPRT-TERMID
           MOVE    LNK-PRTKANRI-OPID   TO  SPRT-OPID
           MOVE    LNK-PRTKANRI-PRTNM  TO  SPRT-PRTNM
           CALL    "ORCSPRT"           USING
                                       ORCSPRTAREA
                                       SPA-AREA
           IF      SPRT-RETURN         =   ZERO
               ADD     1               TO  CNT-PRINT
           ELSE
               MOVE    "Ä¢É¼£Ä£Â¤Ë¹¹¿·¤Ç¤­¤Þ¤»¤ó¤Ç¤·¤¿"
                                       TO  WRK-RECEERR
               PERFORM 500-ERR-HENSYU-SEC
           END-IF
      *    ¥ï¡¼¥¯²Ã»»¥¨¥ê¥¢¥¯¥ê¥¢
           MOVE    ZERO            TO  WRK-KOHFTN2
           MOVE    ZERO            TO  WRK-YKZFTN2
           MOVE    ZERO            TO  WRK-KOHKENSU2
           MOVE    ZERO            TO  WRK-YKZKENSU2
           MOVE    ZERO            TO  WRK-TOTALTEN2
           .
       390-PRINT-OUT-EXT.
           EXIT.
      *
      *****************************************************************
      *    Ä¢É¼ÊÔ½¸<¹ç·×>½èÍý
      *****************************************************************
       395-GOKEI-PRINT-SEC  SECTION.
      *
           ADD   1                 TO  CNT-PAGE
           MOVE  KEY-O-STSCD       TO  WRK-STSCD
           PERFORM 31014-GOUKEI-GET-SEC
      *    °åÎÅÈñÀÁµá³Û
           MOVE  WRK-KOHFTN        TO  WRK-GKINGKX
           MOVE  WRK-GKINGKX       TO  SC03-GAIRAI-GITBFTN
      *
      *    ÌôºÞ°ìÉôÉéÃ´ÀÁµá³Û
           MOVE  WRK-YKZFTN        TO  WRK-YKZFTNX
           MOVE  WRK-YKZFTNX       TO  SC03-GAIRAI-GYKZFTN
      *
      *    °åÎÅÈñÀÁµá·ï¿ô
           MOVE  WRK-KOHKENSU      TO  WRK-KOHKENSUX
           MOVE  WRK-KOHKENSUX     TO  SC03-GAIRAI-GKEN
      *
      *    ÌôºÞ°ìÉôÉéÃ´ÀÁµá·ï¿ô
           MOVE  WRK-YKZKENSU      TO  WRK-YKZKENSUX
           MOVE  WRK-YKZKENSUX     TO  SC03-GAIRAI-GYKZKEN
      *
           MOVE   "SC3003"         TO  WRK-GID
           MOVE    WRK-KAIP-PNO    TO  WRK-GPRT-CTV
           MOVE   "1.red"          TO  WRK-GFILE
           MOVE    WRK-GPRT-ID     TO  SPRT-PRTID
      *
           MOVE    "¤Ò¤È¤ê¿Æ"          TO  SPRT-TITLE
           MOVE    SC03                TO  SPRT-PRTDATA
           MOVE    LNK-PRTKANRI-TERMID TO  SPRT-TERMID
           MOVE    LNK-PRTKANRI-OPID   TO  SPRT-OPID
           MOVE    LNK-PRTKANRI-PRTNM  TO  SPRT-PRTNM
           CALL    "ORCSPRT"           USING
                                       ORCSPRTAREA
                                       SPA-AREA
           IF      SPRT-RETURN     =   ZERO
                ADD     1               TO  CNT-PRINT
           ELSE
               MOVE    "Ä¢É¼£Ä£Â¤Ë¹¹¿·¤Ç¤­¤Þ¤»¤ó¤Ç¤·¤¿"
                                   TO  WRK-RECEERR
               PERFORM 500-ERR-HENSYU-SEC
           END-IF
      *
      *    ¥ï¡¼¥¯²Ã»»¥¨¥ê¥¢¥¯¥ê¥¢
           MOVE    ZERO            TO  WRK-KOHFTN
           MOVE    ZERO            TO  WRK-YKZFTN
           MOVE    ZERO            TO  WRK-KOHKENSU
           MOVE    ZERO            TO  WRK-YKZKENSU
           MOVE    ZERO            TO  WRK-GKENSU
           .
       395-GOUKEI-PRINT-EXT.
           EXIT.
      *
      *****************************************************************
      *    Ä¢É¼ÊÔ½¸<¹ç·×>½èÍý¡¡¥Ñ¥¿¡¼¥ó£²
      *****************************************************************
       3951-GOKEI-PRINT-SEC  SECTION.
      *
           MOVE  KEY-O-STSCD       TO  WRK-STSCD
           PERFORM 31014-GOUKEI-GET-SEC
           .
       3951-GOUKEI-PRINT-EXT.
           EXIT.
      *
      *****************************************************************
      *    À¾ÎñÆüËÜ¸ìÊÑ´¹½èÍý
      *****************************************************************
       31012-SEIWA-HEN-SEC  SECTION.
      *
           INITIALIZE  STS-AREA-DAY
           INITIALIZE  LNK-DAY2-AREA
           MOVE  "21"      TO  LNK-DAY2-IRAI
           MOVE  WRK-SYMD  TO  LNK-DAY2-YMD
           CALL  "ORCSDAY" USING  STS-AREA-DAY
                                  LNK-DAY2-AREA
           MOVE  LNK-DAY2-EDTYMD3  TO  WRK-HENYMDG
           MOVE  LNK-DAY2-EDTYMD1  TO  WRK-HENYMDG1
           INSPECT WRK-HENYMDG REPLACING  ALL "  "  BY  "¡¡"
           .
       31012-SEIWA-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    »ÔÄ®Â¼¥Ç¡¼¥¿¼è¤ê¹þ¤ß
      *****************************************************************
       31013-KAIP-SEC       SECTION.
      *
           MOVE  MF100-KEY (7:3)      TO  WRK-KAIP-STSCD
           SET  IDX-MEI                TO  1  
           MOVE    TBL-KAIP-VAL        TO  TBL-KAIP
           SEARCH  TBL-KAIP-TBL   VARYING  IDX-MEI 
                                       AT  END
                   MOVE    "000"       TO  WRK-KAIP-PNO
                   MOVE    "05"        TO  WRK-KAIP-GYO
                   MOVE    "0"         TO  WRK-KAIP-GOUKEI
             WHEN  WRK-KAIP-STSCD      =   TBL-KAIP-STSCD (IDX-MEI)     
                   MOVE    TBL-KAIP-PNO (IDX-MEI)                     
                                       TO  WRK-KAIP-PNO 
                   MOVE    TBL-KAIP-GYO (IDX-MEI)
                                       TO  WRK-KAIP-GYO  
                   MOVE    TBL-KAIP-GOUKEI (IDX-MEI)
                                       TO  WRK-KAIP-GOUKEI            
           END-SEARCH
           .
       31013-KAIP-EXT.
           EXIT.
      *
      *****************************************************************
      *    ¹ç·×¼è¤ê¹þ¤ß
      *****************************************************************
       31014-GOUKEI-GET-SEC       SECTION.
      *
           SET  IDX-GOU            TO  1  
           SEARCH  SUM-GOKEI       VARYING  IDX-GOU 
                                   AT  END   
               MOVE  ZERO          TO  WRK-GKENSUX
               MOVE  ZERO          TO  WRK-GKOHFTNX
             WHEN    WRK-STSCD     =   SUM-STSCD (IDX-GOU)
  ¡¡¡¡*¡¡  ÀÁµá·ï¿ô
               MOVE  SUM-GKENSU  (IDX-GOU) TO  WRK-GKENSUX
  ¡¡           MOVE  WRK-GKENSUX   TO  SC03-GKEN
                                       SC03-GKEN2
      *    ÀÁµá·ï¿ô¡ÊÆþ±¡¡Ë
               MOVE  SUM-GKENSUNYU (IDX-GOU) TO  WRK-GKENSUX
               MOVE  WRK-GKENSUX   TO  SC03-GKENNYU
      *    ÀÁµá·ï¿ô¡Ê³°Íè¡Ë
               MOVE  SUM-GKENSUGAI (IDX-GOU) TO  WRK-GKENSUX
               MOVE  WRK-GKENSUX   TO  SC03-GKENGAI
  ¡¡¡¡*¡¡  ÀÁµá·ï¿ô¡Ê¹ñÊÝ¡Ë
               MOVE  SUM-GKENSUK (IDX-GOU) TO  WRK-GKENSUX
               MOVE  WRK-GKENSUX   TO  SC03-GKENK
  ¡¡¡¡*¡¡  ÀÁµá·ï¿ô¡Ê¼ÒÊÝ¡Ë
               MOVE  SUM-GKENSUS (IDX-GOU) TO  WRK-GKENSUX
               MOVE  WRK-GKENSUX   TO  SC03-GKENS
      *    ÅÀ¿ô
               MOVE  SUM-TENSU   (IDX-GOU) TO  WRK-GTENSUX
               MOVE  WRK-GTENSUX   TO  SC03-GGTENSU
      *    ÀÁµá¶â³Û
               IF  WRK-STSCD       =   "012" OR "035" OR "038"
                   MOVE  SUM-GTESU (IDX-GOU) TO  WRK-GTESUX
                   MOVE  WRK-GTESUX    TO   SC03-GTESU
                   MOVE  SUM-GKOHFTN (IDX-GOU) TO WRK-GKIN2
                   ADD   SUM-GTESU (IDX-GOU) TO  WRK-GKIN2
                   MOVE  WRK-GKIN2     TO  WRK-GKIN2X
                   MOVE  WRK-GKIN2X    TO   SC03-GKIN2
                   MOVE  SUM-GKOHFTN (IDX-GOU)  TO  WRK-GKOHFTNX
                   MOVE  WRK-GKOHFTNX  TO  SC03-GKIN
               ELSE
                   MOVE  SUM-GKOHFTN (IDX-GOU)  TO  WRK-GKOHFTNX
                   MOVE  WRK-GKOHFTNX  TO  SC03-GKIN
               END-IF
      *    ÌôºÞÉéÃ´
               MOVE  SUM-GYKZFTN (IDX-GOU)  TO  WRK-GYKZFTNX
               MOVE  WRK-GYKZFTNX  TO  SC03-GYKZFTN
           END-SEARCH
           .
       31014-GOUKEI-GET-EXT.
           EXIT.
      *
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
      *    ½ªÎ»¡¡¡¡½èÍý
      *****************************************************************
       300-END-SEC  SECTION.
      *
           CLOSE  MF100-FILE
      *
           MOVE  CNT-PAGE  TO  WRK-PARA-PAGE
      *
           DISPLAY "*** SEIKYU3004 IN   "  CNT-MF100
           DISPLAY "*** SEIKYU3004 PAGE "  CNT-PRINT
           DISPLAY "*** SEIKYU3004 END ***"
           .
       300-END-EXT.
           EXIT.
      *
      *****************************************************************
      *    ¥ì¥»¥×¥ÈÌÀºÙ½ñÆÉ¹þ
      *****************************************************************
       900-MF100-READ-SEC  SECTION.
      *
           READ  MF100-FILE  NEXT
             AT  END
               MOVE  1             TO  FLG-END
               MOVE  HIGH-VALUE    TO  MF100-KEY
             NOT AT  END
      ****        ÅÄÊÕ»Ô¹ñÊÝ°õºþÌµ¤·
      ****         IF  MF100-HKNJANUM-KEY    =  "300061  " OR "67300061"
      ****                                   OR "300343  " OR "67300343"
      ****                                   OR "300418  " OR "67300418"
      ****                                   OR "300517  " OR "67300517"
      ****           GO  TO  900-MF100-READ-SEC
      ****         ELSE
                 ADD   1                 TO  CNT-MF100
                 MOVE  MF100-KEY (7:3)  TO  KEY-N-STSCD
      ****         END-IF
           END-READ
           .
       900-MF100-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    ´ÉÍý¥Þ¥¹¥¿ÆÉ¤ß¹þ¤ß
      *****************************************************************
       800-SYSKANRI-READ-SEC  SECTION.
      *
           MOVE  "DBSELECT"           TO  MCP-FUNC
           MOVE   "tbl_syskanri"      TO  MCP-TABLE
           MOVE   "key10"             TO  MCP-PATHNAME
            CALL  "ORCDBMAIN"         USING
                                          MCPAREA
                                          MCPDATA-REC
                                          SPA-AREA
           IF  MCP-RC                  =   ZERO
               MOVE  "DBFETCH"         TO  MCP-FUNC
               MOVE  "tbl_syskanri"    TO  MCP-TABLE
               MOVE  "key10"           TO  MCP-PATHNAME
               CALL  "ORCDBMAIN"       USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
             IF  MCP-RC            =  ZERO
               MOVE  ZERO              TO  FLG-SYSKANRI
             ELSE
               MOVE  1                 TO  FLG-SYSKANRI
             END-IF
           ELSE
             MOVE  1                   TO  FLG-SYSKANRI
           END-IF
      *
           MOVE   "tbl_syskanri"       TO  MCP-TABLE
           MOVE   "key10"              TO  MCP-PATHNAME
           MOVE  "DBCLOSECURSOR"       TO  MCP-FUNC
           CALL  "ORCDBMAIN"           USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *
           .
       800-SYSKANRI-READ-EXT.
           EXIT.
      *      
      *****************************************************************
      *    ´µ¼Ô¥Þ¥¹¥¿¡¡¸¡º÷ 
      *****************************************************************
       900-PTHKNDB-SEC                    SECTION.
      *
           INITIALIZE                     PTHKNINF-REC
      *     MOVE    WRK-PARA-HOSPID        TO  PTHKN-HOSPID
           MOVE    WRK-PARA-HOSPNUM       TO  PTHKN-HOSPNUM
           MOVE    MF100-PTID             TO  PTHKN-PTID
           MOVE    MF100-HKNID            TO  PTHKN-HKNID
           MOVE    PTHKNINF-REC           TO  MCPDATA-REC
           MOVE    "DBSELECT"             TO  MCP-FUNC
           MOVE    "tbl_pthkninf"         TO  MCP-TABLE
           MOVE    "key"                  TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"            USING
                                              MCPAREA
                                              MCPDATA-REC
                                              SPA-AREA
           IF  MCP-RC  =  ZERO
               MOVE    "DBFETCH"          TO  MCP-FUNC
               MOVE    "tbl_pthkninf"     TO  MCP-TABLE
               MOVE    "key"              TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"        USING
                                          MCPAREA
                                          MCPDATA-REC
                                          SPA-AREA
               IF  MCP-RC  =  ZERO
                   MOVE    MCPDATA-REC    TO  PTHKNINF-REC
               END-IF  
           END-IF        
      *
           MOVE    "DBCLOSECURSOR"        TO  MCP-FUNC
           MOVE    "tbl_pthkninf"         TO  MCP-TABLE
           MOVE    "key"                  TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"            USING
                                              MCPAREA
                                              MCPDATA-REC
                                              SPA-AREA
           .
       900-PTHKNDB-EXT.
           EXIT.
      *
      *****************************************************************
      *    ´ÉÍý¥Þ¥¹¥¿¡¼ÆÉ¹þ¡Ê¥­¡¼¡Ë
      *****************************************************************
       900-HKNJAINF-INV-SEC      SECTION.
      *
           MOVE    "DBSELECT"          TO  MCP-FUNC
           MOVE    "tbl_hknjainf"      TO  MCP-TABLE
           MOVE    "key"               TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"       TO  MCP-FUNC
               MOVE    "tbl_hknjainf"  TO  MCP-TABLE
               MOVE    "key"           TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"     USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
               IF      MCP-RC          =   ZERO
                   MOVE    ZERO        TO  FLG-HKNJAINF
                   MOVE    MCPDATA-REC TO  HKNJAINF-REC
               ELSE
                   MOVE    1           TO  FLG-HKNJAINF
               END-IF
           ELSE
               MOVE    1               TO  FLG-HKNJAINF
           END-IF
      *
           MOVE    "DBCLOSECURSOR"     TO  MCP-FUNC
           MOVE    "tbl_hknjainf"      TO  MCP-TABLE
           MOVE    "key"               TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"       USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
           .
      *
       900-HKNJAINF-INV-EXT.
           EXIT.
      *****************************************************************
      *    £Ä£Â¡¡¥ª¡¼¥×¥ó½èÍý
      *****************************************************************
       100-DBOPEN-SEC  SECTION.
      *
           MOVE    LOW-VALUE       TO  MCP-TABLE
                                       MCP-PATHNAME
           MOVE    "DBOPEN"        TO  MCP-FUNC
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *
           MOVE    LOW-VALUE       TO  MCP-TABLE
                                       MCP-PATHNAME
           MOVE    "DBSTART"       TO  MCP-FUNC
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
           MOVE    LOW-VALUE       TO  MCP-TABLE
                                       MCP-PATHNAME
           MOVE    "DBDISCONNECT"  TO  MCP-FUNC
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
           .
       900-DBCLOSE-EXT.
           EXIT.
      *
