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
       PROGRAM-ID.             SOKATU1105.
      *****************************************************************
      *  システム名        : ＯＲＣＡ
      *  サブシステム名    : 月次帳票
      *  コンポーネント名  : 国保・退職者医療・老人保健及び公費総括表
      *                      (病院及び有床診療所用)
      *  管理者            : 
      *  作成日付    作業者    記述
      *  05/06/08    有村      再作成(2.5.0対応)
      *****************************************************************
      *  プログラム修正履歴
      * Maj/Min/Rev  修正者   日付      内容
      *  01.00.01    有村    05/08/17   「当月＋月遅れ」と「返戻分」は
      *                                 別紙で出力するよう修正
      *  01.00.02    劉洋    06/02/11   川越市の老人福祉医療を併用している
      *                                 患者が集計される
      *  01.00.03    劉亭    06/04/18   公費計の誤集計、印字のバグ修正
      *  01.00.04    劉亭    06/04/19   ORCA2.7、open-cobol0.23への対応
      *  01.00.05    内田    06/11/23   食事がない場合でも生活療養費を印字
      *  01.00.06    内田    07/04/21   印字対象番号の追加（181等）
      *  01.00.07    内田    07/09/21   日レセver4.0対応
      *                                 システム管理マスタ「1901」の
      *                                 医療機関情報を参照
      *  01.00.08    内田    08/03/12   特別療養費対応
      *  01.00.09    長屋    08/04/24   帳票様式に伴う修正
      *                                 入院外の点数が無い場合、入院の
      *                                 平均が印字される不具合を修正
      *  01.00.10    内田    08/05/14   請求額払い金額欄修正
      *                                 （前期高齢９割の特例措置対応）
      *                                 後期高齢の食事印字修正
      *  01.00.11    内田    08/06/25   後期高齢のみの場合でも印字するよう修正
      *                                 印字対象番号の追加（481等）
      *****************************************************************
       ENVIRONMENT                 DIVISION.
       CONFIGURATION               SECTION.
       INPUT-OUTPUT                SECTION.
       FILE-CONTROL.

      *    総括表一時ファイル  
           SELECT  SKT1105TMP-FILE ASSIGN  SKT1105TP
                                   ORGANIZATION    IS  INDEXED
                                   ACCESS  MODE    IS  DYNAMIC
                                   RECORD  KEY     IS  SKT1105TMP-KEY
                                   FILE    STATUS  IS  STS-SKT1105.
      *
006900*    請求ＤＢ更新用ファイル
           SELECT  UPD-FILE        ASSIGN  RECEUPD
                                   FILE    STATUS  IS  STS-RECEUPD.
      *
      *
006900*    エラーファイル
           SELECT  RECEERR-FILE    ASSIGN  RECEERR
                                   FILE    STATUS  IS  STS-RECEERR.
      *
       DATA                        DIVISION.
       FILE                        SECTION.
      *
      *    総括表一時ファイル  
       FD  SKT1105TMP-FILE.
           COPY    "CPSKT1105TMP.INC".
      *
006900*    請求ＤＢ更新用ファイル
       FD  UPD-FILE.
           COPY    "CPRCF010.INC"  REPLACING  //RECE10//
                                   BY         //RECE10X//.
      *
      *
006900*    エラーファイル
       FD  RECEERR-FILE.
       01  RECEERR-REC             PIC X(200). 
      *
       WORKING-STORAGE             SECTION.
      *
      *    印刷用データ 名称領域 
           COPY    "CPCOMMONPRT.INC".
      *
      *    総括表一時ファイル 名称領域 
           COPY    "CPCOMMONDAT2.INC"
                                   REPLACING  //RECE01PARA//
                                   BY         //SKT1105TP//.
      *
      *    請求ＤＢ更新用ファイル 名称領域 
           COPY    "CPCOMMONDAT2.INC"
                                   REPLACING  //RECE01PARA//
                                   BY         //RECEUPD//.
           03  FILLER              PIC X(04)   VALUE   ".dat".
      *
      *    エラーファイル 名称領域 
      *---(01.00.07) LINE ADD START ------------------------------------
      *     COPY    "CPCOMMONDAT2.INC"
      *                             REPLACING  //RECE01PARA//
      *                             BY         //RECEERR//.
      *     03  FILLER              PIC X(04)   VALUE   ".dat".
           COPY    "CPERRFL.INC"    REPLACING  //ERRFLPARA//
                                    BY         //RECEERR//.
      *---(01.00.07) LINE ADD END   ------------------------------------
      *     
      *    シェル用領域
           COPY    "CPCOMMONSHELL.INC".
      *
      *    印刷用領域
           COPY    "SKT1105.INC".
      *
      *    スパ領域
       01  STS-AREA.
           03  STS-PARA            PIC X(02).
           03  STS-SKT1105         PIC X(02).
           03  STS-RECEERR         PIC X(02).
           03  STS-RECEUPD         PIC X(02).
      *
      *    フラグ領域
       01  FLG-AREA.
           03  FLG-END             PIC 9(01).
           03  FLG-SKT1105TMP      PIC 9(01).
           03  FLG-RECE10          PIC 9(01).
           03  FLG-SYSKANRI        PIC 9(01).
           03  FLG-HKNNUM          PIC 9(01).
           03  FLG-HKNJAINF        PIC 9(01).
           03  FLG-UPD             PIC 9(01).
           03  FLG-UPDFILE         PIC 9(01).
           03  FLG-SEIKYU          PIC 9(01).
           03  FLG-PRINT           PIC 9(01).
           03  FLG-NG              PIC 9(01).
           03  FLG-SYUNOU          PIC 9(01).
           03  FLG-PTINF           PIC 9(01).
           03  FLG-RECE02          PIC 9(01).
      *---(01.00.09) LINE ADD START ------------------------------------
           03  FLG-KOUKI           PIC 9(01).
           03  FLG-TOKUBETU        PIC 9(01).
      *---(01.00.09) LINE ADD END   ------------------------------------
      *
      *    添字領域
       01  IDX-AREA.
           03  IDX                 PIC 9(04).
           03  IDX1                PIC 9(04).
           03  IDX2                PIC 9(04).
           03  IDX3                PIC 9(04).
           03  IDX4                PIC 9(04).
           03  IDX-O               PIC 9(04).
      *
      *    システム領域
       01  SYS-AREA.
           03  SYS-TIME            PIC 9(08).    
      *
      *    パラメタ領域
       01  WRK-PARA.
           COPY    "CPORCSPRTLNK.INC".
      ***** 05/08/17 DEL
      *     03  WRK-PARA-JOBID      PIC 9(07).
      *     03  WRK-PARA-SHELLID    PIC X(08).
      *     03  WRK-PARA-HOSPID     PIC X(24).
      *     03  WRK-PARA-PAGE       PIC 9(10).
      ***** 05/08/17 INS
           03  WRK-PARA-JOBID      PIC 9(07).
           03  WRK-PARA-SHELLID    PIC X(08).
      *---(01.00.07) LINE ADD START ------------------------------------
      *     03  WRK-PARA-HOSPID     PIC X(24).
           03  WRK-PARA-HOSPNUM    PIC 9(02).
      *---(01.00.07) LINE ADD END   ------------------------------------
           03  WRK-PARA-HKNJANUM   PIC X(08).
           03  WRK-PARA-PAGE       PIC 9(10).
           03  WRK-PARA-SYOKBN     PIC X(01).
      ****2006/02/11 @@@@-BRAND START
           03  WRK-RJ              PIC 9(08).
      ****2006/02/11 @@@@-BRAND END
      *****
      *
       01  GOUKEI-AREA.
           03  KOKUHO-TAL.
               05  WRK-KOKUHO-NYUGAI OCCURS 2.
                   07  WRK-KKHKENSU     PIC 9(05).
                   07  WRK-KKHNISSU     PIC 9(05).
                   07  WRK-KKHTENSU     PIC 9(09).
               05  WRK-S-KKHKENSU       PIC 9(05).
               05  WRK-S-KKHNISSU       PIC 9(05).
               05  WRK-S-KKHKINGK       PIC 9(09).
               05  WRK-KKHSEIKYUGK      PIC 9(09).
           03  KOUHI-TAL.
               05  WRK-KOUHI-NYUGAI OCCURS 2.
                   07  WRK-KOHKENSU     PIC 9(05).
                   07  WRK-KOHNISSU     PIC 9(05).
                   07  WRK-KOHTENSU     PIC 9(09).
               05  WRK-S-KOHKENSU       PIC 9(05).
               05  WRK-S-KOHNISSU       PIC 9(05).
               05  WRK-S-KOHKINGK       PIC 9(09).
               05  WRK-KOHSEIKYUGK      PIC 9(09).
      *
           03  WRK-KOHNUM               PIC X(03).
           03  WRK-SEIKYUGK-G           PIC 9(07).
           03  WRK-HEIKIN               PIC 9(07)V9(1).
           03  WRK-HEIKIN-Z             PIC ZZZ,ZZZ.Z.
      *
      *    一時領域
       01  WRK-AREA.
           03  WRK-SEIYMD        PIC X(08).
           03  WRK-SEIYMDWH      PIC X(20).
           03  WRK-SRYYMWH       PIC X(16).
           03  WRK-SRYYMD        PIC X(08).
           03  WRK-SEIKYUGK      PIC 9(06).
      *
           03   WRK-KEISAN1      PIC S9(08)V9(01).
           03   WRK-KEISAN1-G    PIC S9(08).
           03   WRK-KEISAN2      PIC S9(08)V9(01).
           03   WRK-KEISAN2-G    PIC S9(08).
      *  
           03  WRK-SYMD.
               05  WRK-SYY           PIC 9(04).
               05  WRK-SMM           PIC 9(02).
               05  WRK-SDD           PIC 9(02).
           03  WRK-HENYMDG           PIC X(22).
      *
           03  WRK-Z2                PIC ZZ.
           03  WRK-Z5                PIC Z,ZZZ.
           03  WRK-Z9                PIC Z,ZZZ,ZZZ.
           03  WRK-Z92               PIC ZZZZZZZZZ.
           03  WRK-Z10               PIC ZZ,ZZZ,ZZZ.
           03  WRK-Z9-14             PIC ZZ,ZZZ,ZZZ,ZZZ.
      *
           03  WRK-RECEERR           PIC X(200). 
      *
           03  WRK-HC01PARA-CNT      PIC  9(06).
      *
           03  WRK-KBN               PIC  9(02).
      *
      *---(01.00.07) LINE ADD START ------------------------------------
      *     03  WRK-PATH.
      *         05  FILLER          PIC S9(09)  BINARY.
      *         05  FILLER          PIC S9(09)  BINARY.
      *         05  FILLER          PIC S9(09)  BINARY.
      ***** 05/08/17 INS
      *    請求管理情報参照用
      *     03  WRK-PATH2.
      *         05  FILLER          PIC S9(09)  BINARY.
      *         05  FILLER          PIC S9(09)  BINARY.
      *         05  FILLER          PIC S9(09)  BINARY.
      *****
           03  WRK-PATH              PIC X(50).
           03  WRK-PATH2             PIC X(50).
      *---(01.00.09) LINE ADD START ------------------------------------
           03  WRK-PATH3               PIC X(50).
           03  WRK-HKNNUM              PIC X(03).
           03  WRK-KOUKI-NYU OCCURS 2.
                05 WRK-KOUKI-1         PIC 9(10).
                05 WRK-KOUKI-2         PIC 9(10).
                05 WRK-KOUKI-3         PIC 9(10).
           03  WRK-KOUKI-5             PIC 9(10).
           03  WRK-KOUKI-6             PIC 9(10).
           03  WRK-KOUKI-9             PIC 9(10).
      *---(01.00.09) LINE ADD END   ------------------------------------
      *    医療機関情報
           03  WRK-HOSPNAME          PIC X(100).
           03  WRK-HOSPNAME-R        REDEFINES   WRK-HOSPNAME.
               05  WRK-HOSPNAME1     PIC X(50).
               05  WRK-HOSPNAME2     PIC X(50).
           03  WRK-HOSPADRS          PIC X(100).
           03  WRK-HOSPADRS-R        REDEFINES   WRK-HOSPADRS.
               05  WRK-HOSPADRS1     PIC X(50).
               05  WRK-HOSPADRS2     PIC X(50).
           03  WRK-HOSPTEL           PIC X(15).
      *---(01.00.07) LINE ADD END   ------------------------------------
      *
      *    文字変換
           03  WRK-MAE-INPUT         PIC X(200).
           03  WRK-OUT-INPUT         PIC X(200).
      *
       01  HEN-AREA.
           03  HEN-KYURATE-AREA.
               05  FILLER            PIC  X(01) VALUE "(".
               05  HEN-KYURATE       PIC  X(02).
               05  FILLER            PIC  X(02) VALUE "割".
               05  FILLER            PIC  X(01) VALUE ")".
           03  HEN-KOH-AREA.
               05  FILLER            PIC  X(01) VALUE "(".
               05  HEN-HBTNUM        PIC  X(02).
               05  FILLER            PIC  X(01) VALUE ")".
      *
      *    カウント領域
       01  CNT-AREA.
           03  CNT-PAGE              PIC 9(03).
           03  CNT-RECE10            PIC 9(06).
           03  CNT-UPDFILE           PIC 9(06).
           03  CNT-LINE              PIC 9(02).
      *
      *    集計領域
       01  SUM-AREA.
           03  SUM-GOKEI-TBL.
               05  SUM-NYUGAI OCCURS 2.
                   07  SUM-KENSU     PIC 9(05).
                   07  SUM-NISSU     PIC 9(05).
                   07  SUM-TENSU     PIC 9(09).
               05  SUM-S-KENSU       PIC 9(05).
               05  SUM-S-NISSU       PIC 9(05).
               05  SUM-S-KINGK       PIC 9(09).
               05  SUM-SEIKYUGK      PIC 9(09).
      *     
      *---(01.00.07) LINE ADD START ------------------------------------
      *     COPY    "ORCA-DBPATH".
           COPY    "COMMON-SPA".
      *---(01.00.07) LINE ADD END   ------------------------------------
      *---(01.00.09) LINE ADD START ------------------------------------
      *    固定項目
       01  WRK-CONS-AREA.
           03  WRK-CONS-SRYYM-200804   PIC X(06)   VALUE   "200804".
      *---(01.00.09) LINE ADD END   ------------------------------------
      *
      *****************************************************************
      *    ファイルレイアウト
      *****************************************************************
      *
      *
      *    患者
       01  PTINF-REC.
           COPY    "CPPTINF.INC".
      *
      *    保険者情報
       01  HKNJAINF-REC.
           COPY    "CPHKNJAINF.INC".
      *
      *    ＪＯＢ管理ＤＢ
       01  JOBKANRI-REC.
           COPY    "CPJOBKANRI.INC".
      *
      *    保険番号
       01  HKNNUM-REC.
           COPY    "CPHKNNUM.INC".
      *
      *    収納情報
       01  SYUNOU-REC.
           COPY  "CPSYUNOU.INC".
      *
      *    システム管理マスタ
           COPY    "CPSYSKANRI.INC".
      *
      *    医療機関情報
           COPY    "CPSK1001.INC".
      *
      *    医療機関情報−所在地、連絡先 
           COPY    "CPSK1002.INC".
      *
      *---(01.00.07) LINE ADD START ------------------------------------
      *    医療機関編集情報
           COPY    "CPSK1900.INC".
      *
      *    医療機関名称編集情報
           COPY    "CPSK1901.INC".
      *
      *    医療機関住所編集情報
           COPY    "CPSK1902.INC".
      *---(01.00.07) LINE ADD END   ------------------------------------
      *
      *    請求管理情報
           COPY    "CPRCF010.INC".
      *
      *    公費請求書
           COPY    "CPKOHSKY.INC"
                   REPLACING  //KOHSKY//
                   BY         //RECE02//.
      *
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
      *    半角チェックサブ
           COPY    "CPORCSKANACHK.INC".
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
      *
           PERFORM  100-INIT-SEC
      *
           PERFORM  200-MAIN-SEC
      *---(01.00.11) LINE ADD START ------------------------------------
      *              UNTIL   FLG-END   =   1
      *---(01.00.11) LINE ADD END   ------------------------------------
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
           INITIALIZE  FLG-AREA
           INITIALIZE  STS-AREA
           INITIALIZE  WRK-AREA
           INITIALIZE  CNT-AREA
           INITIALIZE  SUM-AREA
           INITIALIZE  GOUKEI-AREA
           INITIALIZE  IDX-AREA
      ****2006/04/18 @@@@-BRAND START
           INITIALIZE  WRK-PARA
      ****2006/04/18 @@@@-BRAND END
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
      ***** 05/08/17 DEL 
      *                                         WRK-PARA-JOBID
      *                                         WRK-PARA-SHELLID
      *                                         WRK-PARA-HOSPID
      ***** 05/08/17 INS
      *---(01.00.07) LINE ADD START ------------------------------------
      *                                         WRK-PARA-HOSPID
                                               WRK-PARA-HOSPNUM
      *---(01.00.07) LINE ADD END   ------------------------------------
                                               WRK-PARA-JOBID
                                               WRK-PARA-SHELLID
                                               WRK-PARA-HKNJANUM
                                               WRK-PARA-SYOKBN
      *---(01.00.07) LINE ADD START ------------------------------------
                                               RECEERR
      *---(01.00.07) LINE ADD END   ------------------------------------
      *****
           END-UNSTRING
      *---(01.00.07) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  SPA-HOSPNUM
      *---(01.00.07) LINE ADD END   ------------------------------------
      *
      *    ステップ開始処理
           MOVE    "STS"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
      *---(01.00.07) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.07) LINE ADD END   ------------------------------------
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           MOVE    "SKT1105"    TO  JOB-PGID
           MOVE    "埼玉国保総括表(病院：有床用)"    TO  JOB-SHELLMSG
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA  
                                   JOBKANRI-REC
      *---(01.00.07) LINE ADD START ------------------------------------
                                   SPA-AREA
      *---(01.00.07) LINE ADD END   ------------------------------------
      ****2006/04/19 @@@@-BRAND START
      *     MOVE    "SKT1105TP"         TO  SKT1105TP-FILE-ID
           MOVE    "SKT1105"         TO  SKT1105TP-FILE-ID
      ****2006/04/19 @@@@-BRAND END
           MOVE    LNK-PRTKANRI-TERMID     TO  SKT1105TP-TERMID
      *---(01.00.07) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM        TO  SKT1105TP-HOSPNUM
      *---(01.00.07) LINE ADD END   ------------------------------------
      *
           MOVE    "RECEUPD"           TO  RECEUPD-FILE-ID
           MOVE    LNK-PRTKANRI-TERMID     TO  RECEUPD-TERMID
      *---(01.00.07) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM        TO  RECEUPD-HOSPNUM
      *---(01.00.07) LINE ADD END   ------------------------------------
      *
      *---(01.00.07) LINE ADD START ------------------------------------
      *     MOVE    "RECEERR"           TO  RECEERR-FILE-ID
      *     MOVE    LNK-PRTKANRI-TERMID     TO  RECEERR-TERMID
      *---(01.00.07) LINE ADD END   ------------------------------------
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
           INITIALIZE                     SYS-1001-REC
           MOVE    "1001"              TO  SYS-1001-KANRICD
           MOVE    "*"                 TO  SYS-1001-KBNCD
           MOVE    LNK-PRTKANRI-SRYYM(1:6)
                                       TO  SYS-1001-STYUKYMD(1:6)
                                           SYS-1001-EDYUKYMD(1:6)
           MOVE    "01"                TO  SYS-1001-STYUKYMD(7:2)
                                           SYS-1001-EDYUKYMD(7:2)
      *---(01.00.07) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM         TO  SYS-1001-HOSPNUM
      *---(01.00.07) LINE ADD END   ------------------------------------
           MOVE    SYS-1001-REC   TO      MCPDATA-REC
           PERFORM 900-SYSKANRI-INV-SEC
           IF     FLG-SYSKANRI        =   ZERO
                  MOVE    MCPDATA-REC     TO    SYS-1001-REC
                  IF      SYS-1001-HOSPNAME  =  LOW-VALUE
                          MOVE    SPACE   TO    SYS-1001-HOSPNAME
                  END-IF
                  IF      SYS-1001-KAISETUNAME  =   LOW-VALUE
                          MOVE    SPACE   TO    SYS-1001-KAISETUNAME
                  END-IF    
           ELSE
                  MOVE    "医療機関情報が取得できませんでした"
                                          TO    WRK-RECEERR
                  PERFORM 500-ERR-HENSYU-SEC
                  MOVE    1               TO    FLG-END
           END-IF
      *
      *    医療機関情報−所在地、連絡先
           INITIALIZE                     SYS-1002-REC
           MOVE    "1002"              TO  SYS-1002-KANRICD
           MOVE    "*"                 TO  SYS-1002-KBNCD
           MOVE    LNK-PRTKANRI-SRYYM(1:6)
                                       TO  SYS-1002-STYUKYMD(1:6)
                                           SYS-1002-EDYUKYMD(1:6)
           MOVE    "01"                TO  SYS-1002-STYUKYMD(7:2)
                                           SYS-1002-EDYUKYMD(7:2)
      *---(01.00.07) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM         TO  SYS-1002-HOSPNUM
      *---(01.00.07) LINE ADD END   ------------------------------------
           MOVE     SYS-1002-REC  TO      MCPDATA-REC
           PERFORM  900-SYSKANRI-INV-SEC
           IF       FLG-SYSKANRI       =  ZERO
                    MOVE    MCPDATA-REC   TO    SYS-1002-REC
                    IF      SYS-1002-ADRS =     LOW-VALUE
                            MOVE    SPACE TO    SYS-1002-ADRS
                    END-IF
           ELSE
                    MOVE "医療機関情報（所在地）が取得できませんでした"
                                          TO    WRK-RECEERR
                    PERFORM   500-ERR-HENSYU-SEC
                    MOVE      1           TO    FLG-END
           END-IF 
      *
      *---(01.00.07) LINE ADD START ------------------------------------
           MOVE    SYS-1001-HOSPNAME   TO  WRK-HOSPNAME
           MOVE    SYS-1002-ADRS       TO  WRK-HOSPADRS
           MOVE    SYS-1002-TEL        TO  WRK-HOSPTEL
      *    医療機関編集情報
           PERFORM 900-1900-READ-SEC
      *---(01.00.07) LINE ADD END   ------------------------------------
      *
           OPEN     OUTPUT  UPD-FILE
      *
      ***** 05/08/17 INS
           EVALUATE    WRK-PARA-SYOKBN 
               WHEN    "2"
      *---(01.00.07) LINE ADD START ------------------------------------
      *             MOVE    PATH-TBL-SEIKYU-KEY37    TO  WRK-PATH2
                MOVE    "key37"        TO  WRK-PATH2
      *---(01.00.07) LINE ADD END   ------------------------------------
      *---(01.00.09) LINE ADD START ------------------------------------
                   MOVE    "key65"                  TO  WRK-PATH3
      *---(01.00.09) LINE ADD END   ------------------------------------
               WHEN    "1"
      *---(01.00.07) LINE ADD START ------------------------------------
      *             MOVE    PATH-TBL-SEIKYU-KEY38    TO  WRK-PATH2
                MOVE    "key38"        TO  WRK-PATH2
      *---(01.00.07) LINE ADD END   ------------------------------------
      *---(01.00.09) LINE ADD START ------------------------------------
                   MOVE    "key66"                  TO  WRK-PATH3
      *---(01.00.09) LINE ADD END   ------------------------------------
           END-EVALUATE
      *****
           PERFORM  900-SEIKYU-SELECT-SEC
      *
           .
      *
       100-INIT-EXT.
           EXIT.
      *****************************************************************
      *    主    処理
      *****************************************************************
       200-MAIN-SEC               SECTION.
      *
           OPEN     OUTPUT  SKT1105TMP-FILE
           CLOSE            SKT1105TMP-FILE
           OPEN     I-O     SKT1105TMP-FILE
      *
           INITIALIZE             SUM-AREA
      *
      *---(01.00.11) LINE ADD START ------------------------------------
      *     MOVE     ZERO    TO        FLG-END
      *---(01.00.11) LINE ADD END   ------------------------------------
      *
           PERFORM  2001-KOKUHO-SYUKEI-SEC
                    UNTIL   FLG-END   =   1
      *---(01.00.09) LINE ADD START ------------------------------------
      *    後期高齢
           MOVE     ZERO    TO        FLG-END
           MOVE     1       TO        FLG-KOUKI
           MOVE    "039"    TO        WRK-HKNNUM
           PERFORM  950-SEIKYU-SELECT-SEC
           PERFORM  2001-KOKUHO-SYUKEI-SEC
                    UNTIL   FLG-END   =   1
           PERFORM  950-SEIKYU-CLOSE-SEC
      *---(01.00.09) LINE ADD END   ------------------------------------
      *    国保合計・公費合計書き出し
           PERFORM 2203-SYORI-SEC
      *
      *---(01.00.08) LINE ADD START ------------------------------------
      *    特別療養費集計
           PERFORM  2004-TOKUBETU-SEC
      *---(01.00.08) LINE ADD END   ------------------------------------
      *---(01.00.09) LINE ADD START ------------------------------------
      *    特別医療費（後期分）集計
           PERFORM  2004-TOKUBETU-KOU-SEC
      *---(01.00.09) LINE ADD END   ------------------------------------
      *
           CLOSE   SKT1105TMP-FILE
      *
           IF       FLG-UPD   =         1
                    MOVE      ZERO      TO        WRK-KBN
                    PERFORM   2002-PRINT-SEC
           END-IF
      *
           CLOSE   UPD-FILE
           CLOSE   SKT1105TMP-FILE
      *
           .
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
           DISPLAY "*** SOKATU1105 IN  "  CNT-RECE10 
           DISPLAY "*** SOKATU1105 END ***"
      *
      *    ステップ終了処理
           MOVE    "STE"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
      *---(01.00.07) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.07) LINE ADD END   ------------------------------------
           MOVE    WRK-PARA-PAGE   TO  JOB-UPDCNT
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA  
                                   JOBKANRI-REC
      *---(01.00.07) LINE ADD START ------------------------------------
                                   SPA-AREA
      *---(01.00.07) LINE ADD END   ------------------------------------

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
      *TMP-FILE キーセット
      *
           INITIALIZE       SKT1105TMP-REC
      *
           MOVE    RECE10-HKNJANUM-S   TO  SKT1105TMP-HKNJANUM  
      *
      *区の場合代表番号セット
           IF      SKT1105TMP-HKNJANUM(1:3)    =   "114"
               MOVE    "114009"    TO  SKT1105TMP-HKNJANUM
           END-IF
      *
      *    老人保険・退職者医療の場合
           IF      RECE10-RJNHKNNUM    NOT =   SPACE
               INITIALIZE           SKT1105TMP-KEY
               MOVE    1       TO  SKT1105TMP-KBN1
           ELSE
               IF      RECE10-HKNNUM   =   "067"
                   INITIALIZE          SKT1105TMP-KEY
                   MOVE    2       TO  SKT1105TMP-KBN1
               ELSE
      *---(01.00.10) LINE ADD START ------------------------------------
      *            前期高齢特例措置か
                   IF   RECE10-SRYYM  >=  WRK-CONS-SRYYM-200804
                   AND  RECE10-FLG (2)  =  1
                       MOVE  8                 TO  RECE10-KYURATE
                   END-IF
      *---(01.00.10) LINE ADD END   ------------------------------------
      *            組合のみ給付割合別
                   IF      SKT1105TMP-HKNJANUM(3:1)    =   "3"
                       MOVE    RECE10-KYURATE  TO  SKT1105TMP-KYURATE
                   ELSE
                       MOVE    ZERO            TO  SKT1105TMP-KYURATE
                   END-IF
      *---(01.00.09) LINE ADD START ------------------------------------
      **---(01.00.08) LINE ADD START -----------------------------------
      **             MOVE    3       TO  SKT1105TMP-KBN1
      *             MOVE    4       TO  SKT1105TMP-KBN1
      **---(01.00.08) LINE ADD END   -----------------------------------
                   MOVE    6       TO  SKT1105TMP-KBN1
      *---(01.00.09) LINE ADD END   ------------------------------------
               END-IF
           END-IF
      *
      *---(01.00.09) LINE ADD START ------------------------------------
      *     PERFORM  800-SKTTMP-READ-SEC
      *     PERFORM  220-HKN-SYUKEI-SEC
           IF  FLG-KOUKI  =  ZERO
               PERFORM 800-SKTTMP-READ-SEC
               PERFORM  220-HKN-SYUKEI-SEC
           ELSE
               MOVE    5      TO  SKT1105TMP-KBN1
               PERFORM  800-SKTTMP-READ-SEC
               PERFORM  220-KOUKI-SYUKEI-SEC
           END-IF
      *---(01.00.09) LINE ADD END   ------------------------------------
      *    公費集計処理
           IF      RECE10-KOHNUM(1) NOT = SPACE
               PERFORM 2201-KOH-SYUKEI-SEC
           END-IF
      *
      *    集計の対象にならなかったとき                
           IF     FLG-UPD        =       1
                  PERFORM   240-UPD-FILE-HENSYU-SEC
      *
      *---(01.00.09) LINE ADD START ------------------------------------
      *            PERFORM   900-SEIKYU-READ-SEC
                  IF  FLG-KOUKI  =  ZERO
                      PERFORM   900-SEIKYU-READ-SEC
                  ELSE
                      PERFORM   950-SEIKYU-READ-SEC
                  END-IF
      *---(01.00.09) LINE ADD END   ------------------------------------
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
      *
      *****************************************************************
      *    医療保険・老人保健分集計処理
      *****************************************************************
       220-HKN-SYUKEI-SEC               SECTION.
      *
           IF      RECE10-NYUGAIKBN    =   "1"
               MOVE    1       TO  IDX1
           ELSE
               MOVE    2       TO  IDX1
           END-IF
      *
      *    件数
           ADD     1                   TO  SKT1105TMP-KENSU(IDX1)
      *
      *    日数
           ADD     RECE10-JNISSU(1)    TO  SKT1105TMP-NISSU(IDX1)
      *
      *    点数
           ADD     RECE10-TOTALTEN(1)  TO  SKT1105TMP-TENSU(IDX1)
      *
      *---(01.00.09) LINE ADD START ------------------------------------
      **---(01.00.08) LINE ADD START ----------------------------------
      **     IF      SKT1105TMP-KBN1     =   3
      *     IF      SKT1105TMP-KBN1     =   4
      **---(01.00.08) LINE ADD END   ----------------------------------
           IF      SKT1105TMP-KBN1     =   6
      *---(01.00.09) LINE ADD START ------------------------------------
      *    請求額払の金額
               MOVE    ZERO            TO  WRK-SEIKYUGK-G
               COMPUTE WRK-SEIKYUGK-G  =
                                      (RECE10-TOTALTEN(1)
                                   *   RECE10-KYURATE)
                                   +  (RECE10-SHOKUJIRYOYOHI(1)
                                   -   RECE10-SHOKUJIFTN(1))
               ADD     WRK-SEIKYUGK-G  TO  SKT1105TMP-SEIKYUGK
      *
      *        国保合計加算(老人：退職の場合は加算しない)
               ADD     RECE10-JNISSU(1)    TO  WRK-KKHNISSU(IDX1)
               ADD     RECE10-TOTALTEN(1)  TO  WRK-KKHTENSU(IDX1)
               ADD     1                   TO  WRK-KKHKENSU(IDX1)
               ADD     WRK-SEIKYUGK-G      TO  WRK-KKHSEIKYUGK
               IF      RECE10-SHOKUJINISSU(1)  >   ZERO
                   ADD     1               TO  WRK-S-KKHKENSU
      *---(01.00.05) LINE ADD START ------------------------------------
               END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
               ADD     RECE10-SHOKUJINISSU(1)
                                           TO  WRK-S-KKHNISSU
               ADD     RECE10-SHOKUJIRYOYOHI(1)
                                           TO  WRK-S-KKHKINGK
      *---(01.00.05) LINE ADD START ------------------------------------
      *         END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
           END-IF
      *
      *    食事療養
           IF      RECE10-SHOKUJINISSU(1)  >   ZERO
      *
      *    食事療養：件数
               ADD     1               TO  SKT1105TMP-S-KENSU
      *---(01.00.05) LINE ADD START ------------------------------------
           END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *    食事療養：日数
           ADD     RECE10-SHOKUJINISSU(1)
                                       TO  SKT1105TMP-S-NISSU
      *
      *    食事療養：金額
           ADD     RECE10-SHOKUJIRYOYOHI(1)
                                       TO  SKT1105TMP-S-KINGK
      *---(01.00.05) LINE ADD START ------------------------------------
      *     END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
      *           
           IF      FLG-SKT1105TMP  =   1
               WRITE    SKT1105TMP-REC
           ELSE
               REWRITE  SKT1105TMP-REC
           END-IF
      *
           MOVE    1               TO  FLG-UPD 
      *
           .
      *
       220-HKN-SYUKEI-EXT.
           EXIT.
      *****************************************************************
      *    医療保険・老人保健分集計処理
      *****************************************************************
       2201-KOH-SYUKEI-SEC               SECTION.
      *
      *    対象は全国共通公費と公費番号１４１のみ
           PERFORM  VARYING  IDX3  FROM  1  BY  1
                    UNTIL    IDX3  >     4  OR
                    RECE10-KOHNUM(IDX3)  =  SPACE
      ****2006/02/11 @@@@-BRAND START
      *        IF  RECE10-KOHNUM(IDX3)(1:1) = "0" OR
      *            RECE10-KOHNUM(IDX3)      = "141"
               IF  RECE10-KOHNUM(IDX3)(1:1) = "0"
               OR  RECE10-KOHNUM(IDX3)      = "141"
               OR  RECE10-KOHNUM(IDX3)      = "180"
      *---(01.00.06) LINE ADD START ------------------------------------
               OR  RECE10-KOHNUM(IDX3)      = "181"
               OR  RECE10-KOHNUM(IDX3)      = "182"
               OR  RECE10-KOHNUM(IDX3)      = "183"
               OR  RECE10-KOHNUM(IDX3)      = "281"
      *---(01.00.06) LINE ADD END   ------------------------------------
      ****2006/02/11 @@@@-BRAND END
      *---(01.00.11) LINE ADD START ------------------------------------
               OR  RECE10-KOHNUM(IDX3)      = "481"
               OR  RECE10-KOHNUM(IDX3)      = "482"
               OR  RECE10-KOHNUM(IDX3)      = "483"
               OR  RECE10-KOHNUM(IDX3)      = "583"
      *---(01.00.11) LINE ADD END   ------------------------------------
                    PERFORM  2202-SYORI-SEC
               END-IF
           END-PERFORM
           .
      *
       2201-KOH-SYUKEI-EXT.
           EXIT.
      *****************************************************************
      *    公費集計処理
      *****************************************************************
       2202-SYORI-SEC               SECTION.
      *
      *    TMPキーセット
           INITIALIZE          SKT1105TMP-REC
      *---(01.00.09) LINE ADD START ------------------------------------
      **---(01.00.08) LINE ADD START -----------------------------------
      **     MOVE    4       TO  SKT1105TMP-KBN1
      *     MOVE    5       TO  SKT1105TMP-KBN1
      **---(01.00.08) LINE ADD END   -----------------------------------
           MOVE    7       TO  SKT1105TMP-KBN1
      *---(01.00.09) LINE ADD END   ------------------------------------
      *
           IF      RECE10-KOHNUM(IDX3) =   "091"
               MOVE    "051"           TO  SKT1105TMP-HKNJANUM
           ELSE
               MOVE    RECE10-KOHNUM(IDX3)
                                       TO  SKT1105TMP-HKNJANUM
           END-IF
      *
      *    一時ファイル読み込み
           PERFORM 800-SKTTMP-READ-SEC
      *
           IF      RECE10-NYUGAIKBN    =   "1"
               MOVE    1       TO   IDX1
           ELSE
               MOVE    2       TO   IDX1
           END-IF
      *
      *    件数
           ADD         1     TO   SKT1105TMP-KENSU(IDX1)
      *
      *    日数
           ADD   RECE10-JNISSU(IDX3 + 1) TO SKT1105TMP-NISSU(IDX1)
      *
      *    点数
           ADD   RECE10-TOTALTEN(IDX3 + 1) TO    SKT1105TMP-TENSU(IDX1)
      *
      *    請求額払の金額
           MOVE    RECE10-KOHNUM(IDX3)  TO    WRK-KOHNUM
           MOVE    ZERO                 TO    WRK-SEIKYUGK-G
           MOVE    ZERO                 TO    WRK-KEISAN1
                                              WRK-KEISAN2
           PERFORM  950-HKNNUM-SET-SEC
      *
           IF      RECE10-NYUGAIKBN    =   "1"
      *---(01.00.07) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-SYUNOU-KEY33   TO  WRK-PATH
               MOVE    "key33"         TO  WRK-PATH
      *---(01.00.07) LINE ADD END   ------------------------------------
           ELSE
      *---(01.00.07) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-SYUNOU-KEY25   TO  WRK-PATH
               MOVE    "key25"         TO  WRK-PATH
      *---(01.00.07) LINE ADD END   ------------------------------------
           END-IF
           PERFORM  920-SYUNOU-SET-SEC
      *
           COMPUTE WRK-KEISAN1-G   ROUNDED =   WRK-KEISAN1
           COMPUTE WRK-KEISAN2-G   ROUNDED =   WRK-KEISAN2
           IF      WRK-KEISAN1-G   <=  WRK-KEISAN2-G
               MOVE    ZERO    TO  WRK-SEIKYUGK-G
           ELSE
               COMPUTE WRK-SEIKYUGK-G  =   WRK-KEISAN1-G
                                       -   WRK-KEISAN2-G
           END-IF
      *
      *---(01.00.06) LINE ADD START ------------------------------------
      *    181,182,183,281は請求額を記載しない
      *     ADD     WRK-SEIKYUGK-G          TO  SKT1105TMP-SEIKYUGK
           IF   RECE10-KOHNUM(IDX3)  NOT =  "181"
           AND  RECE10-KOHNUM(IDX3)  NOT =  "182"
           AND  RECE10-KOHNUM(IDX3)  NOT =  "183"
           AND  RECE10-KOHNUM(IDX3)  NOT =  "281"
      *---(01.00.11) LINE ADD START ------------------------------------
           AND  RECE10-KOHNUM(IDX3)  NOT =  "481"
           AND  RECE10-KOHNUM(IDX3)  NOT =  "482"
           AND  RECE10-KOHNUM(IDX3)  NOT =  "483"
           AND  RECE10-KOHNUM(IDX3)  NOT =  "583"
      *---(01.00.11) LINE ADD END   ------------------------------------
             ADD     WRK-SEIKYUGK-G        TO  SKT1105TMP-SEIKYUGK
           END-IF
      *---(01.00.06) LINE ADD END   ------------------------------------
      *
      *    食事療養
           IF      RECE10-SHOKUJINISSU(1)  >   ZERO
      *
      *        食事療養：件数
               ADD     1               TO  SKT1105TMP-S-KENSU
      *---(01.00.05) LINE ADD START ------------------------------------
           END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *    食事療養：日数
           ADD     RECE10-SHOKUJINISSU(IDX3 + 1)
                                       TO  SKT1105TMP-S-NISSU
      *
      *    食事療養：金額
           ADD     RECE10-SHOKUJIRYOYOHI(IDX3 + 1)
                                       TO  SKT1105TMP-S-KINGK
      *---(01.00.05) LINE ADD START ------------------------------------
      *     END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *    公費合計加算
           ADD     RECE10-JNISSU(IDX3 + 1)     TO  WRK-KOHNISSU(IDX1)
           ADD     RECE10-TOTALTEN(IDX3 + 1)   TO  WRK-KOHTENSU(IDX1)
           ADD     1                           TO  WRK-KOHKENSU(IDX1)
      *---(01.00.06) LINE ADD START ------------------------------------
      *    181,182,183,281は請求額を記載しない
      *     ADD     WRK-SEIKYUGK-G              TO  WRK-KOHSEIKYUGK
           IF   RECE10-KOHNUM(IDX3)  NOT =  "181"
           AND  RECE10-KOHNUM(IDX3)  NOT =  "182"
           AND  RECE10-KOHNUM(IDX3)  NOT =  "183"
           AND  RECE10-KOHNUM(IDX3)  NOT =  "281"
      *---(01.00.11) LINE ADD START ------------------------------------
           AND  RECE10-KOHNUM(IDX3)  NOT =  "481"
           AND  RECE10-KOHNUM(IDX3)  NOT =  "482"
           AND  RECE10-KOHNUM(IDX3)  NOT =  "483"
           AND  RECE10-KOHNUM(IDX3)  NOT =  "583"
      *---(01.00.11) LINE ADD END   ------------------------------------
             ADD     WRK-SEIKYUGK-G            TO  WRK-KOHSEIKYUGK
           END-IF
      *---(01.00.06) LINE ADD END   ------------------------------------
      *
      *    食事療養
           IF      RECE10-SHOKUJINISSU(1)  >   0
      *
      *        食事療養：件数
               ADD     1               TO  WRK-S-KOHKENSU
      *---(01.00.05) LINE ADD START ------------------------------------
           END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *        食事療養：日数
           ADD     RECE10-SHOKUJINISSU(IDX3 + 1)
                                       TO  WRK-S-KOHNISSU
      *
      *        食事療養：金額
           ADD     RECE10-SHOKUJIRYOYOHI(IDX3 + 1) 
                                       TO  WRK-S-KOHKINGK
      *---(01.00.05) LINE ADD START ------------------------------------
      *     END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
      *           
           IF      FLG-SKT1105TMP  =   1
               WRITE   SKT1105TMP-REC
           ELSE
               REWRITE SKT1105TMP-REC
           END-IF
      *
           MOVE    1               TO  FLG-UPD 
           .
      *
       2202-SYORI-EXT.
           EXIT.
      *****************************************************************
      *    国保合計・公費合計書き出し
      *****************************************************************
       2203-SYORI-SEC               SECTION.
      *
      *    国保合計書き出し
      *    KEY設定
           INITIALIZE                      SKT1105TMP-REC
      *---(01.00.09) LINE ADD START ------------------------------------
      **---(01.00.08) LINE ADD START -----------------------------------
      **     MOVE    3                   TO  SKT1105TMP-KBN1
      *     MOVE    4                   TO  SKT1105TMP-KBN1
      **---(01.00.08) LINE ADD END   -----------------------------------
           MOVE    6               TO  SKT1105TMP-KBN1
      *---(01.00.09) LINE ADD END   ------------------------------------
           MOVE    1                   TO  SKT1105TMP-KBN2
      *
           MOVE    KOKUHO-TAL          TO  SKT1105TMP-DATA
      *
           WRITE SKT1105TMP-REC
      *    公費合計書き出し
      *    KEY設定
           INITIALIZE                      SKT1105TMP-REC
      *---(01.00.09) LINE ADD START ------------------------------------
      **---(01.00.08) LINE ADD START -----------------------------------
      **     MOVE    4                   TO  SKT1105TMP-KBN1
      *     MOVE    5                   TO  SKT1105TMP-KBN1
      **---(01.00.08) LINE ADD END   -----------------------------------
           MOVE    7               TO  SKT1105TMP-KBN1
      *---(01.00.09) LINE ADD END   ------------------------------------
           MOVE    1                   TO  SKT1105TMP-KBN2
      *
           MOVE    KOUHI-TAL           TO  SKT1105TMP-DATA
      *
           WRITE SKT1105TMP-REC
           .
      *
       2203-SYORI-EXT.
           EXIT.
      *---(01.00.08) LINE ADD START ------------------------------------
      *****************************************************************
      *    特別療養費処理
      *****************************************************************
       2004-TOKUBETU-SEC         SECTION.
      *
           MOVE    "DBCLOSECURSOR"      TO  MCP-FUNC
           MOVE    "tbl_seikyu"         TO  MCP-TABLE
           MOVE    WRK-PATH2            TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
           INITIALIZE    FLG-END
           EVALUATE    WRK-PARA-SYOKBN
               WHEN    "2"
                   MOVE    "key39"        TO  WRK-PATH2
               WHEN    "1"
                   MOVE    "key40"        TO  WRK-PATH2
           END-EVALUATE
           PERFORM  900-SEIKYU-SELECT-SEC
      *
           PERFORM  UNTIL  FLG-END = 1
      *
      *TMP-FILE キーセット
               INITIALIZE                  SKT1105TMP-REC
               MOVE    3               TO  SKT1105TMP-KBN1
      *
               PERFORM  800-SKTTMP-READ-SEC
               PERFORM  20041-TOKU-SYUKEI-SEC
      *
               PERFORM  900-SEIKYU-READ-SEC
           END-PERFORM
      *
           .
      *
       2004-TOKUBETU-EXT.
           EXIT.
      *---(01.00.09) LINE ADD START ------------------------------------
      *****************************************************************
      *    特別療養費(後期分)処理
      *****************************************************************
       2004-TOKUBETU-KOU-SEC         SECTION.
      *
           MOVE    "DBCLOSECURSOR"      TO  MCP-FUNC
           MOVE    "tbl_seikyu"         TO  MCP-TABLE
           MOVE    WRK-PATH2            TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
           INITIALIZE    FLG-END
           EVALUATE    WRK-PARA-SYOKBN
               WHEN    "2"
                   MOVE    "key65"        TO  WRK-PATH3
               WHEN    "1"
                   MOVE    "key66"        TO  WRK-PATH3
           END-EVALUATE
           MOVE    "040"    TO        WRK-HKNNUM
           PERFORM  950-SEIKYU-SELECT-SEC
      *
           PERFORM  UNTIL  FLG-END = 1
      *
      *TMP-FILE キーセット
               INITIALIZE                  SKT1105TMP-REC
               MOVE    4               TO  SKT1105TMP-KBN1
      *
               PERFORM  800-SKTTMP-READ-SEC
               PERFORM  20041-TOKU-SYUKEI-SEC
      *
               PERFORM  950-SEIKYU-READ-SEC
           END-PERFORM
      *
           .
      *
       2004-TOKUBETU-KOU-EXT.
           EXIT.
      *****************************************************************
      *    後期高齢者分集計処理
      *****************************************************************
       220-KOUKI-SYUKEI-SEC               SECTION.
      *
           IF      RECE10-NYUGAIKBN    =   "1"
               MOVE    1       TO  IDX1
           ELSE
               MOVE    2       TO  IDX1
           END-IF
      *    件数
           ADD     1                   TO  SKT1105TMP-KENSU(IDX1)
      *    日数
           ADD     RECE10-JNISSU(1)    TO  SKT1105TMP-NISSU(IDX1)
      *    点数
           ADD     RECE10-TOTALTEN(1)  TO  SKT1105TMP-TENSU(IDX1)
      *
      *---(01.00.10) LINE ADD START ------------------------------------
      *
      *    食事療養
           IF      RECE10-SHOKUJINISSU(1)  >   ZERO
      *    食事療養：件数
               ADD     1               TO  SKT1105TMP-S-KENSU
           END-IF
      *    食事療養：日数
           ADD     RECE10-SHOKUJINISSU(1)
                                       TO  SKT1105TMP-S-NISSU
      *    食事療養：金額
           ADD     RECE10-SHOKUJIRYOYOHI(1)
                                       TO  SKT1105TMP-S-KINGK
      *---(01.00.10) LINE ADD END   ------------------------------------
           IF      FLG-SKT1105TMP  =   1
               WRITE   SKT1105TMP-REC
           ELSE
               REWRITE SKT1105TMP-REC
           END-IF
      ****
           MOVE    1               TO  FLG-UPD 
      ****
           .
       220-KOUKI-SYUKEI-EXT.
           EXIT.  
      *---(01.00.09) LINE ADD END   ------------------------------------
      *****************************************************************
      *    特別療養費処理
      *****************************************************************
       20041-TOKU-SYUKEI-SEC         SECTION.
      *
           IF      RECE10-NYUGAIKBN    =   "1"
               MOVE    1       TO  IDX1
           ELSE
               MOVE    2       TO  IDX1
           END-IF
      *
      *    件数
           ADD     1                   TO  SKT1105TMP-KENSU(IDX1)
      *    日数
           ADD     RECE10-JNISSU(1)    TO  SKT1105TMP-NISSU(IDX1)
      *    点数
           ADD     RECE10-TOTALTEN(1)  TO  SKT1105TMP-TENSU(IDX1)
      *
      *    食事療養
           IF      RECE10-SHOKUJINISSU(1)  >   ZERO
      *    食事療養：件数
               ADD     1               TO  SKT1105TMP-S-KENSU
           END-IF
      *    食事療養：日数
           ADD     RECE10-SHOKUJINISSU(1)
                                       TO  SKT1105TMP-S-NISSU
      *    食事療養：金額
           ADD     RECE10-SHOKUJIRYOYOHI(1)
                                       TO  SKT1105TMP-S-KINGK
      *
           IF      FLG-SKT1105TMP  =   1
               WRITE   SKT1105TMP-REC
           ELSE
               REWRITE SKT1105TMP-REC
           END-IF
      *
           .
       20041-TOKU-SYUKEI-EXT.
           EXIT.
      *---(01.00.08) LINE ADD END   ------------------------------------
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
       2002-PRINT-SEC                   SECTION.
      *
           OPEN    INPUT           SKT1105TMP-FILE
      *
           MOVE    ZERO    TO  FLG-PRINT
           INITIALIZE          SKT1105TMP-KEY
      *    一時ファイル読み込み
           PERFORM  900-TMP-READ-SEC
      *
           PERFORM UNTIL     FLG-PRINT   =   1
      *
      *        帳票編集<見出し>処理
               PERFORM 310-HEAD-HEN-SEC
      *
      *        帳票編集<明細>処理
               PERFORM 320-BODY-HEN-SEC
      *
      *        合計印字
               IF      FLG-PRINT   =  1
                   PERFORM 2002-LAST-SEC
               END-IF
      *
               PERFORM 330-PRINT-OUT-SEC
           END-PERFORM
      *
           .
      *
       2002-PRINT-EXT.
           EXIT.
      *****************************************************************
      *    合計編集                    
      *****************************************************************
       2002-LAST-SEC                   SECTION.
      *
      *
           PERFORM VARYING IDX4    FROM    1   BY  1
                   UNTIL   IDX4    >       2
      *
      *        療養の給付：件数
               MOVE    SUM-KENSU(IDX4)     TO  WRK-Z5
               MOVE    WRK-Z5              TO  SKT05-GKENSU(IDX4)
      *
      *        療養の給付：日数
               MOVE    SUM-NISSU(IDX4)     TO  WRK-Z5
               MOVE    WRK-Z5              TO  SKT05-GNISSU(IDX4)
      *
      *       療養の給付：点数
               MOVE    SUM-TENSU(IDX4)     TO  WRK-Z9
               MOVE    WRK-Z9              TO  SKT05-GTENSU(IDX4)
           END-PERFORM
      *
      *    食事療養：件数
           MOVE    SUM-S-KENSU             TO  WRK-Z5
           MOVE    WRK-Z5                  TO  SKT05-S-GKENSU
      *    食事療養：日数
           MOVE    SUM-S-NISSU             TO  WRK-Z5
           MOVE    WRK-Z5                  TO  SKT05-S-GNISSU
      *    食事療養：金額
           MOVE    SUM-S-KINGK             TO  WRK-Z9
           MOVE    WRK-Z9                  TO  SKT05-S-GMONEY
      *    請求額払
           MOVE    SUM-SEIKYUGK            TO  WRK-Z10
           MOVE    WRK-Z10                 TO  SKT05-GSEIKYUGK
      *
      *    平均点数追加
           COMPUTE WRK-HEIKIN  ROUNDED =   SUM-TENSU(1) / SUM-KENSU(1)
           MOVE    WRK-HEIKIN              TO  WRK-HEIKIN-Z
           MOVE    WRK-HEIKIN-Z            TO  SKT05-HEIKIN1
      *
      *---(01.00.09) LINE ADD START ------------------------------------
           MOVE    ZERO         TO         WRK-HEIKIN
      *---(01.00.09) LINE ADD END   ------------------------------------
           COMPUTE WRK-HEIKIN ROUNDED  =   SUM-TENSU(2) / SUM-KENSU(2)
           MOVE    WRK-HEIKIN              TO  WRK-HEIKIN-Z
           MOVE    WRK-HEIKIN-Z            TO  SKT05-HEIKIN2
      *
      *    診療年月
           MOVE    LNK-PRTKANRI-SRYYM(5:2) TO  SKT05-LSRYYM
      *
      *    医療機関コード
           MOVE    SYS-1001-HOSPCD         TO  SKT05-LHOSPCD
      *
      *    請求額
           MOVE    SUM-SEIKYUGK            TO  WRK-Z92
           MOVE    WRK-Z92                 TO  SKT05-LSEIKYUGK
      *    
           .
      *
       2002-LAST-EXT.
           EXIT.
      *****************************************************************
      *    帳票編集<ヘッダー部>処理
      *****************************************************************
       310-HEAD-HEN-SEC             SECTION.
      *
      *
           INITIALIZE                             SKT1105
      *
           MOVE    WRK-SRYYMWH             TO  SKT05-SRYYM
      *
      *---(01.00.07) LINE ADD START ------------------------------------
      *    医療機関住所
      *     MOVE    SYS-1002-ADRS           TO  SKT05-HOSPADRS1
      *
      *    電話番号
      *     MOVE    SYS-1002-TEL            TO  SKT05-TEL1
      *    医療機関住所
           MOVE    WRK-HOSPADRS            TO  SKT05-HOSPADRS1
      *
      *    電話番号
           MOVE    WRK-HOSPTEL             TO  SKT05-TEL1
      *---(01.00.07) LINE ADD END   ------------------------------------
      *
      *    ＦＡＸ
           MOVE    SYS-1002-FAX            TO  SKT05-FAX1
      *
      *---(01.00.07) LINE ADD START ------------------------------------
      *    医療機関名
      *     MOVE    SYS-1001-HOSPNAME       TO  SKT05-HOSPNAME1
      *    医療機関名
           MOVE    WRK-HOSPNAME            TO  SKT05-HOSPNAME1
      *---(01.00.07) LINE ADD END   ------------------------------------
      *
      *    開設者氏名
           MOVE    SYS-1001-KAISETUNAME    TO  SKT05-KAISETUNAME1
      *
           MOVE    SYS-1001-HOSPCDN        TO  SKT05-HOSPCDN
           MOVE    SKT05-HOSP1             TO  SKT05-HOSP2
           .
      *
       310-HEAD-HEN-EXT.
           EXIT.
      *****************************************************************
      *    帳票編集<保険明細行>処理
      *****************************************************************
       320-BODY-HEN-SEC               SECTION.
      *
      *
           MOVE    ZERO    TO  CNT-LINE
      *
           PERFORM UNTIL   FLG-PRINT   =   1   OR
                           CNT-LINE    =   7
      *
              EVALUATE  SKT1105TMP-KBN1
      *
      *            老人保健
                   WHEN    1
      *---(01.00.09) LINE ADD START ------------------------------------
      *                 PERFORM 3201-BODY-HEN-SEC
                       ADD     1       TO  CNT-LINE
                       PERFORM 3205-BODY-HEN-SEC
      *---(01.00.09) LINE ADD END   ------------------------------------
      *
      *            退職者医療
                   WHEN    2
                       PERFORM 3202-BODY-HEN-SEC
      *---(01.00.08) LINE ADD START ------------------------------------
      *
      *            特別療養費
                   WHEN    3
                       ADD     1       TO  CNT-LINE
                       PERFORM 3205-BODY-HEN-SEC
      *---(01.00.09) LINE ADD START ------------------------------------
      *            特別療養費(後期分)
                   WHEN    4
                       ADD     1       TO  CNT-LINE
                       PERFORM 3205-BODY-HEN-SEC
      *            後期高齢者
                   WHEN    5
                       PERFORM 3201-BODY-HEN-SEC
      *---(01.00.09) LINE ADD END   ------------------------------------
      *---(01.00.08) LINE ADD END   ------------------------------------
      *
      *            一般国保
      *---(01.00.09) LINE ADD START ------------------------------------
      **---(01.00.08) LINE ADD START -----------------------------------
      **             WHEN    3
      *             WHEN    4
      **---(01.00.08) LINE ADD END   -----------------------------------
                   WHEN    6
      *---(01.00.09) LINE ADD END   ------------------------------------
                       ADD     1       TO  CNT-LINE
                       PERFORM 3203-BODY-HEN-SEC
      *
      *            公費
      **---(01.00.09) LINE ADD START ------------------------------------
      **---(01.00.08) LINE ADD START -----------------------------------
      **             WHEN    4
      *             WHEN    5
      **---(01.00.08) LINE ADD END   -----------------------------------
                   WHEN    7
      *---(01.00.09) LINE ADD END   ------------------------------------
                       ADD     1       TO  CNT-LINE
                       PERFORM 3204-BODY-HEN-SEC
              END-EVALUATE
      *
      *    一時ファイル読み込み
              PERFORM 900-TMP-READ-SEC
      *
           END-PERFORM
      *
      *
           .
      *
       320-BODY-HEN-EXT.
           EXIT.
      *****************************************************************
      *    帳票編集<老人保健>処理
      *****************************************************************
       3201-BODY-HEN-SEC              SECTION.
      *
           PERFORM VARYING IDX4    FROM    1   BY  1
                   UNTIL   IDX4    >       2
      *
      *---(01.00.09) LINE ADD START ------------------------------------
      **        療養の給付：件数
      *         MOVE    SKT1105TMP-KENSU(IDX4)  TO  WRK-Z5
      *         MOVE    WRK-Z5                  TO  SKT05-RKENSU(IDX4)
      **
      **        療養の給付：日数
      *         MOVE    SKT1105TMP-NISSU(IDX4)  TO  WRK-Z5
      *         MOVE    WRK-Z5                  TO  SKT05-RNISSU(IDX4)
      **
      **       療養の給付：点数
      *         MOVE    SKT1105TMP-TENSU(IDX4)  TO  WRK-Z9
      *         MOVE    WRK-Z9                  TO  SKT05-RTENSU(IDX4)
      *        療養の給付：件数
               ADD    SKT1105TMP-KENSU(IDX4)  TO  WRK-KOUKI-1(IDX4)
               MOVE   WRK-KOUKI-1(IDX4)       TO  WRK-Z5
               MOVE   WRK-Z5                  TO  SKT05-RKENSU(IDX4)
      *
      *        療養の給付：日数
               ADD    SKT1105TMP-NISSU(IDX4)  TO WRK-KOUKI-2(IDX4)
               MOVE   WRK-KOUKI-2(IDX4)       TO WRK-Z5
               MOVE   WRK-Z5                  TO  SKT05-RNISSU(IDX4)
      *
      *       療養の給付：点数
               ADD    SKT1105TMP-TENSU(IDX4)  TO  WRK-KOUKI-3(IDX4)
               MOVE   WRK-KOUKI-3(IDX4)       TO  WRK-Z9
               MOVE   WRK-Z9                  TO  SKT05-RTENSU(IDX4)
      *---(01.00.09) LINE ADD END   ------------------------------------
           END-PERFORM
      *
      *---(01.00.09) LINE ADD START ------------------------------------
      **    食事療養：件数
      *     MOVE    SKT1105TMP-S-KENSU          TO  WRK-Z5
      *     MOVE    WRK-Z5                      TO  SKT05-S-RKENSU
      **
      **    食事療養：日数
      *     MOVE    SKT1105TMP-S-NISSU          TO  WRK-Z5
      *     MOVE    WRK-Z5                      TO  SKT05-S-RNISSU
      **
      **    食事療養：金額
      *     MOVE    SKT1105TMP-S-KINGK          TO  WRK-Z9
      *     MOVE    WRK-Z9                      TO  SKT05-S-RMONEY
      **
      **    食事療養：件数
           ADD    SKT1105TMP-S-KENSU          TO  WRK-KOUKI-5
           MOVE    WRK-KOUKI-5                 TO  WRK-Z5
           MOVE    WRK-Z5                      TO  SKT05-S-RKENSU
      **
      **    食事療養：日数
           ADD    SKT1105TMP-S-NISSU          TO  WRK-KOUKI-6
           MOVE    WRK-KOUKI-6                 TO  WRK-Z5
           MOVE    WRK-Z5                      TO  SKT05-S-RNISSU
      **
      **    食事療養：金額
           ADD    SKT1105TMP-S-KINGK          TO  WRK-KOUKI-9
           MOVE    WRK-KOUKI-9                 TO  WRK-Z9
           MOVE    WRK-Z9                      TO  SKT05-S-RMONEY
      *---(01.00.09) LINE ADD END   ------------------------------------
      *    合計加算
           ADD     SKT1105TMP-KENSU(1)         TO  SUM-KENSU(1)
           ADD     SKT1105TMP-KENSU(2)         TO  SUM-KENSU(2)
      *
           ADD     SKT1105TMP-NISSU(1)         TO  SUM-NISSU(1)
           ADD     SKT1105TMP-NISSU(2)         TO  SUM-NISSU(2)
      *
           ADD     SKT1105TMP-TENSU(1)         TO  SUM-TENSU(1)
           ADD     SKT1105TMP-TENSU(2)         TO  SUM-TENSU(2)
      *
           ADD     SKT1105TMP-S-KENSU          TO  SUM-S-KENSU
           ADD     SKT1105TMP-S-NISSU          TO  SUM-S-NISSU
           ADD     SKT1105TMP-S-KINGK          TO  SUM-S-KINGK
      *
           .
      *
       3201-BODY-HEN-EXT.
           EXIT.
      *****************************************************************
      *    帳票編集<退職者医療>処理
      *****************************************************************
       3202-BODY-HEN-SEC              SECTION.
      *
           PERFORM VARYING IDX4    FROM    1   BY  1
                   UNTIL   IDX4    >       2
      *
      *        療養の給付：件数
               MOVE    SKT1105TMP-KENSU(IDX4)  TO  WRK-Z5
               MOVE    WRK-Z5                  TO  SKT05-TKENSU(IDX4)
      *
      *        療養の給付：日数
               MOVE    SKT1105TMP-NISSU(IDX4)  TO  WRK-Z5
               MOVE    WRK-Z5                  TO  SKT05-TNISSU(IDX4)
      *
      *        療養の給付：点数
               MOVE    SKT1105TMP-TENSU(IDX4)  TO  WRK-Z9
               MOVE    WRK-Z9                  TO  SKT05-TTENSU(IDX4)
           END-PERFORM
      *
      *    食事療養：件数
           MOVE    SKT1105TMP-S-KENSU          TO  WRK-Z5
           MOVE    WRK-Z5                      TO  SKT05-S-TKENSU
      *
      *    食事療養：日数
           MOVE    SKT1105TMP-S-NISSU          TO  WRK-Z5
           MOVE    WRK-Z5                      TO  SKT05-S-TNISSU
      *
      *    食事療養：金額
           MOVE    SKT1105TMP-S-KINGK          TO  WRK-Z9
           MOVE    WRK-Z9                      TO  SKT05-S-TMONEY
      *
      *    合計加算
           ADD     SKT1105TMP-KENSU(1)         TO  SUM-KENSU(1)
           ADD     SKT1105TMP-KENSU(2)         TO  SUM-KENSU(2)
      *
           ADD     SKT1105TMP-NISSU(1)         TO  SUM-NISSU(1)
           ADD     SKT1105TMP-NISSU(2)         TO  SUM-NISSU(2)
      *
           ADD     SKT1105TMP-TENSU(1)         TO  SUM-TENSU(1)
           ADD     SKT1105TMP-TENSU(2)         TO  SUM-TENSU(2)
      *
           ADD     SKT1105TMP-S-KENSU          TO  SUM-S-KENSU
           ADD     SKT1105TMP-S-NISSU          TO  SUM-S-NISSU
           ADD     SKT1105TMP-S-KINGK          TO  SUM-S-KINGK
      *
           .
      *
       3202-BODY-HEN-EXT.
           EXIT.
      *---(01.00.08) LINE ADD START ------------------------------------
      *****************************************************************
      *    帳票編集<特別療養費>処理
      *****************************************************************
       3205-BODY-HEN-SEC              SECTION.
      *
           PERFORM VARYING IDX4    FROM    1   BY  1
                   UNTIL   IDX4    >       2
      *
      *        療養の給付：件数
               MOVE    SKT1105TMP-KENSU(IDX4)  TO  WRK-Z5
               MOVE    WRK-Z5      TO  SKT05-KENSU(CNT-LINE IDX4)
      *
      *        療養の給付：日数
               MOVE    SKT1105TMP-NISSU(IDX4)  TO  WRK-Z5
               MOVE    WRK-Z5      TO  SKT05-NISSU(CNT-LINE IDX4)
      *
      *        療養の給付：点数
               MOVE    SKT1105TMP-TENSU(IDX4)  TO  WRK-Z9
               MOVE    WRK-Z9      TO  SKT05-TENSU(CNT-LINE IDX4)
           END-PERFORM
      *
      *    食事療養：件数
           MOVE    SKT1105TMP-S-KENSU          TO  WRK-Z5
           MOVE    WRK-Z5          TO  SKT05-S-KENSU(CNT-LINE)
      *
      *    食事療養：日数
           MOVE    SKT1105TMP-S-NISSU          TO  WRK-Z5
           MOVE    WRK-Z5          TO  SKT05-S-NISSU(CNT-LINE)
      *
      *    食事療養：金額
           MOVE    SKT1105TMP-S-KINGK          TO  WRK-Z9
           MOVE    WRK-Z9          TO  SKT05-S-MONEY(CNT-LINE)
      *
      *---(01.00.09) LINE ADD START ------------------------------------
      *     MOVE    "特別療養費"            TO  SKT05-NAME(CNT-LINE)
           EVALUATE SKT1105TMP-KBN1
             WHEN  1
              MOVE  "老人保健（月遅れ分）" TO  SKT05-NAME(CNT-LINE)
             WHEN  3
              MOVE  "特別療養費"           TO  SKT05-NAME(CNT-LINE)
             WHEN  4
              MOVE  "特別療養費(後期分)"   TO  SKT05-NAME(CNT-LINE)
           END-EVALUATE
      *---(01.00.09) LINE ADD END   ------------------------------------
      *    合計加算
           ADD     SKT1105TMP-KENSU(1)         TO  SUM-KENSU(1)
           ADD     SKT1105TMP-KENSU(2)         TO  SUM-KENSU(2)
      *
           ADD     SKT1105TMP-NISSU(1)         TO  SUM-NISSU(1)
           ADD     SKT1105TMP-NISSU(2)         TO  SUM-NISSU(2)
      *
           ADD     SKT1105TMP-TENSU(1)         TO  SUM-TENSU(1)
           ADD     SKT1105TMP-TENSU(2)         TO  SUM-TENSU(2)
      *
           ADD     SKT1105TMP-S-KENSU          TO  SUM-S-KENSU
           ADD     SKT1105TMP-S-NISSU          TO  SUM-S-NISSU
           ADD     SKT1105TMP-S-KINGK          TO  SUM-S-KINGK
      *
           .
      *
       3205-BODY-HEN-EXT.
           EXIT.
      *---(01.00.08) LINE ADD END   ------------------------------------
      *****************************************************************
      *    帳票編集<一般国保>処理
      *****************************************************************
       3203-BODY-HEN-SEC              SECTION.
      *
           PERFORM VARYING IDX4    FROM    1   BY  1
                   UNTIL   IDX4    >       2
      *
      *        療養の給付：件数
               MOVE    SKT1105TMP-KENSU(IDX4)  TO  WRK-Z5
               MOVE    WRK-Z5      TO  SKT05-KENSU(CNT-LINE IDX4)
      *
      *        療養の給付：日数
               MOVE    SKT1105TMP-NISSU(IDX4)  TO  WRK-Z5
               MOVE    WRK-Z5      TO  SKT05-NISSU(CNT-LINE IDX4)
      *
      *        療養の給付：点数
               MOVE    SKT1105TMP-TENSU(IDX4)  TO  WRK-Z9
               MOVE    WRK-Z9      TO  SKT05-TENSU(CNT-LINE IDX4)
           END-PERFORM
      *
      *    食事療養：件数
           MOVE    SKT1105TMP-S-KENSU          TO  WRK-Z5
           MOVE    WRK-Z5          TO  SKT05-S-KENSU(CNT-LINE)
      *
      *    食事療養：日数
           MOVE    SKT1105TMP-S-NISSU          TO  WRK-Z5
           MOVE    WRK-Z5          TO  SKT05-S-NISSU(CNT-LINE)
      *
      *    食事療養：金額
           MOVE    SKT1105TMP-S-KINGK          TO  WRK-Z9
           MOVE    WRK-Z9          TO  SKT05-S-MONEY(CNT-LINE)
      *
      *    請求額払の金額
           MOVE    SKT1105TMP-SEIKYUGK         TO    WRK-Z10
           MOVE    WRK-Z10         TO  SKT05-SEIKYUGK(CNT-LINE)
      *
      *    国保計の時だけ加算
           IF      SKT1105TMP-KBN2 =   1
               MOVE    "国保計"    TO  SKT05-NAME(CNT-LINE)
      *    合計加算
               ADD     SKT1105TMP-KENSU(1)     TO  SUM-KENSU(1)
               ADD     SKT1105TMP-KENSU(2)     TO  SUM-KENSU(2)
      *
               ADD     SKT1105TMP-NISSU(1)     TO  SUM-NISSU(1)
               ADD     SKT1105TMP-NISSU(2)     TO  SUM-NISSU(2)
      *
               ADD     SKT1105TMP-TENSU(1)     TO  SUM-TENSU(1)
               ADD     SKT1105TMP-TENSU(2)     TO  SUM-TENSU(2)
      *
               ADD     SKT1105TMP-S-KENSU      TO  SUM-S-KENSU
               ADD     SKT1105TMP-S-NISSU      TO  SUM-S-NISSU
               ADD     SKT1105TMP-S-KINGK      TO  SUM-S-KINGK
               ADD     SKT1105TMP-SEIKYUGK     TO  SUM-SEIKYUGK
           ELSE
      *
      *        保険者名
               INITIALIZE  HKNJAINF-REC
               MOVE    SKT1105TMP-HKNJANUM     TO  HKNJA-HKNJANUM
               PERFORM 900-HKNJAINF-INV-SEC
               IF      HKNJA-HKNJANAME =   SPACE
                   MOVE    HKNJA-HKNJANUM  TO  WRK-MAE-INPUT
                   PERFORM 2009-HENKAN-SEC
                   MOVE    WRK-OUT-INPUT   TO  SKT05-NAME(CNT-LINE)
               ELSE
                   MOVE    HKNJA-HKNJANAME TO  SKT05-NAME(CNT-LINE)
               END-IF
      *
      *        給付割合
               IF      SKT1105TMP-KYURATE  NOT =   ZERO
                   MOVE    SKT1105TMP-KYURATE  TO  WRK-Z2
                   MOVE    WRK-Z2              TO  HEN-KYURATE
                   MOVE    HEN-KYURATE-AREA    TO  SKT05-WARI(CNT-LINE)
               END-IF
           END-IF
      *
           .
      *
       3203-BODY-HEN-EXT.
           EXIT.
      *****************************************************************
      *    帳票編集<公費>処理
      *****************************************************************
       3204-BODY-HEN-SEC              SECTION.
      *
      ****2006/02/11 @@@@-BRAND START
      *    公費計の時だけ加算
           IF      SKT1105TMP-KBN2 =   1
              MOVE    "公費計"    TO  SKT05-NAME(CNT-LINE)
      *
      *        合計加算
              COMPUTE  SKT1105TMP-SEIKYUGK =
                             SKT1105TMP-SEIKYUGK - WRK-RJ
              ADD     SKT1105TMP-SEIKYUGK     TO  SUM-SEIKYUGK
           ELSE
      *
      *        公費名
              INITIALIZE  HKNNUM-REC
              MOVE    SKT1105TMP-HKNJANUM       TO  WRK-KOHNUM
              PERFORM 950-HKNNUM-SET-SEC
              IF  SKT1105TMP-HKNJANUM  =  "180"
                MOVE    "老人医療"              TO  SKT05-NAME(CNT-LINE)
              ELSE
                MOVE    HKN-TANSEIDONAME        TO  SKT05-NAME(CNT-LINE)
              END-IF
      *
      *    法別番号
              MOVE    HKN-HBTNUM              TO  HEN-HBTNUM
              MOVE    HEN-KOH-AREA            TO  SKT05-WARI(CNT-LINE)
           END-IF
      ****2006/02/11 @@@@-BRAND END
           PERFORM VARYING IDX4    FROM    1   BY  1
                   UNTIL   IDX4    >       2
      *
      *        療養の給付：件数
               MOVE    SKT1105TMP-KENSU(IDX4)  TO  WRK-Z5
               MOVE    WRK-Z5      TO  SKT05-KENSU(CNT-LINE IDX4)
      *
      *        療養の給付：日数
               MOVE    SKT1105TMP-NISSU(IDX4)  TO    WRK-Z5
               MOVE    WRK-Z5      TO  SKT05-NISSU(CNT-LINE IDX4)
      *
      *        療養の給付：点数
               MOVE    SKT1105TMP-TENSU(IDX4)  TO    WRK-Z9
               MOVE    WRK-Z9      TO  SKT05-TENSU(CNT-LINE IDX4)
           END-PERFORM
      *
      *    食事療養：件数
           MOVE    SKT1105TMP-S-KENSU          TO  WRK-Z5
           MOVE    WRK-Z5          TO  SKT05-S-KENSU(CNT-LINE)
      *
      *    食事療養：日数
           MOVE    SKT1105TMP-S-NISSU          TO  WRK-Z5
           MOVE    WRK-Z5          TO  SKT05-S-NISSU(CNT-LINE)
      *
      *    食事療養：金額
           MOVE    SKT1105TMP-S-KINGK          TO  WRK-Z9
           MOVE    WRK-Z9          TO  SKT05-S-MONEY(CNT-LINE)
      *
      *    請求額払の金額
           display  "111:"   HKN-HBTNUM  "--" SKT1105TMP-SEIKYUGK
      ****2006/02/11 @@@@-BRAND START
      *  川越老人の場合、「請求額払の金額」欄には何も印字しない
      *  (公費計の「請求額払の金額」欄にも川越老人の分は含めない)
           IF  HKN-HBTNUM  = "80"
             DISPLAY  "aaa:" SKT1105TMP-SEIKYUGK
             MOVE  SKT1105TMP-SEIKYUGK TO  WRK-RJ
             MOVE  ZERO                TO  SKT1105TMP-SEIKYUGK
           END-IF
      ****2006/02/11 @@@@-BRAND END
      ****2006/04/18 @@@@-BRAND START
      *     MOVE    SKT1105TMP-SEIKYUGK         TO  WRK-Z10
      *     MOVE    WRK-Z10         TO  SKT05-SEIKYUGK(CNT-LINE)
           IF SKT05-KENSU(CNT-LINE IDX4) = 0 
             INITIALIZE SKT05-SEIKYUGK(CNT-LINE)
           ELSE
             MOVE    SKT1105TMP-SEIKYUGK         TO  WRK-Z10
             MOVE    WRK-Z10         TO  SKT05-SEIKYUGK(CNT-LINE)
           END-IF
      ****2006/04/18 @@@@-BRAND END
      *
      ****2006/02/11 @@@@-BRAND START
      *    公費計の時だけ加算
      *     IF      SKT1105TMP-KBN2 =   1
      *         MOVE    "公費計"    TO  SKT05-NAME(CNT-LINE)
      *
      *        合計加算
      *         ADD     SKT1105TMP-SEIKYUGK     TO  SUM-SEIKYUGK
      *     ELSE
      *
      *        公費名
      *         INITIALIZE  HKNNUM-REC
      *         MOVE    SKT1105TMP-HKNJANUM     TO  WRK-KOHNUM
      *         PERFORM 950-HKNNUM-SET-SEC
      *         MOVE    HKN-TANSEIDONAME        TO  SKT05-NAME(CNT-LINE)
      *
      *    給付割合
      *         MOVE    HKN-HBTNUM              TO  HEN-HBTNUM
      *         MOVE    HEN-KOH-AREA            TO  SKT05-WARI(CNT-LINE)
      *     END-IF
            MOVE  ZERO                      TO  HKN-HBTNUM
      ****2006/02/11 @@@@-BRAND END
      *
           .
      *
       3204-BODY-HEN-EXT.
           EXIT.
      *****************************************************************
      *    帳票印刷処理
      *****************************************************************
       330-PRINT-OUT-SEC                   SECTION.
      *
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
           MOVE   "SKT1105.red"        TO  SPRT-PRTID
           MOVE    "総括表"            TO  SPRT-TITLE
           MOVE    SKT1105             TO  SPRT-PRTDATA
           MOVE    LNK-PRTKANRI-TERMID TO  SPRT-TERMID
           MOVE    LNK-PRTKANRI-OPID   TO  SPRT-OPID
           MOVE    LNK-PRTKANRI-PRTNM  TO  SPRT-PRTNM
           DISPLAY  "ORCSPRT call"
           CALL    "ORCSPRT"           USING
                                       ORCSPRTAREA
      *---(01.00.07) LINE ADD START ------------------------------------
                                       SPA-AREA
      *---(01.00.07) LINE ADD END   ------------------------------------
           IF      SPRT-RETURN         =   ZERO
               DISPLAY  "ORCSPRT call ok"
               CONTINUE
           ELSE
               DISPLAY  "ORCSPRT call ng"
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
      *---(01.00.07) LINE ADD START ------------------------------------
               MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.07) LINE ADD END   ------------------------------------
               MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
               MOVE    WRK-PARA-SHELLID
                                       TO  JOB-SHELLID
               MOVE    WRK-RECEERR     TO  JOB-YOBI
               MOVE    "9999"          TO  JOB-ERRCD
               CALL    "ORCSJOB"       USING
                                       ORCSJOBKANRIAREA  
                                       JOBKANRI-REC
      *---(01.00.07) LINE ADD START ------------------------------------
                                       SPA-AREA
      *---(01.00.07) LINE ADD END   ------------------------------------
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
           OPEN     INPUT           UPD-FILE
      *
           PERFORM  900-UPD-FILE-READ-SEC
      *
           PERFORM  UNTIL   FLG-UPDFILE     =     1
              MOVE  RECE10X-KEY     TO    RECE10-KEY
              MOVE  RECE10-REC      TO    MCPDATA-REC
      *   
              PERFORM   900-SEIKYU-INV-SEC
              IF        FLG-SEIKYU  =     ZERO
                        MOVE     "2"    TO     RECE10-SKYKBN
                        MOVE     LNK-PRTKANRI-SRYYM
                                        TO     RECE10-SKYYM
                        MOVE     LNK-PRTKANRI-SKYYMD
                                        TO     RECE10-UPDYMD
                        MOVE     RECE10-REC
                                        TO     MCPDATA-REC
                        MOVE     "DBUPDATE"
                                        TO     MCP-FUNC
      *---(01.00.07) LINE ADD START ------------------------------------
      *                  MOVE    PATH-TBL-SEIKYU-KEY
      *                                  TO  MCP-PATH
      *                  CALL    "MCPSUB"          USING
      *                                           MCPAREA
      *                                           MCPDATA-REC
                        MOVE    "tbl_seikyu"    TO  MCP-TABLE
                        MOVE    "key"           TO  MCP-PATHNAME
                        CALL    "ORCDBMAIN"     USING
                                                MCPAREA
                                                MCPDATA-REC
                                                SPA-AREA
      *---(01.00.07) LINE ADD END   ------------------------------------
                        IF       MCP-RC =      ZERO
                                 PERFORM       900-UPD-FILE-READ-SEC
                        ELSE
                                 DISPLAY "UPD ERR KEY="  RECE10-KEY 
                                 MOVE    
                                "*** SOKATU1105 SEIKYU UPDATE ERROR ***"
                                           TO  WRK-RECEERR
                                 MOVE    RECE10-KEY     TO
                                         WRK-RECEERR(33:)
                                 PERFORM 500-ERR-HENSYU-SEC
                                 MOVE    1      TO      FLG-UPDFILE
                        END-IF
      *
              ELSE
                       DISPLAY "INV ERR KEY="  RECE10-KEY 
                       MOVE    "*** SOKATU1105 SEIKYU INVALID ***"
                                           TO  WRK-RECEERR
                       MOVE    RECE10-KEY     TO  WRK-RECEERR(33:)
                       PERFORM 500-ERR-HENSYU-SEC
                       MOVE    1      TO      FLG-UPDFILE
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
      *---(01.00.07) LINE ADD START ------------------------------------
      *     MOVE    SYS-1001-HOSPID         TO  RECE10-HOSPID.
           MOVE    SPA-HOSPNUM             TO  RECE10-HOSPNUM
      *---(01.00.07) LINE ADD END   ------------------------------------
           MOVE    LNK-PRTKANRI-SRYYM      TO  RECE10-SKYYM.
      *
           MOVE    SPACE                   TO  RECE10-XXSTHKNJANUM
           MOVE    "99999999"              TO  RECE10-XXEDHKNJANUM
      *
      *---(01.00.08) LINE ADD START ------------------------------------
           MOVE    "000000"                TO  RECE10-SRYYM
           MOVE    "999999"                TO  RECE10-XXSRYYM
      *---(01.00.08) LINE ADD END   ------------------------------------
           MOVE    RECE10-REC              TO  MCPDATA-REC.
           MOVE    "DBSELECT"              TO  MCP-FUNC.
      *---(01.00.07) LINE ADD START ------------------------------------
      ***** 05/08/17 UPD
      **     MOVE    PATH-TBL-SEIKYU-KEY4    TO  MCP-PATH
      *     MOVE    WRK-PATH2               TO  MCP-PATH
      *****
      *     CALL    "MCPSUB"                USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           MOVE    "tbl_seikyu"        TO  MCP-TABLE
           MOVE    WRK-PATH2           TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.07) LINE ADD END   ------------------------------------
      *
           IF     MCP-RC        =       ZERO
                  PERFORM  900-SEIKYU-READ-SEC
           ELSE
                  MOVE    1    TO      FLG-END
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
      *---(01.00.07) LINE ADD START ------------------------------------
      ***** 05/08/17 UPD
      **     MOVE    PATH-TBL-SEIKYU-KEY4    TO  MCP-PATH
      *     MOVE    WRK-PATH2               TO  MCP-PATH
      *****
      *     MOVE    "DBFETCH"                  TO  MCP-FUNC
      *     CALL    "MCPSUB"                    USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
           MOVE    "tbl_seikyu"        TO  MCP-TABLE
           MOVE    WRK-PATH2           TO  MCP-PATHNAME
           MOVE    "DBFETCH"           TO  MCP-FUNC
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.07) LINE ADD END   ------------------------------------
      *
           IF       MCP-RC  =     ZERO
               MOVE    MCPDATA-REC   TO      RECE10-REC
      *
      *        テスト患者のときは読み飛ばす
               MOVE    SPACE               TO  PTINF-REC
               INITIALIZE                      PTINF-REC
      *---(01.00.07) LINE ADD START ------------------------------------
      *         MOVE    RECE10-HOSPID       TO  PTINF-HOSPID
               MOVE    SPA-HOSPNUM         TO  PTINF-HOSPNUM
      *---(01.00.07) LINE ADD END   ------------------------------------
               MOVE    RECE10-PTID         TO  PTINF-PTID
               MOVE    PTINF-REC           TO  MCPDATA-REC
               PERFORM 800-PTINF-READ-SEC
               IF      FLG-PTINF           =   ZERO
               AND     PTINF-TSTPTNUMKBN   =   "1"
                   GO  TO  900-SEIKYU-READ-SEC
               END-IF   
      *
      *    １４１を使用している患者は対象外にする
      *    (老人医療費請求書で保険分も含めて請求する為)
               PERFORM  900-KOHSKY-READ-SEC
      **** 2006/02/11 @@@@-BRAND START
      *        IF  RECE02-KOHNUM(1)  =  "141"
      *         OR RECE02-KOHNUM(2)  =  "141"
      *         OR RECE02-KOHNUM(3)  =  "141"
      *         OR RECE02-KOHNUM(4)  =  "141"
               IF  RECE02-KOHNUM(1)  =  "141"
                OR RECE02-KOHNUM(2)  =  "141"
                OR RECE02-KOHNUM(3)  =  "141"
                OR RECE02-KOHNUM(4)  =  "141"
                OR RECE02-KOHNUM(1)  =  "180"
                OR RECE02-KOHNUM(2)  =  "180"
                OR RECE02-KOHNUM(3)  =  "180"
                OR RECE02-KOHNUM(4)  =  "180"
      **** 2006/02/11 @@@@-BRAND END
                   DISPLAY "１４１使用者=" RECE02-PTNUM
                   GO  TO  900-SEIKYU-READ-SEC
               END-IF
      *
               ADD     1             TO      CNT-RECE10   
           ELSE
                    MOVE    1             TO      FLG-END
           END-IF
      *
           .
      *
       900-SEIKYU-READ-EXT.
           EXIT.
      *---(01.00.09) LINE ADD START ------------------------------------
      *****************************************************************
      *    請求管理読込（後期高齢）
      *****************************************************************
       950-SEIKYU-SELECT-SEC             SECTION.
      *
      *    請求管理ＤＢ検索
           INITIALIZE         RECE10-REC.
           MOVE   SPA-HOSPNUM             TO  RECE10-HOSPNUM
           MOVE   LNK-PRTKANRI-SRYYM      TO  RECE10-SKYYM
           MOVE   WRK-CONS-SRYYM-200804   TO  RECE10-SRYYM
           MOVE   999999                  TO  RECE10-XXSRYYM
           MOVE   WRK-HKNNUM                   TO  RECE10-HKNNUM-S
                                              RECE10-HKNNUM
      *
           IF    WRK-PARA-HKNJANUM  NOT = ZERO
               MOVE    WRK-PARA-HKNJANUM  TO  RECE10-XXSTHKNJANUM
                                              RECE10-XXEDHKNJANUM
           ELSE
               MOVE    SPACE              TO  RECE10-XXSTHKNJANUM
               MOVE    "99999999"         TO  RECE10-XXEDHKNJANUM
           END-IF
      *
           MOVE    RECE10-REC              TO  MCPDATA-REC
           MOVE    "DBSELECT"              TO  MCP-FUNC
           MOVE    "tbl_seikyu"            TO  MCP-TABLE
           MOVE    WRK-PATH3               TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
           IF      MCP-RC              =   ZERO
               PERFORM 950-SEIKYU-READ-SEC
           ELSE
               MOVE    1                   TO  FLG-END
               DISPLAY "SELECT ERR"
           END-IF
           .
      *
       950-SEIKYU-SELECT-EXT.
           EXIT.
      *
      *****************************************************************
      *    請求マスター読込（後期高齢）
      *****************************************************************
       950-SEIKYU-READ-SEC           SECTION.
      *
           MOVE    "tbl_seikyu"        TO  MCP-TABLE
           MOVE    WRK-PATH3           TO  MCP-PATHNAME
           MOVE    "DBFETCH"           TO  MCP-FUNC
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
           IF      MCP-RC              =   ZERO
               MOVE    ZERO            TO  FLG-END
               MOVE    MCPDATA-REC         TO  RECE10-REC
      *
      *        テスト患者のときは読み飛ばす
               MOVE    SPACE               TO  PTINF-REC
               INITIALIZE                      PTINF-REC
               MOVE    SPA-HOSPNUM         TO  PTINF-HOSPNUM
               MOVE    RECE10-PTID         TO  PTINF-PTID
               MOVE    PTINF-REC           TO  MCPDATA-REC
               PERFORM 800-PTINF-READ-SEC
               IF      FLG-PTINF           =   ZERO
               AND     PTINF-TSTPTNUMKBN   =   "1"
                   GO  TO  950-SEIKYU-READ-SEC
               END-IF   
      *         
               ADD     1                   TO  CNT-RECE10   
           ELSE
               MOVE    1               TO  FLG-END
           END-IF
           .
      *
       950-SEIKYU-READ-EXT.
           EXIT.
      *****************************************************************
      *    請求管理クローズ
      *****************************************************************
       900-SEIKYU-CLOSE-SEC         SECTION.
      *
           MOVE    "DBCLOSECURSOR"      TO  MCP-FUNC
           MOVE    "tbl_seikyu"         TO  MCP-TABLE
           MOVE    WRK-PATH2            TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
           .
       900-SEIKYU-CLOSE-EXT.
           EXIT.
      *****************************************************************
      *    請求管理クローズ
      *****************************************************************
       950-SEIKYU-CLOSE-SEC         SECTION.
      *
           MOVE    "DBCLOSECURSOR"      TO  MCP-FUNC
           MOVE    "tbl_seikyu"         TO  MCP-TABLE
           MOVE    WRK-PATH3            TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
           .
       900-SEIKYU-CLOSE-EXT.
           EXIT.
      *---(01.00.09) LINE ADD END   ------------------------------------
      *****************************************************************
      *    患者マスタ読込
      *****************************************************************
       800-PTINF-READ-SEC         SECTION.
      *
           MOVE    "DBSELECT"                 TO  MCP-FUNC
      *---(01.00.07) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-PTINF-KEY         TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_ptinf"         TO  MCP-TABLE
           MOVE    "key"               TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.07) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                  TO  MCP-FUNC
      *---(01.00.07) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-PTINF-KEY         TO  MCP-PATH
      *         CALL    "MCPSUB"             USING
      *                                      MCPAREA
      *                                      MCPDATA-REC
               MOVE    "tbl_ptinf"     TO  MCP-TABLE
               MOVE    "key"           TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"     USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.07) LINE ADD END   ------------------------------------
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
      *---(01.00.07) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-PTINF-KEY         TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_ptinf"         TO  MCP-TABLE
           MOVE    "key"               TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.07) LINE ADD END   ------------------------------------
      *
           .
       800-PTINF-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    システム管理マスタ読込
      *****************************************************************
       900-SYSKANRI-INV-SEC         SECTION.
      *
           MOVE    "DBSELECT"                   TO  MCP-FUNC
      *---(01.00.07) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SYSKANRI-KEY10      TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_syskanri"           TO  MCP-TABLE
           MOVE    "key10"                  TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"              USING
                                            MCPAREA
                                            MCPDATA-REC
                                            SPA-AREA
      *---(01.00.07) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                    TO  MCP-FUNC
      *---(01.00.07) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-SYSKANRI-KEY10      TO  MCP-PATH
      *         CALL    "MCPSUB"             USING
      *                                      MCPAREA
      *                                      MCPDATA-REC
               MOVE    "tbl_syskanri"       TO  MCP-TABLE
               MOVE    "key10"              TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"          USING
                                            MCPAREA
                                            MCPDATA-REC
                                            SPA-AREA
      *---(01.00.07) LINE ADD END   ------------------------------------
               IF      MCP-RC              =   ZERO
                   MOVE    ZERO                TO  FLG-SYSKANRI
               ELSE
                   MOVE    1                   TO  FLG-SYSKANRI
               END-IF
           ELSE
               MOVE    1                   TO  FLG-SYSKANRI
           END-IF
      *
           MOVE    "DBCLOSECURSOR"              TO  MCP-FUNC
      *---(01.00.07) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SYSKANRI-KEY10      TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_syskanri"       TO  MCP-TABLE
           MOVE    "key10"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.07) LINE ADD END   ------------------------------------
      *
           .
      *
       900-SYSKANRI-INV-EXT.
           EXIT.
      *****************************************************************
      *    請求管理マスタ読込
      *****************************************************************
       900-SEIKYU-INV-SEC             SECTION.
      *
           MOVE    "DBSELECT"                   TO  MCP-FUNC
      *---(01.00.07) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SEIKYU-KEY          TO  MCP-PATH
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           MOVE    "tbl_seikyu"         TO  MCP-TABLE
           MOVE    "key"                TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.07) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                TO  MCP-FUNC
      *---(01.00.07) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-SEIKYU-KEY      TO  MCP-PATH
      *         CALL    "MCPSUB"            USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
               MOVE    "tbl_seikyu"         TO  MCP-TABLE
               MOVE    "key"                TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"          USING
                                            MCPAREA
                                            MCPDATA-REC
                                            SPA-AREA
      *---(01.00.07) LINE ADD END   ------------------------------------
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
           MOVE    "DBCLOSECURSOR"     TO  MCP-FUNC
      *---(01.00.07) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SEIKYU-KEY TO  MCP-PATH
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           MOVE    "tbl_seikyu"         TO  MCP-TABLE
           MOVE    "key"                TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.07) LINE ADD END   ------------------------------------
      *
           .
      *
       900-SEIKYU-INV-EXT.
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
      *****************************************************************
      *    保険者マスター読込
      *****************************************************************
       900-HKNJAINF-INV-SEC         SECTION.
      *
      *---(01.00.07) LINE ADD START ------------------------------------
      *     MOVE    SYS-1001-HOSPID         TO  HKNJA-HOSPID
           MOVE    SPA-HOSPNUM             TO  HKNJA-HOSPNUM
      *---(01.00.07) LINE ADD END   ------------------------------------
           MOVE    HKNJAINF-REC            TO  MCPDATA-REC
           MOVE    "DBSELECT"              TO  MCP-FUNC
      *---(01.00.07) LINE ADD START ------------------------------------
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
      *---(01.00.07) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"               TO  MCP-FUNC
      *---(01.00.07) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-HKNJAINF-KEY   TO  MCP-PATH
      *         CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
               MOVE    "tbl_hknjainf"       TO  MCP-TABLE
               MOVE    "key"                TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"          USING
                                            MCPAREA
                                            MCPDATA-REC
                                            SPA-AREA
      *---(01.00.07) LINE ADD END   ------------------------------------
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
           MOVE    "DBCLOSECURSOR"         TO  MCP-FUNC
      *---(01.00.07) LINE ADD START ------------------------------------
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
      *---(01.00.07) LINE ADD END   ------------------------------------
      *
           .
      *
       900-HKNJAINF-INV-EXT.
           EXIT.
      *****************************************************************
      *    請求額払集計処理
      *****************************************************************
       800-SEIKYU-SEC  SECTION.
      *
           PERFORM  VARYING  IDX  FROM  1  BY  1
                    UNTIL    IDX  >    4 OR
                    SYU-KOH-HKNNUM(IDX)  =  SPACE
             IF    SYU-KOH-HKNNUM(IDX)  =  WRK-KOHNUM
      *
      *    保険番号マスタのレセプト１円単位表示区分が１の場合は１０円単位
      *    但し、マスタの設定が１０円単位でも全額負担の場合は１円単位
      *    (主保険に限度額が有る場合は無条件で１０円単位)
               IF     IDX  =    1
                 IF  RECE10-FTNMONEY(1) > ZERO
                   ADD  SYU-SYUCOMPFTN            TO  WRK-KEISAN1
                   ADD  SYU-KOH-COMPFTN(IDX)      TO  WRK-KEISAN2
                 ELSE
                   IF  (HKN-RECEFTNDSPKBN     =  "1"   AND
                        SYU-KOH-COMPFTN(IDX)  >  ZERO)
                     ADD  SYU-KOH-COMPFTN(IDX)    TO  WRK-KEISAN2
                   ELSE
                     ADD  SYU-KOH-COMPFTN-ENTANI(IDX)
                                                  TO  WRK-KEISAN2
                   END-IF
                   ADD    SYU-SYUCOMPFTN-ENTANI   TO  WRK-KEISAN1
                 END-IF
               ELSE
                 IF  RECE10-FTNMONEY(1) > ZERO
                   ADD  SYU-KOH-COMPFTN(IDX - 1)  TO  WRK-KEISAN1
                   ADD  SYU-KOH-COMPFTN(IDX)      TO  WRK-KEISAN2
                 ELSE
                   IF  (HKN-RECEFTNDSPKBN     =  "1"   AND
                        SYU-KOH-COMPFTN(IDX)  >  ZERO)
                     ADD  SYU-KOH-COMPFTN(IDX)    TO  WRK-KEISAN2
                   ELSE
                     ADD  SYU-KOH-COMPFTN-ENTANI(IDX)
                                                  TO  WRK-KEISAN2
                   END-IF
                   ADD    SYU-KOH-COMPFTN-ENTANI(IDX - 1)
                                                  TO  WRK-KEISAN1
                 END-IF
               END-IF
             END-IF
           END-PERFORM
      *
      *
           .
       800-SEIKYU-SEC-EXT.
           EXIT.
      *
      *****************************************************************
      *  収納情報セット
      *****************************************************************
       920-SYUNOU-SET-SEC  SECTION.
      *
             INITIALIZE  SYUNOU-REC
      *---(01.00.07) LINE ADD START ------------------------------------
      *       MOVE  RECE10-HOSPID      TO  SYU-HOSPID
             MOVE  SPA-HOSPNUM        TO  SYU-HOSPNUM
      *---(01.00.07) LINE ADD END   ------------------------------------
             MOVE  RECE10-NYUGAIKBN   TO  SYU-NYUGAIKBN
             MOVE  RECE10-PTID        TO  SYU-PTID
             MOVE  RECE10-SRYYM(1:6)  TO  SYU-SRYYMD(1:6)
             MOVE  "__"               TO  SYU-SRYYMD(7:2)
             MOVE  WRK-KOHNUM         TO  SYU-KOH-HKNNUM(1)
                                          SYU-KOH-HKNNUM(2)
                                          SYU-KOH-HKNNUM(3)
                                          SYU-KOH-HKNNUM(4)
             MOVE  SYUNOU-REC         TO  MCPDATA-REC
             MOVE  "DBSELECT"         TO  MCP-FUNC
      *---(01.00.07) LINE ADD START ------------------------------------
      *       MOVE  WRK-PATH           TO  MCP-PATH
      *       CALL  "MCPSUB"            USING
      *                                 MCPAREA
      *                                 MCPDATA-REC
             MOVE    "tbl_syunou"         TO  MCP-TABLE
             MOVE    WRK-PATH             TO  MCP-PATHNAME
             CALL    "ORCDBMAIN"          USING
                                          MCPAREA
                                          MCPDATA-REC
                                          SPA-AREA
      *---(01.00.07) LINE ADD END   ------------------------------------
             IF  MCP-RC  =  ZERO
      *---(01.00.07) LINE ADD START ------------------------------------
      *         MOVE    WRK-PATH        TO  MCP-PATH
               MOVE    "tbl_syunou"         TO  MCP-TABLE
               MOVE    WRK-PATH             TO  MCP-PATHNAME
      *---(01.00.07) LINE ADD END   ------------------------------------
               PERFORM  925-SYUNOU-READ-SEC
      *
               PERFORM  UNTIL  FLG-SYUNOU  =  1
      *
                 IF  SYU-DENPJTIKBN   NOT = "3"
                     PERFORM  800-SEIKYU-SEC
                 END-IF
      *
      *---(01.00.07) LINE ADD START ------------------------------------
      *           MOVE  WRK-PATH         TO  MCP-PATH
                 MOVE    "tbl_syunou"         TO  MCP-TABLE
                 MOVE    WRK-PATH             TO  MCP-PATHNAME
      *---(01.00.07) LINE ADD END   ------------------------------------
                 PERFORM   925-SYUNOU-READ-SEC
               END-PERFORM
             ELSE
               DISPLAY  "SYUNOU SELECT ERR"
             END-IF
      *
             INITIALIZE  MCPAREA
             MOVE  "DBCLOSECURSOR"      TO  MCP-FUNC
      *---(01.00.07) LINE ADD START ------------------------------------
      *       MOVE  WRK-PATH             TO  MCP-PATH
      *       CALL  "MCPSUB"            USING
      *                                 MCPAREA
      *                                 MCPDATA-REC
             MOVE    "tbl_syunou"         TO  MCP-TABLE
             MOVE    WRK-PATH             TO  MCP-PATHNAME
             CALL    "ORCDBMAIN"          USING
                                          MCPAREA
                                          MCPDATA-REC
                                          SPA-AREA
      *---(01.00.07) LINE ADD END   ------------------------------------
      *
           .
       920-SYUNOU-SET-EXT.
           EXIT.
      *
      *****************************************************************
      *    収納読込
      *****************************************************************
       925-SYUNOU-READ-SEC  SECTION.
      *
           MOVE  "DBFETCH"         TO  MCP-FUNC
      *---(01.00.07) LINE ADD START ------------------------------------
      *     CALL  "MCPSUB"              USING
      *                                 MCPAREA
      *                                 MCPDATA-REC
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.07) LINE ADD END   ------------------------------------
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
      *   保険情報セット
      *****************************************************************
       950-HKNNUM-SET-SEC  SECTION.
      *
           INITIALIZE  HKNNUM-REC
      *---(01.00.07) LINE ADD START ------------------------------------
      *     MOVE    WRK-PARA-HOSPID          TO  HKN-HOSPID
           MOVE    SPA-HOSPNUM              TO  HKN-HOSPNUM
      *---(01.00.07) LINE ADD END   ------------------------------------
           MOVE    WRK-KOHNUM               TO  HKN-HKNNUM
           MOVE    LNK-PRTKANRI-SRYYM(1:6)  TO  HKN-TEKSTYMD(1:6)
                                                HKN-TEKEDYMD(1:6)
           MOVE    "01"                     TO  HKN-TEKSTYMD(7:2)
                                                HKN-TEKEDYMD(7:2)
           MOVE    HKNNUM-REC               TO  MCPDATA-REC
           MOVE    "DBSELECT"               TO  MCP-FUNC
      *---(01.00.07) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-HKNNUM-KEY5     TO  MCP-PATH
      *     CALL    "MCPSUB"                 USING
      *                                          MCPAREA
      *                                          MCPDATA-REC
           MOVE    "tbl_hknnum"         TO  MCP-TABLE
           MOVE    "key5"               TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.07) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
      *---(01.00.07) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-HKNNUM-KEY5    TO  MCP-PATH
               MOVE    "tbl_hknnum"         TO  MCP-TABLE
               MOVE    "key5"               TO  MCP-PATHNAME
      *---(01.00.07) LINE ADD END   ------------------------------------
               PERFORM  945-HKNNUM-READ-SEC
      *
           ELSE
               DISPLAY  "HKNNUM SELECT ERR"
           END-IF
      *
           INITIALIZE  MCPAREA
           MOVE    "DBCLOSECURSOR"             TO  MCP-FUNC
      *---(01.00.07) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-HKNNUM-KEY5        TO  MCP-PATH
      *     CALL    "MCPSUB"                    USING
      *                                             MCPAREA
      *                                             MCPDATA-REC
           MOVE    "tbl_hknnum"         TO  MCP-TABLE
           MOVE    "key5"               TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.07) LINE ADD END   ------------------------------------
      *
           .
       950-HKNNUM-SET-EXT.
           EXIT.
      *
      *****************************************************************
      *    保険番号情報読込
      *****************************************************************
       945-HKNNUM-READ-SEC  SECTION.
      *
           MOVE    "DBFETCH"           TO  MCP-FUNC
      *---(01.00.07) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.07) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
             MOVE  MCPDATA-REC  TO  HKNNUM-REC
             MOVE  ZERO         TO  FLG-HKNNUM
             IF    HKN-HKNNUM  =  "051"
               INITIALIZE                HKN-TANSEIDONAME
               MOVE    "特定疾患"   TO   HKN-TANSEIDONAME
             END-IF
           ELSE
             INITIALIZE  HKNNUM-REC
             MOVE  1            TO  FLG-HKNNUM
           END-IF
      *
           .
       945-HKNNUM-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    集計ファイル読込
      *****************************************************************
       800-SKTTMP-READ-SEC             SECTION.
      *
           READ    SKT1105TMP-FILE
               INVALID    KEY
                   MOVE    1           TO  FLG-SKT1105TMP
               NOT INVALID  KEY
                   MOVE    ZERO        TO  FLG-SKT1105TMP
           END-READ
           .
       800-SKTTMP-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    一時ファイル読込
      *****************************************************************
       900-TMP-READ-SEC                SECTION.
      *
           READ  SKT1105TMP-FILE   NEXT
               AT  END
                   MOVE  1  TO  FLG-PRINT
                                FLG-END
           END-READ
           .
       900-TMP-READ-EXT.
           EXIT.
      *      
      *****************************************************************
      *    公費請求情報読み込み
      *****************************************************************
       900-KOHSKY-READ-SEC         SECTION.
      *
           INITIALIZE                  RECE02-REC
           MOVE    RECE10-KEY          TO  RECE02-KEY
           MOVE    RECE02-REC          TO  MCPDATA-REC
           MOVE    "DBSELECT"          TO  MCP-FUNC
      *---(01.00.07) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-KOHSKY-KEY     TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           MOVE    "tbl_kohsky"         TO  MCP-TABLE
           MOVE    "key"                TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.07) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"           TO  MCP-FUNC
      *---(01.00.07) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-KOHSKY-KEY TO  MCP-PATH
      *         CALL    "MCPSUB"                USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
               MOVE    "tbl_kohsky"         TO  MCP-TABLE
               MOVE    "key"                TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"          USING
                                            MCPAREA
                                            MCPDATA-REC
                                            SPA-AREA
      *---(01.00.07) LINE ADD END   ------------------------------------
               IF      MCP-RC              =   ZERO
                   MOVE    ZERO                TO  FLG-RECE02
                   MOVE    MCPDATA-REC         TO  RECE02-REC
               ELSE
                   MOVE    1                   TO  FLG-RECE02
                   INITIALIZE                  RECE02-REC
               END-IF
           ELSE
               MOVE    1                   TO  FLG-RECE02
               INITIALIZE                  RECE02-REC
           END-IF
      *
           MOVE    "DBCLOSECURSOR"         TO  MCP-FUNC
      *---(01.00.07) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-KOHSKY-KEY     TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           MOVE    "tbl_kohsky"         TO  MCP-TABLE
           MOVE    "key"                TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.07) LINE ADD END   ------------------------------------
      *
           .
       900-KOHSKY-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    全角変換処理
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
      *---(01.00.07) LINE ADD START ------------------------------------
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
           MOVE    SYS-1900-REC            TO  MCPDATA-REC
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
      *---(01.00.07) LINE ADD END   ------------------------------------
      *****************************************************************
      *    ＤＢ  オープン処理
      *****************************************************************
       100-DBOPEN-SEC                SECTION.
      *
      *---(01.00.07) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.07) LINE ADD END   ------------------------------------
           MOVE    "DBOPEN"            TO  MCP-FUNC.
      *---(01.00.07) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"            USING
      *                                 MCPAREA
      *                                 MCPDATA-REC
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.07) LINE ADD END   ------------------------------------
      *
      *---(01.00.07) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.07) LINE ADD END   ------------------------------------
           MOVE    "DBSTART"           TO  MCP-FUNC.
      *---(01.00.07) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"            USING
      *                                 MCPAREA
      *                                 MCPDATA-REC
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.07) LINE ADD END   ------------------------------------
      *
           .
      *
       100-DBOPEN-EXT.
           EXIT.
      *****************************************************************
      *    ＤＢ  クローズ処理
      *****************************************************************
       900-DBDISCONNECT-SEC            SECTION.
      *
      *---(01.00.07) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.07) LINE ADD END   ------------------------------------
           MOVE    "DBCOMMIT"          TO  MCP-FUNC.
      *---(01.00.07) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"            USING
      *                                 MCPAREA
      *                                 MCPDATA-REC
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.07) LINE ADD END   ------------------------------------
      *
      *---(01.00.07) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.07) LINE ADD END   ------------------------------------
           MOVE    "DBDISCONNECT"      TO  MCP-FUNC.
      *---(01.00.07) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"            USING
      *                                 MCPAREA
      *                                 MCPDATA-REC
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.07) LINE ADD END   ------------------------------------
      *
           .
       900-DBDISCONNECT-EXT.
           EXIT.
