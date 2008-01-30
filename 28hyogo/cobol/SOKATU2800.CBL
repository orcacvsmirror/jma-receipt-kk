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
       PROGRAM-ID.             SOKATU2800.
      *****************************************************************
      *  システム名        : ＯＲＣＡ
      *  サブシステム名    : 月次帳票
      *  コンポーネント名  : 国民健康保険診療報酬総括票
      *  管理者            : 
      *  作成日付    作業者        記述
      *  05/05/16    山口     ORCAのバージョンアップ(2.5.0)による再作成
      *                      (dia→Monpe、Open cobolのバージョンアップ対応含む)
      *****************************************************************
      *  プログラム修正履歴
      * Maj/Min/Rev	修正者	日付		内容
      *  01.00.01    山口    05/06/30    高齢重度障害者の件数を表示
      *                                  福祉件数の対象公費を追加
      *  01.00.02    山口    05/08/01    福祉件数の対象公費に(227)を追加
      *  01.00.03    山口    05/10/04    請求書枚数の集計方法修正
      *  01.00.04    山口    05/12/01    返戻対応
      *  01.00.05    内田    07/09/02    日レセver4.0対応
      *                                  システム管理マスタ「1901」の
      *                                  医療機関情報を参照
      *  01.00.06    内田    07/12/05    レセ電時、レセ電国保請求書の枚数を集計
      *  01.00.07    内田    07/12/19    レセ電国保請求書は２枚１組で１枚とする
      *                                  レセ電国保請求書は県毎で帳票を分けて
      *                                  カウントする
      *****************************************************************
       ENVIRONMENT                 DIVISION.
       CONFIGURATION               SECTION.
       INPUT-OUTPUT                SECTION.
       FILE-CONTROL.
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
           SELECT  SRYKA-FILE    ASSIGN FILE-NAME
                                 ORGANIZATION   IS  LINE SEQUENTIAL
                                 ACCESS MODE    IS  SEQUENTIAL
                                 FILE   STATUS  IS  STS-SRYKA.
      *
           SELECT  HOSPKBN-FILE  ASSIGN FILE-NAME
                                 ORGANIZATION   IS  LINE SEQUENTIAL
                                 ACCESS MODE    IS  SEQUENTIAL
                                 FILE   STATUS  IS  STS-HOSPKBN.
      *
      *
       DATA                        DIVISION.
       FILE                        SECTION.
      *
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
      *    診療科CDファイル
       FD  SRYKA-FILE.
       01  SRYKA-REC.
           03  SRYKA-SRYKANAME           PIC X(34).
           03  FILLER                    PIC X(01).
      *
       FD  HOSPKBN-FILE.
       01  HOSPKBN-REC.
           03  FILLER                    PIC X(13).
           03  HOSPKBN-CD                PIC X(01).
      *
       WORKING-STORAGE             SECTION.
      *
      *    印刷用データ 名称領域 
           COPY    "CPCOMMONPRT.INC".
      *
      *    請求ＤＢ更新用ファイル 名称領域 
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
      *    印刷用領域
           COPY    "SKT2800.INC".
      *
      *    スパ領域
       01  STS-AREA.
           03  STS-PARA            PIC X(02).
           03  STS-RECE10          PIC X(02).
           03  STS-RECEERR         PIC X(02).
           03  STS-RECEUPD         PIC X(02).
           03  STS-SRYKA           PIC X(02).
           03  STS-HOSPKBN         PIC X(02).
      *
      *    フラグ領域
       01  FLG-AREA.
           03  FLG-END             PIC 9(01).
           03  FLG-SYSKANRI        PIC 9(01).
           03  FLG-HKNJAINF        PIC 9(01).
           03  FLG-UPD             PIC 9(01).
           03  FLG-UPDFILE         PIC 9(01).
           03  FLG-SEIKYU          PIC 9(01).
           03  FLG-OK              PIC 9(01).
           03  FLG-PTINF           PIC 9(01).
      ***** 05/06/30 yamaguchi INS
           03  FLG-SYUNOU          PIC 9(01).
           03  FLG-HKNCOMBI        PIC 9(01).
      *****
      *
      *    添字領域
       01  IDX-AREA.
      ***** 05/06/30 yamaguchi INS
           03  IDX                 PIC 9(04).
      *****
           03  IDX1                PIC 9(04).
           03  IDX2                PIC 9(04).
           03  IDX3                PIC 9(04).
           03  IDX4                PIC 9(02).
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
      *---(01.00.05) LINE ADD START ------------------------------------
      *     03  WRK-PARA-HOSPID     PIC X(24).
           03  WRK-PARA-HOSPNUM    PIC 9(02).
      *---(01.00.05) LINE ADD END   ------------------------------------
           03  WRK-PARA-PAGE       PIC 9(10).
      ***** 05/12/01 yamaguchi INS
           03  WRK-PARA-SYOKBN     PIC X(01).
      *****
      *
      *    一時領域
       01  WRK-AREA.
           03  WRK-SEIYMD        PIC X(08).
           03  WRK-SEIYMDWH      PIC X(20).
           03  WRK-SRYYMWH       PIC X(16).
           03  WRK-SRYYMD        PIC X(08).
      *
      *    ファイル名称用エリア
           03  FILE-NAME        PIC X(512).
           03  WRK-SRYKANAME    PIC X(34) OCCURS 3.
      *
           03  WRK-Z3            PIC ZZZ.
           03  WRK-Z6            PIC ZZZZZZ.
           03  WRK-Z9            PIC ZZZZZZZZZ.
           03  WRK-HKNJANUM      PIC X(06).
           03  WRK-CNT           PIC 9(03).
           03  WRK-KENNAME       PIC X(10).
           03  WRK-HKNJANAME     PIC X(20).
      *---(01.00.06) LINE ADD START ------------------------------------
           03  WRK-MAISU         PIC 9(03).
           03  WRK-AMARI         PIC 9(02).
           03  WRK-MAISUKEI      PIC 9(03).
      *---(01.00.06) LINE ADD END   ------------------------------------
      *---(01.00.07) LINE ADD START ------------------------------------
           03  WRK-GMAISU        PIC 9(03).
      *---(01.00.07) LINE ADD END   ------------------------------------
      *    請求書枚数カウント用エリア
      ***** 05/10/04 yamaguchi DEL
      *     03  WRK-SEIKYUSYO-CNT-TBL OCCURS 200.
      *         05  WRK-SEIKYUSYO-KEY.
      *             07  WRK-KEY-HKNJANUM  PIC X(06).
      *             07  WRK-KEY-SRYYM     PIC X(06).
      *             07  WRK-KEY-ZAITAKU   PIC X(01).
      *     03  WRK-CHK-KEY.
      *         05  WRK-CHK-HKNJANUM      PIC X(06).
      *         05  WRK-CHK-SRYYM         PIC X(06).
      *         05  WRK-CHK-ZAITAKU       PIC X(01).
      ***** 05/10/04 yamaguchi INS
           03  WRK-SEIKYUSYO-CNT-TBL OCCURS 200.
               05  WRK-SEIKYUSYO-KEY.
      *---(01.00.07) LINE ADD START ------------------------------------
                   07  WRK-KEY-PREFKBN   PIC X(01).
                   07  WRK-KEY-PREFNUM   PIC X(02).
      *---(01.00.07) LINE ADD END   ------------------------------------
                   07  WRK-KEY-HKNJANUM  PIC X(06).
                   07  WRK-KEY-ZAITAKU   PIC X(01).
           03  WRK-CHK-KEY.
      *---(01.00.07) LINE ADD START ------------------------------------
               05  WRK-CHK-PREFKBN       PIC X(01).
               05  WRK-CHK-PREFNUM       PIC X(02).
      *---(01.00.07) LINE ADD END   ------------------------------------
               05  WRK-CHK-HKNJANUM      PIC X(06).
               05  WRK-CHK-ZAITAKU       PIC X(01).
      *
      *---(01.00.07) LINE ADD START ------------------------------------
           03  WRK-PREFKENSU-TBL  OCCURS  47.
               05  WRK-PREFNUM           PIC X(02).
               05  WRK-PREFKENSU         PIC 9(03).
      *---(01.00.07) LINE ADD END   ------------------------------------
      *****
      *    県外保険者数カウント用エリア
           03  WRK-CNT-TBL OCCURS 200.
               05  WRK-CNT-HKNJANUM  PIC X(06).
      *
           03  WRK-MAE-INPUT         PIC X(200).
           03  WRK-OUT-INPUT         PIC X(200).
      *
      *
       01  WRK-POSTG.
           03  WRK-POSTMAE       PIC X(06).
           03  FILLER            PIC X(02) VALUE "−".
           03  WRK-POSTATO       PIC X(08).
      *  
           03  WRK-SYMD.
               05  WRK-SYY           PIC 9(04).
               05  WRK-SMM           PIC 9(02).
               05  WRK-SDD           PIC 9(02).
           03  WRK-HENYMDG           PIC X(22).
      *
      *
           03  WRK-RECEERR           PIC X(200).
      *
           03  WRK-KBN               PIC  9(02).
      ***** 05/06/30 yamaguchi INS
           03  WRK-KOHNUM            PIC X(03).
           03  WRK-KOHID             PIC 9(10).
           03  WRK-KOHTENSU          PIC 9(08).
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *     03  WRK-PATH.
      *         05  FILLER            PIC S9(09)  BINARY.
      *         05  FILLER            PIC S9(09)  BINARY.
      *         05  FILLER            PIC S9(09)  BINARY.
           03  WRK-PATH              PIC X(50).
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
      *---(01.00.05) LINE ADD END   ------------------------------------
      *****
      *
      *    カウント領域
       01  CNT-AREA.
           03  CNT-PAGE              PIC 9(03).
           03  CNT-RECE10            PIC 9(06).
           03  CNT-UPDFILE           PIC 9(06).
      *
      *    集計領域
       01  SUM-AREA.
           03  SUM-SEIKYU-DATA        OCCURS  5.
               05  SUM-TENSU         PIC 9(09).
               05  SUM-KENSU         PIC 9(05).
           03  SUM-SEIKYUSYO-G    OCCURS  3.
               05  SUM-SEIKYUSYO     PIC 9(03).
           03  SUM-SYAHOSEIKYU       PIC 9(03).
      ***** 05/06/30 yamaguchi INS
           03  SUM-SYAHOSEIKYU2      PIC 9(03).
      *****
      *
           COPY    "CPSHELLTBL.INC".
      *     
      *---(01.00.05) LINE ADD START ------------------------------------
      *     COPY    "ORCA-DBPATH".
           COPY    "COMMON-SPA".
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *****************************************************************
      *    ファイルレイアウト
      *****************************************************************
      *
      *    保険者情報
       01  HKNJAINF-REC.
           COPY    "CPHKNJAINF.INC".
      *
      *    ＪＯＢ管理ＤＢ
       01  JOBKANRI-REC.
           COPY    "CPJOBKANRI.INC".
      *
      *    ＪＯＢ管理ＤＢ（制御用）
           COPY    "CPORCSJOBKANRI.INC".
      *
      *    保険番号
       01  HKNNUM-REC.
           COPY    "CPHKNNUM.INC".
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
      *---(01.00.06) LINE ADD START ------------------------------------
      *
      *    医療機関情報−レセプト・総括印刷情報
           COPY    "CPSK2005.INC".
      *---(01.00.06) LINE ADD END   ------------------------------------
      *
      *    患者情報
       01  PTINF-REC.
           COPY    "CPPTINF.INC".
      *
      *    請求管理情報
           COPY    "CPRCF010.INC".
      *
      *    公費請求書
           COPY    "CPKOHSKY.INC"
                   REPLACING  //KOHSKY//
                   BY         //RECE02//.
      ***** 05/06/30 yamaguchi INS
      *
      *    収納情報
       01  SYUNOU-REC.
           COPY  "CPSYUNOU.INC".
      *
      *    保険組合せ
       01  HKNCOMBI-REC.
           COPY    "CPHKNCOMBI.INC".
      *****
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
      *    印刷ＤＢ制御サブ
           COPY    "CPORCSPRT.INC".          
      *
      *    ファイルディレクトリ位置指定サブ
           COPY    "CPMKPASS.INC".
      *
      *    全角チェックパラメタ
           COPY    "CPORCSKANACHK.INC".
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
      ***** 05/12/01 yamaguchi DEL
      *                                         WRK-PARA-JOBID
      *                                         WRK-PARA-SHELLID
      *                                         WRK-PARA-HOSPID
      ***** 05/12/01 yamaguchi INS
      *---(01.00.05) LINE ADD START ------------------------------------
      *                                         WRK-PARA-HOSPID
                                               WRK-PARA-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
                                               WRK-PARA-JOBID
                                               WRK-PARA-SHELLID
                                               WRK-PARA-SYOKBN
      *---(01.00.05) LINE ADD START ------------------------------------
                                               RECEERR
      *---(01.00.05) LINE ADD END   ------------------------------------
      *****
           END-UNSTRING
      *---(01.00.05) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  SPA-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *    ステップ開始処理
           MOVE    "STS"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
      *---(01.00.05) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           MOVE    "SOKATU2800"    TO  JOB-PGID
           MOVE    "兵庫国保診療報酬総括表"    TO  JOB-SHELLMSG
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA  
                                   JOBKANRI-REC
      *---(01.00.05) LINE ADD START ------------------------------------
                                   SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
           MOVE    "RECEUPD"           TO  RECEUPD-FILE-ID
           MOVE    LNK-PRTKANRI-TERMID     TO  RECEUPD-TERMID
      *---(01.00.05) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  RECEUPD-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    "RECEERR"           TO  RECEERR-FILE-ID
      *     MOVE    LNK-PRTKANRI-TERMID     TO  RECEERR-TERMID
      *---(01.00.05) LINE ADD END   ------------------------------------
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
           MOVE    "1001"         TO      SYS-1001-KANRICD
           MOVE    "*"            TO      SYS-1001-KBNCD
           MOVE    LNK-PRTKANRI-SRYYM(1:6)
                                  TO      SYS-1001-STYUKYMD(1:6)
                                          SYS-1001-EDYUKYMD(1:6)
           MOVE    "01"           TO      SYS-1001-STYUKYMD(7:2)
                                          SYS-1001-EDYUKYMD(7:2)
      *---(01.00.05) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM    TO      SYS-1001-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
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
           MOVE     "1002"        TO      SYS-1002-KANRICD
           MOVE     "*"           TO      SYS-1002-KBNCD
           MOVE     LNK-PRTKANRI-SRYYM(1:6)
                                  TO      SYS-1002-STYUKYMD(1:6)
                                          SYS-1002-EDYUKYMD(1:6)
           MOVE     "01"          TO      SYS-1002-STYUKYMD(7:2)
                                          SYS-1002-EDYUKYMD(7:2)
      *---(01.00.05) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM    TO      SYS-1002-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
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
      *---(01.00.06) LINE ADD START ------------------------------------
      *    医療機関情報−レセプト・総括印刷情報
           INITIALIZE                     SYS-2005-REC
           MOVE     "2005"        TO      SYS-2005-KANRICD
           MOVE     "*"           TO      SYS-2005-KBNCD
           MOVE     LNK-PRTKANRI-SRYYM(1:6)
                                  TO      SYS-2005-STYUKYMD(1:6)
                                          SYS-2005-EDYUKYMD(1:6)
           MOVE     "01"          TO      SYS-2005-STYUKYMD(7:2)
                                          SYS-2005-EDYUKYMD(7:2)
           MOVE     SPA-HOSPNUM   TO      SYS-2005-HOSPNUM
           MOVE     SYS-2005-REC  TO      MCPDATA-REC
           PERFORM  900-SYSKANRI-INV-SEC
           IF       FLG-SYSKANRI       =  ZERO
               MOVE    MCPDATA-REC   TO    SYS-2005-REC
           ELSE
               MOVE "医療機関情報（レセプト）が取得できませんでした"
                                     TO    WRK-RECEERR
               PERFORM   500-ERR-HENSYU-SEC
               MOVE      1           TO    FLG-END
           END-IF 
      *---(01.00.06) LINE ADD END   ------------------------------------
      *
      *---(01.00.05) LINE ADD START ------------------------------------
           MOVE    SYS-1001-HOSPNAME   TO  WRK-HOSPNAME
           MOVE    SYS-1002-ADRS       TO  WRK-HOSPADRS
           MOVE    SYS-1002-TEL        TO  WRK-HOSPTEL
      *    医療機関編集情報
           PERFORM 900-1900-READ-SEC
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
           PERFORM  111-INI-FILE-SEC
      *
           OPEN     OUTPUT  UPD-FILE
      *
      ***** 05/12/01 yamaguchi INS
           EVALUATE    WRK-PARA-SYOKBN 
               WHEN    "2"
      *---(01.00.05) LINE ADD START ------------------------------------
      *             MOVE    PATH-TBL-SEIKYU-KEY37    TO  WRK-PATH
                   MOVE    "key37"     TO  WRK-PATH
      *---(01.00.05) LINE ADD END   ------------------------------------
               WHEN    "1"
      *---(01.00.05) LINE ADD START ------------------------------------
      *             MOVE    PATH-TBL-SEIKYU-KEY38    TO  WRK-PATH
                   MOVE    "key38"     TO  WRK-PATH
      *---(01.00.05) LINE ADD END   ------------------------------------
           END-EVALUATE
      *****
      *
           PERFORM  900-SEIKYU-SELECT-SEC
      *
           .
      *
       100-INIT-EXT.
           EXIT.
      *****************************************************************
      *    優先保険者番号INIファイル読み込み処理
      *****************************************************************
       111-INI-FILE-SEC                SECTION.
      *
      *    診療科名取得
      *    ファイルディレクトリ位置指定
           INITIALIZE           ORCSMKPASSAREA
           MOVE  "data/SRYKA.INI"     TO  MKPASS-IN-01
           CALL  "ORCSMKPASSSITE"  USING  ORCSMKPASSAREA
           MOVE  MKPASS-OT-01  TO  FILE-NAME
      *
           INITIALIZE   SRYKA-REC
      *
           OPEN  INPUT  SRYKA-FILE
      *
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
           DISPLAY "診療科１="  WRK-SRYKANAME(1)
           DISPLAY "診療科２="  WRK-SRYKANAME(2)
           DISPLAY "診療科３="  WRK-SRYKANAME(3)
      *
      *    医療機関区分取得
      *    ファイルディレクトリ位置指定
           INITIALIZE           ORCSMKPASSAREA
           MOVE  "data/HOSPKBN.INI"     TO  MKPASS-IN-01
           CALL  "ORCSMKPASSSITE"  USING  ORCSMKPASSAREA
           MOVE  MKPASS-OT-01  TO  FILE-NAME
      *
           INITIALIZE   HOSPKBN-REC
      *
           OPEN  INPUT  HOSPKBN-FILE
      *
           READ HOSPKBN-FILE
             AT END
               INITIALIZE        HOSPKBN-REC
           END-READ
      *
      *
           CLOSE HOSPKBN-FILE
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
      *    データ集計処理
           MOVE     ZERO    TO        FLG-END
      *
           PERFORM  2001-SYUKEI-SEC
                    UNTIL   FLG-END   =   1
      *
      *    社保福祉件数集計処理
           PERFORM  2001-KOHI-SYUKEI-SEC
      *
      *    プリント処理
           PERFORM   2001-PRINT-SEC
           MOVE      1      TO     FLG-END
      *
           CLOSE   UPD-FILE
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
           DISPLAY "*** SOKATU2800 IN  "  CNT-RECE10 
           DISPLAY "*** SOKATU2800 END ***"
      *
      *    ステップ終了処理
           MOVE    "STE"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
      *---(01.00.05) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
           MOVE    WRK-PARA-PAGE   TO  JOB-UPDCNT
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
      *
           .
      *
       300-END-EXT.
           EXIT.
      *****************************************************************
      *    保険者番号別集計処理                        
      *****************************************************************
       2001-SYUKEI-SEC               SECTION.
      *
      *    データ加算処理
           PERFORM  2002-SYORI-SEC
      *
           MOVE  1              TO   FLG-UPD
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
       2001-SYUKEI-EXT.
           EXIT.
      *
      *****************************************************************
      *    データ加算処理
      *****************************************************************
       2002-SYORI-SEC               SECTION.
      *
      *    集計場所設定
           IF     RECE10-PREFKBN      =  "1"
             IF     RECE10-NYUGAIKBN  =  "1"
               MOVE     1     TO     IDX1
             ELSE
               MOVE     2     TO     IDX1
             END-IF
             MOVE       1     TO     IDX2
           ELSE
             IF     RECE10-NYUGAIKBN  =  "1"
               MOVE     3     TO     IDX1
             ELSE
               MOVE     4     TO     IDX1
             END-IF
             MOVE       2     TO     IDX2
           END-IF
      *
      *    件数加算
           ADD          1                 TO     SUM-KENSU(IDX1)
                                                 SUM-KENSU(5)
      *
      *    点数加算
           ADD     RECE10-TOTALTEN(1)     TO     SUM-TENSU(IDX1)
                                                 SUM-TENSU(5)
      *
      *    請求書件数チェック処理
           PERFORM  20021-SEIKYUSYO-CHK-SEC
      *
           .
      *
       2002-SYORI-EXT.
           EXIT.
      *****************************************************************
      *    請求書件数チェック処理
      *****************************************************************
       20021-SEIKYUSYO-CHK-SEC        SECTION.
      *
      *    KEY設定(保険者番号・診療年月・在宅フラグで判定)
           INITIALIZE          WRK-CHK-KEY
      *---(01.00.06) LINE ADD START ------------------------------------
      *     MOVE     RECE10-HKNJANUM-S      TO    WRK-CHK-HKNJANUM
      ****** 05/10/04 yamaguchi DEL
      **     MOVE     RECE10-SRYYM           TO    WRK-CHK-SRYYM
      ******
      *     MOVE     RECE10-ZAITAKU         TO    WRK-CHK-ZAITAKU
      *    レセ電と紙レセで条件が異なる
           IF   SYS-2005-KKHRECEKBN  NOT =  ZERO
           AND  WRK-PARA-SYOKBN      NOT =  2
      *---(01.00.07) LINE ADD START ------------------------------------
               IF  RECE10-PREFKBN  =  1
                   MOVE  RECE10-PREFKBN    TO    WRK-CHK-PREFKBN
               ELSE
                   MOVE  RECE10-PREFNUM    TO    WRK-CHK-PREFNUM
               END-IF
      *---(01.00.07) LINE ADD END   ------------------------------------
               MOVE  RECE10-HKNJANUM-S     TO    WRK-CHK-HKNJANUM
           ELSE
               MOVE  RECE10-HKNJANUM-S     TO    WRK-CHK-HKNJANUM
               MOVE  RECE10-ZAITAKU        TO    WRK-CHK-ZAITAKU
           END-IF
      *---(01.00.06) LINE ADD END   ------------------------------------
      *
      *    神戸市は代表番号で括る
           IF       WRK-CHK-HKNJANUM(1:3)  =     "284"
             MOVE   "284000"               TO    WRK-CHK-HKNJANUM
           END-IF
      *
           MOVE     ZERO     TO     FLG-OK
           PERFORM  VARYING  IDX3 FROM  1  BY  1
                    UNTIL    IDX3 >     200
                    OR       FLG-OK    =   1
             IF     WRK-SEIKYUSYO-KEY(IDX3)  =  WRK-CHK-KEY
               MOVE     1     TO     FLG-OK
             ELSE
               IF   WRK-SEIKYUSYO-KEY(IDX3)  =  SPACE
                 MOVE  WRK-CHK-KEY       TO WRK-SEIKYUSYO-KEY(IDX3)
                 ADD   1                     TO SUM-SEIKYUSYO(IDX2)
                                                SUM-SEIKYUSYO(3)
      *---(01.00.07) LINE ADD START ------------------------------------
      *          レセ電時、各県毎の保険者格納
                 IF  RECE10-PREFKBN  NOT =  "1"
                   PERFORM  VARYING  IDX4  FROM  1  BY  1
                            UNTIL    WRK-PREFNUM(IDX4)  =  SPACE
                            OR       IDX4  >    47
                     IF  WRK-PREFNUM(IDX4)  =  WRK-CHK-PREFNUM
                       ADD   1               TO  WRK-PREFKENSU(IDX4)
                       MOVE  47              TO  IDX4
                     END-IF
                   END-PERFORM
      *
                   IF  IDX4  <  47
                       MOVE  WRK-CHK-PREFNUM  TO  WRK-PREFNUM(IDX4)
                       ADD   1                TO  WRK-PREFKENSU(IDX4)
                   END-IF
                 END-IF
      *---(01.00.07) LINE ADD END   ------------------------------------
                 MOVE  1                     TO FLG-OK
               END-IF
             END-IF
           END-PERFORM
      *
      *    県外保険者種類取得(保険者番号のみで判定)
           IF     RECE10-PREFKBN    =    "2"
             MOVE    ZERO      TO    FLG-OK
             PERFORM  VARYING  IDX3 FROM  1  BY  1
                      UNTIL    IDX3 >     200
                      OR       FLG-OK     =   1
               IF     WRK-CNT-HKNJANUM(IDX3)  =   WRK-CHK-HKNJANUM
                 MOVE          1              TO  FLG-OK
               ELSE
                 IF   WRK-CNT-HKNJANUM(IDX3)  =   SPACE
                   MOVE        1              TO  FLG-OK
                   MOVE   WRK-CHK-HKNJANUM    
                                      TO  WRK-CNT-HKNJANUM(IDX3)
                 END-IF
               END-IF
             END-PERFORM
           END-IF
      *
           .
      *
       20021-SEIKYUSYO-CHK-EXT.
           EXIT.
      *****************************************************************
      *    地方公費医療点数集計処理
      *****************************************************************
       2001-KOHI-SYUKEI-SEC                SECTION.
      *
           MOVE    ZERO        TO    FLG-END
      *
           PERFORM 900-KOHSKY-START-SEC
      *
           PERFORM  UNTIL  FLG-END   =   1
      ***** 05/12/02 yamaguchi DEL
      ****** 05/06/30 yamaguchi DEL
      **       PERFORM VARYING IDX3 FROM    1   BY  1
      **               UNTIL   IDX3 >       4
      **         IF  RECE02-KOHNUM (IDX3) = "141" OR "241" OR "180"
      **                                 OR "182" OR "185" OR "280"
      ***
      **           ADD     1         TO      SUM-SYAHOSEIKYU
      ***
      **        END-IF
      **       END-PERFORM
      ****** 05/06/30 yamaguchi INS
      *       PERFORM VARYING IDX3 FROM    1   BY  1
      *               UNTIL   IDX3 >       4
      *         IF  RECE02-KOHNUM (IDX3) =
      *                     "141" OR "180" OR "182" OR "185" OR "143" OR
      *                     "241" OR "280" OR "282" OR "285" OR "243" OR
      *                     "341"
      *           ADD     1         TO      SUM-SYAHOSEIKYU
      *         ELSE
      ****** 05/08/01 yamaguchi DEL
      **           IF  RECE02-KOHNUM (IDX3) = "127"
      ***
      **             MOVE    RECE02-KOHNUM (IDX3)   TO  WRK-KOHNUM
      **             MOVE    RECE02-KOHID  (IDX3)   TO  WRK-KOHID
      **             INITIALIZE                         WRK-KOHTENSU
      **             IF      RECE02-NYUGAIKBN    =   "1"
      **                 MOVE    PATH-TBL-SYUNOU-KEY33   TO  WRK-PATH
      **             ELSE
      **                 MOVE    PATH-TBL-SYUNOU-KEY25   TO  WRK-PATH
      **             END-IF
      **             PERFORM   920-SYUNOU-SET-SEC
      ***
      **             IF  RECE02-TOTALTEN (IDX3)   NOT =  WRK-KOHTENSU
      **                 ADD     1         TO      SUM-SYAHOSEIKYU2
      **             END-IF
      **           END-IF
      **         END-IF
      **       END-PERFORM
      ****** 05/08/01 yamaguchi INS
      **  227も対象となるよう変更
      **  兵庫県では全公と地公は併用させないという事なので、127or227
      **  を持っていれば無条件でカウントする
      *           IF  RECE02-KOHNUM (IDX3) = "127" OR "227"
      *             ADD     1         TO      SUM-SYAHOSEIKYU2
      *           END-IF
      *         END-IF
      *       END-PERFORM
      ****** 
      *
      ***** 05/12/02 yamaguchi INS
      *  兵庫県では全公と地公は併用させないという事なので、地方公費
      *  を持っていれば無条件でカウントする
             IF   WRK-PARA-SYOKBN   =  1
               PERFORM VARYING IDX3 FROM    1   BY  1
                       UNTIL   IDX3 >       4
                 IF  RECE02-KOHNUM (IDX3) =
                          "141" OR "180" OR "182" OR "185" OR "143" OR
                          "241" OR "280" OR "282" OR "285" OR "243" OR
                          "341"
                   ADD     1         TO      SUM-SYAHOSEIKYU
                 ELSE
                   IF  RECE02-KOHNUM (IDX3) = "127" OR "227"
                     ADD     1         TO      SUM-SYAHOSEIKYU2
                   END-IF
                 END-IF
               END-PERFORM
             ELSE
               DISPLAY  "返戻 患者番号 = "  RECE02-PTNUM
               DISPLAY  "WRK-PARA-SYOKBN = " WRK-PARA-SYOKBN
             END-IF
      ***** 
             PERFORM  900-KOHSKY-READ-SEC
           END-PERFORM
      *
           .
       2001-KOHI-SYUKEI-EXT.
           EXIT.
      *
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
       2001-PRINT-SEC                   SECTION.
      *
      *集計データ移行
           MOVE     1      TO        WRK-CNT
           MOVE     ZERO   TO        FLG-OK
           PERFORM  UNTIL     FLG-OK  =   1
                    AND       WRK-CNT-HKNJANUM(WRK-CNT) = SPACE
      *
      *    帳票編集<見出し>処理
             PERFORM  310-HEAD-HEN-SEC
             DISPLAY "310 OK"
      *
      *    帳票編集(明細)処理
             PERFORM  320-BODY-HEN-SEC
             DISPLAY "320 OK"
      *
      *    帳票編集(印刷)処理
             PERFORM  330-PRINT-OUT-SEC
             MOVE     1        TO     FLG-OK
             DISPLAY  "県外保険者２="   WRK-CNT-HKNJANUM(WRK-CNT)
             DISPLAY "カウント２="  WRK-CNT
           END-PERFORM
      *
           .
      *
       2001-PRINT-EXT.
           EXIT.
      *****************************************************************
      *    帳票編集<ヘッダー部>処理
      *****************************************************************
       310-HEAD-HEN-SEC             SECTION.
      *
           INITIALIZE                             SKT2800
      *---(01.00.06) LINE ADD START ------------------------------------
                                                  WRK-MAISUKEI
      *---(01.00.06) LINE ADD START ------------------------------------
      *
           MOVE     WRK-SRYYMWH              TO   SKT2800-SRYYM
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *    医療機関住所
      *     MOVE     SYS-1002-ADRS            TO   SKT2800-ADRS
      *    医療機関住所
           MOVE     WRK-HOSPADRS             TO   SKT2800-ADRS
      *---(01.00.05) LINE ADD END   ------------------------------------
      *    
      *    郵便番号
           MOVE     SYS-1002-POST(1:3)       TO   WRK-MAE-INPUT
           PERFORM  2009-HENKAN-SEC
           MOVE     WRK-OUT-INPUT            TO   WRK-POSTMAE
      *
           MOVE     SYS-1002-POST(4:4)       TO   WRK-MAE-INPUT
           PERFORM  2009-HENKAN-SEC
           MOVE     WRK-OUT-INPUT            TO   WRK-POSTATO
      *
           MOVE     WRK-POSTG                TO   SKT2800-POST
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *    電話番号
      *     MOVE     SYS-1002-TEL             TO   SKT2800-TEL
      *
      *    医療機関名
      *     MOVE     SYS-1001-HOSPNAME        TO   SKT2800-HOSPNAME
      *    電話番号
           MOVE     WRK-HOSPTEL              TO   SKT2800-TEL
      *
      *    医療機関名
           MOVE     WRK-HOSPNAME             TO   SKT2800-HOSPNAME
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *    開設者氏名
           MOVE     SYS-1001-KAISETUNAME     TO   SKT2800-KAISETUNAME
      *
      *    医療機関コード
           MOVE     SYS-1001-HOSPCD          TO   WRK-MAE-INPUT
           PERFORM  2009-HENKAN-SEC
           MOVE     WRK-OUT-INPUT            TO   SKT2800-HOSPCD
      *
      *    点数票区分
           EVALUATE    SYS-1001-TENHYOKBN
           WHEN   1
               MOVE    "◯"           TO     SKT2800-MARU1
           WHEN   3
               MOVE    "◯"           TO     SKT2800-MARU2
           WHEN   4
               MOVE    "◯"           TO     SKT2800-MARU3
           END-EVALUATE
      *
      *    診療科名
           MOVE    WRK-SRYKANAME(1)   TO     SKT2800-SRYKAMEI(1)
           MOVE    WRK-SRYKANAME(2)   TO     SKT2800-SRYKAMEI(2)
           MOVE    WRK-SRYKANAME(3)   TO     SKT2800-SRYKAMEI(3)
      *
      *    医療機関区分
           EVALUATE  HOSPKBN-CD
           WHEN "1"
             MOVE  "○"               TO     SKT2800-HOSPKBN(1)
           WHEN "2"
             MOVE  "○"               TO     SKT2800-HOSPKBN(2)
           WHEN "3"
             MOVE  "○"               TO     SKT2800-HOSPKBN(3)
           WHEN "4"
             MOVE  "○"               TO     SKT2800-HOSPKBN(4)
           WHEN "5"
             MOVE  "○"               TO     SKT2800-HOSPKBN(5)
           END-EVALUATE
           .
      *
       310-HEAD-HEN-EXT.
           EXIT.
      *****************************************************************
      *    集計データ移行                    
      *****************************************************************
       320-BODY-HEN-SEC                   SECTION.
      *
      *    県外保険者による２枚目か？
           IF     WRK-CNT      =     1
      *点数・件数データ移行
             PERFORM   VARYING   IDX2  FROM  1  BY  1
                       UNTIL     IDX2  >     5
               MOVE     SUM-TENSU(IDX2)    TO    WRK-Z9
               MOVE     WRK-Z9             TO    WRK-MAE-INPUT
               PERFORM  2009-HENKAN-SEC
               MOVE     WRK-OUT-INPUT      TO    SKT2800-TENSU(IDX2)
      *
               MOVE     SUM-KENSU(IDX2)    TO    WRK-Z6
               MOVE     WRK-Z6             TO    WRK-MAE-INPUT
               PERFORM  2009-HENKAN-SEC
               MOVE     WRK-OUT-INPUT          TO    SKT2800-KENSU(IDX2)
             END-PERFORM
      * 
      *請求書枚数データ移行
             PERFORM   VARYING   IDX3  FROM  1  BY  1
                       UNTIL     IDX3  >     3
      *---(01.00.06) LINE ADD START ------------------------------------
      *        レセ電はレセ電国保請求書の行数（２２）で割る
      *         MOVE     SUM-SEIKYUSYO(IDX3)  TO  WRK-Z3
               IF   SYS-2005-KKHRECEKBN  NOT =  ZERO
               AND  WRK-PARA-SYOKBN      NOT =  2
                   IF  IDX3  =  3
                       MOVE  WRK-MAISUKEI     TO  WRK-Z3
                   ELSE
      *---(01.00.07) LINE ADD START ------------------------------------
      *                 DIVIDE  SUM-SEIKYUSYO(IDX3)  BY  22
      *                        GIVING  WRK-MAISU  REMAINDER  WRK-AMARI
      *                 IF  WRK-AMARI  >  ZERO
      *                     ADD   1            TO  WRK-MAISU
      *                 END-IF
      *        １帳票で２頁ある（一般・老人）
      *                 COMPUTE  WRK-MAISU  =  WRK-MAISU  *  2
      *                 ADD   WRK-MAISU        TO  WRK-MAISUKEI
      *                 MOVE  WRK-MAISU        TO  WRK-Z3
                     IF  IDX3  =  1
                       DIVIDE  SUM-SEIKYUSYO(IDX3)  BY  22
                       GIVING  WRK-GMAISU  REMAINDER  WRK-AMARI
                       IF  WRK-AMARI  >  ZERO
                           ADD   1            TO  WRK-GMAISU
                       END-IF
                     ELSE
      *        県外データ
                       INITIALIZE                    WRK-GMAISU
                       PERFORM  VARYING  IDX4  FROM  1  BY  1
                                UNTIL    IDX4  >     47
                                OR   WRK-PREFKENSU(IDX4)  =  ZERO
                  DISPLAY  "PREFKENSU  :  "  WRK-PREFKENSU(IDX4)
                  DISPLAY  "PREFNUM  :  "  WRK-PREFNUM(IDX4)
                         DIVIDE  WRK-PREFKENSU(IDX4)  BY  22
                         GIVING  WRK-MAISU  REMAINDER  WRK-AMARI
                         IF  WRK-AMARI  >  ZERO
                             ADD   1          TO  WRK-MAISU
                         END-IF
                         ADD   WRK-MAISU      TO  WRK-GMAISU
                       END-PERFORM
                     END-IF
                     ADD   WRK-GMAISU         TO  WRK-MAISUKEI
                     MOVE  WRK-GMAISU         TO  WRK-Z3
      *---(01.00.07) LINE ADD END   ------------------------------------
                   END-IF
               ELSE
                   MOVE  SUM-SEIKYUSYO(IDX3)  TO  WRK-Z3
               END-IF
      *---(01.00.06) LINE ADD END   ------------------------------------
               MOVE     WRK-Z3               TO  WRK-MAE-INPUT
               PERFORM  2009-HENKAN-SEC
               MOVE     WRK-OUT-INPUT        TO  SKT2800-SEIKYUSYO(IDX3)
             END-PERFORM
      *
      *    社保福祉医療費請求件数データ移行
             MOVE      SUM-SYAHOSEIKYU    TO  WRK-Z3
             MOVE      WRK-Z3             TO  WRK-MAE-INPUT
             PERFORM   2009-HENKAN-SEC
             MOVE      WRK-OUT-INPUT      TO  SKT2800-SYAHOSEIKYU
      ***** 05/06/30 yamaguchi INS
             MOVE      SUM-SYAHOSEIKYU2   TO  WRK-Z3
             MOVE      WRK-Z3             TO  WRK-MAE-INPUT
             PERFORM   2009-HENKAN-SEC
             MOVE      WRK-OUT-INPUT      TO  SKT2800-SYAHOSEIKYU2
      *****
           END-IF
      *
      *    県外保険者名
           PERFORM  VARYING  IDX4   FROM  1  BY  1
                    UNTIL    IDX4   >     20
                    OR       WRK-CNT-HKNJANUM(WRK-CNT) =  SPACE
             DISPLAY "県外保険者="  WRK-CNT-HKNJANUM(WRK-CNT)
             DISPLAY "カウント="    WRK-CNT
             MOVE  WRK-CNT-HKNJANUM(WRK-CNT)  TO  WRK-HKNJANUM
             PERFORM  920-HKNJAINF-SET-SEC
             PERFORM  400-KENNAME-SEC
             MOVE     WRK-HKNJANAME    TO  SKT2800-KGIHKNJANAME(IDX4)
             ADD   1                   TO  WRK-CNT
           END-PERFORM
           .
      *
       320-BODY-HEN-EXT.
           EXIT.
      *****************************************************************
      *    帳票印刷処理
      *****************************************************************
       330-PRINT-OUT-SEC                   SECTION.
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
           MOVE   "SKT2800.red"        TO  SPRT-PRTID
           MOVE    "総括表"            TO  SPRT-TITLE
           MOVE    SKT2800             TO  SPRT-PRTDATA
           MOVE    LNK-PRTKANRI-TERMID TO  SPRT-TERMID
           MOVE    LNK-PRTKANRI-OPID   TO  SPRT-OPID
           MOVE    LNK-PRTKANRI-PRTNM  TO  SPRT-PRTNM
           CALL    "ORCSPRT"           USING
                                       ORCSPRTAREA
      *---(01.00.05) LINE ADD START ------------------------------------
                                       SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           IF      SPRT-RETURN         =   ZERO
               DISPLAY  "ORCSPRT call ok"
           ELSE
               DISPLAY  "ORCSPRT call ng"
               MOVE    "帳票ＤＢに更新できませんでした"
                                          TO  WRK-RECEERR
               PERFORM 500-ERR-HENSYU-SEC
           END-IF
           .
      *
       330-PRINT-OUT-EXT.
           EXIT.
      *****************************************************************
      *    県名設定処理
      *****************************************************************
       400-KENNAME-SEC                SECTION.
      *
           MOVE     SPACE         TO    WRK-HKNJANAME
                                        WRK-KENNAME
           EVALUATE  WRK-CNT-HKNJANUM(WRK-CNT)(1:2)
           WHEN  "01"  MOVE  "北海道"    TO  WRK-KENNAME
           WHEN  "02"  MOVE  "青森県"    TO  WRK-KENNAME
           WHEN  "03"  MOVE  "岩手県"    TO  WRK-KENNAME
           WHEN  "04"  MOVE  "宮城県"    TO  WRK-KENNAME
           WHEN  "05"  MOVE  "秋田県"    TO  WRK-KENNAME
           WHEN  "06"  MOVE  "山形県"    TO  WRK-KENNAME
           WHEN  "07"  MOVE  "福島県"    TO  WRK-KENNAME
           WHEN  "08"  MOVE  "茨城県"    TO  WRK-KENNAME
           WHEN  "09"  MOVE  "栃木県"    TO  WRK-KENNAME
           WHEN  "10"  MOVE  "群馬県"    TO  WRK-KENNAME
           WHEN  "11"  MOVE  "埼玉県"    TO  WRK-KENNAME
           WHEN  "12"  MOVE  "千葉県"    TO  WRK-KENNAME
           WHEN  "13"  MOVE  "東京都"    TO  WRK-KENNAME
           WHEN  "14"  MOVE  "神奈川県"  TO  WRK-KENNAME
           WHEN  "15"  MOVE  "新潟県"    TO  WRK-KENNAME
           WHEN  "16"  MOVE  "富山県"    TO  WRK-KENNAME
           WHEN  "17"  MOVE  "石川県"    TO  WRK-KENNAME
           WHEN  "18"  MOVE  "福井県"    TO  WRK-KENNAME
           WHEN  "19"  MOVE  "山梨県"    TO  WRK-KENNAME
           WHEN  "20"  MOVE  "長野県"    TO  WRK-KENNAME
           WHEN  "21"  MOVE  "岐阜県"    TO  WRK-KENNAME
           WHEN  "22"  MOVE  "静岡県"    TO  WRK-KENNAME
           WHEN  "23"  MOVE  "愛知県"    TO  WRK-KENNAME
           WHEN  "24"  MOVE  "三重県"    TO  WRK-KENNAME
           WHEN  "25"  MOVE  "滋賀県"    TO  WRK-KENNAME
           WHEN  "26"  MOVE  "京都府"    TO  WRK-KENNAME
           WHEN  "27"  MOVE  "大阪府"    TO  WRK-KENNAME
           WHEN  "29"  MOVE  "奈良県"    TO  WRK-KENNAME
           WHEN  "30"  MOVE  "和歌山県"  TO  WRK-KENNAME
           WHEN  "31"  MOVE  "鳥取県"    TO  WRK-KENNAME
           WHEN  "32"  MOVE  "島根県"    TO  WRK-KENNAME
           WHEN  "33"  MOVE  "岡山県"    TO  WRK-KENNAME
           WHEN  "34"  MOVE  "広島県"    TO  WRK-KENNAME
           WHEN  "35"  MOVE  "山口県"    TO  WRK-KENNAME
           WHEN  "36"  MOVE  "徳島県"    TO  WRK-KENNAME
           WHEN  "37"  MOVE  "香川県"    TO  WRK-KENNAME
           WHEN  "38"  MOVE  "愛媛県"    TO  WRK-KENNAME
           WHEN  "39"  MOVE  "高知県"    TO  WRK-KENNAME
           WHEN  "40"  MOVE  "福岡県"    TO  WRK-KENNAME
           WHEN  "41"  MOVE  "佐賀県"    TO  WRK-KENNAME
           WHEN  "42"  MOVE  "長崎県"    TO  WRK-KENNAME
           WHEN  "43"  MOVE  "熊本県"    TO  WRK-KENNAME
           WHEN  "44"  MOVE  "大分県"    TO  WRK-KENNAME
           WHEN  "45"  MOVE  "宮崎県"    TO  WRK-KENNAME
           WHEN  "46"  MOVE  "鹿児島県"  TO  WRK-KENNAME
           WHEN  "47"  MOVE  "沖縄県"    TO  WRK-KENNAME
           END-EVALUATE
      *
      *    国保組合は県名を印字しない
           IF     WRK-CNT-HKNJANUM(WRK-CNT)(3:1)  =  "3"
             MOVE  SPACE                 TO  WRK-KENNAME
           END-IF
      *
      *
           STRING  WRK-KENNAME       DELIMITED BY SPACE
                   HKNJA-HKNJANAME   DELIMITED BY SPACE
                   INTO              WRK-HKNJANAME
           END-STRING
           DISPLAY "保険者名=" WRK-HKNJANAME
      *
           .
       400-KENNAME-EXT.
           EXIT.
      *
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
      *---(01.00.05) LINE ADD START ------------------------------------
      *                  MOVE     PATH-TBL-SEIKYU-KEY
      *                                  TO     MCP-PATH
      *                  CALL     "MCPSUB"      USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
                   MOVE    "tbl_seikyu"    TO  MCP-TABLE
                   MOVE    "key"           TO  MCP-PATHNAME
                   CALL    "ORCDBMAIN"     USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
                        IF       MCP-RC =      ZERO
                                 PERFORM       900-UPD-FILE-READ-SEC
                        ELSE
                                 DISPLAY "UPD ERR KEY="  RECE10-KEY 
                                 MOVE    
                                "*** SOKATU0600 SEIKYU UPDATE ERROR ***"
                                           TO  WRK-RECEERR
                                 MOVE    RECE10-KEY     TO
                                         WRK-RECEERR(33:)
                                 PERFORM 500-ERR-HENSYU-SEC
                                 MOVE    1      TO      FLG-UPDFILE
                        END-IF
      *
              ELSE
                       DISPLAY "INV ERR KEY="  RECE10-KEY 
                       MOVE    "*** SOKATU0600 SEIKYU INVALID ***"
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
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE   SYS-1001-HOSPID       TO    RECE10-HOSPID.
           MOVE   SPA-HOSPNUM           TO    RECE10-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
           MOVE   LNK-PRTKANRI-SRYYM    TO    RECE10-SKYYM.
      *
           MOVE   SPACE                 TO    RECE10-XXSTHKNJANUM
           MOVE   "99999999"            TO    RECE10-XXEDHKNJANUM
      *
           MOVE   RECE10-REC            TO    MCPDATA-REC
           MOVE   "DBSELECT"            TO    MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      ***** 05/12/01 yamaguchi DEL
      **     MOVE   PATH-TBL-SEIKYU-KEY4  TO    MCP-PATH
      ***** 05/12/01 yamaguchi INS
      *     MOVE   WRK-PATH              TO    MCP-PATH
      *****
      *     CALL   "MCPSUB"              USING 
      *                                        MCPAREA
      *                                        MCPDATA-REC
           MOVE    "tbl_seikyu"        TO  MCP-TABLE
           MOVE    WRK-PATH            TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
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
      *---(01.00.05) LINE ADD START ------------------------------------
      ***** 05/12/01 yamaguchi DEL
      **     MOVE   PATH-TBL-SEIKYU-KEY4     TO    MCP-PATH
      ***** 05/12/01 yamaguchi INS
      *     MOVE   WRK-PATH                 TO    MCP-PATH
      *****
      *     MOVE   "DBFETCH"                TO    MCP-FUNC
      *     CALL   "MCPSUB"              USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_seikyu"            TO  MCP-TABLE
           MOVE    WRK-PATH                TO  MCP-PATHNAME
           MOVE    "DBFETCH"               TO  MCP-FUNC
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
           IF       MCP-RC  =     ZERO
                    MOVE    MCPDATA-REC   TO      RECE10-REC
      *        テスト患者のときは読み飛ばす
                    MOVE    SPACE               TO  PTINF-REC
                    INITIALIZE                      PTINF-REC
      *---(01.00.05) LINE ADD START ------------------------------------
      *              MOVE    RECE10-HOSPID       TO  PTINF-HOSPID
                    MOVE    SPA-HOSPNUM         TO  PTINF-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
                    MOVE    RECE10-PTID         TO  PTINF-PTID
                    MOVE    PTINF-REC           TO  MCPDATA-REC
                    PERFORM 800-PTINF-READ-SEC
                    IF      FLG-PTINF            =   ZERO
                      AND     PTINF-TSTPTNUMKBN  =   "1"
                         GO  TO  900-SEIKYU-READ-SEC
                    END-IF   
                    ADD     1             TO      CNT-RECE10   
           ELSE
                    MOVE    1             TO      FLG-END
           END-IF
           .
      *
       900-SEIKYU-READ-EXT.
           EXIT.
      *****************************************************************
      *    患者マスタ読込
      *****************************************************************
       800-PTINF-READ-SEC         SECTION.
      *
           MOVE    "DBSELECT"                 TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
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
      *---(01.00.05) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                  TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
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
           MOVE    "DBCLOSECURSOR"            TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
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
      *---(01.00.05) LINE ADD END   ------------------------------------
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
      *---(01.00.05) LINE ADD START ------------------------------------
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
      *---(01.00.05) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                    TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
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
           MOVE    "DBCLOSECURSOR"              TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
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
      *---(01.00.05) LINE ADD END   ------------------------------------
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
           MOVE    "DBSELECT"                 TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SEIKYU-KEY        TO  MCP-PATH
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
               MOVE    "DBFETCH"                  TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-SEIKYU-KEY        TO  MCP-PATH
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
           MOVE    "DBCLOSECURSOR"            TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SEIKYU-KEY        TO  MCP-PATH
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
      *   保険者情報セット
      *****************************************************************
       920-HKNJAINF-SET-SEC  SECTION.
      *
           INITIALIZE  HKNJAINF-REC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE  SYS-1001-HOSPID             TO  HKNJA-HOSPID
           MOVE  SPA-HOSPNUM                 TO  HKNJA-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
           MOVE  WRK-HKNJANUM                TO  HKNJA-HKNJANUM
           MOVE  HKNJAINF-REC                TO  MCPDATA-REC
           MOVE  "DBSELECT"                  TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-HKNJAINF-KEY       TO  MCP-PATH
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
             MOVE    "tbl_hknjainf"      TO  MCP-TABLE
             MOVE    "key"               TO  MCP-PATHNAME
      *---(01.00.05) LINE ADD END   ------------------------------------
             PERFORM  925-HKNJAINF-READ-SEC
           ELSE
             DISPLAY  "HKNJAINF SELECT ERR"
           END-IF
      *
           INITIALIZE  MCPAREA
           MOVE  "DBCLOSECURSOR"         TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-HKNJAINF-KEY   TO  MCP-PATH
      *     CALL  "MCPSUB"         USING
      *                            MCPAREA
      *                            MCPDATA-REC
           MOVE    "tbl_hknjainf"       TO  MCP-TABLE
           MOVE    "key"                TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
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
           MOVE  "DBFETCH"       TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
             MOVE  MCPDATA-REC  TO  HKNJAINF-REC
             MOVE  ZERO         TO  FLG-HKNJAINF
           ELSE
             INITIALIZE  HKNJAINF-REC
             MOVE  1            TO  FLG-HKNJAINF
           END-IF
      *
           .
       925-HKNJAINF-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    公費請求書マスタ読込  
      *****************************************************************
       900-KOHSKY-START-SEC            SECTION.
      *
           INITIALIZE                  RECE02-REC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    SYS-1001-HOSPID     TO  RECE02-HOSPID
           MOVE    SPA-HOSPNUM         TO  RECE02-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
           MOVE    LNK-PRTKANRI-SRYYM  TO  RECE02-SKYYM
           MOVE    RECE02-REC          TO  MCPDATA-REC
      *
           MOVE    "DBSELECT"                 TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-KOHSKY-KEY2       TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_kohsky"         TO  MCP-TABLE
           MOVE    "key2"               TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
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
      *    公費請求書マスタＲＥＡＤ 
      *****************************************************************
       900-KOHSKY-READ-SEC         SECTION.
      *
           MOVE    "DBFETCH"                  TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-KOHSKY-KEY2       TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_kohsky"         TO  MCP-TABLE
           MOVE    "key2"               TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    ZERO            TO  FLG-END
               MOVE    MCPDATA-REC     TO  RECE02-REC
      ***** 05/06/30 yamaguchi DEL
      *         IF  RECE02-KOHNUM (1)  =  "141" OR "241" OR "180"
      *                                OR "182" OR "185" OR "280" OR
      *             RECE02-KOHNUM (2)  =  "141" OR "241" OR "180"
      *                                OR "182" OR "185" OR "280" OR
      *             RECE02-KOHNUM (3)  =  "141" OR "241" OR "180"
      *                                OR "182" OR "185" OR "280" OR
      *             RECE02-KOHNUM (4)  =  "141" OR "241" OR "180"
      *                                OR "182" OR "185" OR "280"
      ***** 05/08/01 yamaguchi UPD
      ***** 05/06/30 yamaguchi INS
      *         IF  RECE02-KOHNUM (1)  =
      *                      "141" OR "180" OR "182" OR "185" OR "143"
      *                   OR "241" OR "280" OR "282" OR "285" OR "243"
      *                   OR "341" OR "127" OR
      *             RECE02-KOHNUM (2)  =
      *                      "141" OR "180" OR "182" OR "185" OR "143"
      *                   OR "241" OR "280" OR "282" OR "285" OR "243"
      *                   OR "341" OR "127" OR
      *             RECE02-KOHNUM (3)  =
      *                      "141" OR "180" OR "182" OR "185" OR "143"
      *                   OR "241" OR "280" OR "282" OR "285" OR "243"
      *                   OR "341" OR "127" OR
      *             RECE02-KOHNUM (4)  =
      *                      "141" OR "180" OR "182" OR "185" OR "143"
      *                   OR "241" OR "280" OR "282" OR "285" OR "243"
      *                   OR "341" OR "127"
               IF  RECE02-KOHNUM (1)  =
                            "141" OR "180" OR "182" OR "185" OR "143"
                         OR "241" OR "280" OR "282" OR "285" OR "243"
                         OR "341" OR "127" OR "227" OR
                   RECE02-KOHNUM (2)  =
                            "141" OR "180" OR "182" OR "185" OR "143"
                         OR "241" OR "280" OR "282" OR "285" OR "243"
                         OR "341" OR "127" OR "227" OR
                   RECE02-KOHNUM (3)  =
                            "141" OR "180" OR "182" OR "185" OR "143"
                         OR "241" OR "280" OR "282" OR "285" OR "243"
                         OR "341" OR "127" OR "227" OR
                   RECE02-KOHNUM (4)  =
                            "141" OR "180" OR "182" OR "185" OR "143"
                         OR "241" OR "280" OR "282" OR "285" OR "243"
                         OR "341" OR "127" OR "227"
      *****
      *        テスト患者のときは読み飛ばす
                   MOVE    SPACE               TO  PTINF-REC
                   INITIALIZE                      PTINF-REC
      *---(01.00.05) LINE ADD START ------------------------------------
      *             MOVE    RECE02-HOSPID       TO  PTINF-HOSPID
                   MOVE    SPA-HOSPNUM         TO  PTINF-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
                   MOVE    RECE02-PTID         TO  PTINF-PTID
                   MOVE    PTINF-REC           TO  MCPDATA-REC
                   PERFORM 800-PTINF-READ-SEC
                   IF      FLG-PTINF           =   ZERO
                   AND     PTINF-TSTPTNUMKBN   =   "1"
                       GO  TO  900-KOHSKY-READ-SEC
                   END-IF
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
      *    公費請求書マスタCLOSE
      *****************************************************************
       900-KOHSKY-CLOSE-SEC  SECTION.
      *
           MOVE    "DBCLOSECURSOR"         TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-KOHSKY-KEY2    TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
           MOVE    "tbl_kohsky"         TO  MCP-TABLE
           MOVE    "key2"               TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
           .
       900-KOHSKY-CLOSE-EXT.
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
      *
      *****************************************************************
      *    請求点数集計処理  05/06/30 yamaguchi INS
      *****************************************************************
       800-SEIKYU-SEC  SECTION.
      *
           PERFORM  VARYING  IDX  FROM  1  BY  1
                    UNTIL    IDX  >     4  OR
                    SYU-KOH-HKNNUM(IDX) =  SPACE
      *
             IF    SYU-KOH-HKNNUM(IDX)  NOT  =  "027"  AND
                   SYU-KOH-HKNNUM(IDX)(1:1)  =  "0"
               MOVE  SYU-TOTAL-HKNTEN      TO    WRK-KOHTENSU
             END-IF
           END-PERFORM
      *
           .
       800-SEIKYU-SEC-EXT.
           EXIT.
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *****************************************************************
      *  収納情報セット  05/06/30 yamaguchi INS
      *****************************************************************
      * 920-SYUNOU-SET-SEC  SECTION.
      *
      *       INITIALIZE  SYUNOU-REC
      *       MOVE  RECE02-HOSPID      TO  SYU-HOSPID
      *       MOVE  RECE02-NYUGAIKBN   TO  SYU-NYUGAIKBN
      *       MOVE  RECE02-PTID        TO  SYU-PTID
      *       MOVE  RECE02-SRYYM(1:6)  TO  SYU-SRYYMD(1:6)
      *       MOVE  "__"               TO  SYU-SRYYMD(7:2)
      *       MOVE  WRK-KOHNUM         TO  SYU-KOH-HKNNUM(1)
      *                                    SYU-KOH-HKNNUM(2)
      *                                    SYU-KOH-HKNNUM(3)
      *                                    SYU-KOH-HKNNUM(4)
      *       MOVE  SYUNOU-REC         TO  MCPDATA-REC
      *       MOVE  "DBSELECT"         TO  MCP-FUNC
      *       MOVE  WRK-PATH           TO  MCP-PATH
      *       CALL  "MCPSUB"           USING
      *                                MCPAREA
      *                                MCPDATA-REC
      *       IF  MCP-RC  =  ZERO
      *         MOVE  WRK-PATH         TO  MCP-PATH
      *         PERFORM  925-SYUNOU-READ-SEC
      *
      *         PERFORM  UNTIL  FLG-SYUNOU  =  1
      *           IF  SYU-DENPJTIKBN   NOT = "3"
      *             IF    SYU-HKNCOMBINUM  =  RECE02-HKNCOMBI(1) OR
      *                                       RECE02-HKNCOMBI(2) OR
      *                                       RECE02-HKNCOMBI(3) OR
      *                                       RECE02-HKNCOMBI(4) OR
      *                                       RECE02-HKNCOMBI(5) OR
      *                                       RECE02-HKNCOMBI(6) OR
      *                                       RECE02-HKNCOMBI(7) OR
      *                                       RECE02-HKNCOMBI(8) OR
      *                                       RECE02-HKNCOMBI(9) OR
      *                                       RECE02-HKNCOMBI(10) 
      *               PERFORM  910-HKNCOMBI-READ-SEC
      *               IF  COMB-KOHID(1)    =  WRK-KOHID   OR
      *                   COMB-KOHID(2)    =  WRK-KOHID   OR
      *                   COMB-KOHID(3)    =  WRK-KOHID   OR
      *                   COMB-KOHID(4)    =  WRK-KOHID
      *                 PERFORM  800-SEIKYU-SEC
      *               END-IF
      *             END-IF
      *           END-IF
      *
      *           MOVE  WRK-PATH            TO  MCP-PATH
      *           PERFORM   925-SYUNOU-READ-SEC
      *         END-PERFORM
      *       ELSE
      *         DISPLAY  "SYUNOU SELECT ERR"
      *       END-IF
      *
      *       INITIALIZE  MCPAREA
      *       MOVE  "DBCLOSECURSOR"      TO  MCP-FUNC
      *       MOVE  WRK-PATH             TO  MCP-PATH
      *       CALL  "MCPSUB"     USING
      *                          MCPAREA
      *                          MCPDATA-REC
      *
      *     .
      * 920-SYUNOU-SET-EXT.
      *     EXIT.
      *
      *****************************************************************
      *    収納読込  05/06/30 yamaguchi INS
      *****************************************************************
      * 925-SYUNOU-READ-SEC  SECTION.
      *
      *     MOVE  "DBFETCH"  TO  MCP-FUNC
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC
      *     IF  MCP-RC  =  ZERO
      *       MOVE  MCPDATA-REC  TO  SYUNOU-REC
      *       MOVE  ZERO         TO  FLG-SYUNOU
      *     ELSE
      *       INITIALIZE  SYUNOU-REC
      *       MOVE  1  TO  FLG-SYUNOU
      *     END-IF
      *
      *     .
      * 925-SYUNOU-READ-EXT.
      *     EXIT.
      *
      *****************************************************************
      *    保険組合せマスター読み込み  05/06/30 yamaguchi INS
      *****************************************************************
      * 910-HKNCOMBI-READ-SEC         SECTION.
      *
      *     INITIALIZE                      HKNCOMBI-REC
      *     MOVE    SYU-HOSPID              TO  COMB-HOSPID
      *     MOVE    SYU-PTID                TO  COMB-PTID
      *     MOVE    SYU-HKNCOMBINUM         TO  COMB-HKNCOMBINUM
      *     MOVE    HKNCOMBI-REC            TO  MCPDATA-REC
      *     MOVE    "DBSELECT"              TO  MCP-FUNC
      *     MOVE    PATH-TBL-HKNCOMBI-KEY   TO  MCP-PATH
      *     CALL    "MCPSUB"                    USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
      *     IF      MCP-RC              =   ZERO
      *         MOVE    "DBFETCH"               TO  MCP-FUNC
      *         MOVE    PATH-TBL-HKNCOMBI-KEY   TO  MCP-PATH
      *         CALL    "MCPSUB"                    USING
      *                                             MCPAREA
      *                                             MCPDATA-REC
      *         IF      MCP-RC              =   ZERO
      *             MOVE    MCPDATA-REC     TO  HKNCOMBI-REC
      *             MOVE    ZERO            TO  FLG-HKNCOMBI
      *         ELSE
      *             INITIALIZE                  HKNCOMBI-REC
      *             MOVE    1               TO  FLG-HKNCOMBI
      *         END-IF
      *     ELSE
      *         INITIALIZE                  HKNCOMBI-REC
      *         MOVE    1               TO  FLG-HKNCOMBI
      *     END-IF
      *
      *     MOVE    "DBCLOSECURSOR"         TO  MCP-FUNC
      *     MOVE    PATH-TBL-HKNCOMBI-KEY   TO  MCP-PATH
      *     CALL    "MCPSUB"                    USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
      *
      *     .
      * 910-HKNCOMBI-READ-EXT.
      *     EXIT.
      *---(01.00.05) LINE ADD END   ------------------------------------
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
      *---(01.00.05) LINE ADD END   ------------------------------------
      *****************************************************************
      *    ＤＢ  オープン処理
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
      *
           .
      *
       900-DBDISCONNECT-EXT.
           EXIT.
