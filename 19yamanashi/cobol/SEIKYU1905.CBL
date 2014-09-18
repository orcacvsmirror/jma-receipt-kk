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
       PROGRAM-ID.     SEIKYU1905.
      *****************************************************************
      *  システム名        : ＯＲＣＡ
      *  サブシステム名    : 地方公費
      *  コンポーネント名  : 山梨・複写式電子レセプト
      *                      (143)
      *  管理者            : 
      *  作成日付    作業者        記述
      *  14/06/11    吉川          新規作成
      *****************************************************************
      *  プログラム修正履歴
      * Maj/Min/Rev  修正者  日付        内容
      *  01.00.01    吉川    14/08/13    コメントレコードへのコメントの記載は
      *                                  自動で行うように修正
      *  01.00.02    吉川    14/09/05    社保用と国保用の複写レセ電を
      *                                  同時に出力する処理追加
      *  01.00.03    吉川    14/09/18    医薬品レコードがある場合、
      *                                  福祉コメントが記録されないのを修正
      *****************************************************************
      *
       ENVIRONMENT   DIVISION.
       CONFIGURATION SECTION.
       INPUT-OUTPUT  SECTION.
       FILE-CONTROL.
      *
      *    レセプト電算ファイル
           SELECT  RECEDI-FILE     ASSIGN  RECEDI-PATH
                                   ORGANIZATION    IS  LINE
                                                       SEQUENTIAL
                                   FILE    STATUS  IS  STS-RECEDI.
      *
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) start
      *    社保レセプト電算ファイル
           SELECT  SYARECED-FILE   ASSIGN  SYARECED-PATH
                                   ORGANIZATION    IS  LINE
                                                       SEQUENTIAL
                                   FILE    STATUS  IS  STS-SYARECED.
      *    国保レセプト電算ファイル
           SELECT  KORECED-FILE    ASSIGN  KORECED-PATH
                                   ORGANIZATION    IS  LINE
                                                       SEQUENTIAL
                                   FILE    STATUS  IS  STS-KORECED.
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) end
      *
      *    請求書用ファイル
           SELECT  MF101-FILE      ASSIGN    MF101PARA
                                   ORGANIZATION    IS  INDEXED
                                   ACCESS  MODE    IS  DYNAMIC
                                   RECORD  KEY     IS  MF101-KEY
                                   FILE    STATUS  IS  STS-MF101.
006900*    エラーファイル
           SELECT  RECEERR-FILE ASSIGN  RECEERR
                                FILE    STATUS  IS  STS-RECEERR.
      *
       DATA  DIVISION.
       FILE  SECTION.
      *
      *    レセプト電算ファイル
       FD  RECEDI-FILE.
       01  RECEDI-REC         PIC X(2500).
      *     
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) start
      *    社保レセプト電算ファイル
       FD  SYARECED-FILE.
       01  SYARECED-REC         PIC X(2500).
      *
      *    国保レセプト電算ファイル
       FD  KORECED-FILE.
       01  KORECED-REC          PIC X(2500).
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) end
      *
      *    集計ファイル
       FD  MF101-FILE.
       01  MF101-REC.
           COPY  "SEI1905.INC".
      *
006900*    エラーファイル
       FD  RECEERR-FILE.
       01  RECEERR-REC  PIC X(200).
      *
       WORKING-STORAGE  SECTION.
      *    シェル用領域
           COPY  "CPSHELLTBL.INC".
      *
           COPY  "CPCOMMONDAT2.INC"
                   REPLACING  //RECE01//
                   BY         //MF101//.
      *
      *    エラーファイル 名称領域
           COPY    "CPERRFL.INC"    REPLACING  //ERRFLPARA//
                                    BY         //RECEERR//.
      *
      *    レセプト電算ファイル
       01  RECEDI-PATH.
           03  FILLER                PIC X(09) VALUE "/var/tmp/".
           03  FILE-HOSPNUM          PIC 9(02).
           03  FILLER                PIC X(15) VALUE "RECEDEN-TMP.CSV".
      *
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) start
      *    社保レセプト電算ファイル
       01  SYARECED-PATH.
           03  FILLER              PIC X(09) VALUE "/var/tmp/".
           03  SYARECED-HOSPNUM    PIC 9(02).
           03  FILLER              PIC X(18) VALUE "SYARECEDEN-TMP.CSV".
      *
      *    国保レセプト電算ファイル
       01  KORECED-PATH.
           03  FILLER              PIC X(09) VALUE "/var/tmp/".
           03  KORECED-HOSPNUM     PIC 9(02).
           03  FILLER              PIC X(17) VALUE "KORECEDEN-TMP.CSV".
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) end
      *
      *    対象公費領域
       01  TAISYO-DAT.
           03  TAISYO-TBL  OCCURS  100.
               05  TAISYO-KOHNUM     PIC X(03).
               05  TAISYO-KAIGYO     PIC X(01).
      *
      *    スパ領域
       01  STS-AREA.
           03  STS-RECEDI            PIC X(02).
           03  STS-RECEDO            PIC X(02).
           03  STS-MF101             PIC X(02).
           03  STS-RECEERR           PIC X(02).
           03  STS-RECE              PIC X(02).
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) start
           03  STS-SYARECED          PIC X(02).
           03  STS-KORECED           PIC X(02).
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) end
      *
      *    フラグ領域
       01  FLG-AREA.
           03  FLG-PTINF             PIC 9(01).
           03  FLG-END               PIC 9(01).
           03  FLG-ERR               PIC 9(01).
           03  FLG-MF101             PIC 9(01).
           03  FLG-RECE10            PIC 9(01).
           03  FLG-RECEDI            PIC 9(01).
           03  FLG-PRINT             PIC 9(01).
           03  FLG-CSVEND            PIC 9(01).
           03  FLG-SYSKANRI          PIC 9(01).
           03  FLG-WRITE             PIC 9(01).
           03  FLG-PRGOPTION         PIC 9(01).
           03  FLG-OK                PIC 9(01).
           03  FLG-TAISYOKOHI        PIC 9(01).
           03  FLG-TAISYO            PIC 9(01).
           03  FLG-BTPARA            PIC 9(01).
           03  FLG-SYORI             PIC 9(01).
           03  FLG-EDIT              PIC 9(01).
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) start
           03  FLG-SYARECED          PIC 9(01).
           03  FLG-KORECED           PIC 9(01).
           03  FLG-OUTPUT            PIC 9(01).
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) end
      *
      *    添字領域
       01  IDX-AREA.
           03  IDX                   PIC 9(05).
           03  IDXX                  PIC 9(04).
           03  IDX1                  PIC 9(04).
           03  IDX2                  PIC 9(04).
           03  IDX3                  PIC 9(04).
           03  IDY                   PIC 9(04).
           03  IDZ                   PIC 9(04).
           03  IDW                   PIC 9(04).
      *
      *    パラメタ領域
       01  WRK-PARA.
           COPY    "CPORCSPRTLNK.INC".
           03  WRK-PARA-JOBID        PIC 9(07).
           03  WRK-PARA-SHELLID      PIC X(08).
           03  WRK-PARA-HOSPNUM      PIC 9(02).
           03  WRK-PARA-PAGE         PIC 9(10).
           03  WRK-PARA-SYORIFLG     PIC X(01).
      *
      *    一時領域
       01  WRK-AREA.
           03  WRK-RECEERR           PIC  X(200).
           03  WRK-Z1                PIC Z.
           03  WRK-Z2                PIC ZZ.
           03  WRK-Z3                PIC ZZZ.
           03  WRK-Z4                PIC ZZZ9.
           03  WRK-Z5                PIC Z,ZZZ.
           03  WRK-Z6                PIC ZZ,ZZZ.
           03  WRK-Z7                PIC ZZZ,ZZZ.
           03  WRK-Z8                PIC ZZZZZZZZ.
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
           03  WRK-HKNJANUM          PIC X(05).
           03  WRK-KOBETUCITYNUM     PIC X(03).
           03  WRK-PRTID             PIC X(20).
           03  WRK-RECENUM           PIC 9(06).
           03  WRK-KOHNUM            PIC X(03).
           03  WRK-TEISYUTUSAKI      PIC 9(01).
           03  WRK-CHARCNT           PIC 9(02).
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) start
      *     03  WRK-GTENSU            PIC 9(10).
      *     03  WRK-GKENSU            PIC 9(06).
           03  WRK-GOKEI-TBL.
               05  WRK-GTENSU        PIC 9(10).
               05  WRK-GKENSU        PIC 9(06).
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) end
           03  WRK-FILEPATH          PIC X(50).
      *=== 摘要コメントの自動記載対応 by Yoshikawa(2014/08/13) start
           03  WRK-FTNJANUM          PIC X(20).
           03  WRK-JKYSNUM           PIC X(20).
           03  WRK-SIKIBETU          PIC X(02).
           03  WRK-TEKIYO            PIC X(76).
      *=== 摘要コメントの自動記載対応 by Yoshikawa(2014/08/13) end
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) start
           03  WRK-SITEI             PIC X(01).
           03  WRK-SYORI             PIC 9(01).
           03  WRK-INPUTREC          PIC X(2500).
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) end
      *
      *    文字変換
           03  WRK-MAE-INPUT         PIC X(200).
           03  WRK-OUT-INPUT         PIC X(200).
      *
           03  WRK-PATH              PIC X(50).
      *
           03  WRK-REC               PIC X(2500).
           03  WRK-REC-LENGTH        PIC 9(04).
           03  WRK-HENSYU-AREA.
               05  WRK-DATA          PIC X(100).
               05  WRK-NUM           PIC ZZZZZZZZZZ.999.
               05  WRK-NAGASA        PIC 9(04).
               05  WRK-ST            PIC 9(02).
               05  WRK-SYOSUU        PIC 9(01).
               05  WRK-END           PIC 9(01).
      *
           03  WRK-SCSVINFO-SEQ-NO       PIC 9(06).
           03  WRK-SCSVINFO-PTID         PIC 9(10).
           03  WRK-SCSVINFO-NYUGAIKBN    PIC X(01).
      *
      *    プログラムオプション用
           03  WRK-OPTION-TBL.
               05  WRK-OPTION        PIC X(100)  OCCURS 100.
           03  WRK-PRGID             PIC X(25).
           03  WRK-KBNCD             PIC X(16).
      *
      *    カウント領域
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
      *    比較用公費番号テーブル領域
       01  TBL-HIKAKU-KOHI.
           03  TBL-HKOHNUM           PIC X(03)  OCCURS  4.
      *
       01  WRK-CONS-PARA-MAX   PIC 9(03)   VALUE   100.
      *
      *    レセ電ワークテーブル
       01  TBL-RECEDATA-AREA.
           03  TBL-RECEDATA1         PIC X(100).
           03  TBL-RECEDATA2         PIC X(100).
           03  TBL-RECEDATA3         PIC X(100).
           03  TBL-RECEDATA4         PIC X(100).
           03  TBL-RECEDATA5         PIC X(100).
           03  TBL-RECEDATA6         PIC X(100).
           03  TBL-RECEDATA7         PIC X(100).
           03  TBL-RECEDATA8         PIC X(100).
           03  TBL-RECEDATA9         PIC X(100).
           03  TBL-RECEDATA10        PIC X(100).
           03  TBL-RECEDATA11        PIC X(100).
           03  TBL-RECEDATA12        PIC X(100).
           03  TBL-RECEDATA13        PIC X(100).
           03  TBL-RECEDATA14        PIC X(100).
           03  TBL-RECEDATA15        PIC X(100).
           03  TBL-RECEDATA16        PIC X(100).
           03  TBL-RECEDATA17        PIC X(100).
           03  TBL-RECEDATA18        PIC X(100).
           03  TBL-RECEDATA19        PIC X(100).
           03  TBL-RECEDATA20        PIC X(100).
           03  TBL-RECEDATA21        PIC X(100).
           03  TBL-RECEDATA22        PIC X(100).
           03  TBL-RECEDATA23        PIC X(100).
           03  TBL-RECEDATA24        PIC X(100).
           03  TBL-RECEDATA25        PIC X(100).
           03  TBL-RECEDATA26        PIC X(100).
           03  TBL-RECEDATA27        PIC X(100).
           03  TBL-RECEDATA28        PIC X(100).
           03  TBL-RECEDATA29        PIC X(100).
           03  TBL-RECEDATA30        PIC X(100).
           03  TBL-RECEDATA31        PIC X(100).
           03  TBL-RECEDATA32        PIC X(100).
           03  TBL-RECEDATA33        PIC X(100).
           03  TBL-RECEDATA34        PIC X(100).
           03  TBL-RECEDATA35        PIC X(100).
           03  TBL-RECEDATA36        PIC X(100).
           03  TBL-RECEDATA37        PIC X(100).
           03  TBL-RECEDATA38        PIC X(100).
           03  TBL-RECEDATA39        PIC X(100).
           03  TBL-RECEDATA40        PIC X(100).
           03  TBL-RECEDATA41        PIC X(100).
           03  TBL-RECEDATA42        PIC X(100).
           03  TBL-RECEDATA43        PIC X(100).
           03  TBL-RECEDATA44        PIC X(100).
           03  TBL-RECEDATA45        PIC X(100).
       01  TBL-RECEDATA-R         REDEFINES   TBL-RECEDATA-AREA.
           03  TBL-RECEDATA          PIC X(100)  OCCURS 45.
      *
      *    DB参照用
           COPY    "COMMON-SPA".
      *  
       01  WRK-CONS-AREA.
      *    コンマ
           03  WRK-KUGIRI             PIC X(01)   VALUE   ",".
      *    改行コード
           03  WRK-KAIGYO             PIC X(01)   VALUE   X"0D".
      *    改行コード（ＥＵＣ）
           03  WRK-KAIGYO-LF          PIC X(01)   VALUE   X"0A".
      *=== 摘要コメントの自動記載対応 by Yoshikawa(2014/08/13) start
      *    山梨コメント
           03  WRK-CONS-COMMENT PIC X(16) VALUE  "●山梨県自動還付".
      *=== 摘要コメントの自動記載対応 by Yoshikawa(2014/08/13) end
      *
      *****************************************************************
      *    ファイルレイアウト　領域
      *****************************************************************
      *
      *    システム管理マスタ
           COPY    "CPSK1001.INC".
      *
      *    医療機関情報−所在地、連絡先
           COPY    "CPSK1002.INC".
      *
      *    診療科目情報情報
           COPY    "CPSK1005.INC".
      *
      *    ジョブ管理マスタ
       01  JOBKANRI-REC.
           COPY    "CPJOBKANRI.INC".
      *
      *    患者情報
       01  PTINF-REC.
           COPY    "CPPTINF.INC".
      *
      *    請求管理
           COPY    "CPRCF010.INC".
      *
      *    公費請求書
           COPY    "CPKOHSKY.INC"
                   REPLACING  //KOHSKY//
                   BY         //RECE02//.
      *
      *    プログラムオプション
       01  PRGOPTION-REC.
           COPY    "CPPRGOPTION.INC".
      *
      *    パラメタ
       01  BTPARA-REC.
           COPY    "CPBTPARA.INC".
      *
      *****************************************************************
      *    サブプロ用　領域
      *****************************************************************
      *
      *    ジョブ管理ＤＢ制御サブ
           COPY    "CPORCSJOBKANRI.INC".
      *
      *    半角チェックサブ
           COPY    "CPORCSKANACHK.INC".
      *
      *    チェックディジット（モジュラス１１用）算出サブ
           COPY    "CPORCCHKDGT11.INC".
      *
      *    印刷ＤＢ制御サブ
           COPY    "CPORCSPRT.INC".
      *
      *    共通パラメタ
           COPY    "MCPAREA".
      *
      *    日付変換サブ
           COPY    "CPORCSDAY.INC".
           COPY    "CPORCSLNK.INC".
      *
           COPY    "MCPDATA.INC".
      *
      *    クライアント保存ＤＢ制御サブ
           COPY    "CPORCSFILESV.INC".
      *
      *    ＣＳＶ管理ＤＢ制御サブ
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
           INITIALIZE  IDX-AREA
           INITIALIZE  SPA-AREA
           INITIALIZE  TAISYO-DAT
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
      *    ステップ開始処理
           MOVE    "STS"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           MOVE    "SEIKYU1905"    TO  JOB-PGID
           MOVE    "複写式電子レセプト" 
                                   TO  JOB-SHELLMSG
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA
                                   JOBKANRI-REC
                                   SPA-AREA
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
           END-IF
      *
           MOVE    "MF101ZZ"                   TO  MF101PARA-FILE-ID
           MOVE    LNK-PRTKANRI-TERMID(1:16)   TO  MF101PARA-TERMID
           MOVE    WRK-PARA-HOSPNUM            TO  MF101PARA-HOSPNUM
      *
      *    医療機関ＩＤ編集
           INITIALIZE  SYS-1001-REC
           MOVE  "1001"         TO  SYS-1001-KANRICD
           MOVE  "*"            TO  SYS-1001-KBNCD
           MOVE  LNK-PRTKANRI-SRYYM(1:6)
                                TO  SYS-1001-STYUKYMD(1:6)
                                    SYS-1001-EDYUKYMD(1:6)
           MOVE  "01"           TO  SYS-1001-STYUKYMD(7:2)
                                   SYS-1001-EDYUKYMD(7:2)
           MOVE  SPA-HOSPNUM    TO  SYS-1001-HOSPNUM
           MOVE  SYS-1001-REC   TO  MCPDATA-REC
           PERFORM 800-SYSKANRI-READ-SEC
           IF  FLG-SYSKANRI  =  ZERO
             MOVE  MCPDATA-REC  TO  SYS-1001-REC
           ELSE
             DISPLAY "*** SEIKYU1905 SYS 1001 ERR ***"
             MOVE  1            TO  FLG-END
           END-IF
      *
      *    医療機関情報−所在地、連絡先
           INITIALIZE  SYS-1002-REC
           MOVE  "1002"         TO  SYS-1002-KANRICD
           MOVE  "*"            TO  SYS-1002-KBNCD
           MOVE  LNK-PRTKANRI-SRYYM(1:6)
                                TO  SYS-1002-STYUKYMD(1:6)
                                    SYS-1002-EDYUKYMD(1:6)
           MOVE  "01"           TO  SYS-1002-STYUKYMD(7:2)
                                    SYS-1002-EDYUKYMD(7:2)
           MOVE  SPA-HOSPNUM    TO  SYS-1002-HOSPNUM
           MOVE  SYS-1002-REC   TO  MCPDATA-REC
           PERFORM 800-SYSKANRI-READ-SEC
           IF  FLG-SYSKANRI  =  ZERO
             MOVE  MCPDATA-REC  TO  SYS-1002-REC
           ELSE
             DISPLAY "*** SEIKYU1905 SYS 1002 ERR ***"
             MOVE  1            TO  FLG-END
           END-IF
      *
      *    パラメタ編集処理
           PERFORM 1001-PARA-HENSYU-SEC
      *
      *    プログラムオプション取込み
           PERFORM 100-OPTION-SELECT-SEC
      *
           PERFORM 900-KOHSKY-START-SEC
           .
       100-INIT-EXT.
           EXIT.
      *
      *****************************************************************
      *    プログラムオプション取込み処理
      *****************************************************************
       100-OPTION-SELECT-SEC             SECTION.
      *
           MOVE    "SEIKYU1905"              TO  WRK-PRGID
      *
      *    プログラムオプション取得
      *    レセ電パス指定
           MOVE    "RECEDENPATH"             TO  WRK-KBNCD
           PERFORM 1001-OPTION-SET-SEC
           IF  WRK-OPTION(1)(1:2)  =  "※"
             MOVE    SPACE                   TO  WRK-FILEPATH
           ELSE
             MOVE    WRK-OPTION(1)(1:50)     TO  WRK-FILEPATH
           END-IF
           DISPLAY "レセ電パス =" WRK-FILEPATH
      *
      *    対象公費番号
           MOVE    "TAISYOKOHI"              TO  WRK-KBNCD
           PERFORM 1001-OPTION-SET-SEC
           PERFORM  VARYING  IDX  FROM  1  BY  1
                    UNTIL    IDX  >  100
                    OR       WRK-OPTION(IDX)  =  SPACE
             MOVE    WRK-OPTION(IDX)(1:3)    TO  TAISYO-KOHNUM(IDX)
             DISPLAY "対象公費番号="  TAISYO-KOHNUM(IDX)
           END-PERFORM
      *
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) start
      *    レセ電指定区分
           MOVE    "SITEIKBN"                TO  WRK-KBNCD
           PERFORM 1001-OPTION-SET-SEC
           MOVE    WRK-OPTION(1)(1:1)        TO  WRK-SITEI
           DISPLAY "レセ電指定区分 =" WRK-SITEI
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) end
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
                   DISPLAY "パラメタ区分=" BTPARA-INFO-KBN
                           "パラメタ=" BTPARA-INFO-PARA
                           "保険者番号="   TBL-PARA-HKNJANUM(IDXX)
                           "患者番号="     TBL-PARA-PTID(IDXX)
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
           IF  CNT-MF101  >  0
      *      レセ電編集処理
             PERFORM  2002-RECED-READ-SEC
      
             CLOSE   MF101-FILE
                     RECEDI-FILE
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) start
                     SYARECED-FILE
                     KORECED-FILE
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) end
           END-IF
           
           MOVE    1       TO   FLG-END
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
             INITIALIZE                          TBL-HIKAKU-KOHI
             MOVE    RECE02-KOHNUM(IDZ)      TO  TBL-HKOHNUM(1)
      *      対象公費番号チェック処理
             PERFORM  800-TAISYOKOHI-CHK-SEC
             IF  FLG-TAISYO  =  1
               PERFORM 20011-SYUKEI-SEC
             END-IF
           END-PERFORM
      *
           IF  FLG-END  =  ZERO
               PERFORM  900-KOHSKY-READ-SEC
           END-IF
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
      *    TMP-FILE キーセット
      *
           INITIALIZE       MF101-REC
      *
           MOVE    SPA-HOSPNUM                 TO  MF101-HOSPNUM
           MOVE    RECE02-PTNUM                TO  MF101-PTNUM
           MOVE    RECE02-SRYYM                TO  MF101-SRYYM
           MOVE    RECE02-RECESYUBETU          TO  MF101-RECESYUBETU
           MOVE    RECE02-TEISYUTUSAKI         TO  MF101-TEISYUTUSAKI
           MOVE    RECE02-PTID                 TO  MF101-PTID
           MOVE    RECE02-NAME                 TO  MF101-NAME
           MOVE    RECE02-KANANAME             TO  MF101-KANANAME
           MOVE    RECE02-BIRTHDAY             TO  MF101-BIRTHDAY
           MOVE    RECE02-SEX                  TO  MF101-SEX
           MOVE    RECE02-AGE                  TO  MF101-AGE
           MOVE    RECE02-HKN                  TO  MF101-HKN
           MOVE    RECE02-KOHINF      (IDZ)    TO  MF101-KOHINF
      *
      *    広域連合は審査支払機関を「2」にする（国保と同様）
           IF  RECE02-HKNNUM  =  "039"
               MOVE    "2"                     TO  MF101-TEISYUTUSAKI
           END-IF
      *
      *    請求管理からレセプト情報取得
           PERFORM 900-SEIKYU-READ-SEC
           MOVE  RECE10-JNISSU(1)              TO  MF101-JNISSU
           MOVE  RECE10-TOTALTEN(1)            TO  MF101-TOTALTEN
           MOVE  RECE10-SHOKUJIINF(1)          TO  MF101-SHOKUJIINF
      *
      *    保険者番号チェック処理
           MOVE    ZERO        TO  FLG-ERR
           PERFORM 200111-HKNJANUM-CHK-SEC
      *
      *    第２公費以降が第１公費と同じ場合、集計対象外
           IF  IDZ  <  4
               IF  MF101-KOHNUM  =  RECE02-KOHNUM(IDZ + 1)
                   MOVE    1               TO  FLG-ERR
               END-IF
           END-IF
      *
      *    患者負担がない場合は印字対象外
           IF  (FLG-ERR    =    ZERO)
           AND (RECE02-FTNMONEY(IDZ + 1)  NOT =  ZERO)
               WRITE  MF101-REC
               ADD    1                    TO  CNT-MF101
           ELSE
               DISPLAY "助成対象外患者番号="  RECE02-PTNUM
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
           MOVE    "19"                     TO  WRK-HKNJANUM(1:2)
           MOVE    WRK-KOBETUCITYNUM(1:3)   TO  WRK-HKNJANUM(3:3)
      *
           IF  WRK-PARA-SYORIFLG       =   "1"
               AND FLG-SYORI           =    1
               AND FLG-ERR             =   ZERO
      *
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
      *    レセ電ファイル読み込み処理
      *****************************************************************
       2002-RECED-READ-SEC  SECTION.
      *
           INITIALIZE                          RECEDI-REC
                                               WRK-RECENUM
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) start
                                               SYARECED-REC
                                               KORECED-REC
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) end
      *
           MOVE    SPA-HOSPNUM             TO  FILE-HOSPNUM
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) start
           MOVE    SPA-HOSPNUM             TO  SYARECED-HOSPNUM
           MOVE    SPA-HOSPNUM             TO  KORECED-HOSPNUM
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) end
      *    
           OPEN  INPUT  RECEDI-FILE
                        MF101-FILE
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) start
                        SYARECED-FILE
                        KORECED-FILE
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) end
      *
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) start
      **    複写元レセ電が存在しない場合はエラー
      *     IF  STS-RECEDI  =  "35"
      *         MOVE    SPACE             TO  WRK-RECEERR
      *         STRING "複写元レセ電が存在しません　" 
      *                                           DELIMITED  BY  SIZE
      *                 WRK-FILEPATH              DELIMITED  BY  SPACE
      *                                   INTO    WRK-RECEERR
      *         END-STRING                                
      *         PERFORM 500-ERR-HENSYU-SEC
      *         MOVE    1                 TO  FLG-END
      *                                       FLG-RECEDI
      *     END-IF
      **
      *     PERFORM  UNTIL  FLG-RECEDI  =  1
      *       READ  RECEDI-FILE
      *         AT END
      *           INITIALIZE                  RECEDI-REC
      *           MOVE    1               TO  FLG-RECEDI
      *         NOT AT END
      *           DISPLAY "RECEDEN READ =" RECEDI-REC(1:70)
      **          レセ電編集
      *           PERFORM 20021-RECED-EDIT-SEC
      *       END-READ
      *     END-PERFORM
      *
           IF  WRK-SITEI  =  1
      *
             IF  STS-RECEDI  =  "35"
                 MOVE    SPACE               TO  WRK-RECEERR
                 STRING "複写元レセ電が存在しません　" 
                                                   DELIMITED  BY  SIZE
                         WRK-FILEPATH              DELIMITED  BY  SPACE
                                             INTO  WRK-RECEERR
                 END-STRING                                
                 PERFORM 500-ERR-HENSYU-SEC
                 MOVE    1                   TO  FLG-END
             ELSE
                 MOVE    1                   TO  WRK-SYORI
                 MOVE    ZERO                TO  FLG-OUTPUT
                                                 WRK-GOKEI-TBL
                 PERFORM  UNTIL  FLG-RECEDI  =  1
                   READ  RECEDI-FILE
                     AT END
                       INITIALIZE                RECEDI-REC
                       MOVE    1             TO  FLG-RECEDI
                     NOT AT END
                       MOVE    RECEDI-REC    TO  WRK-INPUTREC
                       DISPLAY "RECEDEN READ =" RECEDI-REC(1:70)
      *                レセ電編集
                       PERFORM 20021-RECED-EDIT-SEC
                   END-READ
                 END-PERFORM
                 IF  FLG-OUTPUT  =  1
      *            ファイル保存情報更新
                   PERFORM 3001-FILE-INFO-INSERT-SEC 
                 END-IF
             END-IF
      *
           ELSE
      *
      *      複写元社保レセ電存在チェック
             IF  STS-SYARECED  =  "35"
                 DISPLAY "社保レセ電なし"
             ELSE
      *        社保複写レセ電作成
               MOVE    1                     TO  WRK-SYORI
               MOVE    ZERO                  TO  FLG-OUTPUT
                                                 WRK-GOKEI-TBL
               PERFORM  UNTIL  FLG-SYARECED  =  1
                 READ  SYARECED-FILE
                   AT END
                     INITIALIZE                  SYARECED-REC
                     MOVE    1               TO  FLG-SYARECED
                   NOT AT END
                     MOVE    SYARECED-REC    TO  WRK-INPUTREC
                     DISPLAY "SYAHO RECEDEN READ =" SYARECED-REC(1:70)
      *              レセ電編集
                     PERFORM 20021-RECED-EDIT-SEC
                 END-READ
               END-PERFORM
               IF  FLG-OUTPUT  =  1
      *          ファイル保存情報更新
                 PERFORM 3001-FILE-INFO-INSERT-SEC 
               END-IF
             END-IF
      *
      *      複写元国保レセ電存在チェック
             IF  STS-KORECED  =  "35"
               IF  STS-SYARECED  =  "35"
      *          どちらも存在しなかったらエラーメッセージ表示
                 MOVE    SPACE               TO  WRK-RECEERR
                 STRING "複写元レセ電が存在しません　" 
                                             DELIMITED  BY  SIZE
                         WRK-FILEPATH        DELIMITED  BY  SPACE
                                             INTO  WRK-RECEERR
                 END-STRING
                 PERFORM 500-ERR-HENSYU-SEC
                 MOVE    1                   TO  FLG-END
               ELSE
                 DISPLAY "国保レセ電なし"
               END-IF
             ELSE
      *        国保複写レセ電作成
               MOVE    2                     TO  WRK-SYORI
               MOVE    ZERO                  TO  FLG-OUTPUT
                                                 WRK-GOKEI-TBL
               PERFORM  UNTIL  FLG-KORECED  =  1
                 READ  KORECED-FILE
                   AT END
                     INITIALIZE                  KORECED-REC
                     MOVE    1               TO  FLG-KORECED
                   NOT AT END
                     MOVE    KORECED-REC     TO  WRK-INPUTREC
                     DISPLAY "KOKUHO RECEDEN READ =" KORECED-REC(1:70)
      *              レセ電編集
                     PERFORM 20021-RECED-EDIT-SEC
                 END-READ
               END-PERFORM
               IF  FLG-OUTPUT  =  1
      *          ファイル保存情報更新
                 PERFORM 3001-FILE-INFO-INSERT-SEC 
               END-IF
             END-IF
           END-IF
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) end
      *
           .
       2002-RECED-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    レセ電編集処理
      *****************************************************************
       20021-RECED-EDIT-SEC  SECTION.
      *
           INITIALIZE                          WRK-REC
                                               WRK-REC-LENGTH
      *
      *    レセ電をワークにセット
           PERFORM 900-RECED-SET-SEC
      *
      *    識別コード判定
           EVALUATE  TBL-RECEDATA1
      *
      *      医療機関情報レコード
             WHEN  "IR"
               PERFORM 200211-EDIT-IR-SEC
               MOVE    1                       TO  FLG-WRITE
      *
      *      レセプト共通レコード
             WHEN  "RE"
      *        TMPKEYセット
               INITIALIZE                      MF101-KEY
               MOVE    SPA-HOSPNUM             TO  MF101-HOSPNUM
               MOVE    TBL-RECEDATA14          TO  MF101-PTNUM
               MOVE    LNK-PRTKANRI-SRYYM      TO  MF101-SRYYM
               MOVE    WRK-TEISYUTUSAKI        TO  MF101-TEISYUTUSAKI
               MOVE    TBL-RECEDATA3           TO  MF101-RECESYUBETU
      *
      *        レセ電の患者データが一時ファイルに存在するか
               PERFORM  900-TMP-READ-SEC
               IF  FLG-MF101  =  ZERO
      *            編集
                   PERFORM 200212-EDIT-RE-SEC
                   MOVE    1                   TO  FLG-WRITE
               ELSE
      *            対象外
                   MOVE    ZERO                TO  FLG-WRITE
               END-IF
      *
      *=== 摘要コメントの自動記載対応 by Yoshikawa(2014/08/13) start
             WHEN  "SI"
             WHEN  "CO"
      *=== IYレコードによる不具合対応 by Yoshikawa(2014/09/18) start
             WHEN  "IY"
      *=== IYレコードによる不具合対応 by Yoshikawa(2014/09/18) end
      *        前の行が傷病名レコード（ない場合は保険か公費レコード）
      *        の場合山梨コメントを挿入する
               IF  WRK-SIKIBETU  =  "HO" OR "KO" OR "SY"
                   PERFORM 200213-EDIT-CO-SEC
               ELSE
                   PERFORM 2002111-RECORD-MAKE-SEC
               END-IF
      *=== 摘要コメントの自動記載対応 by Yoshikawa(2014/08/13) end
      *
      *      合計レコード
             WHEN  "GO"
               PERFORM 200218-EDIT-GO-SEC
               MOVE    1                       TO  FLG-WRITE
      *
      *      その他のレコードはそのまま書き込み
             WHEN  OTHER
                PERFORM 2002111-RECORD-MAKE-SEC
      *
           END-EVALUATE
      *
      *    書き込み
           IF  FLG-WRITE  =  1
               PERFORM 500-CSVINFO-SEC
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) start
               MOVE    1                       TO  FLG-OUTPUT
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) end
           END-IF
      *
      *=== 摘要コメントの自動記載対応 by Yoshikawa(2014/08/13) start
      *    識別コードを保存
           MOVE    TBL-RECEDATA1               TO  WRK-SIKIBETU
      *=== 摘要コメントの自動記載対応 by Yoshikawa(2014/08/13) end
      *
           .
       20021-RECED-EDIT-EXT.
           EXIT.
      *
      *****************************************************************
      *    医療機関情報レコード編集処理
      *****************************************************************
       200211-EDIT-IR-SEC  SECTION.
      *
      *    審査支払機関(社保=7、国保=8に変更)
           IF  TBL-RECEDATA2  =  "1"
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) start
      *         MOVE    "7"             TO  RECEDI-REC(4:1)
               MOVE    "7"             TO  WRK-INPUTREC(4:1)
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) end
           ELSE
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) start
      *         MOVE    "8"             TO  RECEDI-REC(4:1)
               MOVE    "8"             TO  WRK-INPUTREC(4:1)
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) end
           END-IF
      *
           PERFORM 2002111-RECORD-MAKE-SEC
      *
           MOVE    TBL-RECEDATA2       TO  WRK-TEISYUTUSAKI
      *
           .
       200211-EDIT-IR-EXT.
           EXIT.
      *
      *****************************************************************
      *    レセプト共通レコード編集処理
      *****************************************************************
       200212-EDIT-RE-SEC  SECTION.
      *
      *    レセプト順序番号編集
           MOVE    "RE,"               TO  WRK-REC
           MOVE    3                   TO  WRK-REC-LENGTH
           ADD     1                   TO  WRK-RECENUM
           MOVE    WRK-RECENUM         TO  WRK-NUM
           MOVE    6                   TO  WRK-NAGASA
           PERFORM 5005-NUM-HENSYU-SEC
      *
      *    レコード作成
           STRING  WRK-REC(1:WRK-REC-LENGTH) 
                                           DELIMITED BY SIZE
                   TBL-RECEDATA3           DELIMITED BY SPACE
                   ","                     DELIMITED BY SPACE
                   TBL-RECEDATA4           DELIMITED BY SPACE
                   ","                     DELIMITED BY SPACE
                   TBL-RECEDATA5           DELIMITED BY SPACE
                   ","                     DELIMITED BY SPACE
                   TBL-RECEDATA6           DELIMITED BY SPACE
                   ","                     DELIMITED BY SPACE
                   TBL-RECEDATA7           DELIMITED BY SPACE
                   ","                     DELIMITED BY SPACE
                   TBL-RECEDATA8           DELIMITED BY SPACE
                   ","                     DELIMITED BY SPACE
                   TBL-RECEDATA9           DELIMITED BY SPACE
                   ","                     DELIMITED BY SPACE
                   TBL-RECEDATA10          DELIMITED BY SPACE
                   ","                     DELIMITED BY SPACE
                   TBL-RECEDATA11          DELIMITED BY SPACE
                   ","                     DELIMITED BY SPACE
                   TBL-RECEDATA12          DELIMITED BY SPACE
                   ","                     DELIMITED BY SPACE
                   TBL-RECEDATA13          DELIMITED BY SPACE
                   ","                     DELIMITED BY SPACE
                   TBL-RECEDATA14          DELIMITED BY SPACE
                   ","                     DELIMITED BY SPACE
                   TBL-RECEDATA15          DELIMITED BY SPACE
                   ","                     DELIMITED BY SPACE
                   TBL-RECEDATA16          DELIMITED BY SPACE
                   ","                     DELIMITED BY SPACE
                   TBL-RECEDATA17          DELIMITED BY SPACE
                   ","                     DELIMITED BY SPACE
                   TBL-RECEDATA18          DELIMITED BY SPACE
                   ","                     DELIMITED BY SPACE
                   TBL-RECEDATA19          DELIMITED BY SPACE
                   ","                     DELIMITED BY SPACE
                   TBL-RECEDATA20          DELIMITED BY SPACE
                   ","                     DELIMITED BY SPACE
                   TBL-RECEDATA21          DELIMITED BY SPACE
                   ","                     DELIMITED BY SPACE
                   TBL-RECEDATA22          DELIMITED BY SPACE
                   ","                     DELIMITED BY SPACE
                   TBL-RECEDATA23          DELIMITED BY SPACE
                   ","                     DELIMITED BY SPACE
                   TBL-RECEDATA24          DELIMITED BY SPACE
                   ","                     DELIMITED BY SPACE
                   TBL-RECEDATA25          DELIMITED BY SPACE
                   ","                     DELIMITED BY SPACE
                   TBL-RECEDATA26          DELIMITED BY SPACE
                   ","                     DELIMITED BY SPACE
                   TBL-RECEDATA27          DELIMITED BY SPACE
                   ","                     DELIMITED BY SPACE
                   TBL-RECEDATA28          DELIMITED BY SPACE
                   ","                     DELIMITED BY SPACE
                   TBL-RECEDATA29          DELIMITED BY SPACE
                   ","                     DELIMITED BY SPACE
                   TBL-RECEDATA30          DELIMITED BY SPACE
                   ","                     DELIMITED BY SPACE
                   TBL-RECEDATA31          DELIMITED BY SPACE
                   ","                     DELIMITED BY SPACE
                   TBL-RECEDATA32          DELIMITED BY SPACE
                   ","                     DELIMITED BY SPACE
                   TBL-RECEDATA33          DELIMITED BY SPACE
                   ","                     DELIMITED BY SPACE
                   TBL-RECEDATA34          DELIMITED BY SPACE
                   ","                     DELIMITED BY SPACE
                   TBL-RECEDATA35          DELIMITED BY SPACE
                   ","                     DELIMITED BY SPACE
                   TBL-RECEDATA36          DELIMITED BY SPACE
                   WRK-KAIGYO              DELIMITED BY SIZE
                   INTO                    WRK-REC
           END-STRING
      *
      *    レセプト件数集計
           EVALUATE  MF101-RECESYUBETU(3:1)
             WHEN  "1"
               ADD    1                TO  WRK-GKENSU
             WHEN  "2"
               ADD    2                TO  WRK-GKENSU
             WHEN  "3"
               ADD    3                TO  WRK-GKENSU
             WHEN  "4"
               ADD    4                TO  WRK-GKENSU
           END-EVALUATE
      *
      *    レセプト点数集計
           ADD    MF101-TOTALTEN       TO  WRK-GTENSU
      *
           .
       200212-EDIT-RE-EXT.
           EXIT.
      *
      *=== 摘要コメントの自動記載対応 by Yoshikawa(2014/08/13) start
      *****************************************************************
      *    山梨県自動還付コメント挿入処理
      *****************************************************************
       200213-EDIT-CO-SEC  SECTION.
      *
      *    負担者番号と受給者番号を全角に変換
           INITIALIZE                          WRK-MAE-INPUT
                                               WRK-OUT-INPUT
                                               WRK-TEKIYO
           MOVE    MF101-KOHFTNJANUM       TO  WRK-MAE-INPUT
           PERFORM 2009-HENKAN-SEC
           MOVE    WRK-OUT-INPUT           TO  WRK-FTNJANUM
           MOVE    MF101-KOHJKYSNUM        TO  WRK-MAE-INPUT
           PERFORM 2009-HENKAN-SEC
           MOVE    WRK-OUT-INPUT           TO  WRK-JKYSNUM
      *
      *    識別コード
           MOVE    "CO,"                   TO  WRK-REC
           MOVE    3                       TO  WRK-REC-LENGTH
      *
      *    診療識別コード
           MOVE    "01"                    TO  WRK-DATA
           MOVE    2                       TO  WRK-NAGASA
           PERFORM 5004-MOJI-HENSYU-SEC
      *
      *    負担区分（現在のレコードから取得）
           MOVE    TBL-RECEDATA3(1:2)      TO  WRK-DATA
           MOVE    2                       TO  WRK-NAGASA
           PERFORM 5004-MOJI-HENSYU-SEC
      *
      *    コメントコード
           MOVE    "810000001"             TO  WRK-DATA
           MOVE    9                       TO  WRK-NAGASA
           PERFORM 5004-MOJI-HENSYU-SEC
      *
      *    コメント内容
           STRING  WRK-CONS-COMMENT        DELIMITED BY SIZE
                   WRK-FTNJANUM            DELIMITED BY SPACE
                   WRK-JKYSNUM             DELIMITED BY SPACE
                   INTO                    WRK-TEKIYO
           END-STRING
           MOVE    WRK-TEKIYO              TO  WRK-DATA
           MOVE    76                      TO  WRK-NAGASA
           MOVE    1                       TO  WRK-END
           PERFORM 5004-MOJI-HENSYU-SEC
      *
      *    改行コード編集
           STRING  WRK-REC(1:WRK-REC-LENGTH) 
                                           DELIMITED BY SIZE
                   WRK-KAIGYO              DELIMITED BY SIZE
                   INTO                    WRK-REC
           END-STRING
           IF  FLG-WRITE  =  1
             PERFORM 500-CSVINFO-SEC
           END-IF
      *
      *    山梨コメント挿入後、現在の行を書き込む
           INITIALIZE                      WRK-REC
                                           WRK-REC-LENGTH
           PERFORM 2002111-RECORD-MAKE-SEC
      *
           .
       200213-EDIT-CO-EXT.
           EXIT.
      *=== 摘要コメントの自動記載対応 by Yoshikawa(2014/08/13) end
      *
      *****************************************************************
      *    合計レコード編集処理
      *****************************************************************
       200218-EDIT-GO-SEC  SECTION.
      *
           MOVE    "GO,"               TO  WRK-REC
           MOVE    3                   TO  WRK-REC-LENGTH
      *
      *    件数
           MOVE    WRK-GKENSU          TO  WRK-NUM
           MOVE    6                   TO  WRK-NAGASA
           PERFORM 5005-NUM-HENSYU-SEC
      *
      *    点数
           MOVE    WRK-GTENSU          TO  WRK-NUM
           MOVE    10                  TO  WRK-NAGASA
           PERFORM 5005-NUM-HENSYU-SEC
      *
           MOVE    "99"                TO  WRK-DATA
           MOVE    2                   TO  WRK-NAGASA
           MOVE    1                   TO  WRK-END
           PERFORM 5004-MOJI-HENSYU-SEC
      *
      *    改行コード編集
           STRING  WRK-REC(1:WRK-REC-LENGTH) 
                                           DELIMITED BY SIZE
                   WRK-KAIGYO              DELIMITED BY SIZE
                   INTO                    WRK-REC
           END-STRING
      *
           .
       200218-EDIT-GO-EXT.
           EXIT.
      *
      *****************************************************************
      *    レセ電レコード作成処理
      *****************************************************************
       2002111-RECORD-MAKE-SEC  SECTION.
      *
           INITIALIZE                      IDY
                                           FLG-CSVEND
      *
           MOVE    99                  TO  WRK-CHARCNT
      *    最後のカンマまで文字数カウント
           PERFORM  VARYING  IDX1  FROM  1  BY  1
                    UNTIL   (IDX1  >  2500)
                    OR      (FLG-CSVEND  =  1)
      *
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) start
      *       IF  RECEDI-REC(IDX1:1)  =  ","
             IF  WRK-INPUTREC(IDX1:1)  =  ","
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) end
               MOVE    ZERO            TO  WRK-CHARCNT
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) start
      *         INSPECT  RECEDI-REC(IDX1 + 1:)
               INSPECT  WRK-INPUTREC(IDX1 + 1:)
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) end
                        TALLYING  WRK-CHARCNT  FOR  ALL  ","
             END-IF
      *
      *      最後のカンマ以降の半角スペースがループを抜ける条件
             IF  WRK-CHARCNT  =  ZERO
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) start
      *         IF  RECEDI-REC(IDX1:1)  =  SPACE
               IF  WRK-INPUTREC(IDX1:1)  =  SPACE
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) end
                 MOVE    1             TO  FLG-CSVEND
               END-IF
             END-IF
             ADD    1                  TO  IDY
           END-PERFORM
      *
      *    改行コード編集
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) start
      *     STRING  RECEDI-REC(1:IDY - 1)   DELIMITED BY SIZE
           STRING  WRK-INPUTREC(1:IDY - 1) DELIMITED BY SIZE
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) end
                   WRK-KAIGYO              DELIMITED BY SIZE
                   INTO                    WRK-REC
           END-STRING
      *
           .
       2002111-RECORD-MAKE-EXT.
           EXIT.
      *
      *****************************************************************
      *    ＣＳＶ＿ＩＮＦＯ出力処理
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
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) start
      *     MOVE    LNK-PRTKANRI-RENNUM TO  SCSVINFO-RENNUM
           MOVE    WRK-SYORI           TO  SCSVINFO-RENNUM
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) end
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
               MOVE    "ＣＳＶ用ＤＢに更新できませんでした"
                                          TO  WRK-RECEERR
               PERFORM 500-ERR-HENSYU-SEC
           END-IF
      *
           MOVE    1                   TO  FLG-ERR
           .
       500-CSVINFO-EXT.
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
      *      ジョブ終了処理
             MOVE    "JBE"           TO  SJOBKANRI-MODE
             INITIALIZE                  JOBKANRI-REC
             MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
             MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
             MOVE    WRK-PARA-SHELLID
                                     TO  JOB-SHELLID
             MOVE    WRK-RECEERR     TO  JOB-YOBI
             MOVE    "9999"          TO  JOB-ERRCD
             CALL    "ORCSJOB"       USING
                                     ORCSJOBKANRIAREA
                                     JOBKANRI-REC
                                     SPA-AREA
           END-IF
      *
           MOVE   1                  TO  FLG-END
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
      *    終了　　処理
      *****************************************************************
       300-END-SEC   SECTION.
      *
           CLOSE  MF101-FILE
           MOVE   CNT-MF101  TO  WRK-PARA-PAGE
      *
           DISPLAY "*** SEIKYU1905 IN  "  CNT-RECE02
           DISPLAY "*** SEIKYU1905 OUT "  CNT-MF101
           DISPLAY "*** SEIKYU1905 END ***"
      *
           IF  CNT-MF101  =  0
             DISPLAY "DATA NOT FOUND. PRINT JOB CANCEL!!"
           END-IF
      *
      *    ファイル保存情報更新
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) start
      *     PERFORM 3001-FILE-INFO-INSERT-SEC
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) end
      *
      *    ステップ終了処理
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
      *    ファイル保存情報更新処理
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
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) start
      *     MOVE    LNK-PRTKANRI-RENNUM
           MOVE    WRK-SYORI
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) end
                                   TO  SFILESV-RENNUM   (1)
           MOVE    LNK-PRTKANRI-SRYYM
                                   TO  SFILESV-SRYYM    (1)
           MOVE    LNK-PRTKANRI-SKYYMD
                                   TO  SFILESV-SKYYMD   (1)
      *
           IF  WRK-TEISYUTUSAKI  =  1
      *        社保
               MOVE    "JUDOC7.CSV"
                                   TO  SFILESV-TO-DATA  (1)
           ELSE
      *        国保
               MOVE    "JUDOC8.CSV"
                                   TO  SFILESV-TO-DATA  (1)
           END-IF
           MOVE    WRK-GKENSU      TO  SFILESV-CNT-ALL  (1)
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) start
      *     MOVE    "複写式電子レセプト"   
      *                             TO  SFILESV-TITLE    (1)
           IF  WRK-TEISYUTUSAKI  =  1
               MOVE    "複写式電子レセプト（社保）"   
                                   TO  SFILESV-TITLE    (1)
           ELSE
               MOVE    "複写式電子レセプト（国保）"   
                                   TO  SFILESV-TITLE    (1)
           END-IF
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) end
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
      *    対象公費番号チェック処理
      *****************************************************************
       800-TAISYOKOHI-CHK-SEC                SECTION.
      *
           INITIALIZE     FLG-TAISYO
      *
           PERFORM  VARYING  IDXX  FROM  1  BY  1
                    UNTIL    IDXX  >  100
                    OR       TAISYO-KOHNUM(IDXX)  =  SPACE
             IF  TBL-HKOHNUM(1)  =  TAISYO-KOHNUM(IDXX)
             OR  TBL-HKOHNUM(2)  =  TAISYO-KOHNUM(IDXX)
             OR  TBL-HKOHNUM(3)  =  TAISYO-KOHNUM(IDXX)
             OR  TBL-HKOHNUM(4)  =  TAISYO-KOHNUM(IDXX)
               MOVE     1                   TO  FLG-TAISYO
               MOVE     100                 TO  IDXX
             END-IF
           END-PERFORM
      *
           .
       800-TAISYOKOHI-CHK-EXT.
           EXIT.
      *****************************************************************
      *    一時ファイル読込
      *****************************************************************
       900-TMP-READ-SEC                SECTION.
      *
           READ    MF101-FILE
               INVALID    KEY
                   MOVE    1           TO  FLG-MF101
               NOT INVALID  KEY
                   MOVE    ZERO        TO  FLG-MF101
           END-READ
           .
       900-TMP-READ-EXT.
           EXIT.
      *****************************************************************
      *    レセ電ファイル読み込み処理
      *****************************************************************
       900-RECED-SET-SEC  SECTION.
      *
           INITIALIZE                          TBL-RECEDATA-AREA
                                               TBL-RECEDATA-R
      *
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) start
      *     UNSTRING   RECEDI-REC       DELIMITED  BY  ","
           UNSTRING   WRK-INPUTREC     DELIMITED  BY  ","
      *=== 社保と国保同時出力対応 by Yoshikawa(2014/09/05) end
                                       INTO    TBL-RECEDATA1
                                               TBL-RECEDATA2
                                               TBL-RECEDATA3
                                               TBL-RECEDATA4
                                               TBL-RECEDATA5
                                               TBL-RECEDATA6
                                               TBL-RECEDATA7
                                               TBL-RECEDATA8
                                               TBL-RECEDATA9
                                               TBL-RECEDATA10
                                               TBL-RECEDATA11
                                               TBL-RECEDATA12
                                               TBL-RECEDATA13
                                               TBL-RECEDATA14
                                               TBL-RECEDATA15
                                               TBL-RECEDATA16
                                               TBL-RECEDATA17
                                               TBL-RECEDATA18
                                               TBL-RECEDATA19
                                               TBL-RECEDATA20
                                               TBL-RECEDATA21
                                               TBL-RECEDATA22
                                               TBL-RECEDATA23
                                               TBL-RECEDATA24
                                               TBL-RECEDATA25
                                               TBL-RECEDATA26
                                               TBL-RECEDATA27
                                               TBL-RECEDATA28
                                               TBL-RECEDATA29
                                               TBL-RECEDATA30
                                               TBL-RECEDATA31
                                               TBL-RECEDATA32
                                               TBL-RECEDATA33
                                               TBL-RECEDATA34
                                               TBL-RECEDATA35
                                               TBL-RECEDATA36
                                               TBL-RECEDATA37
                                               TBL-RECEDATA38
                                               TBL-RECEDATA39
                                               TBL-RECEDATA40
                                               TBL-RECEDATA41
                                               TBL-RECEDATA42
                                               TBL-RECEDATA43
                                               TBL-RECEDATA44
                                               TBL-RECEDATA45
           END-UNSTRING
      *
           .
       900-RECED-SET-EXT.
           EXIT.
      *
      *****************************************************************
      *    公費請求書マスタ読込
      *****************************************************************
       900-KOHSKY-START-SEC            SECTION.
      *
           INITIALIZE                  RECE02-REC
           MOVE    SPA-HOSPNUM         TO  RECE02-HOSPNUM
           MOVE    LNK-PRTKANRI-SRYYM  TO  RECE02-SKYYM
           MOVE    RECE02-REC          TO  MCPDATA-REC
      *
           MOVE    "DBSELECT"          TO  MCP-FUNC
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
      *    公費請求書マスタＲＥＡＤ
      *****************************************************************
       900-KOHSKY-READ-SEC         SECTION.
      *
           MOVE    "DBFETCH"           TO  MCP-FUNC
           MOVE    "tbl_kohsky"        TO  MCP-TABLE
           MOVE    "key2"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
           IF      MCP-RC              =   ZERO
               MOVE    ZERO            TO  FLG-END
               MOVE    MCPDATA-REC     TO  RECE02-REC
               INITIALIZE                            TBL-HIKAKU-KOHI
               MOVE    RECE02-KOHNUM(1)          TO  TBL-HKOHNUM(1)
               MOVE    RECE02-KOHNUM(2)          TO  TBL-HKOHNUM(2)
               MOVE    RECE02-KOHNUM(3)          TO  TBL-HKOHNUM(3)
               MOVE    RECE02-KOHNUM(4)          TO  TBL-HKOHNUM(4)
      *        対象公費番号チェック処理
               PERFORM  800-TAISYOKOHI-CHK-SEC
               IF  FLG-TAISYO  =  1
      *
      *        テスト患者のときは読み飛ばす
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
               PERFORM  900-KOHSKY-CLOSE-SEC
           END-IF
           .
       900-KOHSKY-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    公費請求マスタCLOSE
      *****************************************************************
       900-KOHSKY-CLOSE-SEC           SECTION.
      *
           MOVE    "DBCLOSECURSOR"       TO  MCP-FUNC
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
      *    患者マスタ読込
      *****************************************************************
       800-PTINF-READ-SEC         SECTION.
      *
           MOVE    "DBSELECT"              TO  MCP-FUNC
           MOVE    "tbl_ptinf"             TO  MCP-TABLE
           MOVE    "key"                   TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"           TO  MCP-FUNC
               MOVE    "tbl_ptinf"         TO  MCP-TABLE
               MOVE    "key"               TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"         USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *
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
           MOVE    "DBCLOSECURSOR"         TO  MCP-FUNC
           MOVE    "tbl_ptinf"             TO  MCP-TABLE
           MOVE    "key"                   TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *
           .
       800-PTINF-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    請求管理情報読み込み
      *****************************************************************
       900-SEIKYU-READ-SEC         SECTION.
      *
           INITIALIZE                  RECE10-REC
           MOVE    RECE02-KEY              TO  RECE10-KEY
           MOVE    RECE10-REC              TO  MCPDATA-REC
           MOVE    "DBSELECT"              TO  MCP-FUNC
           MOVE    "tbl_seikyu"            TO  MCP-TABLE
           MOVE    "key"                   TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"               TO  MCP-FUNC
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
           MOVE    "DBCLOSECURSOR"         TO  MCP-FUNC
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
      *    出力レコード処理（文字）
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
      *    出力レコード処理（数字）ZZZZZZZZZ9.999の編集
      *****************************************************************
       5005-NUM-HENSYU-SEC          SECTION.
      *
           IF      WRK-NAGASA          =   ZERO
               CONTINUE
           ELSE                   
      *        開始位置
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
           MOVE  "DBSELECT"                TO  MCP-FUNC
           MOVE    "tbl_syskanri"          TO  MCP-TABLE
           MOVE    "key10"                 TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
           IF  MCP-RC  =  ZERO
             MOVE  "DBFETCH"               TO  MCP-FUNC
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
           MOVE  "DBCLOSECURSOR"         TO  MCP-FUNC
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
      *****************************************************************
      *    パラメタ読込
      *****************************************************************
       900-BTPARA-READ-N-SEC          SECTION.
      *
           MOVE    "DBFETCH"           TO  MCP-FUNC
           CALL    "ORCDBMAIN"         USING
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
      *    ＤＢ　オープン処理
      *****************************************************************
       100-DBOPEN-SEC  SECTION.
      *
           MOVE    LOW-VALUE       TO  MCP-TABLE
                                       MCP-PATHNAME
           MOVE    "DBOPEN"        TO  MCP-FUNC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *
           MOVE    LOW-VALUE       TO  MCP-TABLE
                                       MCP-PATHNAME
           MOVE    "DBSTART"       TO  MCP-FUNC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
           .
       100-DBOPEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    ＤＢ　クローズ処理
      *****************************************************************
       900-DBDISCONNECT-SEC  SECTION.
      *
           MOVE    LOW-VALUE       TO  MCP-TABLE
                                       MCP-PATHNAME
           MOVE    "DBCOMMIT"      TO  MCP-FUNC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *
           MOVE    LOW-VALUE       TO  MCP-TABLE
                                       MCP-PATHNAME
           MOVE    "DBDISCONNECT"  TO  MCP-FUNC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
           .
       900-DBDISCONNECT-EXT.
           EXIT.
      *
