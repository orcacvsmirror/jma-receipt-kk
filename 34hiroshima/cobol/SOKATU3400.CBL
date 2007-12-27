      ******************************************************************
      * Project code name "ORCA"
      * 日医標準レセプトソフト（JMA standard receipt software）
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
       PROGRAM-ID.             SOKATU3400.
      *****************************************************************
      *  システム名        : ＯＲＣＡ
      *  サブシステム名    : 月次帳票
      *  コンポーネント名  : 国保・総括表（広島）用集計処理
      *  管理者            : 
      *  作成日付    作業者        記述
      *  05/04/18    有村          再作成(2.5.0対応)
      *****************************************************************
      *  プログラム修正履歴
      * Maj/Min/Rev  修正者     日付         内容
      *  01.00.01    有村     05/05/06    医療機関情報取得条件修正
      *  01.00.02    呉秀凡   05/12/01    返戻対応
      *  01.00.03    内田     07/07/06    特別療養費国保対応
      *  01.00.04    内田     07/09/07    日レセver4.0対応
      *                                   システム管理マスタ「1901」の
      *                                   医療機関情報を参照
      *****************************************************************
      *
       ENVIRONMENT                 DIVISION.
       CONFIGURATION               SECTION.
       INPUT-OUTPUT                SECTION.
       FILE-CONTROL.

      *    総括表一時ファイル  
           SELECT  SKT3400TMP-FILE ASSIGN  SKT3400TP
                                   ORGANIZATION    IS  INDEXED
                                   ACCESS  MODE    IS  DYNAMIC
                                   RECORD  KEY     IS  SKT3400TMP-KEY
                                   FILE    STATUS  IS  STS-SKT3400.
      *
006900*    請求ＤＢ更新用ファイル
           SELECT  UPD-FILE        ASSIGN  RECEUPD
                                   FILE    STATUS  IS  STS-RECEUPD.
      *
      *    印刷用データ
           SELECT  PRT-FILE        ASSIGN  HC01PARA
                                   FILE    STATUS  IS  STS-PARA.
      *
006900*    エラーファイル
           SELECT  RECEERR-FILE    ASSIGN  RECEERR
                                   FILE    STATUS  IS  STS-RECEERR.
      *
      *
           SELECT  SRYKA-FILE    ASSIGN FILE-NAME
                                 ORGANIZATION   IS  LINE SEQUENTIAL
                                 ACCESS MODE    IS  SEQUENTIAL
                                 FILE   STATUS  IS  STS-SRYKA.
      *
           SELECT  YUSEN-FILE    ASSIGN FILE-NAME
                                 ORGANIZATION   IS  LINE SEQUENTIAL
                                 ACCESS MODE    IS  SEQUENTIAL
                                 FILE   STATUS  IS  STS-YUSEN.
      *
       DATA                        DIVISION.
       FILE                        SECTION.
      *
      *    総括表一時ファイル  
       FD  SKT3400TMP-FILE.
           COPY    "CPSKT3400TMP.INC".
      *
006900*    請求ＤＢ更新用ファイル
       FD  UPD-FILE.
           COPY    "CPRCF010.INC"  REPLACING  //RECE10//
                                   BY         //RECE10X//.
      *
      *    印刷用データ
       FD  PRT-FILE.
       01  PRT-REC                 PIC X(3000).
      *
006900*    エラーファイル
       FD  RECEERR-FILE.
       01  RECEERR-REC             PIC X(200). 
      *
      *    優先保険者番号ファイル
       FD  SRYKA-FILE.
      *
       01  SRYKA-REC.
           03  SRYKA-SRYKANAME           PIC X(30).
           03  FILLER                    PIC X(01).
      *
      *    優先保険者番号ファイル
       FD  YUSEN-FILE.
       01  YUSEN-HKNJANUM             PIC X(06). 
      *
      *
       WORKING-STORAGE             SECTION.
      *
      *    印刷用データ 名称領域 
           COPY    "CPCOMMONPRT.INC".
      *
      *    総括表一時ファイル 名称領域 
           COPY    "CPCOMMONDAT2.INC"
                                   REPLACING  //RECE01PARA//
                                   BY         //SKT3400TP//.
      *
      *    請求ＤＢ更新用ファイル 名称領域 
           COPY    "CPCOMMONDAT2.INC"
                                   REPLACING  //RECE01PARA//
                                   BY         //RECEUPD//.
           03  FILLER              PIC X(04)   VALUE   ".dat".
      *
      *    エラーファイル 名称領域 
      *---(01.00.04) LINE ADD START ------------------------------------
      *     COPY    "CPCOMMONDAT2.INC"
      *                             REPLACING  //RECE01PARA//
      *                             BY         //RECEERR//.
           03  FILLER              PIC X(04)   VALUE   ".dat".
           COPY    "CPERRFL.INC"    REPLACING  //ERRFLPARA//
                                    BY         //RECEERR//.
      *---(01.00.04) LINE ADD END   ------------------------------------
      *     
      *    シェル用領域
           COPY    "CPCOMMONSHELL.INC".
      *
      *    印刷用領域
           COPY    "SKT3400.INC".
      *
      *    スパ領域
       01  STS-AREA.
           03  STS-PARA            PIC X(02).
           03  STS-SKT3400         PIC X(02).
           03  STS-RECE10          PIC X(02).
           03  STS-RECEERR         PIC X(02).
           03  STS-RECEUPD         PIC X(02).
           03  STS-SRYKA           PIC X(02).
           03  STS-YUSEN           PIC X(02).
      *
      *    フラグ領域
       01  FLG-AREA.
           03  FLG-END             PIC 9(01).
           03  FLG-SKT3400TMP      PIC 9(01).
           03  FLG-RECE10          PIC 9(01).
           03  FLG-SYSKANRI        PIC 9(01).
           03  FLG-HKNNUM          PIC 9(01).
           03  FLG-HKNJAINF        PIC 9(01).
           03  FLG-UPD             PIC 9(01).
           03  FLG-UPDFILE         PIC 9(01).
           03  FLG-SEIKYU          PIC 9(01).
           03  FLG-PRINT           PIC 9(01).
           03  FLG-GOKEI1          PIC 9(01).
           03  FLG-GOKEI2          PIC 9(01).
           03  FLG-PTINF           PIC 9(01).
      *
      *    添字領域
       01  IDX-AREA.
           03  IDX1                PIC 9(04).
           03  IDX2                PIC 9(04).
      *
      *    システム領域
       01  SYS-AREA.
           03  SYS-TIME            PIC 9(08).    
      *
      *    パラメタ領域
       01  WRK-PARA.
           COPY    "CPORCSPRTLNK.INC".
           03  WRK-PARA-JOBID      PIC 9(07).
           03  WRK-PARA-SHELLID    PIC X(08).
      *---(01.00.04) LINE ADD START ------------------------------------
      *     03  WRK-PARA-HOSPID     PIC X(24).
           03  WRK-PARA-HOSPNUM    PIC 9(02).
      *---(01.00.04) LINE ADD END   ------------------------------------
           03  WRK-PARA-PAGE       PIC 9(10).
      ****2005/12/01 @@@@-BRAND  START
           03  WRK-PARA-SYOKBN     PIC X(01).
      ****2005/12/01 @@@@-BRAND  END
      *---(01.00.03) LINE ADD START ------------------------------------
           03  WRK-PARA-TOKUBETU   PIC X(01).
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
      *    一時領域
       01  WRK-AREA.
           03  WRK-SEIYMD        PIC X(08).
           03  WRK-SEIYMDWH      PIC X(20).
           03  WRK-SRYYMWH       PIC X(16).
           03  WRK-SRYYMD        PIC X(08).
           03  WRK-HKNJANUM.
               05  WRK-HKNJANUM1 PIC 9(02).
               05  WRK-HKNJANUM2 PIC 9(03).
               05  WRK-HKNJANUM3 PIC 9(01).
               05  WRK-HKNJANUM4 PIC 9(02).
      *    ファイル名称用エリア
           03  FILE-NAME        PIC X(512).
           03  WRK-SRYKACD      PIC X(02).
           03  KEY-NEW          PIC X(01).
           03  KEY-OLD          PIC X(01).
           03  WRK-SRYKANAME    PIC X(30) OCCURS 3.
      *
      *  
           03  WRK-SYMD.
               05  WRK-SYY           PIC 9(04).
               05  WRK-SMM           PIC 9(02).
               05  WRK-SDD           PIC 9(02).
           03  WRK-HENYMDG           PIC X(22).
      *
           03  WRK-Z9-6              PIC ZZ,ZZZ.
           03  WRK-Z9-11             PIC ZZZ,ZZZ,ZZZ.
           03  WRK-Z9-14             PIC ZZ,ZZZ,ZZZ,ZZZ.
      *
           03  WRK-RECEERR           PIC X(200). 
      *
           03  WRK-HC01PARA-CNT      PIC  9(06).
      *
           03  WRK-KBN               PIC  9(02).
      *
      *---(01.00.04) LINE ADD START ------------------------------------
      ****2005/12/01 @@@@-BRAND  START
      *     03  WRK-PATH.
      *         05  FILLER          PIC S9(09)  BINARY.
      *         05  FILLER          PIC S9(09)  BINARY.
      *         05  FILLER          PIC S9(09)  BINARY.
      ****2005/12/01 @@@@-BRAND  END
           03  WRK-PATH            PIC X(50).
      *    医療機関情報
           03  WRK-HOSPNAME        PIC X(100).
           03  WRK-HOSPNAME-R      REDEFINES   WRK-HOSPNAME.
               05  WRK-HOSPNAME1   PIC X(50).
               05  WRK-HOSPNAME2   PIC X(50).
           03  WRK-HOSPADRS        PIC X(100).
           03  WRK-HOSPADRS-R      REDEFINES   WRK-HOSPADRS.
               05  WRK-HOSPADRS1   PIC X(50).
               05  WRK-HOSPADRS2   PIC X(50).
           03  WRK-HOSPTEL         PIC X(15).
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
      *    カウント領域
       01  CNT-AREA.
           03  CNT-PAGE              PIC 9(03).
           03  CNT-RECE10            PIC 9(06).
           03  CNT-UPDFILE           PIC 9(06).
      *
      *    集計領域
       01  SUM-AREA.
           03  SUM-NYUIN.
               05  SUM-N-KENSU1       PIC  9(06).
               05  SUM-N-TENSU1       PIC  9(10).
               05  SUM-N-KENSU2       PIC  9(06).
               05  SUM-N-TENSU2       PIC  9(10).
           03  SUM-GAIRAI.
               05  SUM-G-KENSU1       PIC  9(06).
               05  SUM-G-TENSU1       PIC  9(10).
               05  SUM-G-KENSU2       PIC  9(06).
               05  SUM-G-TENSU2       PIC  9(10).
      *
           COPY    "CPSHELLTBL.INC".
      *     
      *---(01.00.04) LINE ADD START ------------------------------------
      *     COPY    "ORCA-DBPATH".
           COPY    "COMMON-SPA".
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
      *****************************************************************
      *    ファイルレイアウト
      *****************************************************************
      *
      *    保険者情報
       01  HKNJAINF-REC.
           COPY    "CPHKNJAINF.INC".
      *
      *    患者
       01  PTINF-REC.
           COPY    "CPPTINF.INC".
      *
      *    ＪＯＢ管理ＤＢ
       01  JOBKANRI-REC.
           COPY    "CPJOBKANRI.INC".
      *
      *    システム管理マスタ
           COPY    "CPSYSKANRI.INC".
      *
      *    医療機関情報
           COPY    "CPSK1001.INC".
      *
      *    医療機関情報−所在地、連絡先 
           COPY    "CPSK1002.INC".
      *    診療科目情報情報
           COPY    "CPSK1005.INC".
      *
      *---(01.00.04) LINE ADD START ------------------------------------
      *    医療機関編集情報
           COPY    "CPSK1900.INC".
      *
      *    医療機関名称編集情報
           COPY    "CPSK1901.INC".
      *
      *    医療機関住所編集情報
           COPY    "CPSK1902.INC".
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
      *    請求管理情報
           COPY    "CPRCF010.INC".
      *
      *    印刷管理マスタ
       01  PRTKANRI-REC.
           COPY    "CPPRTKANRI.INC".
      *
      *    印刷マスタ
       01  PRTDATA-REC.
           COPY    "CPPRTDATA.INC".

      * 
      ******************************************************************
      *    サブプロ用  領域
      *****************************************************************
      *
      *   日付変換サブ
           COPY    "CPORCSDAY.INC".
           COPY    "CPORCSLNK.INC".
      *
      *    共通パラメタ
           COPY    "MCPAREA".
      *
           COPY    "MCPDATA.INC".
      *
      *   ジョブ管理ＤＢ制御サブ
           COPY    "CPORCSJOBKANRI.INC".
      *
      *    印刷ＤＢ制御サブ
           COPY    "CPORCSPRT.INC".          
      *
      *    ファイルディレクトリ位置指定サブ
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
      *    主    処理
      *****************************************************************
       000-PROC-SEC                SECTION.
      *
           DISPLAY "*** SOKATU3400 START ***"
      *
           PERFORM  100-INIT-SEC
      *
           PERFORM  200-MAIN-SEC
                    UNTIL   FLG-END   =   1
      *
           PERFORM  300-END-SEC
      *
           STOP     RUN
      *
           .
      *
      *****************************************************************
      *    初期  処理
      *****************************************************************
       100-INIT-SEC                SECTION.
      *
           INITIALIZE                   FLG-AREA
           INITIALIZE                   STS-AREA
           INITIALIZE                   WRK-AREA
           INITIALIZE                   CNT-AREA
           INITIALIZE                   SUM-AREA
           INITIALIZE                   IDX-AREA
      *
           ACCEPT     SYS-TIME          FROM    TIME     
      *
           PERFORM    100-DBOPEN-SEC
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
      ****2005/12/01  @@@@-BRAND  START
      *                                         WRK-PARA-JOBID
      *                                         WRK-PARA-SHELLID
      *                                         WRK-PARA-HOSPID
      *---(01.00.04) LINE ADD START ------------------------------------
      *                                         WRK-PARA-HOSPID
                                               WRK-PARA-HOSPNUM
      *---(01.00.04) LINE ADD END   ------------------------------------
                                               WRK-PARA-JOBID
                                               WRK-PARA-SHELLID
                                               WRK-PARA-SYOKBN
      ****2005/12/01  @@@@-BRAND  END
      *---(01.00.03) LINE ADD START ------------------------------------
                                               WRK-PARA-TOKUBETU
      *---(01.00.03) LINE ADD END   ------------------------------------
      *---(01.00.04) LINE ADD START ------------------------------------
                                               RECEERR
      *---(01.00.04) LINE ADD END   ------------------------------------
           END-UNSTRING
      *---(01.00.04) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  SPA-HOSPNUM
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
      *    ステップ開始処理
           MOVE    "STS"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
      *---(01.00.04) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.04) LINE ADD END   ------------------------------------
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           MOVE    "SOKATU3400"    TO  JOB-PGID
           MOVE    "診療報酬総括表" 
                                   TO  JOB-SHELLMSG
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA  
                                   JOBKANRI-REC
      *---(01.00.04) LINE ADD START ------------------------------------
                                   SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------

           MOVE    "SKT3400"           TO  SKT3400TP-FILE-ID
           MOVE    LNK-PRTKANRI-TERMID     TO  SKT3400TP-TERMID
      *---(01.00.04) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  SKT3400TP-HOSPNUM
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
           MOVE    "RECEUPD"           TO  RECEUPD-FILE-ID
           MOVE    LNK-PRTKANRI-TERMID     TO  RECEUPD-TERMID
      *---(01.00.04) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  RECEUPD-HOSPNUM
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
      *---(01.00.04) LINE ADD START ------------------------------------
      *     MOVE    "RECEERR"           TO  RECEERR-FILE-ID
      *     MOVE    LNK-PRTKANRI-TERMID     TO  RECEERR-TERMID
      *---(01.00.04) LINE ADD END   ------------------------------------
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
      *    医療機関ＩＤ編集
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
      *---(01.00.04) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM         TO  SYS-1001-HOSPNUM
      *---(01.00.04) LINE ADD END   ------------------------------------
           MOVE    SYS-1001-REC        TO  MCPDATA-REC
           PERFORM 900-SYSKANRI-INV-SEC
           IF      FLG-SYSKANRI        =   ZERO
               MOVE    MCPDATA-REC         TO  SYS-1001-REC
               IF      SYS-1001-HOSPNAME   =   LOW-VALUE
                   MOVE    SPACE               TO  SYS-1001-HOSPNAME
               END-IF    
               IF      SYS-1001-KAISETUNAME    =   LOW-VALUE
                   MOVE    SPACE               TO  SYS-1001-KAISETUNAME
               END-IF    
           ELSE
               MOVE    "医療機関情報が取得できませんでした"
                                           TO  WRK-RECEERR
               PERFORM 500-ERR-HENSYU-SEC
               MOVE    1                   TO  FLG-END
           END-IF
      *
      *    医療機関情報−所在地、連絡先
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
      *---(01.00.04) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM         TO  SYS-1002-HOSPNUM
      *---(01.00.04) LINE ADD END   ------------------------------------
           MOVE    SYS-1002-REC        TO  MCPDATA-REC
           PERFORM 900-SYSKANRI-INV-SEC
           IF      FLG-SYSKANRI        =   ZERO
               MOVE    MCPDATA-REC        TO  SYS-1002-REC
               IF      SYS-1002-ADRS       =   LOW-VALUE
                   MOVE    SPACE               TO  SYS-1002-ADRS
               END-IF
           ELSE
               MOVE    "医療機関情報（所在地）が取得できませんでした"
                                           TO  WRK-RECEERR
               PERFORM 500-ERR-HENSYU-SEC
               MOVE    1                   TO  FLG-END
           END-IF
      *
      *---(01.00.04) LINE ADD START ------------------------------------
           MOVE    SYS-1001-HOSPNAME   TO  WRK-HOSPNAME
           MOVE    SYS-1002-ADRS       TO  WRK-HOSPADRS
           MOVE    SYS-1002-TEL        TO  WRK-HOSPTEL
      *    医療機関編集情報
           PERFORM 900-1900-READ-SEC
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
      *    標榜科名取得
           PERFORM  110-INI-FILE-SEC
      *
           OPEN     OUTPUT  UPD-FILE
      *  
      *
      ****2005/12/01 @@@@-BRAND  START
      *     MOVE    PATH-TBL-SEIKYU-KEY4    TO  WRK-PATH
      *---(01.00.03) LINE ADD START ------------------------------------
      *      EVALUATE    WRK-PARA-SYOKBN
      *          WHEN   "2"
      *                MOVE   PATH-TBL-SEIKYU-KEY37  TO  WRK-PATH
      *          WHEN   "1"
      *                MOVE   PATH-TBL-SEIKYU-KEY38  TO  WRK-PATH
      *      END-EVALUATE
           EVALUATE    WRK-PARA-SYOKBN  ALSO  WRK-PARA-TOKUBETU
               WHEN   "2"               ALSO  "1"
      *---(01.00.04) LINE ADD START ------------------------------------
      *               MOVE   PATH-TBL-SEIKYU-KEY37  TO  WRK-PATH
                   MOVE    "key37"               TO  WRK-PATH
      *---(01.00.04) LINE ADD END   ------------------------------------
               WHEN   "1"               ALSO  "1"
      *---(01.00.04) LINE ADD START ------------------------------------
      *               MOVE   PATH-TBL-SEIKYU-KEY38  TO  WRK-PATH
                   MOVE    "key38"               TO  WRK-PATH
      *---(01.00.04) LINE ADD END   ------------------------------------
               WHEN   "2"               ALSO  "2"
      *---(01.00.04) LINE ADD START ------------------------------------
      *               MOVE   PATH-TBL-SEIKYU-KEY39  TO  WRK-PATH
                   MOVE    "key39"               TO  WRK-PATH
      *---(01.00.04) LINE ADD END   ------------------------------------
               WHEN   "1"               ALSO  "2"
      *---(01.00.04) LINE ADD START ------------------------------------
      *               MOVE   PATH-TBL-SEIKYU-KEY40  TO  WRK-PATH
                    MOVE    "key40"               TO  WRK-PATH
      *---(01.00.04) LINE ADD END   ------------------------------------
           END-EVALUATE
      *---(01.00.03) LINE ADD END   ------------------------------------
      ****2005/12/01 @@@@-BRAND  END
           PERFORM  900-SEIKYU-SELECT-SEC
      *
           .
      *
       100-INIT-EXT.
           EXIT.
      *****************************************************************
      *    標榜科名取得処理  04/01/16 INS
      *****************************************************************
       110-INI-FILE-SEC                SECTION.
      *
      *
      *    ファイルディレクトリ位置指定
           INITIALIZE           ORCSMKPASSAREA
           MOVE  "data/SRYKA.INI"     TO  MKPASS-IN-01
           CALL  "ORCSMKPASSSITE"  USING  ORCSMKPASSAREA
           MOVE  MKPASS-OT-01  TO  FILE-NAME
      *
           DISPLAY "ファイル名="  FILE-NAME
      *
      *
           INITIALIZE   SRYKA-REC
      *
           OPEN  INPUT  SRYKA-FILE
           PERFORM  VARYING  IDX1  FROM  1  BY  1
                    UNTIL    IDX1  >     3
             READ SRYKA-FILE
               AT END
                 INITIALIZE        SRYKA-REC
             END-READ
      *
             DISPLAY "診療科名取得=" SRYKA-SRYKANAME
             IF    SRYKA-SRYKANAME(1:2)  =  "※"
               MOVE   SPACE             TO  WRK-SRYKANAME(IDX1)
             ELSE
               MOVE   SRYKA-SRYKANAME   TO  WRK-SRYKANAME(IDX1)
             END-IF
           END-PERFORM
      *
           CLOSE SRYKA-FILE
      *
      *    優先保険者番号INIファイル読み込み処理
      *    ファイルディレクトリ位置指定
           INITIALIZE           ORCSMKPASSAREA
           MOVE  "data/YUSEN.INI"     TO  MKPASS-IN-01
           CALL  "ORCSMKPASSSITE"  USING  ORCSMKPASSAREA
           MOVE  MKPASS-OT-01  TO  FILE-NAME
      *
           DISPLAY "ファイル名="  FILE-NAME
      *
           INITIALIZE   YUSEN-HKNJANUM
      *
           OPEN  INPUT  YUSEN-FILE
      *
           READ YUSEN-FILE
             AT END
               INITIALIZE        YUSEN-HKNJANUM
             DISPLAY "読み込み失敗"  
           END-READ
      *
           DISPLAY "優先保険者番号="  YUSEN-HKNJANUM
      *
           CLOSE YUSEN-FILE
      *
           .
       110-INI-FILE-EXT.
           EXIT.
      *
      *****************************************************************
      *    主    処理
      *****************************************************************
       200-MAIN-SEC               SECTION.
      *
           OPEN     OUTPUT  SKT3400TMP-FILE
           CLOSE            SKT3400TMP-FILE
           OPEN     I-O     SKT3400TMP-FILE
      *
           INITIALIZE             SUM-AREA
      *
           MOVE     ZERO    TO        FLG-END
           PERFORM  2001-KOKUHO-SYUKEI-SEC
                    UNTIL   FLG-END   =   1
      *
           CLOSE   SKT3400TMP-FILE
      *
           IF       FLG-UPD   =       1
                    MOVE      ZERO    TO     WRK-KBN
                    PERFORM   2002-PRINT-SEC
           END-IF
      *
           CLOSE   UPD-FILE
           .
      *
       200-MAIN-EXT.
           EXIT.
      *****************************************************************
      *    終了    処理
      *****************************************************************
       300-END-SEC                     SECTION.
      *
           IF      CNT-RECE10          =   ZERO 
                   CONTINUE
           ELSE
                   IF      FLG-UPD     =   1
                           PERFORM     3001-SEIKYU-UPDATE-SEC
                   END-IF
           END-IF    
      *
           MOVE  CNT-PAGE  TO  WRK-PARA-PAGE
      *
           DISPLAY "*** SOKATU3400 IN  "  CNT-RECE10 
           DISPLAY "*** SOKATU3400 END ***"
      *
      *    ステップ終了処理
           MOVE    "STE"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
      *---(01.00.04) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.04) LINE ADD END   ------------------------------------
           MOVE    WRK-PARA-PAGE   TO  JOB-UPDCNT
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA  
                                   JOBKANRI-REC
      *---(01.00.04) LINE ADD START ------------------------------------
                                   SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------

           PERFORM 900-DBDISCONNECT-SEC
      *
           .
      *
       300-END-EXT.
           EXIT.
      *****************************************************************
      *    保険者番号別集計処理                        
      *****************************************************************
       2001-KOKUHO-SYUKEI-SEC               SECTION.
      *
      *     MOVE     ZERO    TO      FLG-UPD
      *
      *TMP-FILE キーセット
      *
           INITIALIZE       SKT3400TMP-REC
           INITIALIZE       SKT3400TMP-HKNJANUM
           INITIALIZE       WRK-HKNJANUM
      *
           IF       RECE10-HKNJANUM(7:2)  =     SPACE
                    MOVE    RECE10-HKNJANUM(1:6)    TO
                            WRK-HKNJANUM(1:6)
                    MOVE    RECE10-HKNJANUM(1:6)    TO
                            SKT3400TMP-HKNJANUM(1:6)
           ELSE
                    MOVE    RECE10-HKNJANUM(3:6)    TO
                            WRK-HKNJANUM(1:6)
                    MOVE    RECE10-HKNJANUM(3:6)    TO
                            SKT3400TMP-HKNJANUM(1:6)
           END-IF
      *
      *    指定した保険者→広島市内保険者→県内市町村→県内国保組合→
      *    →県内扱い国保組合→県外保険者の順に印刷
           IF    YUSEN-HKNJANUM   =  SKT3400TMP-HKNJANUM
             MOVE          1   TO    SKT3400TMP-SYUTURYOKU
           ELSE
             IF  SKT3400TMP-HKNJANUM (1:3) = "344"
               MOVE          2   TO    SKT3400TMP-SYUTURYOKU
             ELSE
               IF  RECE10-PREFKBN          = "1"
                 IF  SKT3400TMP-HKNJANUM(3:1)  =  "3"
                   IF  RECE10-PREFNUM      = "34"
                     MOVE    4   TO    SKT3400TMP-SYUTURYOKU
                   ELSE
                     MOVE    5   TO    SKT3400TMP-SYUTURYOKU
                   END-IF
                 ELSE
                   MOVE      3   TO    SKT3400TMP-SYUTURYOKU
                 END-IF
               ELSE
                 MOVE        6   TO    SKT3400TMP-SYUTURYOKU
               END-IF
             END-IF
           END-IF
      *
            IF  RECE10-PREFKBN = "1"
                  PERFORM   2101-KENNAI-SEC
            ELSE
                  PERFORM   2102-KENGAI-SEC
            END-IF
      *
            PERFORM   900-TMP-READ-SEC
            PERFORM   220-HKN-SYUKEI-SEC
      *
      *    集計の対象にならなかったとき                
           IF     FLG-UPD        =       1
                  PERFORM   240-UPD-FILE-HENSYU-SEC
      *
                  PERFORM   900-SEIKYU-READ-SEC
           ELSE
                  MOVE      SPACE TO      WRK-RECEERR
                  STRING    "集計対象外  患者番号＝"
                                               DELIMITED  BY  SIZE
                            RECE10-PTNUM       DELIMITED  BY  SPACE
                            " 診療年月＝"      DELIMITED  BY  SIZE
                            RECE10-SRYYM       DELIMITED  BY  SIZE
                            " レセ種別＝"      DELIMITED  BY  SIZE
                            RECE10-RECESYUBETU DELIMITED  BY  SIZE
                         INTO                  WRK-RECEERR
                  END-STRING                                
                  PERFORM   500-ERR-HENSYU-SEC
                  MOVE      1         TO        FLG-END
           END-IF
      *
           .
      *
       2001-KOKUHO-SYUKEI-EXT.
           EXIT.
      *****************************************************************
      *    県内処理
      *****************************************************************
       2101-KENNAI-SEC        SECTION.
      *
      *    県区分
           MOVE     1         TO        SKT3400TMP-KBN
                                        WRK-KBN
      *
           IF    RECE10-NYUGAIKBN    =  "1"
             ADD      1                    TO  SUM-N-KENSU1
             ADD      RECE10-TOTALTEN(1)   TO  SUM-N-TENSU1
           ELSE
             ADD      1                    TO  SUM-G-KENSU1
             ADD      RECE10-TOTALTEN(1)   TO  SUM-G-TENSU1
           END-IF
      *
      *
           .
      *
       2101-KENNAI-EXT.
           EXIT.
      *****************************************************************
      *    県外処理
      *****************************************************************
       2102-KENGAI-SEC        SECTION.
      *
      *    県区分
           MOVE     2         TO        SKT3400TMP-KBN
                                        WRK-KBN
      *
      *
           IF    RECE10-NYUGAIKBN    =  "1"
             ADD      1                    TO  SUM-N-KENSU2
             ADD      RECE10-TOTALTEN(1)   TO  SUM-N-TENSU2
           ELSE
             ADD      1                    TO  SUM-G-KENSU2
             ADD      RECE10-TOTALTEN(1)   TO  SUM-G-TENSU2
           END-IF
      *
           .
      *
       2102-KENGAI-EXT.
           EXIT.
      *****************************************************************
      *    医療保険・老人保健分集計処理
      *****************************************************************
       220-HKN-SYUKEI-SEC               SECTION.
      *
      *    入院
           IF   RECE10-NYUGAIKBN    =     1
      *         件数
                ADD      1    TO   SKT3400TMP-N-KENSU
      *
      *         点数
                COMPUTE  SKT3400TMP-N-TENSU       =
                         SKT3400TMP-N-TENSU       +
                         RECE10-TOTALTEN(1)
      *
      *    入院外
           ELSE
      *         件数
                ADD      1    TO   SKT3400TMP-G-KENSU
      *
      *         点数
                COMPUTE  SKT3400TMP-G-TENSU       =
                         SKT3400TMP-G-TENSU       +
                         RECE10-TOTALTEN(1)
           END-IF
      *
           IF      FLG-SKT3400TMP     =          1
                   WRITE    SKT3400TMP-REC
           ELSE
                   REWRITE  SKT3400TMP-REC
           END-IF
      *
           MOVE    1               TO  FLG-UPD 
      *
           .
      *
       220-HKN-SYUKEI-EXT.
           EXIT.
      *****************************************************************
      *    公費負担分処理                           
      *****************************************************************
       230-KOHI-SYUKEI-SEC            SECTION.
      *
           PERFORM  VARYING IDX1  FROM  1 BY  1
                    UNTIL   IDX1  >     4
      *
                    IF  RECE10-KOHNUM(IDX1)   NOT =   SPACE
      *
                        INITIALIZE                 SKT3400TMP-REC
                        MOVE  WRK-KBN(2:1)    TO   SKT3400TMP-KBN
                        MOVE  WRK-HKNJANUM(1:6)
                                            TO     SKT3400TMP-HKNJANUM
      *
                        PERFORM 900-TMP-READ-SEC
                        PERFORM 2301-KOH-SYUKEI-SEC
                    END-IF
           END-PERFORM
      *
           .
      *
       230-KOHI-SYUKEI-EXT.
           EXIT.
      *****************************************************************
      *    公費負担分集計処理
      *****************************************************************
       2301-KOH-SYUKEI-SEC        SECTION.
      *
           COMPUTE  IDX2      =    IDX1      +    1
      *
      *    入院
           IF   RECE10-NYUGAIKBN    =     1
      *         件数
                ADD      1    TO   SKT3400TMP-N-KENSU
      *
      *         点数
                COMPUTE  SKT3400TMP-N-TENSU       =
                         SKT3400TMP-N-TENSU       +
                         RECE10-TOTALTEN(IDX2)
      *
      *    入院外
           ELSE
      *         件数
                ADD      1    TO   SKT3400TMP-G-KENSU
      *
      *         点数
                COMPUTE  SKT3400TMP-G-TENSU       =
                         SKT3400TMP-G-TENSU       +
                         RECE10-TOTALTEN(IDX2)
           END-IF
      *
           IF      FLG-SKT3400TMP     =          1
                   WRITE    SKT3400TMP-REC
           ELSE
                   REWRITE  SKT3400TMP-REC
           END-IF
      *
           .
      *
       2301-KOH-SYUKEI-EXT.
           EXIT.
      *****************************************************************
      *    請求ＤＢ更新用ファイル出力処理             
      *****************************************************************
       240-UPD-FILE-HENSYU-SEC         SECTION.
      *
      *    集計の対象にならなかったとき                
           IF     FLG-UPD   NOT   =       1
                  MOVE      SPACE TO      WRK-RECEERR
                  STRING    "集計対象外  患者番号＝"
                                               DELIMITED  BY  SIZE
                            RECE10-PTNUM       DELIMITED  BY  SPACE
                            " 診療年月＝"      DELIMITED  BY  SIZE
                            RECE10-SRYYM       DELIMITED  BY  SIZE
                            " レセ種別＝"      DELIMITED  BY  SIZE
                            RECE10-RECESYUBETU DELIMITED  BY  SIZE
                         INTO                  WRK-RECEERR
                  END-STRING                                
                  PERFORM   500-ERR-HENSYU-SEC
                  MOVE      1         TO        FLG-END
                  GO        TO        240-UPD-FILE-HENSYU-EXT 
           END-IF
      *
           MOVE   RECE10-REC          TO        RECE10X-REC
           WRITE  RECE10X-REC
      *
           ADD    1                   TO        CNT-UPDFILE
      *
           .
      *
       240-UPD-FILE-HENSYU-EXT.
           EXIT.
      *****************************************************************
      *    帳票ファイル出力処理                    
      *****************************************************************
       2002-PRINT-SEC                          SECTION.
      *
           DISPLAY "2002-PRINT-SEC"
      *
      *    TMPファイル読み込み
           INITIALIZE    SKT3400TMP-REC
           OPEN     INPUT       SKT3400TMP-FILE
           PERFORM  900-TMP-READ2-SEC
           MOVE    KEY-NEW    TO    KEY-OLD
           MOVE    ZERO       TO    FLG-PRINT
                                    FLG-GOKEI1
                                    FLG-GOKEI2
      *
           PERFORM    UNTIL    FLG-PRINT  =  1
      *    帳票編集<見出し>処理
             PERFORM   310-HEAD-HEN-SEC
      *    帳票編集<保険明細>処理
             PERFORM   320-BODY-HEN-SEC
      *    帳票印刷処理
             PERFORM   330-PRINT-OUT-SEC
           END-PERFORM
      *
           CLOSE   SKT3400TMP-FILE
      *
           .
      *
       2002-PRINT-EXT.
           EXIT.
      *****************************************************************
      *    帳票編集<ヘッダー部>処理
      *****************************************************************
       310-HEAD-HEN-SEC             SECTION.
      *
           DISPLAY "310-HEAD-HEN-SEC"
           INITIALIZE                             SKT3400
      *
           MOVE     WRK-SRYYMWH              TO   SKT3400-SEIYM
      *
      *---(01.00.04) LINE ADD START ------------------------------------
      *    医療機関住所
      *     MOVE     SYS-1002-ADRS            TO   SKT3400-ADRS
      *    医療機関名
      *     MOVE     SYS-1001-HOSPNAME        TO   SKT3400-HOSPNAME
      *    医療機関住所
           MOVE    WRK-HOSPADRS              TO   SKT3400-ADRS
      *    医療機関名
           MOVE    WRK-HOSPNAME              TO   SKT3400-HOSPNAME
      *---(01.00.04) LINE ADD END   ------------------------------------
      *    医療機関コード
           MOVE     SYS-1001-HOSPCDN         TO   SKT3400-HOSPCD
      *    郵便番号１
           MOVE     SYS-1002-POST(1:3)       TO   SKT3400-POST1
      *    郵便番号２
           MOVE     SYS-1002-POST(4:4)       TO   SKT3400-POST2
      *    標榜科名
           PERFORM  VARYING  IDX1  FROM  1  BY  1
                    UNTIL    IDX1  >     3
             MOVE  WRK-SRYKANAME(IDX1)   TO  SKT3400-SRYKANAME(IDX1)
           END-PERFORM
      *---(01.00.03) LINE ADD START ------------------------------------
      *    特別療養費
           IF  WRK-PARA-TOKUBETU  =  "2"
             MOVE  "特別療養費"              TO  SKT3400-TOKUBETU
           END-IF
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
           IF     KEY-NEW    =    "1"
              IF    FLG-GOKEI1     =     ZERO
      *             入院・件数
                    MOVE      SUM-N-KENSU1   TO   WRK-Z9-6
                    MOVE      WRK-Z9-6       TO   SKT3400-TL-N-KENSU
      *
      *             入院・点数
                    MOVE      SUM-N-TENSU1   TO   WRK-Z9-11
                    MOVE      WRK-Z9-11      TO   SKT3400-TL-N-TENSU
      *
      *             入院外・件数
                    MOVE      SUM-G-KENSU1   TO   WRK-Z9-6
                    MOVE      WRK-Z9-6       TO   SKT3400-TL-G-KENSU
      *
      *             入院外・点数
                    MOVE      SUM-G-TENSU1   TO   WRK-Z9-11
                    MOVE      WRK-Z9-11      TO   SKT3400-TL-G-TENSU
                    MOVE      1              TO   FLG-GOKEI1
              END-IF
           ELSE
              IF    FLG-GOKEI2     =     ZERO
      *             入院・件数
                    MOVE      SUM-N-KENSU2   TO   WRK-Z9-6
                    MOVE      WRK-Z9-6       TO   SKT3400-TL-N-KENSU
      *
      *             入院・点数
                    MOVE      SUM-N-TENSU2   TO   WRK-Z9-11
                    MOVE      WRK-Z9-11      TO   SKT3400-TL-N-TENSU
      *
      *             入院外・件数
                    MOVE      SUM-G-KENSU2   TO   WRK-Z9-6
                    MOVE      WRK-Z9-6       TO   SKT3400-TL-G-KENSU
      *
      *             入院外・点数
                    MOVE      SUM-G-TENSU2   TO   WRK-Z9-11
                    MOVE      WRK-Z9-11      TO   SKT3400-TL-G-TENSU
                    MOVE      1              TO   FLG-GOKEI2
              END-IF
           END-IF
           DISPLAY "310 OK"
           .
      *
       310-HEAD-HEN-EXT.
           EXIT.
      *****************************************************************
      *    帳票編集<保険明細行>処理
      *****************************************************************
       320-BODY-HEN-SEC               SECTION.
      *
           DISPLAY "320-BODY-HEN-SEC"
      *
      *
           DISPLAY "320 OK" FLG-PRINT
           MOVE    KEY-NEW    TO    KEY-OLD
           PERFORM   VARYING  IDX1  FROM  1  BY  1
                     UNTIL    IDX1  >    48  OR
                     FLG-PRINT      =     1  OR
                     KEY-NEW   NOT  =   KEY-OLD 
             PERFORM  3201-BODY-HEN-SEC
      *
             PERFORM  900-TMP-READ2-SEC
           END-PERFORM
      *
           .
      *
       320-BODY-HEN-EXT.
           EXIT.
      *****************************************************************
      *    帳票編集<保険明細行>処理
      *****************************************************************
       3201-BODY-HEN-SEC              SECTION.
      *
           DISPLAY "3201 OK"
      *    保険者番号
           MOVE     SKT3400TMP-HKNJANUM  TO  SKT3400-HKNJANUM(IDX1)
      *
      *    入院・件数
           MOVE     SKT3400TMP-N-KENSU       TO   WRK-Z9-6
           MOVE     WRK-Z9-6                 TO   SKT3400-N-KENSU(IDX1)
      *
      *    入院・点数
           MOVE     SKT3400TMP-N-TENSU       TO   WRK-Z9-11
           MOVE     WRK-Z9-11                TO   SKT3400-N-TENSU(IDX1)
      *
      *    入院外・件数
           MOVE     SKT3400TMP-G-KENSU       TO   WRK-Z9-6
           MOVE     WRK-Z9-6                 TO   SKT3400-G-KENSU(IDX1)
      *
      *    入院外・点数
           MOVE     SKT3400TMP-G-TENSU       TO   WRK-Z9-11
           MOVE     WRK-Z9-11                TO   SKT3400-G-TENSU(IDX1)
           .
      *
       3201-BODY-HEN-EXT.
           EXIT.
      *****************************************************************
      *    帳票印刷処理
      *****************************************************************
       330-PRINT-OUT-SEC                   SECTION.
      *
           DISPLAY "330 OK"
      *
           ADD  1  TO  CNT-PAGE
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
           MOVE   "SKT3400.red"        TO  SPRT-PRTID
           MOVE    "総括表"            TO  SPRT-TITLE
           MOVE    SKT3400             TO  SPRT-PRTDATA
           MOVE    LNK-PRTKANRI-TERMID TO  SPRT-TERMID
           MOVE    LNK-PRTKANRI-OPID   TO  SPRT-OPID
           MOVE    LNK-PRTKANRI-PRTNM  TO  SPRT-PRTNM
           DISPLAY "ORCSPRT call"
           CALL    "ORCSPRT"           USING
                                       ORCSPRTAREA
      *---(01.00.04) LINE ADD START ------------------------------------
                                       SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
           IF      SPRT-RETURN         =   ZERO
               CONTINUE
           ELSE
               MOVE    "帳票ＤＢに更新できませんでした"
                                          TO  WRK-RECEERR
               PERFORM 500-ERR-HENSYU-SEC
           END-IF
      *
           .
      *
       330-PRINT-OUT-EXT.
           EXIT.
      *****************************************************************
      *    エラー出力処理
      *****************************************************************
       500-ERR-HENSYU-SEC                SECTION.
      *
           OPEN    INPUT   RECEERR-FILE
           IF      STS-RECEERR         =   ZERO
               CONTINUE
           ELSE
               OPEN    OUTPUT              RECEERR-FILE
      *
               MOVE    WRK-RECEERR         TO  RECEERR-REC
               WRITE   RECEERR-REC
      *
      *        ジョブ終了処理
               MOVE    "JBE"           TO  SJOBKANRI-MODE
               INITIALIZE                  JOBKANRI-REC
      *---(01.00.04) LINE ADD START ------------------------------------
               MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.04) LINE ADD END   ------------------------------------
               MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
               MOVE    WRK-PARA-SHELLID
                                       TO  JOB-SHELLID
               MOVE    WRK-RECEERR     TO  JOB-YOBI
               MOVE    "9999"          TO  JOB-ERRCD
               CALL    "ORCSJOB"       USING
                                       ORCSJOBKANRIAREA  
                                       JOBKANRI-REC
      *---(01.00.04) LINE ADD START ------------------------------------
                                       SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
           END-IF
      *
           CLOSE   RECEERR-FILE
      *
           .
      *
       500-ERR-HENSYU-EXT.
           EXIT.
      *****************************************************************
      *   請求管理ＤＢ更新処理                       
      *****************************************************************
       3001-SEIKYU-UPDATE-SEC              SECTION.
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
      *---(01.00.04) LINE ADD START ------------------------------------
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
      *---(01.00.04) LINE ADD END   ------------------------------------
                   IF      MCP-RC          =   ZERO
                       PERFORM 900-UPD-FILE-READ-SEC
                   ELSE
                       DISPLAY "UPD ERR KEY="  RECE10-KEY 
                       MOVE  "*** SOKATU3400 SEIKYU UPD ERR ***"
                                           TO  WRK-RECEERR
                       MOVE    RECE10-KEY  TO  WRK-RECEERR(33:)
                       PERFORM 500-ERR-HENSYU-SEC
                       MOVE    1           TO  FLG-UPDFILE
                   END-IF
               ELSE
                       DISPLAY "INV ERR KEY="  RECE10-KEY 
                   MOVE  "*** SOKATU3400 SEIKYU INVALID ***"
                                           TO  WRK-RECEERR
                   MOVE    RECE10-KEY      TO  WRK-RECEERR(33:)
                   PERFORM 500-ERR-HENSYU-SEC
                   MOVE    1               TO  FLG-UPDFILE
               END-IF
           END-PERFORM  
      *
           CLOSE   UPD-FILE
      *
           .
      *
       3001-SEIKYU-UPDATE-EXT.
           EXIT.
      *****************************************************************
      *    西暦日本語変換処理
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
           INSPECT WRK-HENYMDG    REPLACING  ALL "  "  BY  "  "
      *
           .
      *
       31012-SEIWA-HEN-EXT.
           EXIT.
      *****************************************************************
      *    請求管理読込
      *****************************************************************
       900-SEIKYU-SELECT-SEC             SECTION.
      *
      *    請求管理ＤＢ検索
           INITIALIZE         RECE10-REC.
      *---(01.00.04) LINE ADD START ------------------------------------
      *     MOVE   SYS-1001-HOSPID      TO  RECE10-HOSPID.
           MOVE  SPA-HOSPNUM           TO  RECE10-HOSPNUM
      *---(01.00.04) LINE ADD END   ------------------------------------
           MOVE   LNK-PRTKANRI-SRYYM   TO  RECE10-SKYYM.
           MOVE    SPACE               TO  RECE10-XXSTHKNJANUM
           MOVE    "99999999"          TO  RECE10-XXEDHKNJANUM
      *---(01.00.03) LINE ADD START ------------------------------------
           IF  WRK-PARA-TOKUBETU  =  2
             MOVE    "000000"          TO  RECE10-SRYYM
             MOVE    "999999"          TO  RECE10-XXSRYYM
           END-IF
      *---(01.00.03) LINE ADD END   ------------------------------------
           MOVE    RECE10-REC          TO  MCPDATA-REC
           MOVE    "DBSELECT"          TO  MCP-FUNC
      *---(01.00.04) LINE ADD START ------------------------------------
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
      *---(01.00.04) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               PERFORM 900-SEIKYU-READ-SEC
           ELSE
               MOVE    1                   TO  FLG-END
           END-IF
      *
           .
      *
       900-SEIKYU-SELECT-EXT.
           EXIT.
      *****************************************************************
      *    請求マスター読込
      *****************************************************************
       900-SEIKYU-READ-SEC           SECTION.
      *
      *---(01.00.04) LINE ADD START ------------------------------------
      *     MOVE    WRK-PATH            TO  MCP-PATH
      *     MOVE    "DBFETCH"           TO  MCP-FUNC
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           MOVE    "tbl_seikyu"        TO  MCP-TABLE
           MOVE    WRK-PATH            TO  MCP-PATHNAME
           MOVE    "DBFETCH"           TO  MCP-FUNC
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
           IF      MCP-RC              =   ZERO
               MOVE    ZERO            TO  FLG-END
               MOVE    MCPDATA-REC         TO  RECE10-REC
      *
      *        テスト患者のときは読み飛ばす
               MOVE    SPACE               TO  PTINF-REC
               INITIALIZE                      PTINF-REC
      *---(01.00.04) LINE ADD START ------------------------------------
      *         MOVE    RECE10-HOSPID       TO  PTINF-HOSPID
               MOVE    SPA-HOSPNUM         TO  PTINF-HOSPNUM
      *---(01.00.04) LINE ADD END   ------------------------------------
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
      *
       900-SEIKYU-READ-EXT.
           EXIT.
      *****************************************************************
      *    患者マスタ読込
      *****************************************************************
       800-PTINF-READ-SEC         SECTION.
      *
           MOVE    "DBSELECT"                   TO  MCP-FUNC
      *---(01.00.04) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-PTINF-KEY           TO  MCP-PATH
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           MOVE    "tbl_ptinf"           TO  MCP-TABLE
           MOVE    "key"                 TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"           USING
                                         MCPAREA
                                         MCPDATA-REC
                                         SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                    TO  MCP-FUNC
      *---(01.00.04) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-PTINF-KEY           TO  MCP-PATH
      *         CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
               MOVE    "tbl_ptinf"       TO  MCP-TABLE
               MOVE    "key"             TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"       USING
                                         MCPAREA
                                         MCPDATA-REC
                                         SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
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
      *---(01.00.04) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-PTINF-KEY          TO  MCP-PATH
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           MOVE    "tbl_ptinf"          TO  MCP-TABLE
           MOVE    "key"                TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
           .
       800-PTINF-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    総括表一時ファイルＲＥＡＤ処理
      *****************************************************************
       900-TMP-READ-SEC                 SECTION.
      *
           MOVE   ZERO        TO        FLG-SKT3400TMP
           READ   SKT3400TMP-FILE
                  INVALID     KEY     
                              MOVE    1     TO      FLG-SKT3400TMP
           END-READ
      *
           .
      *
       900-TMP-READ-EXT.
           EXIT.
      *****************************************************************
      *    一時ファイル読込  04/01/16 INS
      *****************************************************************
       900-TMP-READ2-SEC                SECTION.
      *
           READ  SKT3400TMP-FILE   NEXT
               AT  END
                   MOVE  1  TO  FLG-PRINT
                   MOVE  99 TO  WRK-KBN
                   DISPLAY "終了"
               NOT  AT  END
                   MOVE  ZERO               TO  FLG-PRINT
                   MOVE  SKT3400TMP-KBN     TO  KEY-NEW
                   DISPLAY "読み込み成功"
           END-READ
           .
       900-TMP-READ2-EXT.
           EXIT.
      *      
      *****************************************************************
      *    システム管理マスタ読込
      *****************************************************************
       900-SYSKANRI-INV-SEC         SECTION.
      *
      *
           MOVE    "DBSELECT"                     TO  MCP-FUNC
      *---(01.00.04) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SYSKANRI-KEY10        TO  MCP-PATH
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           MOVE    "tbl_syskanri"            TO  MCP-TABLE
           MOVE    "key10"                   TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"               USING
                                             MCPAREA
                                             MCPDATA-REC
                                             SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                      TO  MCP-FUNC
      *---(01.00.04) LINE ADD START ------------------------------------
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
      *---(01.00.04) LINE ADD END   ------------------------------------
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
      *---(01.00.04) LINE ADD START ------------------------------------
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
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
           .
      *
       900-SYSKANRI-INV-EXT.
           EXIT.
      *****************************************************************
      *    請求管理マスタ読込
      *****************************************************************
       910-SEIKYU-INV-SEC             SECTION.
      *
           MOVE    "DBSELECT"              TO  MCP-FUNC
      *---(01.00.04) LINE ADD START ------------------------------------
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
      *---(01.00.04) LINE ADD END   ------------------------------------
           IF      MCP-RC                  =   ZERO
               MOVE    "DBFETCH"                    TO  MCP-FUNC
      *---(01.00.04) LINE ADD START ------------------------------------
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
      *---(01.00.04) LINE ADD END   ------------------------------------
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
      *---(01.00.04) LINE ADD START ------------------------------------
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
      *---(01.00.04) LINE ADD END   ------------------------------------
           .
      *
       910-SEIKYU-INV-EXT.
           EXIT.
      *****************************************************************
      *    請求管理ＤＢ更新用ファイル読込
      *****************************************************************
       900-UPD-FILE-READ-SEC             SECTION.
      *
           READ    UPD-FILE
               AT  END
                   MOVE    1           TO  FLG-UPDFILE
               NOT AT  END
                   MOVE    ZERO        TO  FLG-UPDFILE
           END-READ
      *
           .
      *
       900-UPD-FILE-READ-EXT.
           EXIT.
      * 
      *---(01.00.04) LINE ADD START ------------------------------------
      *****************************************************************
      *    医療機関編集情報読み込み
      *****************************************************************
       900-1900-READ-SEC           SECTION.
      *
      *    医療機関編集情報読み込み
           MOVE    SPACE                   TO  SYS-1900-REC
           INITIALIZE                          SYS-1900-REC
           MOVE    "1900"                  TO  SYS-1900-KANRICD
           MOVE    "*"                     TO  SYS-1900-KBNCD
           MOVE    SPA-HOSPNUM             TO  SYS-1900-HOSPNUM
           MOVE    LNK-PRTKANRI-SRYYM      TO  SYS-1900-STYUKYMD(1:6)
           MOVE    "01"                    TO  SYS-1900-STYUKYMD(7:2)
           MOVE    LNK-PRTKANRI-SRYYM      TO  SYS-1900-EDYUKYMD(1:6)
           MOVE    "01"                    TO  SYS-1900-EDYUKYMD(7:2)
           MOVE    SYS-1900-REC    TO  MCPDATA-REC
           PERFORM 900-SYSKANRI-INV-SEC
           IF      FLG-SYSKANRI        =   ZERO
               MOVE    MCPDATA-REC         TO  SYS-1900-REC
               IF      SYS-1900-PRTKBN(8) NOT =   SPACE
      *            医療機関名称編集情報
                   PERFORM 900-1901-READ-SEC
      *            医療機関住所編集情報
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
      *    医療機関名称編集情報読み込み
      *****************************************************************
       900-1901-READ-SEC           SECTION.
      *
      *    医療機関名称編集情報読み込み
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
           PERFORM 900-SYSKANRI-INV-SEC
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
      *    医療機関住所編集情報読み込み
      *****************************************************************
       900-1902-READ-SEC           SECTION.
      *
      *    医療機関住所編集情報読み込み
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
           PERFORM 900-SYSKANRI-INV-SEC
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
      *---(01.00.04) LINE ADD END   ------------------------------------
      *****************************************************************
      *    ＤＢ　オープン処理
      *****************************************************************
       100-DBOPEN-SEC                SECTION.
      *
      *---(01.00.04) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.04) LINE ADD END   ------------------------------------
           MOVE    "DBOPEN"            TO  MCP-FUNC.
      *---(01.00.04) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
      *---(01.00.04) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.04) LINE ADD END   ------------------------------------
           MOVE    "DBSTART"           TO  MCP-FUNC.
      *---(01.00.04) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
           .
       100-DBOPEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    ＤＢ　クローズ処理
      *****************************************************************
       900-DBDISCONNECT-SEC            SECTION.
      *
      *---(01.00.04) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.04) LINE ADD END   ------------------------------------
           MOVE    "DBCOMMIT"          TO  MCP-FUNC.
      *---(01.00.04) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
      *---(01.00.04) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.04) LINE ADD END   ------------------------------------
           MOVE    "DBDISCONNECT"      TO  MCP-FUNC.
      *---(01.00.04) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.04) LINE ADD END   ------------------------------------
           .                             
       900-DBDISCONNECT-EXT.
           EXIT.
