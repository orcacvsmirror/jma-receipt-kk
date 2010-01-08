      *******************************************************************
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
       PROGRAM-ID.             SOKATU4210.
      *****************************************************************
      *  システム名        : ＯＲＣＡ
      *  サブシステム名    : 月次帳票
      *  コンポーネント名  : 診療報酬請求書
      *  管理者            : 
      *  作成日付    作業者        記述
      *  05/07/20    山口          ORCAのバージョンアップ(2.5.0)による再作成
      *                            (返戻対応含む)
      *****************************************************************
      *  プログラム修正履歴
      * Maj/Min/Rev  修正者	 日付		 内容
      *  01.00.01    有村    05/08/17    記載するデータが有る用紙のみ
      *                                  出力するよう修正
      *                                  ２７＋１９の集計方法修正
      *  01.00.02    山口    05/09/28    ２７＋１９の集計方法修正
      *  01.00.03    内田    07/03/28    老人＋原爆の印字条件修正
      *                       （レセ電と紙レセで単独、併用と印字が異なる）
      *  01.00.04    内田    07/05/15    帳票様式の変更に伴う修正
      *                                  公費再掲の法制欄は全公費「００」を印字
      *  01.00.05    内田    07/08/27    日レセver4.0対応
      *                                  システム管理マスタ「1901」の
      *                                  医療機関情報を参照
      *                                  長期上位（974）は長期と同様の
      *                                  処理をする
      *  01.00.06    内田    08/04/23    帳票様式の変更に伴う修正
      *                                  SPA-AREA初期化
      *  01.00.07    内田    08/05/20    国組３〜６歳の帳票を分けないように修正
      *  01.00.08    門間    08/11/20    シス管「2007」公費まとめ対応
      *  01.00.09    吉川    10/01/07    シス管「2007」のまとめ公費で
      *                                  6つ目以降がまとまらない不具合を修正
      *****************************************************************
      *
       ENVIRONMENT                 DIVISION.
       CONFIGURATION               SECTION.
       INPUT-OUTPUT                SECTION.
       FILE-CONTROL.

      *    請求書一時ファイル  
           SELECT  SKT4210TMP-FILE ASSIGN    SKT4210TP
                                   ORGANIZATION    IS  INDEXED
                                   ACCESS  MODE    IS  DYNAMIC
                                   RECORD  KEY     IS  SKT4210TMP-KEY
                                   FILE    STATUS  IS  STS-SKT4210.
      *
006900*    請求ＤＢ更新用ファイル
           SELECT  UPD-FILE        ASSIGN  RECEUPD
                                   ORGANIZATION    IS  LINE
                                                       SEQUENTIAL 
                                   FILE    STATUS  IS  STS-RECEUPD.
      *
006900*    エラーファイル
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
      *    請求書一時ファイル  
       FD  SKT4210TMP-FILE.
           COPY    "CPSKT4210TMP.INC".
      *
006900*    請求ＤＢ更新用ファイル
       FD  UPD-FILE.
           COPY    "CPRCF010.INC"  REPLACING  //RECE10//
                                   BY         //RECE10X//.
      *
006900*    エラーファイル
       FD  RECEERR-FILE.
       01  RECEERR-REC             PIC X(200). 
      *
      *    優先保険者番号ファイル
       FD  YUSEN-FILE.
       01  YUSEN-HKNJANUM             PIC X(06). 
      *
      *
       WORKING-STORAGE             SECTION.
      *
      *    請求書一時ファイル 名称領域 
           COPY    "CPCOMMONDAT2.INC"
                                   REPLACING  //RECE01PARA//
                                   BY         //SKT4210TP//.
      *
006900*    請求ＤＢ更新用ファイル 名称領域 
           COPY    "CPCOMMONDAT2.INC"
                                   REPLACING  //RECE01PARA//
                                   BY         //RECEUPD//.
           03  FILLER              PIC X(04)   VALUE   ".dat".
      *
      *    エラーファイル 名称領域 
      *---(01.00.05) LINE ADD START ------------------------------------
      *     COPY    "CPCOMMONDAT2.INC"
      *                             REPLACING  //RECE01PARA//
      *                             BY         //RECEERR//.
      *     03  FILLER              PIC X(04)   VALUE   ".dat".
           COPY    "CPERRFL.INC"    REPLACING  //ERRFLPARA//
                                    BY         //RECEERR//.
      *---(01.00.05) LINE ADD END   ------------------------------------
      *     
      *    シェル用領域
           COPY    "CPCOMMONSHELL.INC".
      *
           COPY    "SKT4210.INC".
           COPY    "SKT4220.INC".
           COPY    "SKT4230.INC".
      *
      *    スパ領域
       01  STS-AREA.
           03  STS-SKT4210         PIC X(02).
           03  STS-RECE10          PIC X(02).
           03  STS-RECEERR         PIC X(02).
           03  STS-RECEUPD         PIC X(02).
           03  STS-YUSEN           PIC X(02).
      *
      *    フラグ領域
       01  FLG-AREA.
           03  FLG-END             PIC 9(01).
           03  FLG-SKT4210TMP      PIC 9(01).
           03  FLG-SYSKANRI        PIC 9(01).
           03  FLG-HKNNUM          PIC 9(01).
           03  FLG-HKNJAINF        PIC 9(01).
           03  FLG-UPD             PIC 9(01).
           03  FLG-UPDFILE         PIC 9(01).
           03  FLG-SEIKYU          PIC 9(01).
           03  FLG-PTINF           PIC 9(01).
           03  FLG-PRINT           PIC 9(01).
           03  FLG-PASS            PIC 9(01).
      *
      *    添字領域
       01  IDX-AREA.
           03  IDX1                PIC 9(04).
           03  IDX2                PIC 9(04).
           03  IDX3                PIC 9(04).
           03  IDX4                PIC 9(04).
           03  IDX5                PIC 9(04).
           03  IDX-MAX             PIC 9(04).
           03  IDX6                PIC 9(04).
      *--- (2008/11/20) LINE ADD START MONMA ---------------------------
           03  IDZ1                PIC 9(04).
           03  IDZ2                PIC 9(04).
      *--- (2008/11/20) LINE ADD END   MONMA ---------------------------
      *
       01  WRK-PARA.
           COPY    "CPORCSPRTLNK.INC".
           03  WRK-PARA-JOBID      PIC 9(07).
           03  WRK-PARA-SHELLID    PIC X(08).
      *---(01.00.05) LINE ADD START ------------------------------------
      *     03  WRK-PARA-HOSPID     PIC X(24).
           03  WRK-PARA-HOSPNUM    PIC 9(02).
      *---(01.00.05) LINE ADD END   ------------------------------------
           03  WRK-PARA-HKNJANUM   PIC X(08).
           03  WRK-PARA-PAGE       PIC 9(10).
           03  WRK-PARA-SYOKBN     PIC X(01).
      *
      *
      *    一時領域
       01  WRK-AREA.
           03  WRK-SEIYMDWH        PIC X(22).
           03  WRK-SRYYMWH         PIC X(16).
      *
      *    ファイル名称用エリア
           03  FILE-NAME        PIC X(512).
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
           03  WRK-HKNJANAME       PIC X(20).
      *--- (2008/11/20) LINE ADD START MONMA ---------------------------
           03  WRK-KOHNAME         PIC X(08).
      *--- (2008/11/20) LINE ADD END   MONMA ---------------------------
      *
           03  WRK-Z4              PIC ZZZZ.
           03  WRK-Z5              PIC Z,ZZZ.
           03  WRK-Z9              PIC Z,ZZZ,ZZZ.
      *
           03  WRK-RECEERR         PIC X(200).
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *     03  WRK-PATH.
      *         05  FILLER          PIC S9(09)  BINARY.
      *         05  FILLER          PIC S9(09)  BINARY.
      *         05  FILLER          PIC S9(09)  BINARY.
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
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *    カウント領域
       01  CNT-AREA.
           03  CNT-PAGE            PIC 9(03).
           03  CNT-RECE10          PIC 9(06).
           03  CNT-UPDFILE         PIC 9(06).
           03  CNT-KOH             PIC 9(02).
      *
       01  SORT-AREA.
           03  SORT-TBL.
               05  SORT-KOH-TBL  OCCURS  20.
                   07  SORT-KOHNUM              PIC  X(03).
      *--- (2008/11/20) LINE ADD START MONMA ---------------------------
                   07  SORT-KOHNAME             PIC  X(08).
      *--- (2008/11/20) LINE ADD END   MONMA ---------------------------
                   07  SORT-KOH-NYUGAI-TBL OCCURS 2.
                       09  SORT-K-KENSU         PIC  9(05).
                       09  SORT-K-NISSU         PIC  9(05).
                       09  SORT-K-TENSU         PIC  9(09).
                       09  SORT-K-YKZFTN        PIC  9(09).
                       09  SORT-K-ITBFTN        PIC  9(09).
                   07  SORT-K-SKENSU            PIC  9(05).
                   07  SORT-K-SNISSU            PIC  9(05).
                   07  SORT-K-SKINGK            PIC  9(09).
                   07  SORT-K-SFTNGK            PIC  9(09).
      *
      *--- (2008/11/20) LINE ADD START MONMA ---------------------------
      *    公費番号まとめエリア
       01  WRK-2007-AREA.
           03  WRK-2007-TBL        OCCURS  100.
               05  WRK-2007-MEISYO PIC X(44).
               05  WRK-2007-KOH-AREA.
                   07  WRK-2007-KOHNUM
                                   PIC X(03)   OCCURS  10.
           03  WRK-2007-MAX        PIC 9(03).
      *--- (2008/11/20) LINE ADD END   MONMA ---------------------------
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *     COPY    "ORCA-DBPATH".
           COPY    "COMMON-SPA".
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *---(01.00.06) LINE ADD START ------------------------------------
      *    固定項目
       01  WRK-CONS-AREA.
           03  WRK-CONS-SRYYM-200804   PIC X(06)   VALUE   "200804".
      *---(01.00.06) LINE ADD END   ------------------------------------
      *****************************************************************
      *    ファイルレイアウト
      *****************************************************************
      *
      *    患者
       01  PTINF-REC.
           COPY    "CPPTINF.INC".
      *
      *    保険者情報
       01  HKNJAINF-REC.
           COPY    "CPHKNJAINF.INC".
      *
      *    保険番号
       01  HKNNUM-REC.
           COPY    "CPHKNNUM.INC".
      *
      *    医療機関情報情報
           COPY    "CPSK1001.INC".
      *
      *    医療機関情報−所在地、連絡先 
           COPY    "CPSK1002.INC".
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *    医療機関編集情報
           COPY    "CPSK1900.INC".
      *
      *    医療機関名称編集情報
           COPY    "CPSK1901.INC".
      *
      *    医療機関住所編集情報
           COPY    "CPSK1902.INC".
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *--- (2008/11/17) LINE ADD START MONMA ---------------------------
      *    公費番号まとめ情報
           COPY    "CPSK2007.INC".
      *--- (2008/11/17) LINE ADD END   MONMA ---------------------------
           COPY    "CPRCF010.INC".
      *
      *    ジョブ管理マスタ
       01  JOBKANRI-REC.
           COPY    "CPJOBKANRI.INC".
      *
      ******************************************************************
      *    サブプロ用　領域
      *****************************************************************
      *
      *   ジョブ管理ＤＢ制御サブ
           COPY    "CPORCSJOBKANRI.INC".
      *
      *    印刷ＤＢ更新サブ
           COPY    "CPORCSPRT.INC".
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
      *    主　　処理
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
      *    初期　処理
      *****************************************************************
       100-INIT-SEC                SECTION.
      *
           INITIALIZE                  FLG-AREA
           INITIALIZE                  STS-AREA
           INITIALIZE                  WRK-AREA
           INITIALIZE                  CNT-AREA
           INITIALIZE                  IDX-AREA
      *---(01.00.06) LINE ADD START ------------------------------------
           INITIALIZE                  SPA-AREA
      *---(01.00.06) LINE ADD END   ------------------------------------
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
      *---(01.00.05) LINE ADD START ------------------------------------
      *                                         WRK-PARA-HOSPID
                                               WRK-PARA-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
                                               WRK-PARA-JOBID
                                               WRK-PARA-SHELLID
                                               WRK-PARA-HKNJANUM
                                               WRK-PARA-SYOKBN
      *---(01.00.05) LINE ADD START ------------------------------------
                                               RECEERR
      *---(01.00.05) LINE ADD END   ------------------------------------
           END-UNSTRING
      *---(01.00.05) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  SPA-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *    ステップ管理開始処理
           MOVE    "STS"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
      *---(01.00.05) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           MOVE    "SOKATU4210"    TO  JOB-PGID
           MOVE    "国保請求書"
                                   TO  JOB-SHELLMSG
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA
                                   JOBKANRI-REC
      *---(01.00.05) LINE ADD START ------------------------------------
                                   SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
           MOVE    "SKT4210TP"         TO  SKT4210TP-FILE-ID
           MOVE    LNK-PRTKANRI-TERMID TO  SKT4210TP-TERMID
      *---(01.00.05) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  SKT4210TP-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
           MOVE    "RECEUPD"           TO  RECEUPD-FILE-ID
           MOVE    LNK-PRTKANRI-TERMID TO  RECEUPD-TERMID
      *---(01.00.05) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  RECEUPD-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    "RECEERR"           TO  RECEERR-FILE-ID
      *     MOVE    LNK-PRTKANRI-TERMID TO  RECEERR-TERMID
      *---(01.00.05) LINE ADD END   ------------------------------------
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
      *--- (2008/11/20) LINE ADD START MONMA ---------------------------
      *    公費番号まとめ情報
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
               MOVE    "tbl_syskanri"  TO  MCP-TABLE
               MOVE    "key2"          TO  MCP-PATHNAME
               PERFORM 900-SYSKANRI-READ-N-SEC
           ELSE
               MOVE    1               TO  FLG-SYSKANRI
           END-IF
      *
           MOVE    ZERO            TO  IDX1
           PERFORM         UNTIL   FLG-SYSKANRI   =   1
                           OR      IDX1           >=  100
               MOVE    MCPDATA-REC         TO  SYS-2007-REC
      *
               ADD     1                   TO  IDX1
               MOVE    SYS-2007-MEISYO(1) TO  WRK-2007-MEISYO(IDX1)
               PERFORM VARYING IDX2 FROM    1   BY  1
                       UNTIL   IDX2 >       10
                       OR      SYS-2007-KOHNUM (IDX2)   =   SPACE
                   MOVE    SYS-2007-KOHNUM (IDX2)
                                           TO WRK-2007-KOHNUM(IDX1 IDX2)
               END-PERFORM
      *
               MOVE    "tbl_syskanri"      TO  MCP-TABLE
               MOVE    "key2"              TO  MCP-PATHNAME
               PERFORM 900-SYSKANRI-READ-N-SEC
           END-PERFORM
      *
           MOVE    "tbl_syskanri"          TO  MCP-TABLE
           MOVE    "key2"                  TO  MCP-PATHNAME
           MOVE    "DBCLOSECURSOR"         TO  MCP-FUNC
           PERFORM 900-ORCDBMAIN-SEC
      *
           MOVE    IDX1                    TO  WRK-2007-MAX
      *--- (2008/11/20) LINE ADD END   MONMA ---------------------------
      *
      *    医療機関ＩＤ編集
           INITIALIZE                  SYS-1001-REC
           MOVE    "1001"              TO  SYS-1001-KANRICD
           MOVE    "*"                 TO  SYS-1001-KBNCD
           MOVE    LNK-PRTKANRI-SRYYM(1:6)
                                       TO  SYS-1001-STYUKYMD(1:6)
                                           SYS-1001-EDYUKYMD(1:6)
           MOVE    "01"                TO  SYS-1001-STYUKYMD(7:2)
                                           SYS-1001-EDYUKYMD(7:2)
      *---(01.00.05) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM         TO  SYS-1001-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
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
           MOVE    LNK-PRTKANRI-SRYYM(1:6)
                                       TO  SYS-1002-STYUKYMD(1:6)
                                           SYS-1002-EDYUKYMD(1:6)
           MOVE    "01"                TO  SYS-1002-STYUKYMD(7:2)
                                           SYS-1002-EDYUKYMD(7:2)
      *---(01.00.05) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM         TO  SYS-1002-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
           MOVE    SYS-1002-REC        TO  MCPDATA-REC
           PERFORM 910-SYSKANRI-INV-SEC
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
      *---(01.00.05) LINE ADD START ------------------------------------
           MOVE    SYS-1001-HOSPNAME   TO  WRK-HOSPNAME
           MOVE    SYS-1002-ADRS       TO  WRK-HOSPADRS
           MOVE    SYS-1002-TEL        TO  WRK-HOSPTEL
      *    医療機関編集情報
           PERFORM 900-1900-READ-SEC
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
           PERFORM  110-INI-FILE-SEC
      *
           EVALUATE    WRK-PARA-SYOKBN 
               WHEN    "2"
      *---(01.00.05) LINE ADD START ------------------------------------
      *             MOVE    PATH-TBL-SEIKYU-KEY37    TO  WRK-PATH
                   MOVE    "key37"                  TO  WRK-PATH
      *---(01.00.05) LINE ADD END   ------------------------------------
               WHEN    "1"
      *---(01.00.05) LINE ADD START ------------------------------------
      *             MOVE    PATH-TBL-SEIKYU-KEY38    TO  WRK-PATH
                   MOVE    "key38"                  TO  WRK-PATH
      *---(01.00.05) LINE ADD END   ------------------------------------
           END-EVALUATE
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
      *    優先保険者番号INIファイル読み込み処理
      *****************************************************************
       110-INI-FILE-SEC                SECTION.
      *
      *
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
      *    主　　処理
      *****************************************************************
       200-MAIN-SEC                SECTION.
      *
           OPEN     OUTPUT  SKT4210TMP-FILE
           CLOSE            SKT4210TMP-FILE
           OPEN     I-O     SKT4210TMP-FILE
      *
           MOVE     ZERO    TO      FLG-END
           MOVE     ZERO    TO      FLG-UPD
      *
           PERFORM  2001-KOKUHO-SYUKEI-SEC
                    UNTIL   FLG-END   =   1
      *
           CLOSE   UPD-FILE
           CLOSE   SKT4210TMP-FILE
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
      *    終了    処理
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
           DISPLAY "*** SOKATU4210 IN  "  CNT-RECE10 
           DISPLAY "*** SOKATU4210 END ***"
      *
      *    ステップ終了処理
           MOVE    "STE"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
      *---(01.00.05) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
           MOVE    WRK-PARA-PAGE   TO  JOB-UPDCNT
      *
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA  
                                   JOBKANRI-REC
      *---(01.00.05) LINE ADD START ------------------------------------
                                   SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------

           PERFORM 900-DBDISCONNECT-SEC
           .
       300-END-EXT.
           EXIT.
      *
      *****************************************************************
      *    保険者番号別集計処理
      *****************************************************************
       2001-KOKUHO-SYUKEI-SEC              SECTION.
      * 
      *TMP-FILE キーセット
      *
           INITIALIZE       SKT4210TMP-REC
      *
           IF  RECE10-HKNJANUM(7:2)  =  SPACE
             MOVE  RECE10-HKNJANUM(1:6)  TO  SKT4210TMP-HKNJANUM(1:6)
           ELSE
             MOVE  RECE10-HKNJANUM(3:6)  TO  SKT4210TMP-HKNJANUM(1:6)
           END-IF
      *
      *---(01.00.06) LINE ADD START ------------------------------------
      *    平成２０年３月以前の前期９割、退職前期、３歳未満、老人は旧様式
           IF  RECE10-SRYYM  <  WRK-CONS-SRYYM-200804
             IF  (RECE10-HKNNUM  =  "060"  AND  RECE10-AGE  >=  70
                  AND  RECE10-KYURATE  =  9)
             OR  (RECE10-HKNNUM  =  "067"  AND  RECE10-AGE  >=  70)
             OR  (RECE10-AGE  <  3)
             OR  (RECE10-RJNHKNNUM  NOT =  SPACE)
               MOVE  RECE10-SRYYM          TO  SKT4210TMP-SRYYM
             END-IF
           END-IF
      *---(01.00.06) LINE ADD START ------------------------------------
      *
      *    国保組合判定
      *---(01.00.07) LINE ADD START ------------------------------------
           IF  RECE10-SRYYM  >=  WRK-CONS-SRYYM-200804
             IF      SKT4210TMP-HKNJANUM(3:1)  =     "3"    AND
                     RECE10-RJNHKNNUM          =   SPACE    AND
                     RECE10-FLG (1)        NOT =      1     AND
                     RECE10-AGE                <      70    AND
                     RECE10-KYURATE            NOT =  7
               MOVE  RECE10-KYURATE     TO    SKT4210TMP-KYURATE
             END-IF
           ELSE
      *---(01.00.07) LINE ADD END   ------------------------------------
             IF      SKT4210TMP-HKNJANUM(3:1)  =     "3"    AND
                     RECE10-RJNHKNNUM          =   SPACE    AND
                     RECE10-AGE                >      2     AND
                     RECE10-AGE                <      70    AND
                     RECE10-KYURATE            NOT =  7
               MOVE  RECE10-KYURATE     TO    SKT4210TMP-KYURATE
             END-IF
      *---(01.00.07) LINE ADD START ------------------------------------
           END-IF
      *---(01.00.07) LINE ADD END   ------------------------------------
      *
      *    出力順設定
           IF     YUSEN-HKNJANUM    =    SKT4210TMP-HKNJANUM
             MOVE        1          TO   SKT4210TMP-SYUTURYOKU
           ELSE
             MOVE        2          TO   SKT4210TMP-SYUTURYOKU
           END-IF
      *
      *    在宅
           MOVE   RECE10-ZAITAKU    TO   SKT4210TMP-ZAITAKU
      *
      *    長期
      *---(01.00.05) LINE ADD START ------------------------------------
      *     IF     RECE10-ETC-KOHNUM(1)  =  "972"  OR
      *            RECE10-ETC-KOHNUM(2)  =  "972"  OR
      *            RECE10-ETC-KOHNUM(3)  =  "972"  OR
      *            RECE10-ETC-KOHNUM(4)  =  "972"
           IF     RECE10-ETC-KOHNUM(1)  =  "972"  OR  "974"
           OR     RECE10-ETC-KOHNUM(2)  =  "972"  OR  "974"
           OR     RECE10-ETC-KOHNUM(3)  =  "972"  OR  "974"
           OR     RECE10-ETC-KOHNUM(4)  =  "972"  OR  "974"
      *---(01.00.05) LINE ADD END   ------------------------------------
             MOVE        1          TO   SKT4210TMP-TYOKI
           END-IF
      *
      *
           PERFORM  900-SKTTMP-READ-SEC
      *
           PERFORM  210-HKN-SYUKEI-SEC
      *
      *    集計の対象にならなかったとき
           IF      FLG-UPD             =   1
               PERFORM 230-UPD-FILE-HENSYU-SEC
      *
               PERFORM 900-SEIKYU-READ-SEC
           ELSE
               MOVE    SPACE               TO  WRK-RECEERR
               STRING "集計対象外　患者番号＝"     DELIMITED  BY  SIZE
                       RECE10-PTNUM                DELIMITED  BY  SPACE
                       " 診療年月＝"               DELIMITED  BY  SIZE
                       RECE10-SRYYM                DELIMITED  BY  SIZE
                       " レセ種別＝"               DELIMITED  BY  SIZE
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
      *    医療保険・老人保健分集計処理
      *****************************************************************
       210-HKN-SYUKEI-SEC          SECTION.
      *
      *    入外区分
           IF  RECE10-NYUGAIKBN  =  "1"
             MOVE  1      TO   IDX2
           ELSE
             MOVE  2      TO   IDX2
           END-IF
      *
      *    老人保健か
           IF  RECE10-RJNHKNNUM  NOT  =  SPACE
             IF  RECE10-KYURATE  =  9
               MOVE  10          TO   IDX1
             ELSE
               MOVE  11          TO   IDX1
             END-IF
             MOVE     1          TO    SKT4210TMP-PAGE-FLG2
           ELSE
      ***** 05/08/17 INS
             MOVE     1          TO    SKT4210TMP-PAGE-FLG1
      *****
      *    退職者かどうか
             IF  RECE10-HKNNUM  =  "060"
               IF  RECE10-AGE  >= 70
      *---(01.00.06) LINE ADD START ------------------------------------
      *           IF  RECE10-KYURATE  =  9
      *             MOVE    1     TO    IDX1
      *           ELSE
      *             MOVE    2     TO    IDX1
      *           END-IF
                 IF  RECE10-KYURATE  =  7
                   MOVE    2     TO    IDX1
                 ELSE
                   MOVE    1     TO    IDX1
                 END-IF
      *---(01.00.06) LINE ADD END   ------------------------------------
               ELSE
      *---(01.00.06) LINE ADD START ------------------------------------
                 IF  (RECE10-SRYYM  >=  WRK-CONS-SRYYM-200804)
                 AND  (RECE10-FLG (1)   =  1)
                     MOVE  4     TO  IDX1
                 ELSE
      *---(01.00.06) LINE ADD END   ------------------------------------
                   IF  RECE10-AGE  >= 3
                     MOVE    3     TO    IDX1
                   ELSE
                     MOVE    4     TO    IDX1
                   END-IF
      *---(01.00.06) LINE ADD START ------------------------------------
                 END-IF
      *---(01.00.06) LINE ADD END   ------------------------------------
               END-IF
      *
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
      *---(01.00.06) LINE ADD START ------------------------------------
                   IF  (RECE10-SRYYM  >=  WRK-CONS-SRYYM-200804)
                   AND  (RECE10-FLG (1)   =  1)
                       MOVE  9     TO  IDX1
                   ELSE
      *---(01.00.06) LINE ADD END   ------------------------------------
                     IF  RECE10-AGE  <  3
                       MOVE  9  TO  IDX1
                     ELSE
                       MOVE  8  TO  IDX1
                     END-IF
      *---(01.00.06) LINE ADD START ------------------------------------
                   END-IF
      *---(01.00.06) LINE ADD END   ------------------------------------
                 END-IF
               END-IF
             END-IF
           END-IF
      *
           PERFORM  2101-SYUKEI-SEC
      *
      *    老人原爆、老人被曝判定
           IF  RECE10-RJNHKNNUM  NOT  =  SPACE
             PERFORM  VARYING  IDX5  FROM   1   BY  1
                      UNTIL    IDX5  >  4
      ***** 05/09/28 DEL
      ****** 05/08/17 INS
      **    記載外公費エリアで判定を行う
      *           IF      RECE10-ETC-KOHNUM(IDX5)    =   "019"
      *               MOVE  12          TO    IDX6
      *               PERFORM 2101-RGENBK2-SYUKEI-SEC
      *               MOVE  4           TO    IDX5
      *           END-IF
      ******
      ****** 05/09/28 INS
      *---(01.00.03) LINE ADD START ------------------------------------
      *--  紙レセとレセ電で併用単独が異なる                    --*
      *--  どちらかにしかデータは入らないので両方チェックする  --*
      **    記載外公費エリアで判定を行う
                 IF      RECE10-ETC-KOHNUM(IDX5)    =   "019"
                     MOVE  12          TO    IDX6
                     PERFORM 2101-RGENBK2-SYUKEI-SEC
                     MOVE  4           TO    IDX5
                 END-IF
      *---(01.00.03) LINE ADD END   ------------------------------------
      *    記載外公費ではなく公費エリアで判定を行う
                 IF      RECE10-KOHNUM(IDX5)    =   "019"
                     MOVE  12          TO    IDX6
                     PERFORM 2101-RGENBK-SYUKEI-SEC
                     MOVE  4           TO    IDX5
                 END-IF
      *****
      ***** 05/08/17 DEL
      *         IF  RECE10-KOHNUM(IDX5)  =  "019"
      *             MOVE  12          TO    IDX6
      *             PERFORM  2101-RGENBK-SYUKEI-SEC
      *             MOVE  4           TO    IDX5
      *         ELSE
      *****
                 IF  RECE10-KOHNUM(IDX5)  =  "186"
                     MOVE  13          TO    IDX6
                     PERFORM  2101-RGENBK-SYUKEI-SEC
                     MOVE  4           TO    IDX5
                 END-IF
      ***** 05/08/17 DEL
      *         END-IF
      *****
             END-PERFORM
           END-IF
      *
      *    公費負担分
           IF  RECE10-KOHNUM (1)   NOT =   SPACE
             IF  RECE10-RJNHKNNUM      =   SPACE
                 PERFORM 220-KOH-SYUKEI-SEC
             ELSE
                 PERFORM 220-RKOH-SYUKEI-SEC
             END-IF
           END-IF
      *
      *
           IF  FLG-SKT4210TMP  =  1
               WRITE    SKT4210TMP-REC
           ELSE
               REWRITE  SKT4210TMP-REC
           END-IF
      *
           MOVE    1    TO  FLG-UPD 
      *
           .
       210-HKN-SYUKEI-EXT.
           EXIT.
      *
      *****************************************************************
      *    医療保険・一般国保分集計処理
      *****************************************************************
       2101-SYUKEI-SEC         SECTION.
      *
      *    療養の給付：件数
           ADD   1                  TO  SKT4210TMP-KENSU (IDX1 IDX2)
      *    療養の給付:診療実日数
           ADD  RECE10-JNISSU(1)    TO  SKT4210TMP-NISSU(IDX1 IDX2)
      *    療養の給付：点数
           ADD  RECE10-TOTALTEN(1)  TO  SKT4210TMP-TENSU(IDX1 IDX2)
      *    療養の給付：薬剤一部負担金
           ADD  RECE10-YKZFTN(1)    TO  SKT4210TMP-YKZFTN(IDX1 IDX2)
      *    療養の給付：一部負担金
           ADD  RECE10-FTNMONEY(1)  TO  SKT4210TMP-ITBFTN(IDX1 IDX2)
      *
           IF  RECE10-SHOKUJINISSU(1)  >  ZERO
      *    食事療養:件数
             ADD   1  TO  SKT4210TMP-SKENSU(IDX1)
           END-IF
      *    食事療養:日数
           ADD  RECE10-SHOKUJINISSU(1)   TO  SKT4210TMP-SNISSU(IDX1)
      *    食事療養：金額
           ADD  RECE10-SHOKUJIRYOYOHI(1) TO  SKT4210TMP-SKINGK(IDX1)
      *    食事療養：標準負担額
           ADD  RECE10-SHOKUJIFTN(1)     TO  SKT4210TMP-SFTNGK(IDX1)
      *
           MOVE    1               TO  FLG-UPD 
           .
       2101-SYUKEI-EXT.
           EXIT.
      *
      *****************************************************************
      *    老人被曝集計処理（公費エリアからデータを取得）
      *****************************************************************
       2101-RGENBK-SYUKEI-SEC         SECTION.
      *
      *    療養の給付：件数
           ADD   1                      TO  SKT4210TMP-KENSU (IDX6 IDX2)
      *    療養の給付:診療実日数
           ADD  RECE10-JNISSU(IDX5 + 1)    
                                        TO  SKT4210TMP-NISSU(IDX6 IDX2)
      *    療養の給付：点数
           ADD  RECE10-TOTALTEN(IDX5 + 1)
                                        TO  SKT4210TMP-TENSU(IDX6 IDX2)
      *    療養の給付：薬剤一部負担金
           ADD  RECE10-YKZFTN(IDX5 + 1)
                                        TO  SKT4210TMP-YKZFTN(IDX6 IDX2)
      *    療養の給付：一部負担金
           ADD  RECE10-FTNMONEY(IDX5 + 1)
                                        TO  SKT4210TMP-ITBFTN(IDX6 IDX2)
      *
           IF  RECE10-SHOKUJINISSU(IDX5 + 1)  >  ZERO
      *    食事療養:件数
             ADD   1  TO  SKT4210TMP-SKENSU(IDX6)
           END-IF
      *    食事療養:日数
           ADD  RECE10-SHOKUJINISSU(IDX5 + 1)
                                             TO  SKT4210TMP-SNISSU(IDX6)
      *    食事療養：金額
           ADD  RECE10-SHOKUJIRYOYOHI(IDX5 + 1)
                                             TO  SKT4210TMP-SKINGK(IDX6)
      *    食事療養：標準負担額
           ADD  RECE10-SHOKUJIFTN(IDX5 + 1)
                                             TO  SKT4210TMP-SFTNGK(IDX6)
      *
           .
       2101-RGENBK-SYUKEI-EXT.
           EXIT.
      *
      *****************************************************************
      *    老人原爆集計処理（記載外公費エリアからデータを取得）
      *****************************************************************
       2101-RGENBK2-SYUKEI-SEC         SECTION.
      *
      *    療養の給付：件数
           ADD   1                      TO  SKT4210TMP-KENSU (IDX6 IDX2)
      *    療養の給付:診療実日数
           ADD  RECE10-ETC-JNISSU(IDX5)    
                                        TO  SKT4210TMP-NISSU(IDX6 IDX2)
      *    療養の給付：点数
           ADD  RECE10-ETC-TOTALTEN(IDX5)
                                        TO  SKT4210TMP-TENSU(IDX6 IDX2)
      *    療養の給付：薬剤一部負担金
           ADD  RECE10-ETC-YKZFTN(IDX5)
                                        TO  SKT4210TMP-YKZFTN(IDX6 IDX2)
      *
           IF  RECE10-ETC-SHOKUJINISSU(IDX5)  >  ZERO
      *    食事療養:件数
             ADD   1  TO  SKT4210TMP-SKENSU(IDX6)
           END-IF
      *    食事療養:日数
           ADD  RECE10-ETC-SHOKUJINISSU(IDX5)
                                             TO  SKT4210TMP-SNISSU(IDX6)
      *    食事療養：金額
           ADD  RECE10-ETC-SHOKUJIRYOYOHI(IDX5)
                                             TO  SKT4210TMP-SKINGK(IDX6)
      *    食事療養：標準負担額
           ADD  RECE10-ETC-SHOKUJIFTN(IDX5)
                                             TO  SKT4210TMP-SFTNGK(IDX6)
      *
           .
       2101-RGENBK2-SYUKEI-EXT.
           EXIT.
      *
      *****************************************************************
      *    公費負担分集計処理(一般・退職)
      *****************************************************************
       220-KOH-SYUKEI-SEC        SECTION.
      *
           PERFORM VARYING IDX3     FROM    1   BY  1
                   UNTIL   IDX3     >       4
                   OR  RECE10-KOHNUM (IDX3) =   SPACE
      *
             MOVE  1               TO    SKT4210TMP-PAGE-FLG3
             IF    RECE10-KOHNUM(IDX3)  =  "091"
               MOVE    "051"       TO    RECE10-KOHNUM(IDX3)
             END-IF
      *
      *--- (2008/11/20) LINE ADD START MONMA ---------------------------
      *      公費番号まとめ情報があるとき
               IF  WRK-2007-MAX  >  ZERO
                 MOVE  SPACE     TO  WRK-KOHNAME
                 PERFORM VARYING IDZ1    FROM    1   BY  1
                         UNTIL   IDZ1    >       WRK-2007-MAX
                   PERFORM VARYING IDZ2  FROM    1   BY  1
      *=== 公費番号まとめの編集方法修正 by Yoshikawa(2010/01/07) start
      *                     UNTIL   IDZ2  >       5
                           UNTIL   IDZ2  >       10
      *=== 公費番号まとめの編集方法修正 by Yoshikawa(2010/01/07) end
                           OR WRK-2007-KOHNUM(IDZ1 IDZ2)  =  SPACE
                     IF  RECE10-KOHNUM(IDX3)  
                                   =   WRK-2007-KOHNUM(IDZ1 IDZ2)
                       MOVE  WRK-2007-KOHNUM(IDZ1 1)
                                   TO  RECE10-KOHNUM (IDX3)
                       MOVE  WRK-2007-MEISYO (IDZ1)
                                   TO  WRK-KOHNAME
      *=== 公費番号まとめの編集方法修正 by Yoshikawa(2010/01/07) start
      *                 MOVE  5             TO  IDZ2
                       MOVE  10            TO  IDZ2
      *=== 公費番号まとめの編集方法修正 by Yoshikawa(2010/01/07) end
                       MOVE  WRK-2007-MAX  TO  IDZ1
                     END-IF
                   END-PERFORM
                 END-PERFORM
               END-IF
      *--- (2008/11/20) LINE ADD END   MONMA ---------------------------
      *
      *    公費判別
      *    原爆と被曝は印字場所固定
             IF    RECE10-KOHNUM(IDX3)  =  "019" OR "186"
               PERFORM  220-GENBK-SYUKEI-SEC
             ELSE
               PERFORM  VARYING  IDX4  FROM  1  BY  1
                        UNTIL    IDX4  >     20
                        OR       SKT4210TMP-KOHNUM (IDX4) = SPACE
                 IF  RECE10-KOHNUM (IDX3)  =  SKT4210TMP-KOHNUM (IDX4)
                     MOVE  IDX4  TO  CNT-KOH
                     MOVE  20    TO  IDX4
                 END-IF
               END-PERFORM
      *
      *    該当公費がなかった場合
               IF  IDX4  < 20
                 MOVE  IDX4  TO  CNT-KOH
               END-IF
      *
      *    公費名
               MOVE  RECE10-KOHNUM(IDX3)     TO
                                 SKT4210TMP-KOHNUM(CNT-KOH)
      *--- (2008/11/17) LINE ADD START MONMA ---------------------------
      *    公費名称
               MOVE  WRK-KOHNAME      TO  SKT4210TMP-KOHNAME(CNT-KOH)
      *--- (2008/11/17) LINE ADD END   MONMA ---------------------------
      *    療養の給付：件数
               ADD   1                       TO
                                 SKT4210TMP-K-KENSU (CNT-KOH IDX2)
      *    療養の給付:診療実日数
               ADD  RECE10-JNISSU(IDX3 + 1)  TO
                                 SKT4210TMP-K-NISSU(CNT-KOH IDX2)
      *    療養の給付：点数
               ADD  RECE10-TOTALTEN(IDX3 + 1)        TO
                                 SKT4210TMP-K-TENSU(CNT-KOH IDX2)
      *    療養の給付：一部負担金
               ADD  RECE10-FTNMONEY(IDX3 + 1)        TO
                                 SKT4210TMP-K-ITBFTN(CNT-KOH IDX2)
      *
               IF  RECE10-SHOKUJINISSU(IDX3 + 1)  >  ZERO
      *    食事療養:件数
                 ADD   1  TO  SKT4210TMP-K-SKENSU(CNT-KOH)
               END-IF
      *    食事療養:日数
               ADD  RECE10-SHOKUJINISSU(IDX3 + 1)    TO
                                 SKT4210TMP-K-SNISSU(CNT-KOH)
      *    食事療養：金額
               ADD  RECE10-SHOKUJIRYOYOHI(IDX3 + 1)  TO
                                 SKT4210TMP-K-SKINGK(CNT-KOH)
      *    食事療養：標準負担額
               ADD  RECE10-SHOKUJIFTN(IDX3 + 1)      TO
                                 SKT4210TMP-K-SFTNGK(CNT-KOH)
             END-IF
           END-PERFORM
      *
      *
           .
       220-KOH-SYUKEI-EXT.
           EXIT.
057400*
      *****************************************************************
006900*    一般保険＋原爆・被曝集計処理
      *****************************************************************
       220-GENBK-SYUKEI-SEC         SECTION.
      *
           IF     RECE10-KOHNUM(IDX3) = "019"
             MOVE    1                       TO   IDX1
           ELSE
             MOVE    2                       TO   IDX1
           END-IF
      *    療養の給付：件数
           ADD   1        TO     SKT4210TMP-G-KENSU (IDX1 IDX2)
      *    療養の給付:診療実日数
           ADD  RECE10-JNISSU(IDX3 + 1)      TO
                                 SKT4210TMP-G-NISSU(IDX1 IDX2)
      *    療養の給付：点数
           ADD  RECE10-TOTALTEN(IDX3 + 1)    TO
                                 SKT4210TMP-G-TENSU(IDX1 IDX2)
      *    療養の給付：一部負担金
           ADD  RECE10-FTNMONEY(IDX3 + 1)    TO
                                 SKT4210TMP-G-ITBFTN(IDX1 IDX2)
      *
           IF  RECE10-SHOKUJINISSU(IDX3 + 1)  >  ZERO
      *    食事療養:件数
             ADD   1  TO  SKT4210TMP-G-SKENSU(IDX1)
           END-IF
      *    食事療養:日数
           ADD  RECE10-SHOKUJINISSU(IDX3 + 1)    TO
                                 SKT4210TMP-G-SNISSU(IDX1)
      *    食事療養：金額
           ADD  RECE10-SHOKUJIRYOYOHI(IDX3 + 1)  TO
                                 SKT4210TMP-G-SKINGK(IDX1)
      *    食事療養：標準負担額
           ADD  RECE10-SHOKUJIFTN(IDX3 + 1)      TO
                                 SKT4210TMP-G-SFTNGK(IDX1)
      *
           .
       220-GENBK-SYUKEI-EXT.
           EXIT.
057400*
      *****************************************************************
      *    公費負担分集計処理(老人)
      *****************************************************************
       220-RKOH-SYUKEI-SEC        SECTION.
      *
           PERFORM VARYING IDX3     FROM    1   BY  1
                   UNTIL   IDX3     >       4
                   OR  RECE10-KOHNUM (IDX3) =   SPACE
      *
             IF    RECE10-KOHNUM(IDX3)  =  "091"
               MOVE    "051"       TO    RECE10-KOHNUM(IDX3)
             END-IF
      *
      *--- (2008/11/20) LINE ADD START MONMA ---------------------------
      *      公費番号まとめ情報があるとき
               IF  WRK-2007-MAX  >  ZERO
                 MOVE  SPACE     TO  WRK-KOHNAME
                 PERFORM VARYING IDZ1    FROM    1   BY  1
                         UNTIL   IDZ1    >       WRK-2007-MAX
                   PERFORM VARYING IDZ2  FROM    1   BY  1
      *=== 公費番号まとめの編集方法修正 by Yoshikawa(2010/01/07) start
      *                     UNTIL   IDZ2  >       5
                           UNTIL   IDZ2  >       10
      *=== 公費番号まとめの編集方法修正 by Yoshikawa(2010/01/07) end
                           OR WRK-2007-KOHNUM(IDZ1 IDZ2)  =  SPACE
                     IF  RECE10-KOHNUM(IDX3)  
                                   =   WRK-2007-KOHNUM(IDZ1 IDZ2)
                       MOVE  WRK-2007-KOHNUM(IDZ1 1)
                                   TO  RECE10-KOHNUM (IDX3)
                       MOVE  WRK-2007-MEISYO (IDZ1)
                                   TO  WRK-KOHNAME
      *=== 公費番号まとめの編集方法修正 by Yoshikawa(2010/01/07) start
      *                 MOVE  5             TO  IDZ2
                       MOVE  10            TO  IDZ2
      *=== 公費番号まとめの編集方法修正 by Yoshikawa(2010/01/07) end
                       MOVE  WRK-2007-MAX  TO  IDZ1
                     END-IF
                   END-PERFORM
                 END-PERFORM
               END-IF
      *--- (2008/11/20) LINE ADD END   MONMA ---------------------------
      *
      *    公費判別
      *    原爆・被曝は対象外
             IF    RECE10-KOHNUM(IDX3) = "019" OR "186"
               DISPLAY "老人との併用の為対象外" RECE10-KOHNUM(IDX3)
             ELSE
               PERFORM  VARYING  IDX4  FROM  1  BY  1
                        UNTIL    IDX4  >     20
                        OR       SKT4210TMP-RKOHNUM (IDX4) = SPACE
                 IF  RECE10-KOHNUM (IDX3)  =  SKT4210TMP-RKOHNUM (IDX4)
                     MOVE  IDX4  TO  CNT-KOH
                     MOVE  20    TO  IDX4
                 END-IF
               END-PERFORM
      *
      *    該当公費がなかった場合
               IF  IDX4  < 20
                 MOVE  IDX4  TO  CNT-KOH
               END-IF
      *
      *    公費名
               MOVE  RECE10-KOHNUM(IDX3)     TO
                                 SKT4210TMP-RKOHNUM(CNT-KOH)
      *--- (2008/11/20) LINE ADD START MONMA ---------------------------
      *    公費名称
               MOVE  WRK-KOHNAME   TO  SKT4210TMP-RKOHNAME(CNT-KOH)
      *--- (2008/11/20) LINE ADD END   MONMA ---------------------------
      *    療養の給付：件数
               ADD   1                       TO
                                 SKT4210TMP-RK-KENSU(CNT-KOH IDX2)
      *    療養の給付:診療実日数
               ADD  RECE10-JNISSU(IDX3 + 1)  TO
                                 SKT4210TMP-RK-NISSU(CNT-KOH IDX2)
      *    療養の給付：点数
               ADD  RECE10-TOTALTEN(IDX3 + 1)        TO
                                 SKT4210TMP-RK-TENSU(CNT-KOH IDX2)
      *    療養の給付：一部負担金
               ADD  RECE10-FTNMONEY(IDX3 + 1)        TO
                                 SKT4210TMP-RK-ITBFTN(CNT-KOH IDX2)
      *
               IF  RECE10-SHOKUJINISSU(IDX3 + 1)  >  ZERO
      *    食事療養:件数
                 ADD   1  TO  SKT4210TMP-RK-SKENSU(CNT-KOH)
               END-IF
      *    食事療養:日数
               ADD  RECE10-SHOKUJINISSU(IDX3 + 1)    TO
                                 SKT4210TMP-RK-SNISSU(CNT-KOH)
      *    食事療養：金額
               ADD  RECE10-SHOKUJIRYOYOHI(IDX3 + 1)  TO
                                 SKT4210TMP-RK-SKINGK(CNT-KOH)
      *    食事療養：標準負担額
               ADD  RECE10-SHOKUJIFTN(IDX3 + 1)      TO
                                 SKT4210TMP-RK-SFTNGK(CNT-KOH)
             END-IF
           END-PERFORM
      *
      *
           .
       220-RKOH-SYUKEI-EXT.
           EXIT.
057400*
      *****************************************************************
006900*    請求ＤＢ更新用ファイル出力処理
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
      *    帳票ファイル出力処理
      *****************************************************************
       2002-PRINT-SEC                SECTION.
      *
           OPEN     INPUT       SKT4210TMP-FILE
      *
           MOVE     ZERO        TO       FLG-PRINT
      *
      *    一時ファイル読込
           PERFORM  900-TMP-READ-SEC
      *
           PERFORM  UNTIL     FLG-PRINT   =   1
      ***** 05/08/17 DEL
      **    １枚目
      **    帳票編集<見出し>処理
      *       PERFORM 310-HEAD-HEN-SEC
      **    帳票編集<明細>処理
      *       PERFORM 320-BODY-HEN-SEC
      **    帳票印刷処理
      *       PERFORM 330-PRINT-OUT-SEC
      ***** 05/08/17 INS
      *---(01.00.06) LINE ADD START ------------------------------------
      *     旧様式が必要なデータかどうか
             IF  SKT4210TMP-SRYYM  NOT =  ZERO
      *---(01.00.06) LINE ADD END   ------------------------------------
      *    １枚目
      *    印字データが存在しない場合は印刷しない
             IF  SKT4210TMP-PAGE-FLG1  NOT  =  ZERO
      *
      *        帳票編集<見出し>処理
               PERFORM 310-HEAD-HEN-SEC
      *
      *        帳票編集<明細>処理
               PERFORM 320-BODY-HEN-SEC
      *
      *        帳票印刷処理
               PERFORM 330-PRINT-OUT-SEC
             END-IF
      *****
      *    公費ソート処理
             PERFORM  KOH-SORT-SEC
      *
      *    ２枚目
      *    印字データが存在しない場合は印刷しない
             IF  SKT4210TMP-PAGE-FLG2  NOT  =  ZERO
               MOVE     1    TO  WRK-CNT
               MOVE  ZERO    TO  FLG-PASS
               PERFORM  UNTIL  SKT4210TMP-RKOHNUM (WRK-CNT) = SPACE
                        AND    FLG-PASS  =  1
      *    帳票編集<見出し>処理
                 PERFORM 311-HEAD-HEN-SEC
      *    帳票編集<明細>処理
                 PERFORM 321-BODY-HEN-SEC
      *    帳票印刷処理
                 PERFORM 331-PRINT-OUT-SEC
                 MOVE  1  TO  FLG-PASS
               END-PERFORM
             END-IF
      *
      *    ３枚目
      *    印字データが存在しない場合は印刷しない
             IF  SKT4210TMP-PAGE-FLG3  NOT  =  ZERO
               MOVE     1    TO  WRK-CNT
               MOVE  ZERO    TO  FLG-PASS
               PERFORM  UNTIL  SKT4210TMP-KOHNUM (WRK-CNT) = SPACE
                        AND    FLG-PASS  =  1
      *    帳票編集<見出し>処理
                 PERFORM 312-HEAD-HEN-SEC
      *    帳票編集<明細>処理
                 PERFORM 322-BODY-HEN-SEC
      *    帳票印刷処理
                 PERFORM 332-PRINT-OUT-SEC
                 MOVE  1  TO  FLG-PASS
               END-PERFORM
             END-IF
      *---(01.00.06) LINE ADD START ------------------------------------
             ELSE
      *      新様式
               MOVE     1    TO  WRK-CNT
               MOVE  ZERO    TO  FLG-PASS
               PERFORM  UNTIL  SKT4210TMP-KOHNUM (WRK-CNT) = SPACE
                        AND    FLG-PASS  =  1
      *          帳票編集<見出し>処理
                 PERFORM 313-HEAD-HEN-SEC
      *
      *          帳票編集<明細>処理
                 PERFORM 323-BODY-HEN-SEC
      *
      *          帳票印刷処理
                 PERFORM 333-PRINT-OUT-SEC
                 MOVE  1  TO  FLG-PASS
               END-PERFORM
             END-IF
      *---(01.00.06) LINE ADD END   ------------------------------------
      *    一時ファイル読込
             PERFORM  900-TMP-READ-SEC
           END-PERFORM
      *
           CLOSE    SKT4210TMP-FILE
      *
           .
       2002-PRINT-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票編集<ヘッダー部>処理
      *****************************************************************
       310-HEAD-HEN-SEC          SECTION.
      *
           ADD     1                     TO  CNT-PAGE
      *
           INITIALIZE                    SKT4210
      *
      *    診療年月
      *---(01.00.06) LINE ADD START ------------------------------------
           MOVE    SKT4210TMP-SRYYM      TO  WRK-SYMD (1:6)
           MOVE    "01"                  TO  WRK-SYMD (7:2)
           PERFORM 31012-SEIWA-HEN-SEC
           MOVE    WRK-HENYMDG(1:16)     TO  WRK-SRYYMWH 
      *---(01.00.06) LINE ADD END   ------------------------------------
           MOVE    WRK-SRYYMWH           TO  SKT4210-SRYYM
      *    保険者名
           MOVE    SKT4210TMP-HKNJANUM   TO  WRK-HKNJANUM
           PERFORM  920-HKNJAINF-SET-SEC
           MOVE    WRK-HKNJANAME         TO  SKT4210-HKNJANAME
      *    請求年月日
           MOVE    WRK-SEIYMDWH          TO  SKT4210-SEIYMD
      *    郵便番号
      *---(01.00.05) LINE ADD START ------------------------------------
      *    医療機関住所
      *     MOVE    SYS-1002-ADRS         TO  SKT4210-ADRS
      *    医療機関名
      *     MOVE    SYS-1001-HOSPNAME     TO  SKT4210-HOSPNAME
      *    医療機関住所
           MOVE    WRK-HOSPADRS          TO  SKT4210-ADRS
      *    医療機関名
           MOVE    WRK-HOSPNAME          TO  SKT4210-HOSPNAME
      *---(01.00.05) LINE ADD END   ------------------------------------
      *    開設者名
           MOVE    SYS-1001-KAISETUNAME  TO  SKT4210-KAISETUNAME
      *---(01.00.05) LINE ADD START ------------------------------------
      *    電話番号
      *     MOVE    SYS-1002-TEL          TO  SKT4210-TEL
      *    電話番号
           MOVE    WRK-HOSPTEL           TO  SKT4210-TEL
      *---(01.00.05) LINE ADD END   ------------------------------------
      *    保険者番号
           MOVE    SKT4210TMP-HKNJANUM   TO  SKT4210-HKNJANUM
      *    医療機関コード
           MOVE    SYS-1001-HOSPCD       TO  SKT4210-HOSPCD
      *    在宅
           IF     SKT4210TMP-ZAITAKU  =  "1"
             MOVE  "在"                  TO  SKT4210-ZAI1
             MOVE  "○"                  TO  SKT4210-ZAI2
           END-IF
      *    長期
           IF     SKT4210TMP-TYOKI    =  "1"
             MOVE  "長"                  TO  SKT4210-TYOKI1
             MOVE  "○"                  TO  SKT4210-TYOKI2
           END-IF
      *    給付割合
           EVALUATE  SKT4210TMP-KYURATE
           WHEN 10
             MOVE    "100"                  TO  SKT4210-KYURATE
           WHEN 9
             MOVE    " 90"                  TO  SKT4210-KYURATE
           WHEN 8
             MOVE    " 80"                  TO  SKT4210-KYURATE
           WHEN OTHER
             MOVE    " 70"                  TO  SKT4210-KYURATE
           END-EVALUATE
      *
      *    ページ番号
           MOVE      CNT-PAGE               TO  WRK-Z4
           MOVE      WRK-Z4                 TO  SKT4210-NO
      *
           .
       310-HEAD-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票編集<明細行>処理
      *****************************************************************
       320-BODY-HEN-SEC      SECTION.
      *
      *    編集処理
           PERFORM  VARYING  IDX1  FROM    1   BY  1
                    UNTIL    IDX1  >  9
             PERFORM  VARYING  IDX2  FROM  1  BY  1
                      UNTIL    IDX2  >     2
      *    療養の給付：件数
               MOVE  SKT4210TMP-KENSU(IDX1 IDX2)   TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT4210-KENSU(IDX1 IDX2)
      *    療養の給付：日数
               MOVE  SKT4210TMP-NISSU(IDX1 IDX2)   TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT4210-NISSU(IDX1 IDX2)
      *    療養の給付：点数
               MOVE  SKT4210TMP-TENSU(IDX1 IDX2)   TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT4210-TENSU(IDX1 IDX2)
      *---(01.00.04) LINE ADD START ------------------------------------
      *    療養の給付：一部負担金
      *         IF  IDX1  =  1 OR 2 OR 6 OR 7
      *             MOVE  SKT4210TMP-ITBFTN (IDX1 IDX2) TO  WRK-Z9
      *             MOVE  WRK-Z9   TO  SKT4210-ITBFTN(IDX1 IDX2)
      *         END-IF
               MOVE  SKT4210TMP-ITBFTN (IDX1 IDX2) TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT4210-ITBFTN(IDX1 IDX2)
      *---(01.00.04) LINE ADD END   ------------------------------------
             END-PERFORM
      *    食事療養：件数
             MOVE  SKT4210TMP-SKENSU(IDX1)  TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT4210-SKENSU(IDX1)
      *    食事療養：日数
             MOVE  SKT4210TMP-SNISSU(IDX1)  TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT4210-SNISSU(IDX1)
      *    食事療養：金額
             MOVE  SKT4210TMP-SKINGK(IDX1)  TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT4210-SKINGK(IDX1)
      *    食事療養：標準負担額
             MOVE  SKT4210TMP-SFTNGK(IDX1)  TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT4210-SFTNGK(IDX1)
           END-PERFORM
      *
           .
       320-BODY-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票印刷処理
      *****************************************************************
       330-PRINT-OUT-SEC                SECTION.
      *
           DISPLAY  "PRINT"
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
      *---(01.00.06) LINE ADD START ------------------------------------
      *     MOVE   "SKT4210.red"        TO  SPRT-PRTID
           MOVE   "SKT4210o.red"       TO  SPRT-PRTID
      *---(01.00.06) LINE ADD END   ------------------------------------
           MOVE    "国保請求書"        TO  SPRT-TITLE
           MOVE    SKT4210             TO  SPRT-PRTDATA
           MOVE    LNK-PRTKANRI-TERMID TO  SPRT-TERMID
           MOVE    LNK-PRTKANRI-OPID   TO  SPRT-OPID
           MOVE    LNK-PRTKANRI-PRTNM  TO  SPRT-PRTNM
           MOVE    "2"                 TO  SPRT-SITEKBN
           CALL    "ORCSPRT"           USING
                                       ORCSPRTAREA
      *---(01.00.05) LINE ADD START ------------------------------------
                                       SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           IF      SPRT-RETURN         =   ZERO
               CONTINUE
           ELSE
               MOVE    "印刷ＤＢに更新できませんでした"
                                          TO  WRK-RECEERR
               PERFORM 500-ERR-HENSYU-SEC
           END-IF
           .
       330-PRINT-OUT-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票編集<ヘッダー部>処理（老人分）
      *****************************************************************
       311-HEAD-HEN-SEC          SECTION.
      *
           ADD     1                     TO  CNT-PAGE
      *
           INITIALIZE                    SKT4220
      *
      *    診療年月
      *---(01.00.06) LINE ADD START ------------------------------------
           MOVE    SKT4210TMP-SRYYM      TO  WRK-SYMD (1:6)
           MOVE    "01"                  TO  WRK-SYMD (7:2)
           PERFORM 31012-SEIWA-HEN-SEC
           MOVE    WRK-HENYMDG(1:16)     TO  WRK-SRYYMWH 
      *---(01.00.06) LINE ADD END   ------------------------------------
           MOVE    WRK-SRYYMWH           TO  SKT4220-SRYYM
      *    保険者名
           MOVE    SKT4210TMP-HKNJANUM   TO  WRK-HKNJANUM
           PERFORM  920-HKNJAINF-SET-SEC
           MOVE    WRK-HKNJANAME         TO  SKT4220-HKNJANAME
      *    請求年月日
           MOVE    WRK-SEIYMDWH          TO  SKT4220-SEIYMD
      *    郵便番号
      *---(01.00.05) LINE ADD START ------------------------------------
      *    医療機関住所
      *     MOVE    SYS-1002-ADRS         TO  SKT4220-ADRS
      *    医療機関名
      *     MOVE    SYS-1001-HOSPNAME     TO  SKT4220-HOSPNAME
      *    医療機関住所
           MOVE    WRK-HOSPADRS          TO  SKT4220-ADRS
      *    医療機関名
           MOVE    WRK-HOSPNAME          TO  SKT4220-HOSPNAME
      *---(01.00.05) LINE ADD END   ------------------------------------
      *    開設者名
           MOVE    SYS-1001-KAISETUNAME  TO  SKT4220-KAISETUNAME
      *---(01.00.05) LINE ADD START ------------------------------------
      *    電話番号
      *     MOVE    SYS-1002-TEL          TO  SKT4220-TEL
      *    電話番号
           MOVE    WRK-HOSPTEL           TO  SKT4220-TEL
      *---(01.00.05) LINE ADD END   ------------------------------------
      *    保険者番号
           MOVE    SKT4210TMP-HKNJANUM   TO  SKT4220-HKNJANUM
      *    医療機関コード
           MOVE    SYS-1001-HOSPCD       TO  SKT4220-HOSPCD
      *    在宅
           IF     SKT4210TMP-ZAITAKU  =  "1"
             MOVE  "在"                  TO  SKT4220-ZAI1
             MOVE  "○"                  TO  SKT4220-ZAI2
           END-IF
      *    長期
           IF     SKT4210TMP-TYOKI    =  "1"
             MOVE  "長"                  TO  SKT4220-TYOKI1
             MOVE  "○"                  TO  SKT4220-TYOKI2
           END-IF
      *
      *    ページ番号
           MOVE    CNT-PAGE              TO  WRK-Z4
           MOVE    WRK-Z4                TO  SKT4220-NO
      *
      *
           .
       311-HEAD-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票編集<明細行>処理（公費等）
      *****************************************************************
       321-BODY-HEN-SEC      SECTION.
      *
      *    公費の為の２枚目以上か
           IF  WRK-CNT  =  1
      *    老人編集処理
             MOVE     ZERO     TO    IDX4
             PERFORM  VARYING  IDX1  FROM   10   BY  1
                      UNTIL    IDX1  >  13
               ADD  1  TO  IDX4
               PERFORM  VARYING  IDX2  FROM  1  BY  1
                        UNTIL    IDX2  >     2
      *    療養の給付：件数
                 MOVE  SKT4210TMP-KENSU(IDX1 IDX2)  TO  WRK-Z5
                 MOVE  WRK-Z5   TO  SKT4220-KENSU(IDX4 IDX2)
      *    療養の給付：日数
                 MOVE  SKT4210TMP-NISSU(IDX1 IDX2)  TO  WRK-Z5
                 MOVE  WRK-Z5   TO  SKT4220-NISSU(IDX4 IDX2)
      *    療養の給付：点数
                 MOVE  SKT4210TMP-TENSU(IDX1 IDX2)  TO  WRK-Z9
                 MOVE  WRK-Z9   TO  SKT4220-TENSU(IDX4 IDX2)
      *    療養の給付：一部負担金
      *    原爆・被曝は印字しない
                 IF    IDX4  =  1 OR 2
                   MOVE  SKT4210TMP-ITBFTN(IDX1 IDX2) TO  WRK-Z9
                   MOVE  WRK-Z9   TO  SKT4220-ITBFTN(IDX4 IDX2)
                 END-IF
               END-PERFORM
      *    食事療養：件数
               MOVE  SKT4210TMP-SKENSU(IDX1)  TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT4220-SKENSU(IDX4)
      *    食事療養：日数
               MOVE  SKT4210TMP-SNISSU(IDX1)  TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT4220-SNISSU(IDX4)
      *    食事療養：金額
               MOVE  SKT4210TMP-SKINGK(IDX1)  TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT4220-SKINGK(IDX4)
      *    食事療養：標準負担額
               MOVE  SKT4210TMP-SFTNGK(IDX1)  TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT4220-SFTNGK(IDX4)
             END-PERFORM
      *
           END-IF
      *
      *    公費の印字
           PERFORM  VARYING  IDX3  FROM  1  BY  1
                    UNTIL    IDX3  >     4
                    OR  WRK-CNT    >     20
                    OR  SKT4210TMP-RKOHNUM(WRK-CNT) = SPACE
             PERFORM  VARYING  IDX2  FROM  1  BY  1
                      UNTIL    IDX2  >     2
      *    療養の給付：件数
               MOVE  SKT4210TMP-RK-KENSU(WRK-CNT IDX2)   TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT4220-K-KENSU(IDX3 IDX2)
      *    療養の給付：日数
               MOVE  SKT4210TMP-RK-NISSU(WRK-CNT IDX2)   TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT4220-K-NISSU(IDX3 IDX2)
      *    療養の給付：点数
               MOVE  SKT4210TMP-RK-TENSU(WRK-CNT IDX2)   TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT4220-K-TENSU(IDX3 IDX2)
      *    療養の給付：一部負担金
               MOVE  SKT4210TMP-RK-ITBFTN(WRK-CNT IDX2)  TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT4220-K-ITBFTN(IDX3 IDX2)
             END-PERFORM
      *    食事療養：件数
             MOVE  SKT4210TMP-RK-SKENSU(WRK-CNT)         TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT4220-K-SKENSU(IDX3)
      *    食事療養：日数
             MOVE  SKT4210TMP-RK-SNISSU(WRK-CNT)         TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT4220-K-SNISSU(IDX3)
      *    食事療養：金額
             MOVE  SKT4210TMP-RK-SKINGK(WRK-CNT)         TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT4220-K-SKINGK(IDX3)
      *    食事療養：標準負担額
             MOVE  SKT4210TMP-RK-SFTNGK(WRK-CNT)         TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT4220-K-SFTNGK(IDX3)
      *    公費名
             MOVE  SKT4210TMP-RKOHNUM (WRK-CNT)  TO  WRK-KOHNUM
             PERFORM  950-HKNNUM-SET-SEC
             MOVE  HKN-HBTNUM         TO  SKT4220-HBTNUM(IDX3)
             MOVE  HKN-TANSEIDONAME   TO  SKT4220-KOHNAME(IDX3)
      *
      *--- (2008/11/20) LINE ADD START MONMA --------------------------- 
             IF  SKT4210TMP-RKOHNAME (WRK-CNT)  NOT =  SPACE
               MOVE  SKT4210TMP-RKOHNAME (WRK-CNT)
                                        TO  SKT4220-KOHNAME(IDX3)
             ELSE
               MOVE  HKN-TANSEIDONAME   TO  SKT4220-KOHNAME(IDX3)
             END-IF
      *--- (2008/11/20) LINE ADD END   MONMA ---------------------------
      *
             ADD  1  TO  WRK-CNT
           END-PERFORM
      *
           .
       321-BODY-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票印刷処理（老人・公費等）
      *****************************************************************
       331-PRINT-OUT-SEC                SECTION.
      *
           DISPLAY  "PRINT"
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
           MOVE   "SKT4220.red"        TO  SPRT-PRTID
           MOVE    "国保請求書"        TO  SPRT-TITLE
           MOVE    SKT4220             TO  SPRT-PRTDATA
           MOVE    LNK-PRTKANRI-TERMID TO  SPRT-TERMID
           MOVE    LNK-PRTKANRI-OPID   TO  SPRT-OPID
           MOVE    LNK-PRTKANRI-PRTNM  TO  SPRT-PRTNM
           MOVE    "2"                 TO  SPRT-SITEKBN
           CALL    "ORCSPRT"           USING
                                       ORCSPRTAREA
      *---(01.00.05) LINE ADD START ------------------------------------
                                       SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           IF      SPRT-RETURN         =   ZERO
               CONTINUE
           ELSE
               MOVE    "印刷ＤＢに更新できませんでした"
                                          TO  WRK-RECEERR
               PERFORM 500-ERR-HENSYU-SEC
           END-IF
           .
       331-PRINT-OUT-EXT.
           EXIT.
057400*
      *****************************************************************
      *    帳票編集<ヘッダー部>処理（老人・公費等）
      *****************************************************************
       312-HEAD-HEN-SEC          SECTION.
      *
           ADD     1                     TO  CNT-PAGE
      *
           INITIALIZE                    SKT4230
      *
      *    医療機関コード
           MOVE    SYS-1001-HOSPCD       TO  SKT4230-HOSPCD
      *    在宅
           IF     SKT4210TMP-ZAITAKU  =  "1"
             MOVE  "在"                  TO  SKT4230-ZAI1
             MOVE  "○"                  TO  SKT4230-ZAI2
           END-IF
      *    長期
           IF     SKT4210TMP-TYOKI    =  "1"
             MOVE  "長"                  TO  SKT4230-TYOKI1
             MOVE  "○"                  TO  SKT4230-TYOKI2
           END-IF
      *
      *    ページ番号
           MOVE    CNT-PAGE              TO  WRK-Z4
           MOVE    WRK-Z4                TO  SKT4230-NO
      *
      *
           .
       312-HEAD-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票編集<明細行>処理（公費等）
      *****************************************************************
       322-BODY-HEN-SEC      SECTION.
      *
      *    公費の為の２枚目以上か
           IF  WRK-CNT  =  1
      *    原爆・被曝編集
             PERFORM  VARYING  IDX1  FROM   1   BY  1
                      UNTIL    IDX1  >  2
               PERFORM  VARYING  IDX2  FROM  1  BY  1
                        UNTIL    IDX2  >     2
      *    療養の給付：件数
                 MOVE  SKT4210TMP-G-KENSU(IDX1 IDX2)  TO  WRK-Z5
                 MOVE  WRK-Z5   TO  SKT4230-KENSU(IDX1 IDX2)
      *    療養の給付：日数
                 MOVE  SKT4210TMP-G-NISSU(IDX1 IDX2)  TO  WRK-Z5
                 MOVE  WRK-Z5   TO  SKT4230-NISSU(IDX1 IDX2)
      *    療養の給付：点数
                 MOVE  SKT4210TMP-G-TENSU(IDX1 IDX2)  TO  WRK-Z9
                 MOVE  WRK-Z9   TO  SKT4230-TENSU(IDX1 IDX2)
      *    療養の給付：一部負担金
                 MOVE  SKT4210TMP-G-ITBFTN(IDX1 IDX2) TO  WRK-Z9
                 MOVE  WRK-Z9   TO  SKT4230-ITBFTN(IDX1 IDX2)
               END-PERFORM
      *    食事療養：件数
               MOVE  SKT4210TMP-G-SKENSU(IDX1)  TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT4230-SKENSU(IDX1)
      *    食事療養：日数
               MOVE  SKT4210TMP-G-SNISSU(IDX1)  TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT4230-SNISSU(IDX1)
      *    食事療養：金額
               MOVE  SKT4210TMP-G-SKINGK(IDX1)  TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT4230-SKINGK(IDX1)
      *    食事療養：標準負担額
               MOVE  SKT4210TMP-G-SFTNGK(IDX1)  TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT4230-SFTNGK(IDX1)
             END-PERFORM
           END-IF
      *
      *    公費の印字
           PERFORM  VARYING  IDX3  FROM  1  BY  1
                    UNTIL    IDX3  >     8
                    OR  WRK-CNT    >     20
                    OR  SKT4210TMP-KOHNUM(WRK-CNT) = SPACE
             PERFORM  VARYING  IDX2  FROM  1  BY  1
                      UNTIL    IDX2  >     2
      *    療養の給付：件数
               MOVE  SKT4210TMP-K-KENSU(WRK-CNT IDX2)   TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT4230-K-KENSU(IDX3 IDX2)
      *    療養の給付：日数
               MOVE  SKT4210TMP-K-NISSU(WRK-CNT IDX2)   TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT4230-K-NISSU(IDX3 IDX2)
      *    療養の給付：点数
               MOVE  SKT4210TMP-K-TENSU(WRK-CNT IDX2)   TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT4230-K-TENSU(IDX3 IDX2)
      *    療養の給付：一部負担金(入院のみ)
               IF    IDX2  =  1
                 MOVE  SKT4210TMP-K-ITBFTN(WRK-CNT IDX2)  TO  WRK-Z9
                 MOVE  WRK-Z9   TO  SKT4230-K-ITBFTN(IDX3 IDX2)
               END-IF
             END-PERFORM
      *    食事療養：件数
             MOVE  SKT4210TMP-K-SKENSU(WRK-CNT)         TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT4230-K-SKENSU(IDX3)
      *    食事療養：日数
             MOVE  SKT4210TMP-K-SNISSU(WRK-CNT)         TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT4230-K-SNISSU(IDX3)
      *    食事療養：金額
             MOVE  SKT4210TMP-K-SKINGK(WRK-CNT)         TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT4230-K-SKINGK(IDX3)
      *    食事療養：標準負担額
             MOVE  SKT4210TMP-K-SFTNGK(WRK-CNT)         TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT4230-K-SFTNGK(IDX3)
      *    公費名
             MOVE  SKT4210TMP-KOHNUM (WRK-CNT)  TO  WRK-KOHNUM
             PERFORM  950-HKNNUM-SET-SEC
             MOVE  HKN-HBTNUM         TO  SKT4230-HBTNUM(IDX3)
             MOVE  HKN-TANSEIDONAME   TO  SKT4230-KOHNAME(IDX3)
      *---(01.00.04) LINE ADD START ------------------------------------
      *    法制
             MOVE  "00"               TO  SKT4230-HOUSEI(IDX3)
      *---(01.00.04) LINE ADD END   ------------------------------------
      *
      *--- (2008/11/20) LINE ADD START MONMA --------------------------- 
             IF  SKT4210TMP-KOHNAME (WRK-CNT)  NOT =  SPACE
               MOVE  SKT4210TMP-KOHNAME (WRK-CNT)
                                        TO  SKT4230-KOHNAME(IDX3)
             ELSE
               MOVE  HKN-TANSEIDONAME   TO  SKT4230-KOHNAME(IDX3)
             END-IF
      *--- (2008/11/20) LINE ADD END   MONMA ---------------------------
      *
             ADD  1  TO  WRK-CNT
           END-PERFORM
      *
           .
       322-BODY-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票印刷処理（老人・公費等）
      *****************************************************************
       332-PRINT-OUT-SEC                SECTION.
      *
           DISPLAY  "PRINT"
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
           MOVE   "SKT4230.red"        TO  SPRT-PRTID
           MOVE    "国保請求書"        TO  SPRT-TITLE
           MOVE    SKT4230             TO  SPRT-PRTDATA
           MOVE    LNK-PRTKANRI-TERMID TO  SPRT-TERMID
           MOVE    LNK-PRTKANRI-OPID   TO  SPRT-OPID
           MOVE    LNK-PRTKANRI-PRTNM  TO  SPRT-PRTNM
           MOVE    "2"                 TO  SPRT-SITEKBN
           CALL    "ORCSPRT"           USING
                                       ORCSPRTAREA
      *---(01.00.05) LINE ADD START ------------------------------------
                                       SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           IF      SPRT-RETURN         =   ZERO
               CONTINUE
           ELSE
               MOVE    "印刷ＤＢに更新できませんでした"
                                          TO  WRK-RECEERR
               PERFORM 500-ERR-HENSYU-SEC
           END-IF
           .
       332-PRINT-OUT-EXT.
           EXIT.
      *---(01.00.06) LINE ADD START ------------------------------------
      *****************************************************************
      *    帳票編集<ヘッダー部>処理
      *****************************************************************
       313-HEAD-HEN-SEC          SECTION.
      *
           ADD     1                     TO  CNT-PAGE
      *
           INITIALIZE                    SKT4210
      *
      *    診療年月
      *---(01.00.06) LINE ADD START ------------------------------------
           MOVE    LNK-PRTKANRI-SRYYM    TO  WRK-SYMD (1:6)
           MOVE    "01"                  TO  WRK-SYMD (7:2)
           PERFORM 31012-SEIWA-HEN-SEC
           MOVE    WRK-HENYMDG(1:16)     TO  WRK-SRYYMWH 
      *---(01.00.06) LINE ADD END   ------------------------------------
           MOVE    WRK-SRYYMWH           TO  SKT4210-SRYYM
      *    保険者名
           MOVE    SKT4210TMP-HKNJANUM   TO  WRK-HKNJANUM
           PERFORM  920-HKNJAINF-SET-SEC
           MOVE    WRK-HKNJANAME         TO  SKT4210-HKNJANAME
      *    請求年月日
           MOVE    WRK-SEIYMDWH          TO  SKT4210-SEIYMD
      *    郵便番号
           MOVE    WRK-HOSPADRS          TO  SKT4210-ADRS
      *    医療機関名
           MOVE    WRK-HOSPNAME          TO  SKT4210-HOSPNAME
      *    開設者名
           MOVE    SYS-1001-KAISETUNAME  TO  SKT4210-KAISETUNAME
      *    電話番号
           MOVE    WRK-HOSPTEL           TO  SKT4210-TEL
      *    保険者番号
           MOVE    SKT4210TMP-HKNJANUM   TO  SKT4210-HKNJANUM
      *    医療機関コード
           MOVE    SYS-1001-HOSPCD       TO  SKT4210-HOSPCD
      *    在宅
           IF     SKT4210TMP-ZAITAKU  =  "1"
             MOVE  "在"                  TO  SKT4210-ZAI1
             MOVE  "○"                  TO  SKT4210-ZAI2
           END-IF
      *    長期
           IF     SKT4210TMP-TYOKI    =  "1"
             MOVE  "長"                  TO  SKT4210-TYOKI1
             MOVE  "○"                  TO  SKT4210-TYOKI2
           END-IF
      *
      *    ページ番号
           MOVE      CNT-PAGE               TO  WRK-Z4
           MOVE      WRK-Z4                 TO  SKT4210-NO
      *
           .
       313-HEAD-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票編集<明細行>処理
      *****************************************************************
       323-BODY-HEN-SEC      SECTION.
      *
      *    公費の為の２枚目以上か
           IF  WRK-CNT  =  1
      *    編集処理
             PERFORM  VARYING  IDX1  FROM    1   BY  1
                      UNTIL    IDX1  >  9
               PERFORM  VARYING  IDX2  FROM  1  BY  1
                        UNTIL    IDX2  >     2
      *    療養の給付：件数
                 MOVE  SKT4210TMP-KENSU(IDX1 IDX2)   TO  WRK-Z5
                 MOVE  WRK-Z5   TO  SKT4210-KENSU(IDX1 IDX2)
      *    療養の給付：日数
                 MOVE  SKT4210TMP-NISSU(IDX1 IDX2)   TO  WRK-Z5
                 MOVE  WRK-Z5   TO  SKT4210-NISSU(IDX1 IDX2)
      *    療養の給付：点数
                 MOVE  SKT4210TMP-TENSU(IDX1 IDX2)   TO  WRK-Z9
                 MOVE  WRK-Z9   TO  SKT4210-TENSU(IDX1 IDX2)
                 MOVE  SKT4210TMP-ITBFTN (IDX1 IDX2) TO  WRK-Z9
                 MOVE  WRK-Z9   TO  SKT4210-ITBFTN(IDX1 IDX2)
               END-PERFORM
      *    食事療養：件数
               MOVE  SKT4210TMP-SKENSU(IDX1)  TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT4210-SKENSU(IDX1)
      *    食事療養：日数
               MOVE  SKT4210TMP-SNISSU(IDX1)  TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT4210-SNISSU(IDX1)
      *    食事療養：金額
               MOVE  SKT4210TMP-SKINGK(IDX1)  TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT4210-SKINGK(IDX1)
      *    食事療養：標準負担額
               MOVE  SKT4210TMP-SFTNGK(IDX1)  TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT4210-SFTNGK(IDX1)
             END-PERFORM
      *    原爆・被爆
             PERFORM  VARYING  IDX1  FROM    1   BY  1
                      UNTIL    IDX1  >  2
               PERFORM  VARYING  IDX2  FROM  1  BY  1
                        UNTIL    IDX2  >     2
      *    療養の給付：件数
                 MOVE  SKT4210TMP-G-KENSU(IDX1 IDX2)   TO  WRK-Z5
                 MOVE  WRK-Z5   TO  SKT4210-KENSU(IDX1 + 9 IDX2)
      *    療養の給付：日数
                 MOVE  SKT4210TMP-G-NISSU(IDX1 IDX2)   TO  WRK-Z5
                 MOVE  WRK-Z5   TO  SKT4210-NISSU(IDX1 + 9 IDX2)
      *    療養の給付：点数
                 MOVE  SKT4210TMP-G-TENSU(IDX1 IDX2)   TO  WRK-Z9
                 MOVE  WRK-Z9   TO  SKT4210-TENSU(IDX1 + 9 IDX2)
                 MOVE  SKT4210TMP-G-ITBFTN (IDX1 IDX2) TO  WRK-Z9
                 MOVE  WRK-Z9   TO  SKT4210-ITBFTN(IDX1 + 9 IDX2)
               END-PERFORM
      *    食事療養：件数
               MOVE  SKT4210TMP-G-SKENSU(IDX1)  TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT4210-SKENSU(IDX1 + 9)
      *    食事療養：日数
               MOVE  SKT4210TMP-G-SNISSU(IDX1)  TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT4210-SNISSU(IDX1 + 9)
      *    食事療養：金額
               MOVE  SKT4210TMP-G-SKINGK(IDX1)  TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT4210-SKINGK(IDX1 + 9)
      *    食事療養：標準負担額
               MOVE  SKT4210TMP-G-SFTNGK(IDX1)  TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT4210-SFTNGK(IDX1 + 9)
             END-PERFORM
           END-IF
      *
      *    公費の印字
           PERFORM  VARYING  IDX3  FROM  1  BY  1
                    UNTIL    IDX3  >     3
                    OR  WRK-CNT    >     20
                    OR  SKT4210TMP-KOHNUM(WRK-CNT) = SPACE
             PERFORM  VARYING  IDX2  FROM  1  BY  1
                      UNTIL    IDX2  >     2
      *    療養の給付：件数
               MOVE  SKT4210TMP-K-KENSU(WRK-CNT IDX2)   TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT4210-KKENSU(IDX3 IDX2)
      *    療養の給付：日数
               MOVE  SKT4210TMP-K-NISSU(WRK-CNT IDX2)   TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT4210-KNISSU(IDX3 IDX2)
      *    療養の給付：点数
               MOVE  SKT4210TMP-K-TENSU(WRK-CNT IDX2)   TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT4210-KTENSU(IDX3 IDX2)
      *    療養の給付：一部負担金
               MOVE  SKT4210TMP-K-ITBFTN(WRK-CNT IDX2)  TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT4210-KITBFTN(IDX3 IDX2)
             END-PERFORM
      *    食事療養：件数
             MOVE  SKT4210TMP-K-SKENSU(WRK-CNT)         TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT4210-KSKENSU(IDX3)
      *    食事療養：日数
             MOVE  SKT4210TMP-K-SNISSU(WRK-CNT)         TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT4210-KSNISSU(IDX3)
      *    食事療養：金額
             MOVE  SKT4210TMP-K-SKINGK(WRK-CNT)         TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT4210-KSKINGK(IDX3)
      *    食事療養：標準負担額
             MOVE  SKT4210TMP-K-SFTNGK(WRK-CNT)         TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT4210-KSFTNGK(IDX3)
      *    公費名
             MOVE  SKT4210TMP-KOHNUM (WRK-CNT)  TO  WRK-KOHNUM
             PERFORM  950-HKNNUM-SET-SEC
             MOVE  HKN-HBTNUM         TO  SKT4210-KOHNUM(IDX3)
             MOVE  HKN-TANSEIDONAME   TO  SKT4210-KOHNAME(IDX3)
      *
      *--- (2008/11/20) LINE ADD START MONMA --------------------------- 
             IF  SKT4210TMP-KOHNAME (WRK-CNT)  NOT =  SPACE
               MOVE  SKT4210TMP-KOHNAME (WRK-CNT)
                                        TO  SKT4210-KOHNAME(IDX3)
             ELSE
               MOVE  HKN-TANSEIDONAME   TO  SKT4210-KOHNAME(IDX3)
             END-IF
      *--- (2008/11/20) LINE ADD END   MONMA ---------------------------
      *
             ADD  1  TO  WRK-CNT
           END-PERFORM
      *
           .
       323-BODY-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票印刷処理
      *****************************************************************
       333-PRINT-OUT-SEC                SECTION.
      *
           DISPLAY  "PRINT"
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
           MOVE   "SKT4210.red"        TO  SPRT-PRTID
           MOVE    "国保請求書"        TO  SPRT-TITLE
           MOVE    SKT4210             TO  SPRT-PRTDATA
           MOVE    LNK-PRTKANRI-TERMID TO  SPRT-TERMID
           MOVE    LNK-PRTKANRI-OPID   TO  SPRT-OPID
           MOVE    LNK-PRTKANRI-PRTNM  TO  SPRT-PRTNM
           MOVE    "2"                 TO  SPRT-SITEKBN
           CALL    "ORCSPRT"           USING
                                       ORCSPRTAREA
                                       SPA-AREA
           IF      SPRT-RETURN         =   ZERO
               CONTINUE
           ELSE
               MOVE    "印刷ＤＢに更新できませんでした"
                                          TO  WRK-RECEERR
               PERFORM 500-ERR-HENSYU-SEC
           END-IF
           .
       333-PRINT-OUT-EXT.
           EXIT.
      *---(01.00.06) LINE ADD END   ------------------------------------
057400*
      *****************************************************************
      *    公費ソート処理
      *****************************************************************
       KOH-SORT-SEC          SECTION.
      *
      *    一般・退職分
           INITIALIZE  SORT-AREA
      *    公費数を取得
           MOVE    ZERO    TO    IDX-MAX
                                 IDX2 
           MOVE    SPACE   TO    WRK-KOHNUM
           PERFORM  VARYING  IDX1  FROM  1  BY  1
                    UNTIL    IDX1  >  20
             IF  SKT4210TMP-KOHNUM(IDX1)  =  SPACE
               MOVE  20    TO    IDX1
             ELSE
               IF    WRK-KOHNUM               =   SPACE   OR
                     SKT4210TMP-KOHNUM(IDX1)  <   WRK-KOHNUM
                 MOVE     IDX1                TO  IDX2
                 MOVE     SKT4210TMP-KOHNUM(IDX1) TO  WRK-KOHNUM
               END-IF
               ADD   1     TO    IDX-MAX
             END-IF
           END-PERFORM
           IF     IDX2     >     ZERO
             MOVE    SKT4210TMP-KOH-TBL(IDX2) TO  SORT-KOH-TBL(1)
           END-IF
      
           DISPLAY "一般ソート前１" SKT4210TMP-KOHNUM(1)
           DISPLAY "一般ソート前２" SKT4210TMP-KOHNUM(2)
           DISPLAY "一般ソート前３" SKT4210TMP-KOHNUM(3)
      *
           IF      IDX-MAX    >     ZERO
             MOVE    2    TO    IDX1
             MOVE    1    TO    IDX2
             MOVE    1    TO    IDX3
             MOVE   999   TO    WRK-KOHNUM
             PERFORM    UNTIL    IDX1  >    IDX-MAX
               PERFORM  VARYING  IDX2  FROM  1  BY  1
                        UNTIL    IDX2  >    IDX-MAX
                 IF  SKT4210TMP-KOHNUM(IDX2)  >   SORT-KOHNUM(IDX1 - 1)
                   IF  SKT4210TMP-KOHNUM(IDX2)  <  WRK-KOHNUM
                     MOVE  SKT4210TMP-KOHNUM(IDX2)  TO WRK-KOHNUM
                     MOVE  IDX2          TO    IDX3
                   END-IF
                 END-IF
               END-PERFORM
               MOVE  SKT4210TMP-KOH-TBL(IDX3)  TO  SORT-KOH-TBL(IDX1)
               MOVE  999  TO    WRK-KOHNUM
               ADD   1    TO    IDX1
             END-PERFORM
           END-IF
      *
           INITIALIZE             SKT4210TMP-KOH-AREA
           MOVE  SORT-AREA  TO    SKT4210TMP-KOH-AREA
      *
           DISPLAY "一般ソート後１" SKT4210TMP-KOHNUM(1)
           DISPLAY "一般ソート後２" SKT4210TMP-KOHNUM(2)
           DISPLAY "一般ソート後３" SKT4210TMP-KOHNUM(3)
      *
      *
      *    老人分
           INITIALIZE  SORT-AREA
      *    公費数を取得
           MOVE    ZERO    TO    IDX-MAX
                                 IDX2 
           MOVE    SPACE   TO    WRK-KOHNUM
           PERFORM  VARYING  IDX1  FROM  1  BY  1
                    UNTIL    IDX1  >  20
             IF  SKT4210TMP-RKOHNUM(IDX1)  =  SPACE
               MOVE  20    TO    IDX1
             ELSE
               IF    WRK-KOHNUM               =   SPACE   OR
                     SKT4210TMP-RKOHNUM(IDX1) <   WRK-KOHNUM
                 MOVE     IDX1                TO  IDX2
                 MOVE     SKT4210TMP-RKOHNUM(IDX1) TO  WRK-KOHNUM
               END-IF
               ADD   1     TO    IDX-MAX
             END-IF
           END-PERFORM
           IF     IDX2     >     ZERO
             MOVE    SKT4210TMP-RKOH-TBL(IDX2) TO  SORT-KOH-TBL(1)
           END-IF
      
           DISPLAY "老人ソート前１" SKT4210TMP-RKOHNUM(1)
           DISPLAY "老人ソート前２" SKT4210TMP-RKOHNUM(2)
           DISPLAY "老人ソート前３" SKT4210TMP-RKOHNUM(3)
      *
           IF      IDX-MAX    >     ZERO
             MOVE    2    TO    IDX1
             MOVE    1    TO    IDX2
             MOVE    1    TO    IDX3
             MOVE   999   TO    WRK-KOHNUM
             PERFORM    UNTIL    IDX1  >    IDX-MAX
               PERFORM  VARYING  IDX2  FROM  1  BY  1
                        UNTIL    IDX2  >    IDX-MAX
                 IF  SKT4210TMP-RKOHNUM(IDX2)  >   SORT-KOHNUM(IDX1 - 1)
                   IF  SKT4210TMP-RKOHNUM(IDX2)  <  WRK-KOHNUM
                     MOVE  SKT4210TMP-RKOHNUM(IDX2)  TO WRK-KOHNUM
                     MOVE  IDX2          TO    IDX3
                   END-IF
                 END-IF
               END-PERFORM
               MOVE  SKT4210TMP-RKOH-TBL(IDX3)  TO  SORT-KOH-TBL(IDX1)
               MOVE  999  TO    WRK-KOHNUM
               ADD   1    TO    IDX1
             END-PERFORM
           END-IF
      *
           INITIALIZE             SKT4210TMP-RKOH-AREA
           MOVE  SORT-AREA  TO    SKT4210TMP-RKOH-AREA
      *
           DISPLAY "老人ソート後１" SKT4210TMP-RKOHNUM(1)
           DISPLAY "老人ソート後２" SKT4210TMP-RKOHNUM(2)
           DISPLAY "老人ソート後３" SKT4210TMP-RKOHNUM(3)
           .
       KOH-SORT-EXT.
           EXIT.
      *
      *****************************************************************
      *    エラー出力処理
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
      *        ジョブ管理開始処理
               MOVE    "JBE"           TO  SJOBKANRI-MODE
               INITIALIZE                  JOBKANRI-REC
      *---(01.00.05) LINE ADD START ------------------------------------
               MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
               MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
               MOVE    WRK-PARA-SHELLID
                                       TO  JOB-SHELLID
               MOVE    WRK-RECEERR     TO  JOB-YOBI
               MOVE    "9999"          TO  JOB-ERRCD
               CALL    "ORCSJOB"       USING
                                       ORCSJOBKANRIAREA  
                                       JOBKANRI-REC
      *---(01.00.05) LINE ADD START ------------------------------------
                                       SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           END-IF
      *
           MOVE    1                   TO  FLG-END     
      *
           .
       500-ERR-HENSYU-EXT.
           EXIT.
      *
      *****************************************************************
      *   請求管理ＤＢ更新処理
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
                   MOVE    RECE10-REC           TO  MCPDATA-REC
                   MOVE    "DBUPDATE"           TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *             MOVE    PATH-TBL-SEIKYU-KEY  TO  MCP-PATH
      *             CALL    "MCPSUB"         USING
      *                                      MCPAREA
      *                                      MCPDATA-REC
                   MOVE    "tbl_seikyu"     TO  MCP-TABLE
                   MOVE    "key"            TO  MCP-PATHNAME
                   CALL    "ORCDBMAIN"      USING
                                            MCPAREA
                                            MCPDATA-REC
                                            SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
                   IF      MCP-RC          =   ZERO
                       PERFORM 900-UPD-FILE-READ-SEC
                   ELSE
                       DISPLAY "UPD ERR KEY="  RECE10-KEY 
                       MOVE  "*** SOKATU4210 SEIKYU UPD ERR ***"
                                           TO  WRK-RECEERR
                       MOVE    RECE10-KEY  TO  WRK-RECEERR(33:)
                       PERFORM 500-ERR-HENSYU-SEC
                       MOVE    1           TO  FLG-UPDFILE
                   END-IF
               ELSE
                       DISPLAY "INV ERR KEY="  RECE10-KEY 
                   MOVE  "*** SOKATU4210 SEIKYU INVALID ***"
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
      *   保険者情報セット
      *****************************************************************
       920-HKNJAINF-SET-SEC  SECTION.
      *
           INITIALIZE  HKNJAINF-REC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE  SYS-1001-HOSPID        TO  HKNJA-HOSPID
           MOVE    SPA-HOSPNUM          TO  HKNJA-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
           MOVE  WRK-HKNJANUM           TO  HKNJA-HKNJANUM
           MOVE  HKNJAINF-REC           TO  MCPDATA-REC
           MOVE  "DBSELECT"             TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-HKNJAINF-KEY  TO  MCP-PATH
      *     CALL  "MCPSUB"             USING
      *                                MCPAREA
      *                                MCPDATA-REC
           MOVE    "tbl_hknjainf"       TO  MCP-TABLE
           MOVE    "key"                TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
      *---(01.00.05) LINE ADD START ------------------------------------
      *       MOVE  PATH-TBL-HKNJAINF-KEY  TO  MCP-PATH
             MOVE    "tbl_hknjainf"   TO  MCP-TABLE
             MOVE    "key"            TO  MCP-PATHNAME
      *---(01.00.05) LINE ADD END   ------------------------------------
             PERFORM  925-HKNJAINF-READ-SEC
             MOVE  HKNJA-HKNJANAME  TO  WRK-HKNJANAME
           ELSE
             DISPLAY  "HKNJAINF SELECT ERR"
           END-IF
      *
           INITIALIZE  MCPAREA
           MOVE  "DBCLOSECURSOR"        TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-HKNJAINF-KEY  TO  MCP-PATH
      *     CALL  "MCPSUB"         USING
      *                            MCPAREA
      *                            MCPDATA-REC
           MOVE  "tbl_hknjainf"         TO  MCP-TABLE
           MOVE  "key"                  TO  MCP-PATHNAME
           CALL  "ORCDBMAIN"            USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
           .
       920-HKNJAINF-SET-EXT.
           EXIT.
      *
      *****************************************************************
      *    保険者情報読込
      *****************************************************************
       925-HKNJAINF-READ-SEC  SECTION.
      *
           MOVE  "DBFETCH"  TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC
           CALL  "ORCDBMAIN"           USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
             MOVE  MCPDATA-REC  TO  HKNJAINF-REC
             MOVE  ZERO         TO  FLG-HKNJAINF
           ELSE
             INITIALIZE  HKNJAINF-REC
             MOVE  1  TO  FLG-HKNJAINF
           END-IF
      *
           .
       925-HKNJAINF-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *   保険番号情報セット
      *****************************************************************
       950-HKNNUM-SET-SEC  SECTION.
      *
           INITIALIZE  HKNNUM-REC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE  SYS-1001-HOSPID       TO  HKN-HOSPID
           MOVE  SPA-HOSPNUM           TO  HKN-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
           MOVE  WRK-KOHNUM            TO  HKN-HKNNUM
           MOVE  HKNNUM-REC            TO  MCPDATA-REC
           MOVE  "DBSELECT"            TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-HKNNUM-KEY2  TO  MCP-PATH
      *     CALL  "MCPSUB"             USING
      *                                MCPAREA
      *                                MCPDATA-REC
           MOVE    "tbl_hknnum"         TO  MCP-TABLE
           MOVE    "key2"               TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
      *---(01.00.05) LINE ADD START ------------------------------------
      *       MOVE  PATH-TBL-HKNNUM-KEY2  TO  MCP-PATH
             MOVE    "tbl_hknnum"     TO  MCP-TABLE
             MOVE    "key2"           TO  MCP-PATHNAME
      *---(01.00.05) LINE ADD END   ------------------------------------
             PERFORM  955-HKNNUM-READ-SEC
           ELSE
             DISPLAY  "HKNNUM SELECT ERR"
           END-IF
      *
           INITIALIZE  MCPAREA
           MOVE  "DBCLOSECURSOR"       TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-HKNNUM-KEY2  TO  MCP-PATH
      *     CALL  "MCPSUB"         USING
      *                            MCPAREA
      *                            MCPDATA-REC
           MOVE  "tbl_hknnum"           TO  MCP-TABLE
           MOVE  "key2"                 TO  MCP-PATHNAME
           CALL  "ORCDBMAIN"            USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
           .
       950-HKNNUM-SET-EXT.
           EXIT.
      *
      *****************************************************************
      *    保険番号情報読込
      *****************************************************************
       955-HKNNUM-READ-SEC  SECTION.
      *
           MOVE  "DBFETCH"  TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC
           CALL  "ORCDBMAIN"           USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
             MOVE  MCPDATA-REC  TO  HKNNUM-REC
             MOVE  ZERO         TO  FLG-HKNNUM
             IF    HKN-HKNNUM  =  "051"
               INITIALIZE                HKN-TANSEIDONAME
               MOVE    "特定疾患"   TO   HKN-TANSEIDONAME
             END-IF
           ELSE
             INITIALIZE  HKNNUM-REC
             MOVE  1  TO  FLG-HKNNUM
           END-IF
      *
           .
       955-HKNNUM-READ-EXT.
           EXIT.
      *
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
           INSPECT WRK-HENYMDG    REPLACING  ALL "  "  BY  "　"
           .
       31012-SEIWA-HEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    請求管理読込
      *****************************************************************
       900-SEIKYU-SELECT-SEC             SECTION.
      *
      *    請求管理ＤＢ検索
           INITIALIZE                  RECE10-REC
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE   SYS-1001-HOSPID       TO    RECE10-HOSPID.
           MOVE   SPA-HOSPNUM           TO    RECE10-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
           MOVE   LNK-PRTKANRI-SRYYM    TO    RECE10-SKYYM.
      *
           IF    WRK-PARA-HKNJANUM  NOT = ZERO
             MOVE  WRK-PARA-HKNJANUM  TO  RECE10-XXSTHKNJANUM
                                          RECE10-XXEDHKNJANUM
           ELSE
               MOVE    SPACE               TO  RECE10-XXSTHKNJANUM
               MOVE    "99999999"          TO  RECE10-XXEDHKNJANUM
           END-IF
      *
           MOVE    RECE10-REC          TO  MCPDATA-REC
           MOVE    "DBSELECT"          TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    WRK-PATH            TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_seikyu"        TO  MCP-TABLE
           MOVE    WRK-PATH            TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
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
      *    請求マスター読込
      *****************************************************************
       900-SEIKYU-READ-SEC           SECTION.
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    WRK-PATH            TO  MCP-PATH
      *     MOVE    "DBFETCH"           TO  MCP-FUNC
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_seikyu"        TO  MCP-TABLE
           MOVE    WRK-PATH            TO  MCP-PATHNAME
           MOVE    "DBFETCH"           TO  MCP-FUNC
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    ZERO                TO  FLG-END
               MOVE    MCPDATA-REC         TO  RECE10-REC
      *
      *        テスト患者のときは読み飛ばす
               MOVE    SPACE               TO  PTINF-REC
               INITIALIZE                      PTINF-REC
      *---(01.00.05) LINE ADD START ------------------------------------
      *         MOVE    RECE10-HOSPID       TO  PTINF-HOSPID
               MOVE    SPA-HOSPNUM         TO  PTINF-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
               MOVE    RECE10-PTID         TO  PTINF-PTID
               MOVE    PTINF-REC           TO  MCPDATA-REC
               PERFORM 800-PTINF-READ-SEC
               IF      FLG-PTINF           =   ZERO
               AND     PTINF-TSTPTNUMKBN   =   "1"
                   GO  TO  900-SEIKYU-READ-SEC
               END-IF   
      *         
               ADD     1               TO  CNT-RECE10   
           ELSE
               MOVE    1               TO  FLG-END
           END-IF
      *
           .
       900-SEIKYU-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    患者マスタ読込
      *****************************************************************
       800-PTINF-READ-SEC         SECTION.
      *
           MOVE    "DBSELECT"          TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-PTINF-KEY  TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_ptinf"           TO  MCP-TABLE
           MOVE    "key"                 TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"           USING
                                         MCPAREA
                                         MCPDATA-REC
                                         SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"           TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-PTINF-KEY  TO  MCP-PATH
      *         CALL    "MCPSUB"             USING
      *                                      MCPAREA
      *                                      MCPDATA-REC
               MOVE    "tbl_ptinf"       TO  MCP-TABLE
               MOVE    "key"             TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"       USING
                                         MCPAREA
                                         MCPDATA-REC
                                         SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
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
           MOVE    "DBCLOSECURSOR"           TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-PTINF-KEY        TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_ptinf"          TO  MCP-TABLE
           MOVE    "key"                TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
           .
       800-PTINF-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    集計ファイル読込
      *****************************************************************
       900-SKTTMP-READ-SEC             SECTION.
      *
           READ    SKT4210TMP-FILE
               INVALID    KEY
                   MOVE    1           TO  FLG-SKT4210TMP
               NOT INVALID  KEY
                   MOVE    ZERO        TO  FLG-SKT4210TMP
           END-READ
           .
       900-SKTTMP-READ-EXT.
           EXIT.
      *
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
           .
       900-UPD-FILE-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    システム管理マスタ読込
      *****************************************************************
       910-SYSKANRI-INV-SEC         SECTION.
      *
           MOVE    "DBSELECT"               TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SYSKANRI-KEY10  TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_syskanri"            TO  MCP-TABLE
           MOVE    "key10"                   TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"               USING
                                             MCPAREA
                                             MCPDATA-REC
                                             SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-SYSKANRI-KEY10  TO  MCP-PATH
      *         CALL    "MCPSUB"             USING
      *                                      MCPAREA
      *                                      MCPDATA-REC
               MOVE    "tbl_syskanri"       TO  MCP-TABLE
               MOVE    "key10"              TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"          USING
                                            MCPAREA
                                            MCPDATA-REC
                                            SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
               IF      MCP-RC              =   ZERO
                   MOVE    ZERO                TO  FLG-SYSKANRI
               ELSE
                   MOVE    1                   TO  FLG-SYSKANRI
               END-IF
           ELSE
               MOVE    1                   TO  FLG-SYSKANRI
           END-IF
      *
           MOVE    "DBCLOSECURSOR"           TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SYSKANRI-KEY10   TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_syskanri"       TO  MCP-TABLE
           MOVE    "key10"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
           .
       910-SYSKANRI-INV-EXT.
           EXIT.
      *
      *****************************************************************
      *    請求管理マスタ読込
      *****************************************************************
       910-SEIKYU-INV-SEC         SECTION.
      *
           MOVE    "DBSELECT"           TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SEIKYU-KEY  TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_seikyu"         TO  MCP-TABLE
           MOVE    "key"                TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"            TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-SEIKYU-KEY  TO  MCP-PATH
      *         CALL    "MCPSUB"             USING
      *                                      MCPAREA
      *                                      MCPDATA-REC
               MOVE    "tbl_seikyu"         TO  MCP-TABLE
               MOVE    "key"                TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"          USING
                                            MCPAREA
                                            MCPDATA-REC
                                            SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
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
           MOVE    "DBCLOSECURSOR"           TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SEIKYU-KEY       TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_seikyu"         TO  MCP-TABLE
           MOVE    "key"                TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
           .
       910-SEIKYU-INV-EXT.
           EXIT.
      *
      *****************************************************************
      *    一時ファイル読込
      *****************************************************************
       900-TMP-READ-SEC                SECTION.
      *
           READ  SKT4210TMP-FILE   NEXT
               AT  END
                   MOVE  1  TO  FLG-PRINT
           END-READ
           .
       900-TMP-READ-EXT.
           EXIT.
      *
      *--- (2008/11/20) LINE ADD START MONMA ---------------------------
      *****************************************************************
      *    テーブルアクセス処理
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
      *    システム管理マスタ読込（ＮＥＸＴ）
      *****************************************************************
       900-SYSKANRI-READ-N-SEC         SECTION.
      *
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
      *    ＤＢＦＥＴＣＨ処理
      *****************************************************************
       900-DBFETCH-SEC                SECTION.
      *
           MOVE    "DBFETCH"           TO  MCP-FUNC
           PERFORM 900-ORCDBMAIN-SEC
      *
           .
       900-DBFETCH-EXT.
           EXIT.
      *--- (2008/11/20) LINE ADD START MONMA ---------------------------
      *
      *---(01.00.05) LINE ADD START ------------------------------------
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
           PERFORM 910-SYSKANRI-INV-SEC
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
      *---(01.00.05) LINE ADD END   ------------------------------------
      *****************************************************************
      *    ＤＢ　オープン処理
      *****************************************************************
       100-DBOPEN-SEC                SECTION.
      *
      *---(01.00.05) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.05) LINE ADD END   ------------------------------------
           MOVE    "DBOPEN"            TO  MCP-FUNC.
      *---(01.00.05) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *---(01.00.05) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.05) LINE ADD END   ------------------------------------
           MOVE    "DBSTART"           TO  MCP-FUNC.
      *---(01.00.05) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           .
       100-DBOPEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    ＤＢ　クローズ処理
      *****************************************************************
       900-DBDISCONNECT-SEC            SECTION.
      *
      *---(01.00.05) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.05) LINE ADD END   ------------------------------------
           MOVE    "DBCOMMIT"          TO  MCP-FUNC.
      *---(01.00.05) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *---(01.00.05) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.05) LINE ADD END   ------------------------------------
           MOVE    "DBDISCONNECT"      TO  MCP-FUNC.
      *---(01.00.05) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           .                             
       900-DBDISCONNECT-EXT.
           EXIT.
