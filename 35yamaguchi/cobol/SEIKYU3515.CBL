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
      * this license along with this program. If not, stop using this
      * program and contact JMA, 2-28-16 Honkomagome, Bunkyo-ku, Tokyo,
      * 113-8621, Japan.
      ********************************************************************
       IDENTIFICATION  DIVISION.
       PROGRAM-ID.     SEIKYU3515.
      *****************************************************************
      *  システム名        : ＯＲＣＡ
      *  サブシステム名    : 地方公費
      *  コンポーネント名  : 山口・福祉医療費請求書(一般)
      *                      (181,281,381,481,581,681,781)
      *  管理者            : 
      *  作成日付    作業者        記述
      *  05/07/13    山口          ORCAのバージョンアップ(2.5.0)による再作成
      *                            (個別発行対応含む)
      *****************************************************************
      *  プログラム修正履歴
      * Maj/Min/Rev	修正者	日付		内容
      *  01.00.00    内田    06/06/28    診療年月の修正
      *                                  月中の保険変更の修正
      *  01.00.01    内田    06/11/19    長期上位の追加
      *  01.00.02    内田    07/03/08    入院日は月跨ぎでも入院した日を印字
      *  01.00.03    内田    07/04/18    福祉医療費請求額の追加
      *  01.00.04    内田    07/05/01    福祉医療費請求額の修正
      *  01.00.05    内田    07/09/19    日レセver4.0対応
      *                                  システム管理マスタ「1901」の
      *                                  医療機関情報を参照
      *  01.00.06    内田    08/03/13    精神通院の場合、結精点数は印字しない
      *  01.00.07    内田    08/05/01    ３歳未満の判定を６歳へ
      *  01.00.08    内田    08/08/15    ６５歳以上を印字対象とする
      *  01.00.09    吉川    09/02/25    返戻及び月遅れの場合入院日が
      *                                  正しく取得されない不具合を修正
      *                                  SPA-AREA初期化
      *  01.00.10    内田    09/07/09    結精薬剤負担額欄へ一部負担金印字
      *                                  印字対象番号の追加(681)
      *  01.00.11    吉川    09/07/28    福祉医療費請求額欄は
      *                                  公費の助成分を印字する
      *  01.00.12    吉川    10/04/30    印字対象番号の追加(781)
      *  01.00.13    吉川    10/11/10    診療科は旧総合病院のみ印字
      *  01.00.14    吉川    12/06/21    患者負担がある公費で高額の場合
      *                                  一部負担金と福祉医療費請求額の計算を修正
      *  01.00.15    吉川    13/02/06    医療機関情報編集対応
      *  01.00.16    吉川    13/07/16    高額上限未満の福祉医療費請求額は
      *                                  円単位で記載するように修正
      *                                  保険番号781の福祉医療費請求額と
      *                                  一部負担金欄の計算修正
      *  01.00.17    吉川    14/07/07    自費のみの診療の場合、帳票に
      *                                  記載しないように修正
      *  01.00.18    吉川    14/10/27    ver4.8.0対応（一時ディレクトリ変更）
      *  01.00.19    吉川    15/10/08    食事項目は記載不要
      *                                  医療機関編集情報への開設者名
      *                                  追加対応
      *  01.00.19    萩野    17/02/15    対象公費はPGオプションから取得する
      *                                  医療機関コード変更時、
      *                                  医療機関コード別の作成処理対応
      *  01.00.20    萩野    18/04/09    SITEKBN変更（動作に変更なし）
      *****************************************************************
      *
       ENVIRONMENT   DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT  SECTION.
       FILE-CONTROL.
      *
      *    請求書用ファイル
           SELECT  MF101-FILE   ASSIGN    MF101PARA
                               ORGANIZATION    IS  INDEXED
                               ACCESS  MODE    IS  DYNAMIC
                               RECORD  KEY     IS  MF101-KEY
                               FILE    STATUS  IS  STS-MF101.
      *
006900*    エラーファイル
           SELECT  RECEERR-FILE ASSIGN  RECEERR
                                FILE    STATUS  IS  STS-RECEERR.
      *
       DATA  DIVISION.
       FILE  SECTION.
      *
      *
      *    集計ファイル
       FD  MF101-FILE.
       01  MF101-REC.
           COPY  "SEI3515.INC".
      *
006900*    エラーファイル
       FD  RECEERR-FILE.
       01  RECEERR-REC  PIC X(200).
      *
       WORKING-STORAGE  SECTION.
      *
      *
           COPY  "CPCOMMONDAT2.INC"
                   REPLACING  //RECE01//
                   BY         //MF101//.
      *
      *    エラーファイル 名称領域
      *---(01.00.05) LINE ADD START ------------------------------------
      *     COPY  "CPCOMMONDAT2.INC"
      *             REPLACING  //RECE01PARA//
      *             BY         //RECEERR//.
      *     03      PIC X(04)   VALUE   ".dat".
      *=== ver4.8対応 by Yoshikawa(2014/10/27) start
      *     COPY    "CPERRFL.INC"    REPLACING  //ERRFLPARA//
      *                              BY         //RECEERR//.
           COPY    "CPRECEERR.INC".
      *=== ver4.8対応 by Yoshikawa(2014/10/27) end
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
           COPY  "SC3515.INC".
      *
      *    スパ領域
       01  STS-AREA.
           03  STS-MF101   PIC X(02).
           03  STS-RECE02  PIC X(02).
           03  STS-RECEERR  PIC X(02).
      *
      *    フラグ領域
       01  FLG-AREA.
           03  FLG-PTINF      PIC 9(01).
           03  FLG-END        PIC 9(01).
           03  FLG-SYUNOU     PIC 9(01).
           03  FLG-MF101      PIC 9(01).
           03  FLG-TYOKI      PIC 9(01).
           03  FLG-PRINT      PIC 9(01).
           03  FLG-SYSKANRI   PIC 9(01).
           03  FLG-PTNYUINRRK PIC 9(01).
           03  FLG-HKNJAINF   PIC 9(01).
           03  FLG-HKNNUM     PIC 9(01).
           03  FLG-HKNCOMBI   PIC 9(01).
           03  FLG-ERR        PIC 9(01).
           03  FLG-BTPARA     PIC 9(01).
           03  FLG-SYORI      PIC 9(01).
      *=== 781の福祉請求額等の計算修正 by Yoshikawa(2013/07/16) start
           03  FLG-ETCKOH     PIC 9(01).
      *=== 781の福祉請求額等の計算修正 by Yoshikawa(2013/07/16) end
      *=== 対象公費をPGオプションから取得 by hagino(2017/02/15) start
           03  FLG-PRGOPTION  PIC 9(01).
           03  FLG-OK         PIC 9(01).
           03  FLG-TAISYO     PIC 9(01).
      *=== 対象公費をPGオプションから取得 by hagino(2017/02/15) end
      *
      *    添字領域
       01  IDX-AREA.
           03  IDX            PIC 9(04).
           03  IDXX           PIC 9(04).
           03  IDX1           PIC 9(04).
           03  IDX2           PIC 9(04).
           03  IDX3           PIC 9(04).
           03  IDY            PIC 9(04).
           03  IDZ            PIC 9(04).
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
           03  WRK-PARA-SYORIFLG   PIC X(01).
      *=== 医療機関コード変更時作成対応 by hagino(2017/02/15) start
           03  WRK-PARA-STSRYYM    PIC 9(06).
           03  WRK-PARA-EDSRYYM    PIC 9(06).
      *=== 医療機関コード変更時作成対応 by hagino(2017/02/15) end
      *
      *    一時領域
       01  WRK-AREA.
           03  WRK-RECEERR           PIC X(200).
           03  WRK-Z2                PIC Z(02).
           03  WRK-Z6                PIC Z(06).
           03  WRK-Z7                PIC Z(07).
      *=== 結精薬剤負担額欄へ一部負担金を印字 by Uchida(2009/07/09) start
           03  WRK-Z69               PIC ZZZZZ9.
      *=== 結精薬剤負担額欄へ一部負担金を印字 by Uchida(2009/07/09) end
      *=== 公費の助成分を印字 by Yoshikawa(2009/07/28) start
           03  WRK-Z79               PIC ZZZZZZ9.
      *=== 公費の助成分を印字 by Yoshikawa(2009/07/28) end
           03  WRK-SRYYMWH           PIC X(16).
           03  WRK-SEIYMDWH          PIC X(22).
           03  WRK-SEIYMDWH2         PIC X(09).
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
           03  WRK-KASAN-TBL.
               05   WRK-KOHNUM       PIC X(03).
               05   WRK-TENSU        PIC 9(08).
               05   WRK-KESETENSU    PIC 9(08).
               05   WRK-KESEYKZFTN   PIC 9(08).
           03  WRK-HKNJANUM          PIC X(05).
           03  WRK-HKNJANAME         PIC X(20).
           03  WRK-KOHID             PIC 9(10).
           03  WRK-KOBETUCITYNUM     PIC X(03).
      *---(01.00.03) LINE ADD START ------------------------------------
           03  WRK-SYUKEI-TBL.
               05  WRK-SEIKYUGK      PIC 9(07)V9(01).
               05  WRK-SEIKYUGK-G    PIC 9(07)V9(01).
               05  WRK-SEIKYUGK-G2   PIC 9(07).
      *---(01.00.03) LINE ADD END   ------------------------------------
      *=== 福祉医療費請求額は円単位 by Yoshikawa(2013/07/16) start
           03  WRK-KEISAN            PIC 9(07).
      *=== 福祉医療費請求額は円単位 by Yoshikawa(2013/07/16) end
      *
      *    文字変換
           03  WRK-MAE-INPUT         PIC X(200).
           03  WRK-OUT-INPUT         PIC X(200).
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
      *=== 医療機関編集情報へ開設者名追加 by Yoshikawa(2015/10/08) start
           03  WRK-KAISETUNAME       PIC X(80).
      *=== 医療機関編集情報へ開設者名追加 by Yoshikawa(2015/10/08) end
      *
      *=== 対象公費をPGオプションから取得 by hagino(2017/02/15) start
      *    プログラムオプション
           03  WRK-OPTION-TBL.
               05  WRK-OPTION        PIC X(100)  OCCURS 100.
           03  WRK-PRGID             PIC X(25).
           03  WRK-KBNCD             PIC X(16).
           03  WRK-CHK-KOHNUM-TBL.
               05  WRK-CHK-KOHNUM    PIC X(03)  OCCURS 4.
      *    対象公費
           03  WRK-TAISYO-KOHNUM     PIC X(03)  OCCURS 100.
      *=== 対象公費をPGオプションから取得 by hagino(2017/02/15) end
      *
      *
       01  KEY-AREA  VALUE  ZERO.
           03  KEY-NEW.
               05  KEY-N-FTNJANUM        PIC X(08).
           03  KEY-OLD.
               05  KEY-O-FTNJANUM        PIC X(08).
      *
      *    カウント領域
       01  CNT-AREA.
           03  CNT-RECE02  PIC 9(06).
           03  CNT-MF101   PIC 9(06).
           03  CNT-PAGE    PIC 9(03).
      *
       01  TABLE-AREA.
           03  TBL-PARA-OCC    OCCURS  100.
               05  TBL-PARA-HKNJANUM    PIC X(08).
               05  TBL-PARA-PTID        PIC 9(10).
      *
       01  WRK-CONS-PARA-MAX   PIC 9(03)   VALUE   100.
      *
      *    DB参照用
      *---(01.00.05) LINE ADD START ------------------------------------
      *     COPY    "ORCA-DBPATH".
           COPY    "COMMON-SPA".
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *---(01.00.07) LINE ADD START ------------------------------------
      *    固定項目
       01  WRK-CONS-AREA.
           03  WRK-CONS-SRYYM-200804   PIC X(06)   VALUE   "200804".
      *---(01.00.07) LINE ADD END   ------------------------------------
      *****************************************************************
      *    ファイルレイアウト　領域
      *****************************************************************
      *
      *    システム管理マスタ
           COPY  "CPSK1001.INC".
      *
      *    医療機関情報−所在地、連絡先
           COPY  "CPSK1002.INC".
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
      *=== 医療機関編集情報へ開設者名追加 by Yoshikawa(2015/10/08) start
      *    医療機関住所編集情報（２）
           COPY    "CPSK1903.INC".
      *=== 医療機関編集情報へ開設者名追加 by Yoshikawa(2015/10/08) end
      *
      *    ジョブ管理マスタ
       01  JOBKANRI-REC.
           COPY    "CPJOBKANRI.INC".
      *
      *    収納情報
       01  SYUNOU-REC.
           COPY  "CPSYUNOU.INC".
      *
      *    入院履歴情報
       01  PTNYUINRRK-REC.
           COPY    "CPPTNYUINRRK.INC".
      *
      *　　保険者情報
       01  HKNJAINF-REC.
           COPY    "CPHKNJAINF.INC".
      *
      *    保険番号
       01  HKNNUM-REC.
           COPY    "CPHKNNUM.INC".
      *
      *    患者情報
       01  PTINF-REC.
           COPY    "CPPTINF.INC".
      *
      *    公費請求書
           COPY    "CPKOHSKY.INC"
                   REPLACING  //KOHSKY//
                   BY         //RECE02//.
      *
      *    保険組合せ
       01  HKNCOMBI-REC.
           COPY    "CPHKNCOMBI.INC".
      *
      *    パラメタ
       01  BTPARA-REC.
           COPY    "CPBTPARA.INC".
      *
      *=== 対象公費をPGオプションから取得 by hagino(2017/02/15) start
      *    プログラムオプション
       01  PRGOPTION-REC.
           COPY    "CPPRGOPTION.INC".
      *=== 対象公費をPGオプションから取得 by hagino(2017/02/15) end
      *
      *****************************************************************
      *    サブプロ用　領域
      *****************************************************************
      *
      *    ジョブ管理ＤＢ制御サブ
           COPY    "CPORCSJOBKANRI.INC".
      *
      *    印刷ＤＢ制御サブ
           COPY    "CPORCSPRT.INC".
      *
      *    共通パラメタ
           COPY  "MCPAREA".
      *
      *   日付変換サブ
           COPY    "CPORCSDAY.INC".
           COPY    "CPORCSLNK.INC".      
      *
           COPY  "MCPDATA.INC".
      *
      *    半角チェックサブ
           COPY    "CPORCSKANACHK.INC".
      *
      *=== ver4.8対応 by Yoshikawa(2014/10/27) start
      *    一時ファイル名編集
           COPY    "CPORCSGETTEMP.INC".
      *=== ver4.8対応 by Yoshikawa(2014/10/27) end
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
      *    主　　処理
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
      *    初期　処理
      *****************************************************************
       100-INIT-SEC  SECTION.
      *
           INITIALIZE  FLG-AREA
           INITIALIZE  STS-AREA
           INITIALIZE  WRK-AREA
           INITIALIZE  CNT-AREA
      *=== SPA-AREA初期化 by Yoshikawa(2009/02/25) start
           INITIALIZE  SPA-AREA
      *=== SPA-AREA初期化 by Yoshikawa(2009/02/25) end
      *=== ver4.8対応 by Yoshikawa(2014/10/27) start
           INITIALIZE  RECEERR
      *=== ver4.8対応 by Yoshikawa(2014/10/27) end
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
      *---(01.00.05) LINE ADD START ------------------------------------
      *                                         WRK-PARA-HOSPID
                                               WRK-PARA-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
                                               WRK-PARA-SYORIFLG
      *=== 医療機関コード変更時作成対応 by hagino(2017/02/15) start
                                               WRK-PARA-STSRYYM
                                               WRK-PARA-EDSRYYM
      *=== 医療機関コード変更時作成対応 by hagino(2017/02/15) end
      *---(01.00.05) LINE ADD START ------------------------------------
                                               RECEERR
      *---(01.00.05) LINE ADD END   ------------------------------------
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
           MOVE    "SEIKYU3515"    TO  JOB-PGID
           MOVE    "福祉医療費請求書(一般)" 
                                   TO  JOB-SHELLMSG
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA
                                   JOBKANRI-REC
      *---(01.00.05) LINE ADD START ------------------------------------
                                   SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *    対象年月最終日取得
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
      *    半角で出力するため半角日付を取得する
                   MOVE    LNK-DAY2-EDTYMD1    TO  WRK-SEIYMDWH2
           END-IF
      *
      *
      *=== ver4.8対応 by Yoshikawa(2014/10/27) start
      *     MOVE  "MF101ZZ"        TO  MF101PARA-FILE-ID
      *     MOVE  LNK-PRTKANRI-TERMID(1:16)  TO  MF101PARA-TERMID
      **---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE  WRK-PARA-HOSPNUM           TO  MF101PARA-HOSPNUM
      **---(01.00.05) LINE ADD END   ------------------------------------
           INITIALIZE                     SGETTEMP-AREA
      *
           MOVE  WRK-PARA-HOSPNUM     TO  MF101PARA-HOSPNUM
           MOVE  "MF101ZZ"            TO  MF101PARA-FILE-ID
           MOVE  LNK-PRTKANRI-TERMID  TO  MF101PARA-TERMID
      *
           MOVE  MF101PARA-BASENAME   TO  SGETTEMP-BASENAMES (1)
           MOVE  RECEERR              TO  SGETTEMP-BASENAMES (2)
           CALL  "ORCSGETTEMP"        USING
                                      SGETTEMP-AREA
           MOVE  SGETTEMP-FULLNAMES (1)  TO  MF101PARA-FULLNAME
           MOVE  SGETTEMP-FULLNAMES (2)  TO  RECEERR
      *=== ver4.8対応 by Yoshikawa(2014/10/27) end
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE  "RECEERR"        TO  RECEERR-FILE-ID
      *     MOVE  LNK-PRTKANRI-TERMID(1:16)
      *                            TO  RECEERR-TERMID
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *    医療機関ＩＤ編集
           INITIALIZE  SYS-1001-REC
           MOVE  "1001"        TO  SYS-1001-KANRICD
           MOVE  "*"           TO  SYS-1001-KBNCD
      *=== 医療機関コード変更時作成対応 by hagino(2017/02/15) start
      *     MOVE  LNK-PRTKANRI-SRYYM(1:6)
      *                         TO  SYS-1001-STYUKYMD(1:6)
      *                             SYS-1001-EDYUKYMD(1:6)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1001-STYUKYMD(1:6)
                                               SYS-1001-EDYUKYMD(1:6)
           ELSE
               MOVE    WRK-PARA-EDSRYYM    TO  SYS-1001-STYUKYMD(1:6)
                                               SYS-1001-EDYUKYMD(1:6)
           END-IF
      *=== 医療機関コード変更時作成対応 by hagino(2017/02/15) end
           MOVE  "01"          TO  SYS-1001-STYUKYMD(7:2)
                                   SYS-1001-EDYUKYMD(7:2)
      *---(01.00.05) LINE ADD START ------------------------------------
           MOVE  SPA-HOSPNUM   TO  SYS-1001-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
           MOVE  SYS-1001-REC  TO  MCPDATA-REC
           PERFORM 800-SYSKANRI-READ-SEC
           IF  FLG-SYSKANRI  =  ZERO
             MOVE  MCPDATA-REC  TO  SYS-1001-REC
           ELSE
             DISPLAY "*** SEIKYU3515 SYS 1001 ERR ***"
             MOVE  1            TO  FLG-END
           END-IF
      *
      *    医療機関情報−所在地、連絡先
           INITIALIZE  SYS-1002-REC
           MOVE  "1002"        TO  SYS-1002-KANRICD
           MOVE  "*"           TO  SYS-1002-KBNCD
      *=== 医療機関コード変更時作成対応 by hagino(2017/02/15) start
      *     MOVE  LNK-PRTKANRI-SRYYM(1:6)
      *                         TO  SYS-1002-STYUKYMD(1:6)
      *                             SYS-1002-EDYUKYMD(1:6)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1002-STYUKYMD(1:6)
                                               SYS-1002-EDYUKYMD(1:6)
           ELSE
               MOVE    WRK-PARA-EDSRYYM    TO  SYS-1002-STYUKYMD(1:6)
                                               SYS-1002-EDYUKYMD(1:6)
           END-IF
      *=== 医療機関コード変更時作成対応 by hagino(2017/02/15) end
           MOVE  "01"          TO  SYS-1002-STYUKYMD(7:2)
                                   SYS-1002-EDYUKYMD(7:2)
      *---(01.00.05) LINE ADD START ------------------------------------
           MOVE  SPA-HOSPNUM   TO  SYS-1002-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
           MOVE  SYS-1002-REC  TO  MCPDATA-REC
           PERFORM 800-SYSKANRI-READ-SEC
           IF  FLG-SYSKANRI  =  ZERO
             MOVE  MCPDATA-REC  TO  SYS-1002-REC
           ELSE
             DISPLAY "*** SEIKYU3515 SYS 1002 ERR ***"
             MOVE  1            TO  FLG-END
           END-IF
      *
      *---(01.00.05) LINE ADD START ------------------------------------
           MOVE    SYS-1001-HOSPNAME   TO  WRK-HOSPNAME
      *=== 医療機関編集情報へ開設者名追加 by Yoshikawa(2015/10/08) start
           MOVE    SYS-1001-KAISETUNAME
                                       TO  WRK-KAISETUNAME
      *=== 医療機関編集情報へ開設者名追加 by Yoshikawa(2015/10/08) end
           MOVE    SYS-1002-ADRS       TO  WRK-HOSPADRS
           MOVE    SYS-1002-TEL        TO  WRK-HOSPTEL
      *    医療機関編集情報
           PERFORM 900-1900-READ-SEC
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *=== 対象公費をPGオプションから取得 by hagino(2017/02/15) start
      *    プログラムオプション取込み
           PERFORM 100-OPTION-SELECT-SEC
      *=== 対象公費をPGオプションから取得 by hagino(2017/02/15) end
      *
      *    パラメタ編集処理
           PERFORM 1001-PARA-HENSYU-SEC
      *
           PERFORM 900-KOHSKY-START-SEC
           .
       100-INIT-EXT.
           EXIT.
      *
      *=== 対象公費をPGオプションから取得 by hagino(2017/02/15) start
      *****************************************************************
      *    プログラムオプション取込み処理
      *****************************************************************
       100-OPTION-SELECT-SEC             SECTION.
      *
           MOVE    "SEIKYU3515"              TO  WRK-PRGID
      *
      *    プログラムオプション取得
      *    対象公費番号
           MOVE    "TAISYOKOHI"              TO  WRK-KBNCD
           PERFORM 1001-OPTION-SET-SEC
           PERFORM  VARYING  IDX  FROM  1  BY  1
                    UNTIL    IDX  >  100
                    OR       WRK-OPTION(IDX)  =  SPACE
             MOVE    WRK-OPTION(IDX)(1:3)    TO  WRK-TAISYO-KOHNUM(IDX)
             DISPLAY "対象公費番号="  WRK-TAISYO-KOHNUM(IDX)
           END-PERFORM
      *    
           .
       100-OPTION-SELECT-EXT.
           EXIT.
      *****************************************************************
      *    プログラムオプションパラメタセット処理
      *****************************************************************
       1001-OPTION-SET-SEC              SECTION.
      *
           INITIALIZE                            WRK-OPTION-TBL
                                                 FLG-OK
      *    プログラムオプション情報読込
           PERFORM  900-PRGOPTION-READ-SEC
      *
      *    オプション数の初期設定
           MOVE    1                         TO  IDX1
           IF  FLG-PRGOPTION  =  ZERO
             PERFORM  VARYING  IDX  FROM  1  BY  1
                      UNTIL   (IDX     >   44000 )
                         OR   (IDX1    >  100)
                         OR   (FLG-OK  NOT =   ZERO)
      *
      *        オプションの1桁目が空白であれば処理終了
               IF   PRGOPTION-OPTION(IDX:1)  =  SPACE
               AND  IDY                      =  ZERO
                   MOVE    1                 TO  FLG-OK
               END-IF
      *
               IF  FLG-OK  =  ZERO
      *          改行地点か
                 IF  PRGOPTION-OPTION(IDX:1)  =   X"0A"
                 OR  IDY  >=  100
                   ADD    1                  TO  IDX1
                   MOVE    ZERO              TO  IDY
                 ELSE
                   ADD    1                  TO  IDY
      *            PGオプション内容を１文字ずつセット
                   MOVE    PRGOPTION-OPTION(IDX:1)
                                         TO  WRK-OPTION(IDX1)(IDY:1)
                 END-IF
               END-IF
             END-PERFORM
           END-IF
      *
           .
       1001-OPTION-SET-EXT.
           EXIT.
      *=== 対象公費をPGオプションから取得 by hagino(2017/02/15) end
      *
      *****************************************************************
      *    パラメタ編集処理
      *****************************************************************
       1001-PARA-HENSYU-SEC        SECTION.
      *
           MOVE    ZERO                    TO  IDXX
                                           FLG-SYORI
           INITIALIZE                      TABLE-AREA
      *
           IF      WRK-PARA-SYORIFLG   =   "1" 
               INITIALIZE                      BTPARA-REC
      *---(01.00.05) LINE ADD START ------------------------------------
               MOVE    SPA-HOSPNUM         TO  BTPARA-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
               MOVE    WRK-PARA-SHELLID    TO  BTPARA-SHELLID
               MOVE    WRK-PARA-JOBID      TO  BTPARA-JOBID
               MOVE    BTPARA-REC          TO  MCPDATA-REC
      *---(01.00.05) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-BTPARA-KEY5
      *                                     TO  MCP-PATH
      *         MOVE    "DBSELECT"          TO  MCP-FUNC
      *         CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
               MOVE    "DBSELECT"          TO  MCP-FUNC
               MOVE    "tbl_btpara"        TO  MCP-TABLE
               MOVE    "key5"              TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"         USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
               IF      MCP-RC              =   ZERO
      *---(01.00.05) LINE ADD START ------------------------------------
      *             MOVE    PATH-TBL-BTPARA-KEY5    TO  MCP-PATH
                   MOVE    "tbl_btpara"    TO  MCP-TABLE
                   MOVE    "key5"          TO  MCP-PATHNAME
      *---(01.00.05) LINE ADD END   ------------------------------------
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
                   DISPLAY "パラメタ区分=" BTPARA-INFO-KBN
                           "パラメタ=" BTPARA-INFO-PARA
                           "保険者番号="   TBL-PARA-HKNJANUM(IDXX)
                           "患者番号="     TBL-PARA-PTID(IDXX)
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *             MOVE    PATH-TBL-BTPARA-KEY5    TO  MCP-PATH
                   MOVE    "tbl_btpara"    TO  MCP-TABLE
                   MOVE    "key5"          TO  MCP-PATHNAME
      *---(01.00.05) LINE ADD END   ------------------------------------
                   PERFORM 900-BTPARA-READ-N-SEC
               END-PERFORM
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-BTPARA-KEY5
      *                                     TO  MCP-PATH
               MOVE    "tbl_btpara"        TO  MCP-TABLE
               MOVE    "key5"              TO  MCP-PATHNAME
      *---(01.00.05) LINE ADD END   ------------------------------------
               MOVE    "DBCLOSECURSOR"     TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *         CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
               CALL    "ORCDBMAIN"         USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
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
      *    主　　処理
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
                    PERFORM   2002-PRINT-SEC
           END-IF
           MOVE   1   TO   FLG-END
      *
           .
       200-MAIN-EXT.
           EXIT.
      *
      *****************************************************************
      *    集計処理
      *****************************************************************
       2001-SYUKEI-SEC  SECTION.
      *
           PERFORM  VARYING  IDZ  FROM  1  BY  1
                    UNTIL    IDZ  >     4
      *=== 対象公費をPGオプションから取得 by hagino(2017/02/15) start
      *       IF  RECE02-KOHNUM (IDZ) = "181" OR "281" OR "381" OR
      *                                 "481" OR "581"
      *=== 印字対象番号の追加 by Uchida(2009/07/09) start
      *                              OR "681"
      *=== 印字対象番号の追加 by Uchida(2009/07/09) end
      *=== 印字対象番号の追加 by Yoshikawa(2010/04/30) start
      *                              OR "781"
      *=== 印字対象番号の追加 by Yoshikawa(2010/04/30) end
             INITIALIZE                            WRK-CHK-KOHNUM-TBL
             MOVE    RECE02-KOHNUM (IDZ)       TO  WRK-CHK-KOHNUM(1)
      *      対象公費番号チェック処理
             PERFORM  800-TAISYOKOHI-CHK-SEC
             IF  FLG-TAISYO  =  1
      *=== 対象公費をPGオプションから取得 by hagino(2017/02/15) end
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
      *    集計処理２
      *****************************************************************
       20011-SYUKEI-SEC  SECTION.
      *
           INITIALIZE       MF101-REC
           INITIALIZE       WRK-KASAN-TBL
      *
           MOVE    RECE02-RECEKA             TO  MF101-SRYKA
           MOVE    RECE02-PTNUM              TO  MF101-PTNUM
           MOVE    RECE02-NAME               TO  MF101-NAME
           MOVE    RECE02-SEX                TO  MF101-SEX
           MOVE    RECE02-HKNJANUM           TO  MF101-HKNJANUM
           MOVE    RECE02-HKNNUM             TO  MF101-HKNNUM
           MOVE    RECE02-KIGO(1:6)          TO  MF101-KIGO
           MOVE    RECE02-NUM(1:10)          TO  MF101-NUM
           MOVE    RECE02-SRYYM              TO  MF101-SRYYM
           MOVE    RECE02-KOHFTNJANUM(IDZ)   TO  MF101-FTNJANUM
           MOVE    RECE02-KOHJKYSNUM(IDZ)    TO  MF101-JKYSNUM
           MOVE    RECE02-KOHNUM(IDZ)        TO  WRK-KOHNUM
           MOVE    RECE02-KOHID(IDZ)         TO  WRK-KOHID
           COMPUTE IDY     =         IDZ     +   1
           MOVE    RECE02-SHOKUJINISSU(IDY)  TO  MF101-SHOKUJINISSU
           MOVE    RECE02-JNISSU(IDY)        TO  MF101-NISSU
      *---(01.00.03) LINE ADD START ------------------------------------
      *     MOVE    RECE02-YKZFTN(1)          TO  MF101-YKZFTN
      *---(01.00.03) LINE ADD END   ------------------------------------
           MOVE    RECE02-SHOKUJIRYOYOHI(1)  TO  MF101-SHOKUJIRYOYOHI
           MOVE    RECE02-SHOKUJIFTN(1)      TO  MF101-SHOKUJIFTN
           MOVE    RECE02-TOTALTEN(IDY)      TO  MF101-TENSU
      *
      *    個別発行用市町村番号
           MOVE  RECE02-KOHFTNJANUM(IDZ)(5:3)   TO  WRK-KOBETUCITYNUM
      *
      *    結核・精神点数等集計
           MOVE    ZERO     TO        FLG-TYOKI
      *=== 781の福祉請求額等の計算修正 by Yoshikawa(2013/07/16) start
                                      FLG-ETCKOH
      *=== 781の福祉請求額等の計算修正 by Yoshikawa(2013/07/16) end
      *---(01.00.03) LINE ADD START ------------------------------------
           INITIALIZE                              WRK-SYUKEI-TBL
      *---(01.00.03) LINE ADD END   ------------------------------------
           IF      RECE02-NYUGAIKBN    =   "1"
      *---(01.00.05) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-SYUNOU-KEY33   TO  WRK-PATH
               MOVE    "key33"        TO  WRK-PATH
      *---(01.00.05) LINE ADD END   ------------------------------------
           ELSE
      *---(01.00.05) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-SYUNOU-KEY25   TO  WRK-PATH
               MOVE    "key25"        TO  WRK-PATH
      *---(01.00.05) LINE ADD END   ------------------------------------
           END-IF
           PERFORM  920-SYUNOU-SET-SEC
      *    
           IF    FLG-TYOKI          =     1
             MOVE    10000          TO    WRK-TENSU
             MOVE    "5"            TO    MF101-TYOKI
           END-IF
      *---(01.00.01) LINE ADD START ------------------------------------
           IF    FLG-TYOKI          =     2
             MOVE    20000          TO    WRK-TENSU
             MOVE    "2"            TO    MF101-TYOKI
           END-IF
      *---(01.00.01) LINE ADD END   ------------------------------------
      *
           ADD    WRK-KESETENSU  TO     MF101-KESETENSU
           ADD    WRK-KESEYKZFTN TO     MF101-KESEYKZFTN
      *
      *---(01.00.03) LINE ADD START ------------------------------------
      *    長期チェック
           IF     FLG-TYOKI             =      1   AND
                  WRK-SEIKYUGK-G        >  10000
             MOVE    10000             TO  WRK-SEIKYUGK-G
           END-IF
      *
      *    長期上位チェック
           IF     FLG-TYOKI             =      2   AND
                  WRK-SEIKYUGK-G        >  20000
             MOVE    20000             TO  WRK-SEIKYUGK-G
           END-IF
      *
      *    保険限度額判定
           IF  RECE02-FTNMONEY(1)       <  WRK-SEIKYUGK-G  AND
               RECE02-FTNMONEY(1)       >  ZERO
      *=== 福祉医療費請求額は円単位 by Yoshikawa(2013/07/16) start
      *       MOVE  RECE02-FTNMONEY(1)  TO  WRK-SEIKYUGK-G
             COMPUTE  WRK-KEISAN  =
                      WRK-SEIKYUGK-G  -  RECE02-FTNMONEY(1)
             IF  (WRK-KEISAN  <  10)
             AND (RECE02-FLG(2)  =  1)
               CONTINUE
             ELSE
               MOVE  RECE02-FTNMONEY(1)  TO  WRK-SEIKYUGK-G
             END-IF
      *=== 福祉医療費請求額は円単位 by Yoshikawa(2013/07/16) end
           END-IF
      *
      *    福祉医療費請求額を計算
           COMPUTE  WRK-SEIKYUGK-G2  ROUNDED  =  WRK-SEIKYUGK-G
      *
      *    欄がないので薬剤一部負担金欄へ印字
      *=== 公費の助成分を印字 by Yoshikawa(2009/07/28) start
      *     MOVE  WRK-SEIKYUGK-G2       TO  MF101-YKZFTN
           COMPUTE  MF101-YKZFTN  =  WRK-SEIKYUGK-G2  -
                                     WRK-KESEYKZFTN
      *=== 公費の助成分を印字 by Yoshikawa(2009/07/28) end
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
      *=== 患者負担がある公費の計算修正 by Yoshikawa(2012/06/21) start
      *    患者負担がある公費で高額の場合、計算されてきた高額療養費で
      *    それぞれ福祉医療費請求額と一部負担金を算出する
           IF  (RECE02-ZAITAKU  NOT =  SPACE AND "1")
           AND (RECE02-FTNMONEY(IDY)  NOT =  ZERO)
             COMPUTE  MF101-YKZFTN  ROUNDED =  WRK-SEIKYUGK-G2  /  
                                               (RECE02-KYURATE / 10)
             COMPUTE  MF101-KESEYKZFTN  =  WRK-SEIKYUGK-G2  -
                                           MF101-YKZFTN
           END-IF
      *=== 患者負担がある公費の計算修正 by Yoshikawa(2012/06/21) end
      *
      *=== 781の福祉請求額等の計算修正 by Yoshikawa(2013/07/16) start
      *    三者併用又は高額療養費が発生する場合、公費負担、
      *    高額療養費を差し引いた後の自己負担分相当額の1/3を助成する
           IF  WRK-KOHNUM  =  "781"
             IF  (FLG-ETCKOH  =  1)
             OR  (FLG-TYOKI   NOT =  ZERO)
             OR  ((RECE02-ZAITAKU  NOT =  SPACE AND "1")
                  AND (RECE02-FTNMONEY(IDY)  NOT =  ZERO))
               COMPUTE  MF101-YKZFTN  ROUNDED =  WRK-SEIKYUGK-G2  /  3
               COMPUTE  MF101-KESEYKZFTN  =  WRK-SEIKYUGK-G2  -
                                             MF101-YKZFTN
             END-IF
           END-IF
      *=== 781の福祉請求額等の計算修正 by Yoshikawa(2013/07/16) end
      *
           PERFORM  950-HKNNUM-SET-SEC
      *
           IF    RECE02-NYUGAIKBN   =  "1"
             COMPUTE  MF101-JOSEIGK  =  MF101-JOSEIGK +
                 (HKN-HON-NYUSKJJYOGAK *    MF101-SHOKUJINISSU)
      *
      *    入院日設定
             PERFORM  930-PTNYUINRRK-SELECT-SEC
             PERFORM  930-PTNYUINRRK-CLOSE-SEC
      *
      *    入院日を和暦変換
      *---(01.00.02) LINE ADD START ------------------------------------
      *    月を跨いでいても月初めに編集しない
      *       IF    PTNYUINRRK-NYUINYMD(1:6) = LNK-PRTKANRI-SRYYM
               MOVE    PTNYUINRRK-NYUINYMD  TO  WRK-SYMD
               PERFORM 31012-SEIWA-HEN-SEC
      *       ELSE
      *         MOVE    LNK-PRTKANRI-SRYYM  TO  WRK-SYMD(1:6)
      *         MOVE    "01"                TO  WRK-SYMD(7:2)
      *         PERFORM  31012-SEIWA-HEN-SEC
      *       END-IF
      *---(01.00.02) LINE ADD START ------------------------------------
      *
             MOVE    "4"                  TO    MF101-NYUING
             MOVE    LNK-DAY2-EDTYMD1-Y   TO    MF101-NYUINY
             MOVE    LNK-DAY2-EDTYMD1-M   TO    MF101-NYUINM
             MOVE    LNK-DAY2-EDTYMD1-D   TO    MF101-NYUIND
             INSPECT MF101-NYUINGYMD      REPLACING  ALL " "  BY  "0"
           ELSE
             MOVE    SPACE              TO  MF101-NYUINGYMD
           END-IF
      *
           IF    RECE02-CONTKBN   =  "2"
             MOVE    "1"     TO    MF101-NINKEI
           END-IF
      *
      *    誕生日変換
           MOVE    RECE02-BIRTHDAY    TO    WRK-SYMD
           PERFORM 31012-SEIWA-HEN-SEC
           EVALUATE  LNK-DAY2-EDTYMD1-G
           WHEN "M"
             MOVE    "1"    TO    MF101-SEIG
           WHEN "T"
             MOVE    "2"    TO    MF101-SEIG
           WHEN "S"
             MOVE    "3"    TO    MF101-SEIG
           WHEN "H"
             MOVE    "4"    TO    MF101-SEIG
           END-EVALUATE
           MOVE    LNK-DAY2-EDTYMD1-Y   TO    MF101-SEIY
           MOVE    LNK-DAY2-EDTYMD1-M   TO    MF101-SEIM
           MOVE    LNK-DAY2-EDTYMD1-D   TO    MF101-SEID
           INSPECT MF101-SEIGYMD        REPLACING  ALL " "  BY  "0"
      *
      *   給付割合設定
           EVALUATE  RECE02-KYURATE
           WHEN 10
      *---(01.00.08) LINE ADD START ------------------------------------
      *       MOVE    "9"     TO    MF101-KYURATE
             IF   (RECE02-SRYYM  >=  WRK-CONS-SRYYM-200804)
             AND  (RECE02-FLG (2)   =  1)
                 MOVE    "8"     TO    MF101-KYURATE
             ELSE
                 MOVE    "9"     TO    MF101-KYURATE
             END-IF
      *---(01.00.08) LINE ADD END   ------------------------------------
           WHEN 20
             MOVE    "8"     TO    MF101-KYURATE
           WHEN 30
      *---(01.00.08) LINE ADD START ------------------------------------
      *       MOVE    SPACE   TO    MF101-KYURATE
             IF  RECE02-AGE  >=  65
               MOVE    "7"     TO    MF101-KYURATE
             ELSE
               MOVE    SPACE   TO    MF101-KYURATE
             END-IF
      *---(01.00.08) LINE ADD END   ------------------------------------
           WHEN  0
             MOVE    "0"     TO    MF101-KYURATE
           END-EVALUATE
      *
      *   入外区分
           IF    RECE02-NYUGAIKBN  =  "1"
      *---(01.00.07) LINE ADD START ------------------------------------
             IF  (RECE02-SRYYM  >=  WRK-CONS-SRYYM-200804)
             AND  (RECE02-FLG (1)   =  1)
                 MOVE    "3"    TO    MF101-NYUGAIKBN
             ELSE
      *---(01.00.07) LINE ADD END   ------------------------------------
               IF    RECE02-AGE    <   3
                 MOVE    "3"    TO    MF101-NYUGAIKBN
               ELSE
                 MOVE    "1"    TO    MF101-NYUGAIKBN
               END-IF
      *---(01.00.07) LINE ADD START ------------------------------------
             END-IF
      *---(01.00.07) LINE ADD END   ------------------------------------
           ELSE
      *---(01.00.07) LINE ADD START ------------------------------------
             IF  (RECE02-SRYYM  >=  WRK-CONS-SRYYM-200804)
             AND  (RECE02-FLG (1)   =  1)
                 MOVE    "4"    TO    MF101-NYUGAIKBN
             ELSE
      *---(01.00.07) LINE ADD END   ------------------------------------
               IF    RECE02-AGE    <   3
                 MOVE    "4"    TO    MF101-NYUGAIKBN
               ELSE
                 MOVE    "2"    TO    MF101-NYUGAIKBN
               END-IF
      *---(01.00.07) LINE ADD START ------------------------------------
             END-IF
      *---(01.00.07) LINE ADD END   ------------------------------------
           END-IF
      *---(01.00.08) LINE ADD START ------------------------------------
      *    前期高齢者対応（5,6が不要な為、全てレセプト種別とはできない）
           IF  RECE02-AGE  >=  70
               MOVE  RECE02-RECESYUBETU (4:1)  TO  MF101-NYUGAIKBN
           END-IF
      *---(01.00.08) LINE ADD END   ------------------------------------
      *
      *    保険者番号チェック処理
           MOVE    ZERO               TO   FLG-ERR
           PERFORM 200111-HKNJANUM-CHK-SEC
      *
      *=== 自費診療のみは記載対象外 by Yoshikawa(2014/07/07) start
           IF  MF101-TENSU  =  ZERO
               MOVE    1              TO  FLG-ERR
           END-IF
      *=== 自費診療のみは記載対象外 by Yoshikawa(2014/07/07) end
      *
           IF  FLG-ERR    =    ZERO
             WRITE    MF101-REC
             ADD  1   TO  CNT-MF101
           ELSE
               DISPLAY "対象外患者番号="  RECE02-PTNUM
           END-IF
      *
           .
       20011-SYUKEI-EXT.
           EXIT.
      *
      *****************************************************************
      *    個別発行時の保険者番号(市町村番号)チェック処理
      *****************************************************************
       200111-HKNJANUM-CHK-SEC                SECTION.
      *
           INITIALIZE      WRK-HKNJANUM
           MOVE    "35"                     TO  WRK-HKNJANUM(1:2)
           MOVE    WRK-KOBETUCITYNUM(1:3)   TO  WRK-HKNJANUM(3:3)
      *
           IF  WRK-PARA-SYORIFLG       =   "1"
               AND FLG-SYORI           =    1
               AND FLG-ERR             =   ZERO
      *
               DISPLAY "患者番号 = "  RECE02-PTNUM
               DISPLAY "チェック用保険者番号="  WRK-HKNJANUM
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
      *    帳票ファイル出力処理
      *****************************************************************
       2002-PRINT-SEC                SECTION.
      *
           OPEN     INPUT       MF101-FILE
      *
           MOVE     ZERO        TO       FLG-PRINT
      *
      *    一時ファイル読込
           PERFORM  900-TMP-READ-SEC
      *
           PERFORM  UNTIL     FLG-PRINT   =  1
      *
               MOVE    KEY-NEW       TO    KEY-OLD
      *    帳票編集<見出し>処理
               PERFORM  310-HEAD-HEN-SEC
      *    帳票編集<明細>処理
               PERFORM  320-BODY-HEN-SEC
      *    帳票印刷処理
               PERFORM  330-PRINT-OUT-SEC
           END-PERFORM
      *
           CLOSE    MF101-FILE
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
           INITIALIZE                             SC15
      *    印刷年月日
           MOVE     WRK-SEIYMDWH2(2:2)        TO   SC15-PRTYY
           MOVE     WRK-SEIYMDWH2(5:2)        TO   SC15-PRTMM
           MOVE     WRK-SEIYMDWH2(8:2)        TO   SC15-PRTDD
      *
      *    市町村名
           INITIALIZE                             WRK-HKNJANUM
           MOVE  MF101-FTNJANUM(3:5)         TO   WRK-HKNJANUM
           PERFORM  920-HKNJAINF-SET-SEC
           MOVE  WRK-HKNJANAME               TO   SC15-CITYNAME
      *
      *    負担者番号
           MOVE    MF101-FTNJANUM            TO   SC15-FTNJANUM
      *
      *    医療機関コード
           MOVE    SYS-1001-HOSPCD           TO   SC15-HOSPCD
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *    医療機関住所
      *     MOVE     SYS-1002-ADRS            TO   SC15-ADRS
      *
      *    医療機関名
      *     MOVE     SYS-1001-HOSPNAME        TO   SC15-HOSPNAME
      *    住所
           MOVE    WRK-HOSPADRS              TO   SC15-ADRS
      *=== 医療機関情報編集対応 by Yoshikawa(2013/02/06) start
           INSPECT SC15-ADRS                 REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集対応 by Yoshikawa(2013/02/06) end
      *
      *    医療機関名
           MOVE    WRK-HOSPNAME              TO   SC15-HOSPNAME
      *=== 医療機関情報編集対応 by Yoshikawa(2013/02/06) start
           INSPECT SC15-HOSPNAME             REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集対応 by Yoshikawa(2013/02/06) end
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *    開設者名
      *=== 医療機関編集情報へ開設者名追加 by Yoshikawa(2015/10/08) start
      *     MOVE     SYS-1001-KAISETUNAME     TO   SC15-KAISETU
           MOVE     WRK-KAISETUNAME          TO   SC15-KAISETU
      *=== 医療機関編集情報へ開設者名追加 by Yoshikawa(2015/10/08) end
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
      *
           PERFORM  VARYING  IDX1  FROM  1  BY  1
                    UNTIL    IDX1  >    3
                    OR    KEY-NEW    NOT  =   KEY-OLD
                    OR    FLG-PRINT       =   1
      *
      *    診療年月
      *    印字データの修正  ADD  UCHI
      *      MOVE    RECE02-SRYYM         TO  WRK-SYMD(1:6)
            MOVE    MF101-SRYYM          TO  WRK-SYMD(1:6)
            MOVE    "01"                 TO  WRK-SYMD(7:2)
            PERFORM 31012-SEIWA-HEN-SEC
            INSPECT LNK-DAY2-EDTYMD1
                    REPLACING  ALL " "  BY  "0"
            MOVE    LNK-DAY2-EDTYMD1(2:2)
                                         TO  SC15-SRYYM(IDX1)(1:2)
            MOVE    LNK-DAY2-EDTYMD1(5:2)
                                         TO  SC15-SRYYM(IDX1)(3:2)
      *
      *    入外区分
             MOVE    MF101-NYUGAIKBN     TO  SC15-NYUGAIKBN(IDX1)
      *
      *    記号・番号
             IF      MF101-JKYSNUM(8:1)  =   SPACE
                 MOVE    MF101-JKYSNUM(1:2)
                                         TO  SC15-KIGO(IDX1)(2:2)
                 MOVE    MF101-JKYSNUM(3:5)
                                         TO  SC15-BANGO(IDX1)
             ELSE
                 MOVE    MF101-JKYSNUM(1:3)
                                         TO  SC15-KIGO(IDX1)
                 MOVE    MF101-JKYSNUM(4:5)
                                         TO  SC15-BANGO(IDX1)
             END-IF
      *
      *    性別
             MOVE    MF101-SEX           TO  SC15-SEX(IDX1)
      *
      *    氏名
             MOVE    MF101-NAME          TO    SC15-NAME(IDX1)
      *
      *    生年月日
             MOVE    MF101-SEIGYMD       TO  SC15-TANJOGYMD(IDX1)
             DISPLAY "生年月日=" MF101-SEIGYMD
      *
      *    保険者番号
             EVALUATE  MF101-HKNNUM
                 WHEN    "001"
                     MOVE    MF101-HKNJANUM(1:4)
                                     TO  SC15-HKNJANUM(IDX1)(5:4)
                 WHEN    "060"
                     MOVE    MF101-HKNJANUM(1:6)
                                     TO  SC15-HKNJANUM(IDX1)(3:6)
                 WHEN    OTHER
                     MOVE    MF101-HKNJANUM
                                     TO  SC15-HKNJANUM(IDX1)
             END-EVALUATE
      *
      *    任意継続
             MOVE    MF101-NINKEI        TO  SC15-TAININ(IDX1)
      *
      *    給付割合
             MOVE    MF101-KYURATE       TO  SC15-KYURATE(IDX1)
      *
      *    特殊
             MOVE    MF101-TYOKI         TO  SC15-TYOKI(IDX1)
      *
      *    入院年月日
             MOVE    MF101-NYUINGYMD     TO  SC15-NYUINGYMD(IDX1)
      *
      *    診療科
      *=== 診療科は旧総合病院のみ印字 by Yoshikawa(2010/11/10) start
             IF  SYS-1001-HOSPSBT1  =  1
      *=== 診療科は旧総合病院のみ印字 by Yoshikawa(2010/11/10) end
               IF    MF101-SRYKA    =  "00"
                 MOVE    SPACE           TO  SC15-SRYKA(IDX1)
               ELSE
                 MOVE    MF101-SRYKA     TO  SC15-SRYKA(IDX1)
               END-IF
      *=== 診療科は旧総合病院のみ印字 by Yoshikawa(2010/11/10) start
             END-IF
      *=== 診療科は旧総合病院のみ印字 by Yoshikawa(2010/11/10) end
      *
      *    日数
             MOVE    MF101-NISSU         TO  WRK-Z2
             MOVE    WRK-Z2               TO  SC15-NISSU(IDX1)
      *
      *    福祉医療費請求点数
             MOVE    MF101-TENSU          TO  WRK-Z7
             MOVE    WRK-Z7               TO  SC15-TENSU(IDX1)
      *
      *    結核・精神点数
             MOVE    MF101-KESETENSU      TO  WRK-Z6
             MOVE    WRK-Z6               TO  SC15-KESETENSU(IDX1)
      *
      *=== 食事項目は記載不要 by Yoshikawa(2015/10/08) start
      **    食事日数
      *       MOVE    MF101-SHOKUJINISSU   TO  WRK-Z2
      *       MOVE    WRK-Z2               TO  SC15-SNISSU(IDX1)
      **
      **    食事療養費総費用額
      *       MOVE    MF101-SHOKUJIRYOYOHI TO  WRK-Z7
      *       MOVE    WRK-Z7               TO  SC15-SKINGK(IDX1)
      **
      **    食事療養標準負担額
      *       MOVE    MF101-SHOKUJIFTN     TO  WRK-Z6
      *       MOVE    WRK-Z6               TO  SC15-SFTNGK(IDX1)
      **
      **    福祉医療費食事助成額
      *       MOVE    MF101-JOSEIGK        TO  WRK-Z6
      *       MOVE    WRK-Z6               TO  SC15-JOSEIGK(IDX1)
      *=== 食事項目は記載不要 by Yoshikawa(2015/10/08) end
      *
      *=== 公費の助成分を印字 by Yoshikawa(2009/07/28) start
      **    薬剤一部負担金
      *       MOVE    MF101-YKZFTN         TO  WRK-Z7
      *       MOVE    WRK-Z7               TO  SC15-YKZFTN(IDX1)
      *    福祉医療費請求額
             MOVE    MF101-YKZFTN         TO  WRK-Z79
             MOVE    WRK-Z79              TO  SC15-YKZFTN(IDX1)
      *=== 公費の助成分を印字 by Yoshikawa(2009/07/28) end
      *
      *    結核精神薬剤負担額
      *=== 結精薬剤負担額欄へ一部負担金を印字 by Uchida(2009/07/09) start
      *       MOVE    MF101-KESEYKZFTN     TO  WRK-Z6
      *       MOVE    WRK-Z6               TO  SC15-KESEYKZFTN(IDX1)
             MOVE    MF101-KESEYKZFTN     TO  WRK-Z69
             MOVE    WRK-Z69              TO  SC15-KESEYKZFTN(IDX1)
      *=== 結精薬剤負担額欄へ一部負担金を印字 by Uchida(2009/07/09) end
      *
             PERFORM   900-TMP-READ-SEC
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
           ADD      1         TO        CNT-PAGE
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
           MOVE   "SC3515.red"         TO  SPRT-PRTID
           MOVE    "福祉医療費請求書(一般)"        TO  SPRT-TITLE
           MOVE    SC15             TO  SPRT-PRTDATA
           MOVE    LNK-PRTKANRI-TERMID TO  SPRT-TERMID
           MOVE    LNK-PRTKANRI-OPID   TO  SPRT-OPID
           MOVE    LNK-PRTKANRI-PRTNM  TO  SPRT-PRTNM
      *=== SITEKBN変更 by hagino(2018/04/09) start
           MOVE    "2"                 TO  SPRT-SITEKBN
      *=== SITEKBN変更 by hagino(2018/04/09) end
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
      *****************************************************************
      *    エラー出力処理
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
      *    請求点数集計処理
      *****************************************************************
       800-SEIKYU-SEC  SECTION.
      *
      *=== 福祉医療費請求額は円単位 by Yoshikawa(2013/07/16) start
      **---(01.00.03) LINE ADD START ------------------------------------
      *     IF       RECE02-RJNHKNNUM   =  SPACE
      *       IF     RECE02-FTNMONEY(1) >  ZERO
      *         MOVE   SYU-SYUCOMPFTN            TO  WRK-SEIKYUGK
      *       ELSE
      *         MOVE   SYU-SYUCOMPFTN-ENTANI     TO  WRK-SEIKYUGK
      *       END-IF
      *     ELSE
      *       IF     RECE02-FTNMONEY(1) >  ZERO
      *         MOVE   SYU-KOH-COMPFTN(1)        TO  WRK-SEIKYUGK
      *       ELSE
      *         MOVE   SYU-KOH-COMPFTN-ENTANI(1) TO  WRK-SEIKYUGK
      *       END-IF
      *     END-IF
      **---(01.00.03) LINE ADD END   ------------------------------------
           MOVE   SYU-SYUCOMPFTN-ENTANI          TO  WRK-SEIKYUGK
      *=== 福祉医療費請求額は円単位 by Yoshikawa(2013/07/16) end
      *
           PERFORM  VARYING  IDX  FROM  1  BY  1
                    UNTIL    IDX  >    4
             EVALUATE    SYU-KOH-HKNNUM(IDX)
             WHEN "010"
             WHEN "011"
             WHEN "020"
      *---(01.00.06) LINE ADD START ------------------------------------
      *       WHEN "021"
      *---(01.00.06) LINE ADD END   ------------------------------------
                 ADD    SYU-TOTAL-HKNTEN         TO    WRK-KESETENSU
                 ADD    SYU-KOH-COMPYKZFTN(IDX)  TO    WRK-KESEYKZFTN
      *---(01.00.04) LINE ADD START ------------------------------------
      *---(01.00.03) LINE ADD START ------------------------------------
      *           MOVE   SYU-KOH-COMPFTN-ENTANI(IDX)  TO  WRK-SEIKYUGK
      *       WHEN "015"
      *       WHEN "016"
      *           MOVE   SYU-KOH-COMPFTN-ENTANI(IDX)  TO  WRK-SEIKYUGK
      *---(01.00.03) LINE ADD END   ------------------------------------
      *---(01.00.04) LINE ADD END   ------------------------------------
             WHEN WRK-KOHNUM
                 IF    IDX      =    1
                   COMPUTE  WRK-TENSU  =  WRK-TENSU  +
                     (SYU-SYUCOMPFTN  -  SYU-KOH-COMPFTN(1))
                 ELSE
                   COMPUTE  WRK-TENSU  =  WRK-TENSU  +
                     (SYU-KOH-COMPFTN(IDX - 1) - SYU-KOH-COMPFTN(IDX))
                 END-IF
      *=== 結精薬剤負担額欄へ一部負担金を印字 by Uchida(2009/07/09) start
                 ADD  SYU-KOH-COMPFTN(IDX)  TO  WRK-KESEYKZFTN
      *=== 結精薬剤負担額欄へ一部負担金を印字 by Uchida(2009/07/09) end
             WHEN "972"
               MOVE    1     TO    FLG-TYOKI
      *---(01.00.01) LINE ADD START ------------------------------------
             WHEN "974"
               MOVE    2     TO    FLG-TYOKI
      *---(01.00.01) LINE ADD END   ------------------------------------
             END-EVALUATE
      *---(01.00.04) LINE ADD START ------------------------------------
      *    全国公費使用時
             IF   SYU-KOH-HKNNUM(IDX)(1:1)  =  "0"
             AND  SYU-KOH-HKNNUM(IDX)   NOT =  "027"
                 MOVE   SYU-KOH-COMPFTN-ENTANI(IDX)  TO  WRK-SEIKYUGK
      *=== 781の福祉請求額等の計算修正 by Yoshikawa(2013/07/16) start
                 MOVE   1                            TO  FLG-ETCKOH
      *=== 781の福祉請求額等の計算修正 by Yoshikawa(2013/07/16) end
             END-IF
      *---(01.00.04) LINE ADD END   ------------------------------------
           END-PERFORM
      *
      *---(01.00.03) LINE ADD START ------------------------------------
           ADD     WRK-SEIKYUGK            TO  WRK-SEIKYUGK-G
      *---(01.00.03) LINE ADD END   ------------------------------------
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
      *---(01.00.05) LINE ADD START ------------------------------------
      *       MOVE  RECE02-HOSPID      TO  SYU-HOSPID
             MOVE  SPA-HOSPNUM        TO  SYU-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
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
      *---(01.00.05) LINE ADD START ------------------------------------
      *       MOVE  WRK-PATH           TO  MCP-PATH
      *       CALL  "MCPSUB"           USING
      *                                MCPAREA
      *                                MCPDATA-REC
             MOVE  "tbl_syunou"       TO  MCP-TABLE
             MOVE  WRK-PATH           TO  MCP-PATHNAME
             CALL  "ORCDBMAIN"        USING
                                      MCPAREA
                                      MCPDATA-REC
                                      SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
             IF  MCP-RC  =  ZERO
      *---(01.00.05) LINE ADD START ------------------------------------
      *         MOVE  WRK-PATH         TO  MCP-PATH
               MOVE  "tbl_syunou"       TO  MCP-TABLE
               MOVE  WRK-PATH           TO  MCP-PATHNAME
      *---(01.00.05) LINE ADD END   ------------------------------------
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
      *---(01.00.05) LINE ADD START ------------------------------------
      *           MOVE  WRK-PATH          TO  MCP-PATH
                 MOVE  "tbl_syunou"       TO  MCP-TABLE
                 MOVE  WRK-PATH           TO  MCP-PATHNAME
      *---(01.00.05) LINE ADD END   ------------------------------------
                 PERFORM   925-SYUNOU-READ-SEC
               END-PERFORM
             ELSE
               DISPLAY  "SYUNOU SELECT ERR"
             END-IF
      *
             INITIALIZE  MCPAREA
             MOVE  "DBCLOSECURSOR"     TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *       MOVE  WRK-PATH            TO  MCP-PATH
      *       CALL  "MCPSUB"     USING
      *                          MCPAREA
      *                          MCPDATA-REC
             MOVE  "tbl_syunou"       TO  MCP-TABLE
             MOVE  WRK-PATH           TO  MCP-PATHNAME
             CALL  "ORCDBMAIN"        USING
                                      MCPAREA
                                      MCPDATA-REC
                                      SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
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
           MOVE  "DBFETCH"  TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC
           CALL  "ORCDBMAIN"        USING
                                    MCPAREA
                                    MCPDATA-REC
                                    SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
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
      *    終了　　処理
      *****************************************************************
       300-END-SEC   SECTION.
      *
      *
           CLOSE  MF101-FILE
           MOVE  CNT-PAGE  TO  WRK-PARA-PAGE
      *
           DISPLAY "*** SEIKYU3515 IN  "  CNT-RECE02
           DISPLAY "*** SEIKYU3515 OUT "  CNT-MF101 
           DISPLAY "*** SEIKYU3515 END ***"
      *
           IF  CNT-MF101  =  0
             DISPLAY "DATA NOT FOUND. PRINT JOB CANCEL!!"
           END-IF
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
      *
           PERFORM 900-DBDISCONNECT-SEC
           .
       300-END-EXT.
           EXIT.
      *
      *=== 対象公費をPGオプションから取得 by hagino(2017/02/15) start
      *****************************************************************
      *    対象公費番号チェック処理
      *****************************************************************
       800-TAISYOKOHI-CHK-SEC                SECTION.
      *
           INITIALIZE     FLG-TAISYO
      *
           PERFORM  VARYING  IDXX  FROM  1  BY  1
                    UNTIL    IDXX  >  100
                    OR       WRK-TAISYO-KOHNUM(IDXX)  =  SPACE
               IF  WRK-CHK-KOHNUM(1)  =  WRK-TAISYO-KOHNUM(IDXX)
               OR  WRK-CHK-KOHNUM(2)  =  WRK-TAISYO-KOHNUM(IDXX)
               OR  WRK-CHK-KOHNUM(3)  =  WRK-TAISYO-KOHNUM(IDXX)
               OR  WRK-CHK-KOHNUM(4)  =  WRK-TAISYO-KOHNUM(IDXX)
                   MOVE     1                 TO  FLG-TAISYO
                   MOVE     100               TO  IDXX
               END-IF
           END-PERFORM
      *
           .
       800-TAISYOKOHI-CHK-EXT.
           EXIT.
      *=== 対象公費をPGオプションから取得 by hagino(2017/02/15) end
      *
      *****************************************************************
      *    集計ファイル読込
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
      *    一時ファイル読込
      *****************************************************************
       900-TMP-READ-SEC                SECTION.
      *
           READ  MF101-FILE   NEXT
               AT  END
                   MOVE  1  TO  FLG-PRINT
               NOT  AT  END
                   MOVE    MF101-FTNJANUM     TO   KEY-N-FTNJANUM
           END-READ
           .
       900-TMP-READ-EXT.
           EXIT.
      *      
      *****************************************************************
      *    公費請求書マスタ読込
      *****************************************************************
       900-KOHSKY-START-SEC            SECTION.
      *
           INITIALIZE                  RECE02-REC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    WRK-PARA-HOSPID     TO  RECE02-HOSPID
           MOVE    SPA-HOSPNUM         TO  RECE02-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
           MOVE    LNK-PRTKANRI-SRYYM  TO  RECE02-SKYYM
           MOVE    RECE02-REC          TO  MCPDATA-REC
      *
           MOVE    "DBSELECT"            TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-KOHSKY-KEY2  TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_kohsky"        TO  MCP-TABLE
           MOVE    "key2"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               PERFORM 900-KOHSKY-READ-SEC
           ELSE
               MOVE    1                   TO  FLG-END
               PERFORM 900-KOHSKY-CLOSE-SEC
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
           MOVE    "DBFETCH"             TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-KOHSKY-KEY2  TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_kohsky"        TO  MCP-TABLE
           MOVE    "key2"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    ZERO            TO  FLG-END
               MOVE    MCPDATA-REC     TO  RECE02-REC
      *=== 印字対象番号の追加 by Uchida(2009/07/09) start
      *         IF  RECE02-KOHNUM (1)  =  "181" OR "281" OR "381"
      *                                OR "481" OR "581" OR
      *             RECE02-KOHNUM (2)  =  "181" OR "281" OR "381"
      *                                OR "481" OR "581" OR
      *             RECE02-KOHNUM (3)  =  "181" OR "281" OR "381"
      *                               OR "481" OR "581" OR
      *             RECE02-KOHNUM (4)  =  "181" OR "281" OR "381"
      *                                OR "481" OR "581"
      *=== 印字対象番号の追加 by Yoshikawa(2010/04/30) start
      *         IF  RECE02-KOHNUM (1)  =  "181" OR "281" OR "381"
      *                                OR "481" OR "581" OR "681"
      *         OR  RECE02-KOHNUM (2)  =  "181" OR "281" OR "381"
      *                                OR "481" OR "581" OR "681"
      *         OR  RECE02-KOHNUM (3)  =  "181" OR "281" OR "381"
      *                                OR "481" OR "581" OR "681"
      *         OR  RECE02-KOHNUM (4)  =  "181" OR "281" OR "381"
      *                                OR "481" OR "581" OR "681"
      *=== 対象公費をPGオプションから取得 by hagino(2017/02/15) start
      *         IF  RECE02-KOHNUM (1)  =  "181" OR "281" OR "381"
      *                                OR "481" OR "581" OR "681"
      *                                OR "781"
      *         OR  RECE02-KOHNUM (2)  =  "181" OR "281" OR "381"
      *                                OR "481" OR "581" OR "681"
      *                                OR "781"
      *         OR  RECE02-KOHNUM (3)  =  "181" OR "281" OR "381"
      *                                OR "481" OR "581" OR "681"
      *                                OR "781"
      *         OR  RECE02-KOHNUM (4)  =  "181" OR "281" OR "381"
      *                                OR "481" OR "581" OR "681"
      *                                OR "781"
               INITIALIZE                          WRK-CHK-KOHNUM-TBL
               MOVE    RECE02-KOHNUM(1)        TO  WRK-CHK-KOHNUM(1)
               MOVE    RECE02-KOHNUM(2)        TO  WRK-CHK-KOHNUM(2)
               MOVE    RECE02-KOHNUM(3)        TO  WRK-CHK-KOHNUM(3)
               MOVE    RECE02-KOHNUM(4)        TO  WRK-CHK-KOHNUM(4)
      *        対象公費番号チェック処理
               PERFORM  800-TAISYOKOHI-CHK-SEC
               IF  FLG-TAISYO  =  1
      *=== 対象公費をPGオプションから取得 by hagino(2017/02/15) end
      *=== 印字対象番号の追加 by Yoshikawa(2010/04/30) end
      *=== 印字対象番号の追加 by Uchida(2009/07/09) end
      *
      *=== 医療機関コード変更時作成対応 by hagino(2017/02/15) start
                   IF      WRK-PARA-STSRYYM    =   "999999"
                       CONTINUE
                   ELSE
                       IF  ( RECE02-SRYYM      <   WRK-PARA-STSRYYM )
                       OR  ( RECE02-SRYYM      >   WRK-PARA-EDSRYYM )
                           GO  TO  900-KOHSKY-READ-SEC
                       END-IF
                   END-IF
      *=== 医療機関コード変更時作成対応 by hagino(2017/02/15) end
      *
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
      *---(01.00.08) LINE ADD START ------------------------------------
      *    ６５歳以上は老人に分類するので対象外
      *             IF    RECE02-AGE    >= 65
      *               GO    TO    900-KOHSKY-READ-SEC
      *             END-IF
                   IF   (RECE02-SRYYM  <  WRK-CONS-SRYYM-200804)
                   AND  (RECE02-AGE    >= 65)
                     GO    TO    900-KOHSKY-READ-SEC
                   END-IF
      *---(01.00.08) LINE ADD END   ------------------------------------
      * 
      *        個別発行で患者番号指定の場合、対象判定を行う
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
               PERFORM 900-KOHSKY-CLOSE-SEC
           END-IF
           .
       900-KOHSKY-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    公費請求書マスタCLOSE
      *****************************************************************
       900-KOHSKY-CLOSE-SEC        SECTION.
      *
      *
           MOVE    "DBCLOSECURSOR"            TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-KOHSKY-KEY2       TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_kohsky"          TO  MCP-TABLE
           MOVE    "key2"                TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"           USING
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
               MOVE    "tbl_ptinf"         TO  MCP-TABLE
               MOVE    "key"               TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"         USING
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
           MOVE    "tbl_ptinf"            TO  MCP-TABLE
           MOVE    "key"                  TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"            USING
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
      *    保険組合せマスター読み込み
      *****************************************************************
       910-HKNCOMBI-READ-SEC         SECTION.
      *
           INITIALIZE                      HKNCOMBI-REC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    SYU-HOSPID          TO  COMB-HOSPID
           MOVE    SPA-HOSPNUM         TO  COMB-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
           MOVE    SYU-PTID            TO  COMB-PTID
           MOVE    SYU-HKNCOMBINUM     TO  COMB-HKNCOMBINUM
           MOVE    HKNCOMBI-REC           TO  MCPDATA-REC
           MOVE    "DBSELECT"             TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-HKNCOMBI-KEY  TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_hkncombi"          TO  MCP-TABLE
           MOVE    "key"                   TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"              TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-HKNCOMBI-KEY  TO  MCP-PATH
      *         CALL    "MCPSUB"             USING
      *                                      MCPAREA
      *                                      MCPDATA-REC
               MOVE    "tbl_hkncombi"      TO  MCP-TABLE
               MOVE    "key"               TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"         USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
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
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-HKNCOMBI-KEY      TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_hkncombi"        TO  MCP-TABLE
           MOVE    "key"                 TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"           USING
                                         MCPAREA
                                         MCPDATA-REC
                                         SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
           .
       910-HKNCOMBI-READ-EXT.
           EXIT.
      *****************************************************************
      *   保険者情報セット
      *****************************************************************
       920-HKNJAINF-SET-SEC  SECTION.
      *
           INITIALIZE  HKNJAINF-REC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE  SYS-1001-HOSPID      TO  HKNJA-HOSPID
           MOVE  SPA-HOSPNUM          TO  HKNJA-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
           MOVE  WRK-HKNJANUM         TO  HKNJA-HKNJANUM
           DISPLAY "負担者番号３="  HKNJA-HKNJANUM
           MOVE  HKNJAINF-REC            TO  MCPDATA-REC
           MOVE  "DBSELECT"              TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-HKNJAINF-KEY2  TO  MCP-PATH
      *     CALL  "MCPSUB"             USING
      *                                MCPAREA
      *                                MCPDATA-REC
           MOVE    "tbl_hknjainf"             TO  MCP-TABLE
           MOVE    "key2"                     TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"                USING
                                              MCPAREA
                                              MCPDATA-REC
                                              SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
             PERFORM  925-HKNJAINF-READ-SEC
             MOVE  HKNJA-HKNJANAME   TO  WRK-HKNJANAME
           ELSE
             DISPLAY  "HKNJAINF SELECT ERR"
           END-IF
      *
           INITIALIZE  MCPAREA
           MOVE  "DBCLOSECURSOR"         TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-HKNJAINF-KEY2  TO  MCP-PATH
      *     CALL  "MCPSUB"         USING
      *                            MCPAREA
      *                            MCPDATA-REC
           MOVE    "tbl_hknjainf"         TO  MCP-TABLE
           MOVE    "key2"                 TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"            USING
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
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-HKNJAINF-KEY2   TO  MCP-PATH
      *     MOVE  "DBFETCH"                TO  MCP-FUNC
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC
           MOVE  "DBFETCH"              TO  MCP-FUNC
           MOVE  "tbl_hknjainf"         TO  MCP-TABLE
           MOVE  "key2"                 TO  MCP-PATHNAME
           CALL  "ORCDBMAIN"            USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
             MOVE  MCPDATA-REC  TO  HKNJAINF-REC
             MOVE  ZERO         TO  FLG-HKNJAINF
           ELSE
             INITIALIZE         HKNJAINF-REC
             MOVE  1            TO  FLG-HKNJAINF
           END-IF
      *
           .
       925-HKNJAINF-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    入院履歴情報SELECT
      *****************************************************************
       930-PTNYUINRRK-SELECT-SEC         SECTION.
      *
           INITIALIZE                   PTNYUINRRK-REC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    RECE02-HOSPID        TO  PTNYUINRRK-HOSPID
           MOVE    SPA-HOSPNUM          TO  PTNYUINRRK-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
           MOVE    RECE02-PTID          TO  PTNYUINRRK-PTID
           MOVE    WRK-LASTYMD          TO  PTNYUINRRK-NYUINYMD
      *=== 月遅れでも入院日を正しく取得 by Yoshikawa(2009/02/25) start
      *     MOVE    LNK-PRTKANRI-SRYYM   TO  PTNYUINRRK-TAIINYMD(1:6)
           MOVE    RECE02-SRYYM         TO  PTNYUINRRK-TAIINYMD(1:6)
      *=== 月遅れでも入院日を正しく取得 by Yoshikawa(2009/02/25) end
           MOVE    "01"                 TO  PTNYUINRRK-TAIINYMD(7:2)
           MOVE    PTNYUINRRK-REC             TO  MCPDATA-REC
           MOVE    "DBSELECT"                 TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-PTNYUINRRK-KEY24  TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_ptnyuinrrk"        TO  MCP-TABLE
           MOVE    "key24"                 TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           IF      MCP-RC           =   ZERO
                   PERFORM 930-PTNYUINRRK-FETCH-SEC
           ELSE
                   MOVE   1               TO  FLG-PTNYUINRRK
           END-IF
           .
       930-PTNYUINRRK-SELECT-EXT.
           EXIT.
      *****************************************************************
      *    入院履歴情報１件読み込み
      *****************************************************************
       930-PTNYUINRRK-FETCH-SEC         SECTION.
      *
           MOVE    "DBFETCH"                  TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-PTNYUINRRK-KEY24  TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_ptnyuinrrk"        TO  MCP-TABLE
           MOVE    "key24"                 TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
                   MOVE    MCPDATA-REC     TO  PTNYUINRRK-REC
                   MOVE    ZERO            TO  FLG-PTNYUINRRK
           ELSE
                   MOVE    1               TO  FLG-PTNYUINRRK
           END-IF
           .
       930-PTNYUINRRK-FETCH-EXT.
           EXIT.
      *****************************************************************
      *    入院履歴情報クローズ
      *****************************************************************
       930-PTNYUINRRK-CLOSE-SEC         SECTION.
      *
           MOVE    "DBCLOSECURSOR"             TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-PTNYUINRRK-KEY24   TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_ptnyuinrrk"        TO  MCP-TABLE
           MOVE    "key24"                 TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           .
       930-PTNYUINRRK-CLOSE-EXT.
           EXIT.
      *****************************************************************
      *   保険番号情報セット
      *****************************************************************
       950-HKNNUM-SET-SEC  SECTION.
      *
           INITIALIZE  HKNNUM-REC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE  SYS-1001-HOSPID      TO  HKN-HOSPID
           MOVE  SPA-HOSPNUM          TO  HKN-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
           MOVE  WRK-KOHNUM           TO  HKN-HKNNUM
           MOVE  HKNNUM-REC            TO  MCPDATA-REC
           MOVE  "DBSELECT"            TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-HKNNUM-KEY2  TO  MCP-PATH
      *     CALL  "MCPSUB"             USING
      *                                MCPAREA
      *                                MCPDATA-REC
           MOVE    "tbl_hknnum"        TO  MCP-TABLE
           MOVE    "key2"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
      *---(01.00.05) LINE ADD START ------------------------------------
      *       MOVE  PATH-TBL-HKNNUM-KEY2  TO  MCP-PATH
             MOVE    "tbl_hknnum"        TO  MCP-TABLE
             MOVE    "key2"              TO  MCP-PATHNAME
      *---(01.00.05) LINE ADD END   ------------------------------------
             PERFORM  955-HKNNUM-READ-SEC
           ELSE
             DISPLAY  "HKNNUM SELECT ERR"
           END-IF
      *
           INITIALIZE  MCPAREA
           MOVE  "DBCLOSECURSOR"        TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-HKNNUM-KEY2   TO  MCP-PATH
      *     CALL  "MCPSUB"         USING
      *                            MCPAREA
      *                            MCPDATA-REC
           MOVE    "tbl_hknnum"        TO  MCP-TABLE
           MOVE    "key2"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
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
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
             MOVE  MCPDATA-REC  TO  HKNNUM-REC
             MOVE  ZERO         TO  FLG-HKNNUM
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
      *    月末日算出処理
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
      *    管理マスタ読み込み
      *****************************************************************
       800-SYSKANRI-READ-SEC  SECTION.
      *
           MOVE  "DBSELECT"               TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-SYSKANRI-KEY10  TO  MCP-PATH
      *     CALL  "MCPSUB"         USING
      *                            MCPAREA
      *                            MCPDATA-REC
           MOVE    "tbl_syskanri"          TO  MCP-TABLE
           MOVE    "key10"                 TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           IF  MCP-RC  =  ZERO
             MOVE  "DBFETCH"               TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *       MOVE  PATH-TBL-SYSKANRI-KEY10 TO  MCP-PATH
      *       CALL  "MCPSUB"        USING
      *                             MCPAREA
      *                             MCPDATA-REC
             MOVE  "tbl_syskanri"          TO  MCP-TABLE
             MOVE  "key10"                 TO  MCP-PATHNAME
             CALL  "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
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
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE  PATH-TBL-SYSKANRI-KEY10  TO  MCP-PATH
      *     CALL  "MCPSUB"        USING
      *                           MCPAREA
      *                           MCPDATA-REC
           MOVE  "tbl_syskanri"          TO  MCP-TABLE
           MOVE  "key10"                 TO  MCP-PATHNAME
           CALL  "ORCDBMAIN"             USING
                                         MCPAREA
                                         MCPDATA-REC
                                         SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
           .
       800-SYSKANRI-READ-EXT.
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
      *=== 医療機関コード変更時作成対応 by hagino(2017/02/15) start
      *     MOVE    LNK-PRTKANRI-SRYYM      TO  SYS-1900-STYUKYMD(1:6)
      *     MOVE    "01"                    TO  SYS-1900-STYUKYMD(7:2)
      *     MOVE    LNK-PRTKANRI-SRYYM      TO  SYS-1900-EDYUKYMD(1:6)
      *     MOVE    "01"                    TO  SYS-1900-EDYUKYMD(7:2)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1900-STYUKYMD(1:6)
                                               SYS-1900-EDYUKYMD(1:6)
           ELSE
               MOVE    WRK-PARA-EDSRYYM    TO  SYS-1900-STYUKYMD(1:6)
                                               SYS-1900-EDYUKYMD(1:6)
           END-IF
           MOVE    "01"                    TO  SYS-1900-STYUKYMD(7:2)
                                               SYS-1900-EDYUKYMD(7:2)
      *=== 医療機関コード変更時作成対応 by hagino(2017/02/15) end
           MOVE    SYS-1900-REC            TO  MCPDATA-REC
           PERFORM 800-SYSKANRI-READ-SEC
           IF      FLG-SYSKANRI        =   ZERO
               MOVE    MCPDATA-REC         TO  SYS-1900-REC
               IF      SYS-1900-PRTKBN(8) NOT =   SPACE
      *            医療機関名称編集情報
                   PERFORM 900-1901-READ-SEC
      *            医療機関住所編集情報
                   PERFORM 900-1902-READ-SEC
      *=== 医療機関編集情報へ開設者名追加 by Yoshikawa(2015/10/08) start
      *            医療機関住所編集情報（２）
                   PERFORM 900-1903-READ-SEC
      *=== 医療機関編集情報へ開設者名追加 by Yoshikawa(2015/10/08) end
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
      *=== 医療機関コード変更時作成対応 by hagino(2017/02/15) start
      *     MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1901-STYUKYMD(1:6)
      *     MOVE    "01"                TO  SYS-1901-STYUKYMD(7:2)
      *     MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1901-EDYUKYMD(1:6)
      *     MOVE    "01"                TO  SYS-1901-EDYUKYMD(7:2)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1901-STYUKYMD(1:6)
                                               SYS-1901-EDYUKYMD(1:6)
           ELSE
               MOVE    WRK-PARA-EDSRYYM    TO  SYS-1901-STYUKYMD(1:6)
                                               SYS-1901-EDYUKYMD(1:6)
           END-IF
           MOVE    "01"                TO  SYS-1901-STYUKYMD(7:2)
                                           SYS-1901-EDYUKYMD(7:2)
      *=== 医療機関コード変更時作成対応 by hagino(2017/02/15) end
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
      *=== 医療機関コード変更時作成対応 by hagino(2017/02/15) start
      *     MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1902-STYUKYMD(1:6)
      *     MOVE    "01"                TO  SYS-1902-STYUKYMD(7:2)
      *     MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1902-EDYUKYMD(1:6)
      *     MOVE    "01"                TO  SYS-1902-EDYUKYMD(7:2)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1902-STYUKYMD(1:6)
                                               SYS-1902-EDYUKYMD(1:6)
           ELSE
               MOVE    WRK-PARA-EDSRYYM    TO  SYS-1902-STYUKYMD(1:6)
                                               SYS-1902-EDYUKYMD(1:6)
           END-IF
           MOVE    "01"                TO  SYS-1902-STYUKYMD(7:2)
                                           SYS-1902-EDYUKYMD(7:2)
      *=== 医療機関コード変更時作成対応 by hagino(2017/02/15) end
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
      *---(01.00.05) LINE ADD END   ------------------------------------
      *=== 医療機関編集情報へ開設者名追加 by Yoshikawa(2015/10/08) start
      *****************************************************************
      *    医療機関住所編集情報読み込み
      *****************************************************************
       900-1903-READ-SEC           SECTION.
      *
      *    医療機関住所編集情報読み込み
           MOVE    SPACE               TO  SYS-1903-REC
           INITIALIZE                      SYS-1903-REC
           MOVE    SPA-HOSPNUM         TO  SYS-1903-HOSPNUM
           MOVE    "1903"              TO  SYS-1903-KANRICD
           MOVE    SYS-1900-PRTKBN(8)  TO  SYS-1903-KBNCD
      *=== 医療機関コード変更時作成対応 by hagino(2017/02/15) start
      *     MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1903-STYUKYMD (1:6)
      *     MOVE    "01"                TO  SYS-1903-STYUKYMD (7:2)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1903-STYUKYMD(1:6)
           ELSE
               MOVE    WRK-PARA-EDSRYYM    TO  SYS-1903-STYUKYMD(1:6)
           END-IF
           MOVE    "01"                TO  SYS-1903-STYUKYMD(7:2)
      *=== 医療機関コード変更時作成対応 by hagino(2017/02/15) end
           MOVE    SYS-1903-STYUKYMD   TO  SYS-1903-EDYUKYMD
           MOVE    SYS-1903-REC        TO  MCPDATA-REC
           PERFORM 800-SYSKANRI-READ-SEC
           IF      FLG-SYSKANRI        =   ZERO
               MOVE    MCPDATA-REC     TO  SYS-1903-REC
               MOVE    SYS-1903-KAISETUNAME
                                       TO  WRK-KAISETUNAME
           ELSE
               INITIALIZE                  SYS-1903-REC
           END-IF
           .
      *
       900-1903-READ-EXT.
           EXIT.
      *=== 医療機関編集情報へ開設者名追加 by Yoshikawa(2015/10/08) end
      *
      *
      *=== 対象公費をPGオプションから取得 by hagino(2017/02/15) start
      *****************************************************************
      *    プログラムオプション情報読込
      *****************************************************************
       900-PRGOPTION-READ-SEC  SECTION.
      *
           INITIALIZE                      PRGOPTION-REC
           MOVE    SPA-HOSPNUM         TO  PRGOPTION-HOSPNUM
           MOVE    WRK-PRGID           TO  PRGOPTION-PRGID
           MOVE    WRK-KBNCD           TO  PRGOPTION-KBNCD
           MOVE    PRGOPTION-REC       TO  MCPDATA-REC
           MOVE    "DBSELECT"          TO  MCP-FUNC
           MOVE    "tbl_prgoption"     TO  MCP-TABLE
           MOVE    "key"               TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"           TO  MCP-FUNC
               MOVE    "tbl_prgoption"     TO  MCP-TABLE
               MOVE    "key"               TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"          USING
                                            MCPAREA
                                            MCPDATA-REC
                                            SPA-AREA
               IF      MCP-RC              =   ZERO
                   MOVE    MCPDATA-REC         TO  PRGOPTION-REC
                   MOVE    ZERO                TO  FLG-PRGOPTION
               ELSE
                   INITIALIZE                      PRGOPTION-REC
                   MOVE    1                   TO  FLG-PRGOPTION
               END-IF
           ELSE
               MOVE    1                   TO  FLG-PRGOPTION
           END-IF
           MOVE    "DBCLOSECURSOR"            TO  MCP-FUNC
           MOVE    "tbl_prgoption"     TO  MCP-TABLE
           MOVE    "key"               TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *
           .
       900-PRGOPTION-READ-EXT.
           EXIT.
      *=== 対象公費をPGオプションから取得 by hagino(2017/02/15) end
      *
      *****************************************************************
      *    パラメタ読込
      *****************************************************************
       900-BTPARA-READ-N-SEC          SECTION.
      *
           MOVE    "DBFETCH"           TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"            USING
      *                                 MCPAREA
      *                                 MCPDATA-REC
           CALL  "ORCDBMAIN"           USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
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
      *    ＤＢ　オープン処理
      *****************************************************************
       100-DBOPEN-SEC  SECTION.
      *
      *---(01.00.05) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.05) LINE ADD END   ------------------------------------
           MOVE  "DBOPEN"   TO  MCP-FUNC.
      *---(01.00.05) LINE ADD START ------------------------------------
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC.
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
           MOVE  "DBSTART"  TO  MCP-FUNC.
      *---(01.00.05) LINE ADD START ------------------------------------
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC.
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
       900-DBDISCONNECT-SEC  SECTION.
      *
      *---(01.00.05) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.05) LINE ADD END   ------------------------------------
           MOVE  "DBCOMMIT"      TO  MCP-FUNC.
      *---(01.00.05) LINE ADD START ------------------------------------
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC.
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
           MOVE  "DBDISCONNECT"  TO  MCP-FUNC.
      *---(01.00.05) LINE ADD START ------------------------------------
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           .
       900-DBDISCONNECT-EXT.
           EXIT.
      *
