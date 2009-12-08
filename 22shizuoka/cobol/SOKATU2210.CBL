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
       PROGRAM-ID.             SOKATU2210.
      *****************************************************************
      *  システム名        : ＯＲＣＡ
      *  サブシステム名    : 月次帳票
      *  コンポーネント名  : 静岡・診療報酬請求書(国保請求書)
      *  管理者            : 
      *  作成日付    作業者        記述
      *  05/05/31    山口          ORCAのバージョンアップ(2.5.0)による再作成
      *                            (返戻対応含む)
      *****************************************************************
      *  プログラム修正履歴
      * Maj/Min/Rev	修正者	日付		内容
      *  01.00.01    内田    06/11/18    食事がない場合でも生活療養費を印字
      *  01.00.02    内田    07/04/07    浜松市政令指定都市対応
      *  01.00.03    吉川    07/10/03    日レセver4.0対応
      *                                  システム管理マスタ「1901」の
      *                                  医療機関情報を参照
      *  01.00.04    内田    07/11/16    旧浜松市も浜松市でまとめる
      *  01.00.05    内田k   08/04/27    帳票様式の変更に伴う修正
      *  01.00.06    内田    08/05/03    退職家族集計修正
      *  01.00.07    吉川    08/06/17    H20年3月以前の返戻はまとめて印字
      *  01.00.08    吉川    08/09/11    シス管「2007」の公費まとめ対応
      *  01.00.09    吉川    09/12/02    シス管「2007」のまとめ公費で
      *                                  6つ目以降がまとまらない不具合を修正
      *****************************************************************
      *
       ENVIRONMENT                 DIVISION.
       CONFIGURATION               SECTION.
       INPUT-OUTPUT                SECTION.
       FILE-CONTROL.

      *    請求書一時ファイル  
           SELECT  SKT2210TMP-FILE ASSIGN    SKT2210TP
                                   ORGANIZATION    IS  INDEXED
                                   ACCESS  MODE    IS  DYNAMIC
                                   RECORD  KEY     IS  SKT2210TMP-KEY
                                   FILE    STATUS  IS  STS-SKT2210.
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
      *    優先保険者番号ファイル
           SELECT  YUSEN-FILE    ASSIGN FILE-NAME
                                 ORGANIZATION   IS  LINE SEQUENTIAL
                                 ACCESS MODE    IS  SEQUENTIAL
                                 FILE   STATUS  IS  STS-YUSEN.
      *
       DATA                        DIVISION.
       FILE                        SECTION.
      *
      *    請求書一時ファイル  
       FD  SKT2210TMP-FILE.
           COPY    "CPSKT2210TMP.INC".
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
       WORKING-STORAGE             SECTION.
      *
      *    請求書一時ファイル 名称領域 
           COPY    "CPCOMMONDAT2.INC"
                                   REPLACING  //RECE01PARA//
                                   BY         //SKT2210TP//.
      *
006900*    請求ＤＢ更新用ファイル 名称領域 
           COPY    "CPCOMMONDAT2.INC"
                                   REPLACING  //RECE01PARA//
                                   BY         //RECEUPD//.
           03  FILLER              PIC X(04)   VALUE   ".dat".
      *
      *    エラーファイル 名称領域 
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *     COPY    "CPCOMMONDAT2.INC"
      *                             REPLACING  //RECE01PARA//
      *                             BY         //RECEERR//.
      *     03  FILLER              PIC X(04)   VALUE   ".dat".
           COPY    "CPERRFL.INC"    REPLACING  //ERRFLPARA//
                                    BY         //RECEERR//.
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
      *     
      *    シェル用領域
           COPY    "CPCOMMONSHELL.INC".
      *
           COPY    "SKT2210.INC".
           COPY    "SKT2220.INC".
      *
      *    スパ領域
       01  STS-AREA.
           03  STS-SKT2210         PIC X(02).
           03  STS-RECE10          PIC X(02).
           03  STS-RECEERR         PIC X(02).
           03  STS-RECEUPD         PIC X(02).
           03  STS-YUSEN           PIC X(02).
      *
      *    フラグ領域
       01  FLG-AREA.
           03  FLG-END             PIC 9(01).
           03  FLG-SKT2210TMP      PIC 9(01).
           03  FLG-SYSKANRI        PIC 9(01).
           03  FLG-HKNNUM          PIC 9(01).
           03  FLG-HKNJAINF        PIC 9(01).
           03  FLG-UPD             PIC 9(01).
           03  FLG-UPDFILE         PIC 9(01).
           03  FLG-SEIKYU          PIC 9(01).
           03  FLG-PTINF           PIC 9(01).
           03  FLG-PRINT           PIC 9(01).
           03  FLG-PASS            PIC 9(01).
      *=== 旧様式の返戻をまとめて印字 by Yoshikawa(2008/06/17) start
           03  FLG-CHK             PIC 9(01).
      *=== 旧様式の返戻をまとめて印字 by Yoshikawa(2008/06/17) end
      *
      *    添字領域
       01  IDX-AREA.
           03  IDX1                PIC 9(04).
           03  IDX2                PIC 9(04).
           03  IDX3                PIC 9(04).
           03  IDX4                PIC 9(04).
           03  IDX5                PIC 9(04).
           03  IDX-MAX             PIC 9(04).
      *=== シス管「2007」対応 by Yoshikawa(2008/09/11) start
           03  IDZ1                PIC 9(04).
           03  IDZ2                PIC 9(04).
      *=== シス管「2007」対応 by Yoshikawa(2008/09/11) end
      *
      *  パラメタ領域（地方公費仕様）
       01  WRK-PARA.
           COPY    "CPORCSPRTLNK.INC".
           03  WRK-PARA-JOBID      PIC 9(07).
           03  WRK-PARA-SHELLID    PIC X(08).
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *     03  WRK-PARA-HOSPID     PIC X(24).
           03  WRK-PARA-HOSPNUM    PIC 9(02).
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
           03  WRK-PARA-HKNJANUM   PIC X(08).
           03  WRK-PARA-PAGE       PIC 9(10).
           03  WRK-PARA-SYOKBN     PIC X(01).
      *
      *
      *    一時領域
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
           03  WRK-CNT1            PIC 9(02).
           03  WRK-CNT2            PIC 9(02).
           03  WRK-KOHNUM          PIC X(03).
           03  WRK-HKNJANUM        PIC X(06).
           03  WRK-HKNJANAME       PIC X(20).
      *=== シス管「2007」対応 by Yoshikawa(2008/09/11) start
           03  WRK-KOHNAME         PIC X(08).
      *=== シス管「2007」対応 by Yoshikawa(2008/09/11) end
      *
           03  WRK-Z4              PIC ZZZZ.
           03  WRK-Z5              PIC Z,ZZZ.
           03  WRK-Z7              PIC ZZZ,ZZZ.
           03  WRK-Z9              PIC Z,ZZZ,ZZZ.
      *
           03  WRK-RECEERR         PIC X(200).
      *
      *    ファイル名称用エリア
           03  FILE-NAME        PIC X(512).
      *    文字変換
           03  WRK-MAE-INPUT           PIC X(200).
           03  WRK-OUT-INPUT           PIC X(200).
      *
      *=== シス管「1901」対応 By Yoshikawa(2007/10/03) start
      *     03  WRK-PATH.
      *         05  FILLER          PIC S9(09)  BINARY.
      *         05  FILLER          PIC S9(09)  BINARY.
      *         05  FILLER          PIC S9(09)  BINARY.
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
      *=== シス管「1901」対応 By Yoshikawa(2007/10/03) end
      *
      *    カウント領域
       01  CNT-AREA.
           03  CNT-PAGE            PIC 9(03).
           03  CNT-RECE10          PIC 9(06).
           03  CNT-UPDFILE         PIC 9(06).
           03  CNT-KOH             PIC 9(02).
      *---(01.00.05) LINE ADD START ------------------------------------
           03  CNT-KOH2            PIC 9(02).
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *=== シス管「2007」対応 by Yoshikawa(2008/09/11) start
      *    公費番号まとめエリア
       01  WRK-2007-AREA.
           03  WRK-2007-TBL        OCCURS  100.
               05  WRK-2007-MEISYO PIC X(44).
               05  WRK-2007-KOH-AREA.
                   07  WRK-2007-KOHNUM
                                   PIC X(03)   OCCURS  10.
           03  WRK-2007-MAX        PIC 9(03).
      *=== シス管「2007」対応 by Yoshikawa(2008/09/11) end
      *
       01  SORT-AREA.
           03  SORT-TBL.
               05  SORT-KOH-TBL  OCCURS  20.
                   07  SORT-KOHNUM              PIC  X(03).
      *=== シス管「2007」対応 by Yoshikawa(2008/09/11) start
                   07  SORT-KOHNAME             PIC  X(08).
      *=== シス管「2007」対応 by Yoshikawa(2008/09/11) end
                   07  SORT-KOH-NYUGAI-TBL OCCURS 2.
                       09  SORT-K-KENSU         PIC  9(05).
                       09  SORT-K-NISSU         PIC  9(05).
                       09  SORT-K-TENSU         PIC  9(09).
                       09  SORT-K-ITBFTN        PIC  9(09).
                   07  SORT-K-SKENSU            PIC  9(05).
                   07  SORT-K-SNISSU            PIC  9(05).
                   07  SORT-K-SKINGK            PIC  9(09).
                   07  SORT-K-SFTNGK            PIC  9(09).
      *
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *     COPY    "ORCA-DBPATH".
           COPY    "COMMON-SPA".
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *    固定項目
       01  WRK-CONS-AREA.
           03  WRK-CONS-SRYYM-200804   PIC X(06)   VALUE   "200804".
      *---(01.00.05) LINE ADD END   ------------------------------------
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
      *    システム管理マスタ
           COPY    "CPSYSKANRI.INC".
      *
      *    医療機関情報情報
           COPY    "CPSK1001.INC".
      *
      *    医療機関情報−所在地、連絡先 
           COPY    "CPSK1002.INC".
      *
      *=== シス管「1901」対応 By Yoshikawa(2007/10/03) start
      *    医療機関編集情報
           COPY    "CPSK1900.INC".
      *
      *    医療機関名称編集情報
           COPY    "CPSK1901.INC".
      *
      *    医療機関住所編集情報
           COPY    "CPSK1902.INC".
      *=== シス管「1901」対応 By Yoshikawa(2007/10/03) end
      *
      *=== シス管「2007」対応 by Yoshikawa(2008/09/11) start
      *    公費番号まとめ情報
           COPY    "CPSK2007.INC".
      *=== シス管「2007」対応 by Yoshikawa(2008/09/11) end
      *
      *    請求管理情報
           COPY    "CPRCF010.INC".
      *
      *    ジョブ管理マスタ
       01  JOBKANRI-REC.
           COPY    "CPJOBKANRI.INC".
      *
      *    全角チェックパラメタ
           COPY    "CPORCSKANACHK.INC".
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
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
           INITIALIZE                  SPA-AREA
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
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
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *                                         WRK-PARA-HOSPID
                                               WRK-PARA-HOSPNUM
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
                                               WRK-PARA-JOBID
                                               WRK-PARA-SHELLID
                                               WRK-PARA-HKNJANUM
                                               WRK-PARA-SYOKBN
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
                                               RECEERR
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
           END-UNSTRING
      *
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
           MOVE    WRK-PARA-HOSPNUM    TO  SPA-HOSPNUM
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
      *
      *    ステップ管理開始処理
           MOVE    "STS"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           MOVE    "SOKATU2210"    TO  JOB-PGID
           MOVE    "国保請求書"
                                   TO  JOB-SHELLMSG
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA
                                   JOBKANRI-REC
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
                                   SPA-AREA
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
      *
           MOVE    "SKT2210"           TO  SKT2210TP-FILE-ID
           MOVE    LNK-PRTKANRI-TERMID TO  SKT2210TP-TERMID
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
           MOVE    WRK-PARA-HOSPNUM    TO  SKT2210TP-HOSPNUM
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
      *
           MOVE    "RECEUPD"           TO  RECEUPD-FILE-ID
           MOVE    LNK-PRTKANRI-TERMID TO  RECEUPD-TERMID
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
           MOVE    WRK-PARA-HOSPNUM    TO  RECEUPD-HOSPNUM
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
      *
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *     MOVE    "RECEERR"           TO  RECEERR-FILE-ID
      *     MOVE    LNK-PRTKANRI-TERMID TO  RECEERR-TERMID
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
      *
           MOVE    LNK-PRTKANRI-SRYYM  TO  WRK-SYMD (1:6)
           MOVE    "01"                TO  WRK-SYMD (7:2)
           PERFORM 31012-SEIWA-HEN-SEC
           MOVE    WRK-HENYMDG(1:16)   TO  WRK-SRYYMWH 
      *
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
           MOVE    LNK-PRTKANRI-SRYYM(1:6)
                                       TO  SYS-1001-STYUKYMD(1:6)
                                           SYS-1001-EDYUKYMD(1:6)
           MOVE    "01"                TO  SYS-1001-STYUKYMD(7:2)
                                           SYS-1001-EDYUKYMD(7:2)
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
           MOVE    SPA-HOSPNUM         TO  SYS-1001-HOSPNUM
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
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
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
           MOVE    SPA-HOSPNUM         TO  SYS-1002-HOSPNUM
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
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
      *=== シス管「2007」対応 by Yoshikawa(2008/09/11) start
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
      *=== シス管「2007」対応 by Yoshikawa(2008/09/11) end
      *
      *=== シス管「1901」対応 By Yoshikawa(2007/10/03) start
           MOVE    SYS-1001-HOSPNAME   TO  WRK-HOSPNAME
           MOVE    SYS-1002-ADRS       TO  WRK-HOSPADRS
           MOVE    SYS-1002-TEL        TO  WRK-HOSPTEL
      *    医療機関編集情報
           PERFORM 900-1900-READ-SEC
      *=== シス管「1901」対応 By Yoshikawa(2007/10/03) end
      *
           PERFORM  110-INI-FILE-SEC
      *
           EVALUATE    WRK-PARA-SYOKBN 
               WHEN    "2"
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *             MOVE    PATH-TBL-SEIKYU-KEY37    TO  WRK-PATH
                   MOVE    "key37"        TO  WRK-PATH
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
               WHEN    "1"
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *             MOVE    PATH-TBL-SEIKYU-KEY38    TO  WRK-PATH
                   MOVE    "key38"        TO  WRK-PATH
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
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
           OPEN     OUTPUT  SKT2210TMP-FILE
           CLOSE            SKT2210TMP-FILE
           OPEN     I-O     SKT2210TMP-FILE
      *
           MOVE     ZERO    TO      FLG-END
           MOVE     ZERO    TO      FLG-UPD
      *
           PERFORM  2001-KOKUHO-SYUKEI-SEC
                    UNTIL   FLG-END   =   1
      *
      *---(01.00.05) LINE ADD START ------------------------------------
           PERFORM  900-SEIKYU-CLOSE-SEC
      *---(01.00.05) LINE ADD END   ------------------------------------
           CLOSE   UPD-FILE
           CLOSE   SKT2210TMP-FILE
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
           DISPLAY "*** SOKATU2210 IN  "  CNT-RECE10 
           DISPLAY "*** SOKATU2210 END ***"
      *
      *    ステップ終了処理
           MOVE    "STE"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
           MOVE    WRK-PARA-PAGE   TO  JOB-UPDCNT
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA  
                                   JOBKANRI-REC
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
                                   SPA-AREA
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
      *
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
           INITIALIZE       SKT2210TMP-REC
      *
      *    保険者番号
           MOVE  RECE10-HKNJANUM-S       TO  SKT2210TMP-HKNJANUM
      *
      *    名古屋市の場合、代表番号セット
           IF  SKT2210TMP-HKNJANUM (1:3) = "234"
            MOVE  "234005"  TO  SKT2210TMP-HKNJANUM
           END-IF
      *
      *    静岡市の場合、代表番号セット
           IF  SKT2210TMP-HKNJANUM (1:3) = "224"
           OR  SKT2210TMP-HKNJANUM(1:5)  = "22001"
             MOVE  "224006"  TO  SKT2210TMP-HKNJANUM
           END-IF
      *---(01.00.02) LINE ADD START ------------------------------------
      *
      *    浜松市の場合、代表番号セット
      *---(01.00.04) LINE ADD START ------------------------------------
      *     IF  SKT2210TMP-HKNJANUM (1:3) = "225"
           IF  SKT2210TMP-HKNJANUM (1:3) = "225"
           OR  SKT2210TMP-HKNJANUM (1:5) = "22002"
      *---(01.00.04) LINE ADD END   ------------------------------------
             MOVE  "225003"  TO  SKT2210TMP-HKNJANUM
           END-IF
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
      *    出力順設定
      *    (優先保険者→県内市町村→県内国保組合→全国国保組合→県外)
           IF    YUSEN-HKNJANUM   =  SKT2210TMP-HKNJANUM
             MOVE          1   TO    SKT2210TMP-SYUTURYOKU
           ELSE
             IF    RECE10-PREFKBN  =  "1"
               IF  SKT2210TMP-HKNJANUM(3:1)  =  "3"
                 MOVE  3        TO    SKT2210TMP-SYUTURYOKU
               ELSE
                 MOVE  2        TO    SKT2210TMP-SYUTURYOKU
               END-IF
             ELSE
               MOVE    5        TO    SKT2210TMP-SYUTURYOKU
             END-IF
             IF    SKT2210TMP-HKNJANUM  =  "133033" OR
                                           "133264" OR
                                           "133298" 
               MOVE    4        TO    SKT2210TMP-SYUTURYOKU
             END-IF
           END-IF
      *
      *    在宅・在医総
           MOVE    RECE10-ZAITAKU        TO  SKT2210TMP-ZAITAKU
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *    平成２０年３月以前は旧様式
           DISPLAY "RECE10-SRYYM"RECE10-SRYYM
           DISPLAY "WRK-CONS-SRYYM-200804"WRK-CONS-SRYYM-200804
           IF  RECE10-SRYYM  <  WRK-CONS-SRYYM-200804
      *=== 旧様式の返戻をまとめて印字 by Yoshikawa(2008/06/17) start
      *         MOVE  RECE10-SRYYM          TO  SKT2210TMP-SRYYM
               MOVE  "200803"              TO  SKT2210TMP-SRYYM
      *=== 旧様式の返戻をまとめて印字 by Yoshikawa(2008/06/17) end
               DISPLAY "平成２０年３月以前は旧様式"SKT2210TMP-SRYYM
           END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
           PERFORM  900-SKTTMP-READ-SEC
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *     PERFORM  210-HKN-SYUKEI-SEC
           IF  RECE10-SRYYM  <  WRK-CONS-SRYYM-200804
             PERFORM  210-HKN-SYUKEI-SEC
           ELSE
             PERFORM  220-HKN-SYUKEI-SEC
           END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *    集計の対象にならなかったとき
           IF      FLG-UPD             =   1
               PERFORM 230-UPD-FILE-HENSYU-SEC
      *
                  PERFORM   900-SEIKYU-READ-SEC
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
             MOVE    1    TO   SKT2210TMP-PAGE-FLG2
             IF  RECE10-KYURATE  =  9
               MOVE  10   TO   IDX1
             ELSE
               MOVE  11   TO   IDX1
             END-IF
           ELSE
             MOVE    1    TO   SKT2210TMP-PAGE-FLG1
      *    一般国保か
             IF  RECE10-HKNNUM  =  "060"
               IF  RECE10-AGE  >= 70
                 IF  RECE10-KYURATE  =  9
                   MOVE    1     TO    IDX1
                 ELSE
                   MOVE    2     TO    IDX1
                 END-IF
               ELSE
                 IF  RECE10-AGE  >= 3
                   MOVE    3     TO    IDX1
                 ELSE
                   MOVE    4     TO    IDX1
                 END-IF
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
                 IF  RECE10-HONKZKKBN  =  "1"
                   MOVE  5    TO   IDX1
                 ELSE
                   IF  RECE10-AGE  <  3
                     MOVE  9  TO  IDX1
                   ELSE
                     MOVE  8  TO  IDX1
                   END-IF
                 END-IF
               END-IF
             END-IF
           END-IF
      *
           PERFORM  2101-SYUKEI-SEC
      *
      **    公費負担分
           IF  RECE10-KOHNUM (1)   NOT =   SPACE
             IF  RECE10-RJNHKNNUM  NOT =   SPACE
               PERFORM 220-RKOH-SYUKEI-SEC
             ELSE
      *---(01.00.05) LINE ADD START ------------------------------------
               MOVE    4    TO    CNT-KOH2
      *---(01.00.05) LINE ADD END   ------------------------------------
               PERFORM 220-KOH-SYUKEI-SEC
             END-IF
           END-IF
      *
      *    長期件数
           IF  RECE10-ETC-KOHNUM(1) = "972" OR "974" OR
               RECE10-ETC-KOHNUM(2) = "972" OR "974" OR
               RECE10-ETC-KOHNUM(3) = "972" OR "974" OR
               RECE10-ETC-KOHNUM(4) = "972" OR "974"
             EVALUATE  IDX1
             WHEN 1 THRU  4
               ADD     1          TO   SKT2210TMP-TYOGEN(1)
             WHEN 5 THRU  9
               ADD     1          TO   SKT2210TMP-TYOGEN(2)
             WHEN OTHER
               ADD     1          TO   SKT2210TMP-TYOGEN(3)
             END-EVALUATE
           END-IF
      *
      *    原爆件数
           IF  RECE10-ETC-KOHNUM(1) = "019" OR
               RECE10-ETC-KOHNUM(2) = "019" OR
               RECE10-ETC-KOHNUM(3) = "019" OR
               RECE10-ETC-KOHNUM(4) = "019"
               ADD     1          TO   SKT2210TMP-TYOGEN(4)
           END-IF
      *
           IF  FLG-SKT2210TMP  =  1
               WRITE    SKT2210TMP-REC
           ELSE
               REWRITE  SKT2210TMP-REC
           END-IF
      *
           MOVE    1    TO  FLG-UPD 
      *
           .
       210-HKN-SYUKEI-EXT.
           EXIT.
      *
      *****************************************************************
      *    医療保険・老人保健分集計処理
      *****************************************************************
       220-HKN-SYUKEI-SEC          SECTION.
      *
      *    入外区分
           IF  RECE10-NYUGAIKBN  =  "1"
             MOVE  1      TO   IDX2
           ELSE
             MOVE  2      TO   IDX2
           END-IF
      *
             MOVE    1    TO   SKT2210TMP-PAGE-FLG1
      *    一般国保
           IF  RECE10-HKNNUM  =  "060"
             IF  RECE10-AGE  >= 70
               IF  RECE10-KYURATE  =  9
                 MOVE    1     TO    IDX1
               ELSE
                 MOVE    2     TO    IDX1
               END-IF
             ELSE
               IF  (RECE10-SRYYM  >=  WRK-CONS-SRYYM-200804)
                 AND  (RECE10-FLG (1)   =  1)
                   MOVE  4     TO  IDX1
               ELSE
                 IF  RECE10-AGE  >= 3
                   MOVE    3     TO    IDX1
                 ELSE
                   MOVE    4     TO    IDX1
                 END-IF
               END-IF
             END-IF
      *
           ELSE
             IF  RECE10-HONKZKKBN  =  "1"
               MOVE  5    TO   IDX1
             ELSE
               IF  (RECE10-SRYYM  >=  WRK-CONS-SRYYM-200804)
               AND  (RECE10-FLG (1)   =  1)
                  MOVE  7     TO  IDX1
      *---(01.00.06) LINE ADD START ------------------------------------
               ELSE
      *---(01.00.06) LINE ADD END   ------------------------------------
                 IF  RECE10-AGE  <  3
                   MOVE  7  TO  IDX1
                 ELSE
                   MOVE  6  TO  IDX1
                 END-IF
               END-IF
             END-IF
           END-IF
      *
           PERFORM  2101-SYUKEI-SEC
      *
      **    公費負担分
           IF  RECE10-KOHNUM (1)   NOT =   SPACE
             IF  RECE10-RJNHKNNUM  NOT =   SPACE
               PERFORM 220-RKOH-SYUKEI-SEC
             ELSE
               MOVE    3    TO    CNT-KOH2
               PERFORM 220-KOH-SYUKEI-SEC
             END-IF
           END-IF
      *
      *    長期件数
           IF  RECE10-ETC-KOHNUM(1) = "972" OR "974" OR
               RECE10-ETC-KOHNUM(2) = "972" OR "974" OR
               RECE10-ETC-KOHNUM(3) = "972" OR "974" OR
               RECE10-ETC-KOHNUM(4) = "972" OR "974"
             EVALUATE  IDX1
             WHEN 1 THRU  4
               ADD     1          TO   SKT2210TMP-TYOGEN(1)
             WHEN 5 THRU  9
               ADD     1          TO   SKT2210TMP-TYOGEN(2)
             WHEN OTHER
               ADD     1          TO   SKT2210TMP-TYOGEN(3)
             END-EVALUATE
           END-IF
      *
      *    原爆件数
           IF  RECE10-ETC-KOHNUM(1) = "019" OR
               RECE10-ETC-KOHNUM(2) = "019" OR
               RECE10-ETC-KOHNUM(3) = "019" OR
               RECE10-ETC-KOHNUM(4) = "019"
               ADD     1          TO   SKT2210TMP-TYOGEN(4)
           END-IF
      *
           IF  FLG-SKT2210TMP  =  1
               WRITE    SKT2210TMP-REC
           ELSE
               REWRITE  SKT2210TMP-REC
           END-IF
      *
           MOVE    1    TO  FLG-UPD 
      *
           .
       220-HKN-SYUKEI-EXT.
           EXIT.
      *
      *****************************************************************
      *    医療保険・一般国保分集計処理
      *****************************************************************
       2101-SYUKEI-SEC         SECTION.
      *
      *    療養の給付：件数
           ADD   1                  TO  SKT2210TMP-KENSU(IDX1 IDX2)
      *    療養の給付:診療実日数
           ADD  RECE10-JNISSU(1)    TO  SKT2210TMP-NISSU(IDX1 IDX2)
      *    療養の給付：点数
           ADD  RECE10-TOTALTEN(1)  TO  SKT2210TMP-TENSU(IDX1 IDX2)
      *    療養の給付：一部負担金
           ADD  RECE10-FTNMONEY(1)  TO  SKT2210TMP-ITBFTN(IDX1 IDX2)
      *
           IF  RECE10-SHOKUJINISSU(1)  >  0
      *    食事療養:件数
             ADD   1  TO  SKT2210TMP-SKENSU(IDX1)
      *---(01.00.01) LINE ADD START ------------------------------------
           END-IF
      *---(01.00.01) LINE ADD END   ------------------------------------
      *    食事療養:日数
           ADD  RECE10-SHOKUJINISSU(1)   TO  SKT2210TMP-SNISSU(IDX1)
      *    食事療養：金額
           ADD  RECE10-SHOKUJIRYOYOHI(1) TO  SKT2210TMP-SKINGK(IDX1)
      *    食事療養：標準負担額
           ADD  RECE10-SHOKUJIFTN(1)     TO  SKT2210TMP-SFTNGK(IDX1)
      *---(01.00.01) LINE ADD START ------------------------------------
      *     END-IF
      *---(01.00.01) LINE ADD END   ------------------------------------
      *
           MOVE    1               TO  FLG-UPD
      *
      *    一般・退職の場合は合計加算
           IF  RECE10-RJNHKNNUM  =  SPACE
             IF  RECE10-HKNNUM   =  "060"
               ADD 1                         TO  SKT2210TMP-GKENSU(1)
               ADD RECE10-FTNMONEY(1)        TO  SKT2210TMP-GKINGK(1)
               ADD RECE10-SHOKUJIRYOYOHI(1)  TO  SKT2210TMP-GKINGK(1)
               ADD RECE10-SHOKUJIFTN(1)      TO  SKT2210TMP-GKINGK(1)
             ELSE
               ADD 1                         TO  SKT2210TMP-GKENSU(2)
               ADD RECE10-FTNMONEY(1)        TO  SKT2210TMP-GKINGK(2)
               ADD RECE10-SHOKUJIRYOYOHI(1)  TO  SKT2210TMP-GKINGK(2)
               ADD RECE10-SHOKUJIFTN(1)      TO  SKT2210TMP-GKINGK(2)
             END-IF
           END-IF
           .
       2101-SYUKEI-EXT.
           EXIT.
      *
      *****************************************************************
      *    公費負担分集計処理(一般・退職分)
      *****************************************************************
       220-KOH-SYUKEI-SEC        SECTION.
      *
           PERFORM VARYING IDX3     FROM    1   BY  1
      *---(01.00.05) LINE ADD START ------------------------------------
      *             UNTIL   IDX3     >       4
                   UNTIL   IDX3     >       CNT-KOH2
      *---(01.00.05) LINE ADD END   ------------------------------------
                   OR  RECE10-KOHNUM (IDX3) =   SPACE
      *
      *    ０５１と０９１は同じ場所に集計する
             IF    RECE10-KOHNUM(IDX3)  =  "091"
               MOVE    "051"    TO    RECE10-KOHNUM(IDX3)
             END-IF
      *
      *=== シス管「2007」対応 by Yoshikawa(2008/09/11) start
      *      公費番号まとめ情報があるとき
             IF  WRK-2007-MAX  >  ZERO
               MOVE  SPACE     TO  WRK-KOHNAME
               PERFORM VARYING IDZ1    FROM    1   BY  1
                       UNTIL   IDZ1    >       WRK-2007-MAX
                 PERFORM VARYING IDZ2  FROM    1   BY  1
      *=== 公費番号まとめの編集方法修正 by Yoshikawa(2009/12/02) start
      *                   UNTIL   IDZ2  >       5
                         UNTIL   IDZ2  >       10
      *=== 公費番号まとめの編集方法修正 by Yoshikawa(2009/12/02) end
                         OR WRK-2007-KOHNUM(IDZ1 IDZ2)  =  SPACE
                   IF  RECE10-KOHNUM(IDX3)  
                                 =   WRK-2007-KOHNUM(IDZ1 IDZ2)
                     MOVE  WRK-2007-KOHNUM(IDZ1 1)
                                 TO  RECE10-KOHNUM (IDX3)
                     MOVE  WRK-2007-MEISYO (IDZ1)
                                 TO  WRK-KOHNAME
      *=== 公費番号まとめの編集方法修正 by Yoshikawa(2009/12/02) start
      *               MOVE  5             TO  IDZ2
                     MOVE  10            TO  IDZ2
      *=== 公費番号まとめの編集方法修正 by Yoshikawa(2009/12/02) end
                     MOVE  WRK-2007-MAX  TO  IDZ1
                   END-IF
                 END-PERFORM
               END-PERFORM
             END-IF
      *=== シス管「2007」対応 by Yoshikawa(2008/09/11) end
      *
             PERFORM  VARYING  IDX4  FROM  1  BY  1
                      UNTIL    IDX4  >     20
                      OR       SKT2210TMP-KOHNUM (IDX4) = SPACE
               IF  RECE10-KOHNUM (IDX3)  =  SKT2210TMP-KOHNUM (IDX4)
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
             MOVE  RECE10-KOHNUM(IDX3)  TO  SKT2210TMP-KOHNUM(CNT-KOH)
      *=== シス管「2007」対応 by Yoshikawa(2008/09/11) start
      *    公費名称
             MOVE  WRK-KOHNAME      TO  SKT2210TMP-KOHNAME(CNT-KOH)
      *=== シス管「2007」対応 by Yoshikawa(2008/09/11) end
      *    療養の給付：件数
             ADD   1  TO  SKT2210TMP-K-KENSU (CNT-KOH IDX2)
      *    療養の給付:診療実日数
             ADD  RECE10-JNISSU(IDX3 + 1)    TO
                               SKT2210TMP-K-NISSU(CNT-KOH IDX2)
      *    療養の給付：点数
             ADD  RECE10-TOTALTEN(IDX3 + 1)  TO
                               SKT2210TMP-K-TENSU(CNT-KOH IDX2)
      *
      *    療養の給付：一部負担金
             ADD  RECE10-FTNMONEY(IDX3 + 1)  TO
                               SKT2210TMP-K-ITBFTN(CNT-KOH IDX2)
      *
             IF  RECE10-SHOKUJINISSU(IDX3 + 1)  >  0
      *    食事療養:件数
               ADD   1  TO  SKT2210TMP-K-SKENSU(CNT-KOH)
      *---(01.00.01) LINE ADD START ------------------------------------
             END-IF
      *---(01.00.01) LINE ADD END   ------------------------------------
      *    食事療養:日数
             ADD  RECE10-SHOKUJINISSU(IDX3 + 1)    TO
                               SKT2210TMP-K-SNISSU(CNT-KOH)
      *    食事療養：金額
             ADD  RECE10-SHOKUJIRYOYOHI(IDX3 + 1)  TO
                               SKT2210TMP-K-SKINGK(CNT-KOH)
      *    食事療養：標準負担額
             ADD  RECE10-SHOKUJIFTN(IDX3 + 1)      TO
                               SKT2210TMP-K-SFTNGK(CNT-KOH)
      *---(01.00.01) LINE ADD START ------------------------------------
      *       END-IF
      *---(01.00.01) LINE ADD END   ------------------------------------
      *
      *    合計加算
             IF  RECE10-HKNNUM   =  "060"
               ADD RECE10-FTNMONEY(IDX3 + 1) TO  SKT2210TMP-GKINGK(1)
             ELSE
               ADD RECE10-FTNMONEY(IDX3 + 1) TO  SKT2210TMP-GKINGK(2)
             END-IF
      *
           END-PERFORM
      *
      *
           .
       220-KOH-SYUKEI-EXT.
           EXIT.
057400*
      *****************************************************************
      *    公費負担分集計処理(老人分)
      *****************************************************************
       220-RKOH-SYUKEI-SEC        SECTION.
      *
           PERFORM VARYING IDX3     FROM    1   BY  1
                   UNTIL   IDX3     >       4
                   OR  RECE10-KOHNUM (IDX3) =   SPACE
      *
      *    ０５１と０９１は同じ場所に集計する
             IF    RECE10-KOHNUM(IDX3)  =  "091"
               MOVE    "051"    TO    RECE10-KOHNUM(IDX3)
             END-IF
      *
             PERFORM  VARYING  IDX4  FROM  1  BY  1
                      UNTIL    IDX4  >     20
                      OR       SKT2210TMP-RKOHNUM (IDX4) = SPACE
               IF  RECE10-KOHNUM (IDX3)  =  SKT2210TMP-RKOHNUM (IDX4)
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
             MOVE  RECE10-KOHNUM(IDX3)  TO  SKT2210TMP-RKOHNUM(CNT-KOH)
      *    療養の給付：件数
             ADD   1  TO  SKT2210TMP-K-RKENSU (CNT-KOH IDX2)
      *    療養の給付:診療実日数
             ADD  RECE10-JNISSU(IDX3 + 1)    TO
                               SKT2210TMP-K-RNISSU(CNT-KOH IDX2)
      *    療養の給付：点数
             ADD  RECE10-TOTALTEN(IDX3 + 1)  TO
                               SKT2210TMP-K-RTENSU(CNT-KOH IDX2)
      *
      *    療養の給付：一部負担金
             ADD  RECE10-FTNMONEY(IDX3 + 1)  TO
                               SKT2210TMP-K-RITBFTN(CNT-KOH IDX2)
      *
             IF  RECE10-SHOKUJINISSU(IDX3 + 1)  >  0
      *    食事療養:件数
               ADD   1  TO  SKT2210TMP-K-RSKENSU(CNT-KOH)
      *---(01.00.01) LINE ADD START ------------------------------------
             END-IF
      *---(01.00.01) LINE ADD END   ------------------------------------
      *    食事療養:日数
             ADD  RECE10-SHOKUJINISSU(IDX3 + 1)    TO
                               SKT2210TMP-K-RSNISSU(CNT-KOH)
      *    食事療養：金額
             ADD  RECE10-SHOKUJIRYOYOHI(IDX3 + 1)  TO
                               SKT2210TMP-K-RSKINGK(CNT-KOH)
      *    食事療養：標準負担額
             ADD  RECE10-SHOKUJIFTN(IDX3 + 1)      TO
                               SKT2210TMP-K-RSFTNGK(CNT-KOH)
      *---(01.00.01) LINE ADD START ------------------------------------
      *       END-IF
      *---(01.00.01) LINE ADD END   ------------------------------------
      *
           END-PERFORM
      *
      *
           .
       220-KOH-SYUKEI-EXT.
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
           OPEN     INPUT       SKT2210TMP-FILE
      *
           MOVE     ZERO        TO       FLG-PRINT
      *
      *    一時ファイル読込
           PERFORM  900-TMP-READ-SEC
      *
           PERFORM  UNTIL     FLG-PRINT   =   1
      *
             PERFORM  KOH-SORT-SEC
      *    該当データが無い場合は印刷しない
             IF    SKT2210TMP-PAGE-FLG1   =   1
               MOVE  ZERO  TO  FLG-PASS
               MOVE  1     TO  WRK-CNT1
               PERFORM  UNTIL  FLG-PASS   =   1  AND
                        SKT2210TMP-KOHNUM(WRK-CNT1) = SPACE
      *    １枚目(一般＋退職)
      *    帳票編集<見出し>処理
                 PERFORM 310-HEAD-HEN-SEC 
      *    帳票編集<明細>処理
                 PERFORM 320-BODY-HEN-SEC
      *    帳票印刷処理
                 PERFORM 330-PRINT-OUT-SEC
                 MOVE    1     TO    FLG-PASS
               END-PERFORM
             END-IF
      *
             IF    SKT2210TMP-PAGE-FLG2   =   1
               MOVE  ZERO  TO  FLG-PASS
               MOVE  1     TO  WRK-CNT2
               PERFORM  UNTIL  FLG-PASS   =   1  AND
                        SKT2210TMP-RKOHNUM(WRK-CNT2) = SPACE
      *    １枚目(一般＋退職)
      *    帳票編集<見出し>処理
                 PERFORM 311-HEAD-HEN-SEC 
      *    帳票編集<明細>処理
                 PERFORM 321-BODY-HEN-SEC
      *    帳票印刷処理
                 PERFORM 331-PRINT-OUT-SEC
                 MOVE    1     TO    FLG-PASS
               END-PERFORM
             END-IF
      *
      *    一時ファイル読込
             PERFORM  900-TMP-READ-SEC
           END-PERFORM
      *
           CLOSE    SKT2210TMP-FILE
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
           INITIALIZE                        SKT2210
      *    診療年月
      *=== 旧様式の返戻をまとめて印字 by Yoshikawa(2008/06/17) start
      **---(01.00.05) LINE ADD START ------------------------------------
      **     MOVE    WRK-SRYYMWH           TO  SKT2210-PRTYM
      **
      *     DISPLAY "頭書き時日付"SKT2210TMP-SRYYM
      *     IF  SKT2210TMP-SRYYM  NOT =  ZERO
      *         MOVE  SKT2210TMP-SRYYM    TO  WRK-SYMD (1:6)
      *         DISPLAY "旧"
      *     ELSE
      *         MOVE  LNK-PRTKANRI-SRYYM  TO  WRK-SYMD (1:6)
      *         DISPLAY "新"
      *     END-IF
      *     MOVE    "01"                TO  WRK-SYMD (7:2)
      *     DISPLAY "WRK-SYMD"WRK-SYMD
      *     PERFORM 31012-SEIWA-HEN-SEC
      *     MOVE    WRK-HENYMDG(1:16)   TO  WRK-SRYYMWH 
      **     INITIALIZE                      LNK-DAY2-AREA
      **     MOVE    "21"                TO  LNK-DAY2-IRAI
      **     MOVE    LNK-PRTKANRI-SKYYMD     TO  LNK-DAY2-YMD
      **     CALL    "ORCSDAY"           USING   STS-AREA-DAY
      **                                         LNK-DAY2-AREA
      **     IF      STS-DAY-RC1         =   ZERO 
      **             MOVE    LNK-DAY2-EDTYMD3    TO  WRK-SEIYMDWH
      **     END-IF
      *     MOVE    WRK-SRYYMWH      TO  SKT2210-PRTYM
      *     DISPLAY "WRK-SRYYMWH"WRK-SRYYMWH
      **---(01.00.05) LINE ADD END   ------------------------------------
           MOVE    WRK-SRYYMWH           TO  SKT2210-PRTYM
           IF  SKT2210TMP-SRYYM  NOT =  ZERO
               MOVE  1                   TO  FLG-CHK
           ELSE
               MOVE  ZERO                TO  FLG-CHK
           END-IF
      *=== 旧様式の返戻をまとめて印字 by Yoshikawa(2008/06/17) end
      *    請求年月日
           MOVE    WRK-SEIYMDWH          TO  SKT2210-SEIYMD
      *    医療機関住所
      *=== シス管「1901」対応 By Yoshikawa(2007/10/03) start
      *     MOVE    SYS-1002-ADRS         TO  SKT2210-ADRS
           MOVE    WRK-HOSPADRS          TO  SKT2210-ADRS
      *=== シス管「1901」対応 By Yoshikawa(2007/10/03) end
      *    医療機関名
      *=== シス管「1901」対応 By Yoshikawa(2007/10/03) start
      *     MOVE    SYS-1001-HOSPNAME     TO  SKT2210-HOSPNAME
           MOVE    WRK-HOSPNAME          TO  SKT2210-HOSPNAME
      *=== シス管「1901」対応 By Yoshikawa(2007/10/03) end
      *    開設者名
           MOVE    SYS-1001-KAISETUNAME  TO  SKT2210-KAISETUNAME
      *    電話番号
      *=== シス管「1901」対応 By Yoshikawa(2007/10/03) start
      *     MOVE    SYS-1002-TEL          TO  SKT2210-TEL
           MOVE    WRK-HOSPTEL           TO  SKT2210-TEL
      *=== シス管「1901」対応 By Yoshikawa(2007/10/03) end
      *    保険者番号
           INITIALIZE                        WRK-MAE-INPUT
           MOVE    SKT2210TMP-HKNJANUM   TO  WRK-MAE-INPUT
           PERFORM 2009-HENKAN-SEC
           MOVE    WRK-OUT-INPUT         TO  SKT2210-HKNJANUM
      *    保険者名
           MOVE    SKT2210TMP-HKNJANUM   TO  WRK-HKNJANUM
           PERFORM 920-HKNJAINF-SET-SEC
           IF      HKNJA-HKNJANAME    NOT  =  SPACE
             STRING  HKNJA-HKNJANAME    DELIMITED BY SPACE
                     "  殿"             DELIMITED BY SIZE
                     INTO               SKT2210-HKNJANAME
             END-STRING
           ELSE
             MOVE  "殿"           TO  SKT2210-HKNJANAME(23:2)
           END-IF
      *    医療機関コード
           MOVE    SYS-1001-HOSPCD       TO  SKT2210-HOSPCD
      *    在総診・在医総
           IF    SKT2210TMP-ZAITAKU  =  "1"
             MOVE    "在"                TO  SKT2210-ZAIMOJI
             MOVE    "◯"                TO  SKT2210-ZAIMARU
           END-IF
      *
      *    ページ番号の追加
           MOVE    CNT-PAGE              TO  WRK-Z4
           MOVE    WRK-Z4                TO  SKT2210-NO
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
           IF  WRK-CNT1      =     1
             PERFORM  VARYING  IDX1  FROM    1   BY  1
                      UNTIL    IDX1  >  9
               PERFORM  VARYING  IDX2  FROM  1  BY  1
                        UNTIL    IDX2  >     2
      *    療養の給付：件数
                 MOVE  SKT2210TMP-KENSU(IDX1 IDX2)   TO  WRK-Z5
                 MOVE  WRK-Z5   TO  SKT2210-KENSU(IDX1 IDX2)
      *    療養の給付：日数
                 MOVE  SKT2210TMP-NISSU(IDX1 IDX2)   TO  WRK-Z5
                 MOVE  WRK-Z5   TO  SKT2210-NISSU(IDX1 IDX2)
      *    療養の給付：点数
                 MOVE  SKT2210TMP-TENSU(IDX1 IDX2)   TO  WRK-Z9
                 MOVE  WRK-Z9   TO  SKT2210-TENSU(IDX1 IDX2)
      *    療養の給付：一部負担金
                 MOVE  SKT2210TMP-ITBFTN (IDX1 IDX2) TO  WRK-Z9
                 MOVE  WRK-Z9   TO  SKT2210-ITBFTN(IDX1 IDX2)
               END-PERFORM
      *    食事療養：件数
               MOVE  SKT2210TMP-SKENSU(IDX1)  TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT2210-SKENSU(IDX1)
      *    食事療養：日数
               MOVE  SKT2210TMP-SNISSU(IDX1)  TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT2210-SNISSU(IDX1)
      *    食事療養：金額
               MOVE  SKT2210TMP-SKINGK(IDX1)  TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT2210-SKINGK(IDX1)
      *    食事療養：標準負担額
               MOVE  SKT2210TMP-SFTNGK(IDX1)  TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT2210-SFTNGK(IDX1)
             END-PERFORM
      *
      *    合計編集
             PERFORM  VARYING  IDX1  FROM  1  BY  1
                      UNTIL    IDX1  >     2
      *---(01.00.01) LINE ADD START ------------------------------------
      *         MOVE  SKT2210TMP-GKENSU(IDX1)  TO  WRK-Z5
      *         MOVE  WRK-Z5    TO  SKT2210-GKENSU(IDX1)
      *         MOVE  SKT2210TMP-GKINGK(IDX1)  TO  WRK-Z9
      *         MOVE  WRK-Z9    TO  SKT2210-GKINGK(IDX1)
      *---(01.00.01) LINE ADD END   ------------------------------------
      *
      *    長期
               MOVE  SKT2210TMP-TYOGEN(IDX1)  TO  WRK-Z7
               MOVE  WRK-Z7    TO  SKT2210-TYOKI(IDX1)
             END-PERFORM
           END-IF
      *
      *    公費の印字
           PERFORM  VARYING  IDX3  FROM  1  BY  1
      *---(01.00.05) LINE ADD START ------------------------------------
      *              UNTIL    IDX3  >     4
                    UNTIL    IDX3  >     3
      *---(01.00.05) LINE ADD END   ------------------------------------
                    OR  WRK-CNT1   >     20
                    OR  SKT2210TMP-KOHNUM(WRK-CNT1) = SPACE
             PERFORM  VARYING  IDX2  FROM  1  BY  1
                      UNTIL    IDX2  >     2
      *    療養の給付：件数
               MOVE  SKT2210TMP-K-KENSU(WRK-CNT1 IDX2)   TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT2210-K-KENSU(IDX3 IDX2)
      *    療養の給付：日数
               MOVE  SKT2210TMP-K-NISSU(WRK-CNT1 IDX2)   TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT2210-K-NISSU(IDX3 IDX2)
      *    療養の給付：点数
               MOVE  SKT2210TMP-K-TENSU(WRK-CNT1 IDX2)   TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT2210-K-TENSU(IDX3 IDX2)
      *    療養の給付：一部負担金
               MOVE  SKT2210TMP-K-ITBFTN(WRK-CNT1 IDX2)  TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT2210-K-ITBFTN(IDX3 IDX2)
             END-PERFORM
      *    食事療養：件数
             MOVE  SKT2210TMP-K-SKENSU(WRK-CNT1)         TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT2210-K-SKENSU(IDX3)
      *    食事療養：日数
             MOVE  SKT2210TMP-K-SNISSU(WRK-CNT1)         TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT2210-K-SNISSU(IDX3)
      *    食事療養：金額
             MOVE  SKT2210TMP-K-SKINGK(WRK-CNT1)         TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT2210-K-SKINGK(IDX3)
      *    食事療養：標準負担額
             MOVE  SKT2210TMP-K-SFTNGK(WRK-CNT1)         TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT2210-K-SFTNGK(IDX3)
      *    公費名
             MOVE  SKT2210TMP-KOHNUM (WRK-CNT1)  TO  WRK-KOHNUM
             PERFORM  950-HKNNUM-SET-SEC
             MOVE  HKN-HBTNUM         TO  SKT2210-HBTNUM(IDX3)
      *=== シス管「2007」対応 by Yoshikawa(2008/09/11) start
      *       MOVE  HKN-TANSEIDONAME   TO  SKT2210-KOHNAME(IDX3)      
             IF  SKT2210TMP-KOHNAME (WRK-CNT1)  NOT =  SPACE
               MOVE  SKT2210TMP-KOHNAME (WRK-CNT1)
                                        TO  SKT2210-KOHNAME(IDX3)
             ELSE
               MOVE  HKN-TANSEIDONAME   TO  SKT2210-KOHNAME(IDX3)
             END-IF
      *=== シス管「2007」対応 by Yoshikawa(2008/09/11) end
      *
             ADD  1  TO  WRK-CNT1
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
      *---(01.00.05) LINE ADD START ------------------------------------
      *=== 旧様式の返戻をまとめて印字 by Yoshikawa(2008/06/17) start
      *     DISPLAY "印刷時"WRK-SYMD (1:6)
      *     DISPLAY "固定項目"WRK-CONS-SRYYM-200804
      *     IF  WRK-SYMD (1:6)   >=  WRK-CONS-SRYYM-200804
           IF  FLG-CHK  =  ZERO
      *=== 旧様式の返戻をまとめて印字 by Yoshikawa(2008/06/17) end
             MOVE   "SKT2210.red"        TO  SPRT-PRTID
           ELSE
             MOVE   "SKT2210o.red"        TO  SPRT-PRTID
           END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
           MOVE    "国保請求書"        TO  SPRT-TITLE
           MOVE    SKT2210             TO  SPRT-PRTDATA
           MOVE    LNK-PRTKANRI-TERMID TO  SPRT-TERMID
           MOVE    LNK-PRTKANRI-OPID   TO  SPRT-OPID
           MOVE    LNK-PRTKANRI-PRTNM  TO  SPRT-PRTNM
           CALL    "ORCSPRT"           USING
                                       ORCSPRTAREA
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
                                       SPA-AREA
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
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
      *    帳票編集<ヘッダー部>処理（老人・公費等）
      *****************************************************************
       311-HEAD-HEN-SEC          SECTION.
      *
           ADD     1                     TO  CNT-PAGE
      *
           INITIALIZE                        SKT2220
      *    診療年月
      *     MOVE    WRK-SRYYMWH           TO  SKT2220-PRTYM
      *
      *=== 旧様式の返戻をまとめて印字 by Yoshikawa(2008/06/17) start
      *     DISPLAY "頭書き時日付"SKT2210TMP-SRYYM
      *     IF  SKT2210TMP-SRYYM  NOT =  ZERO
      *         MOVE  SKT2210TMP-SRYYM    TO  WRK-SYMD (1:6)
      *         DISPLAY "旧"
      *     ELSE
      *         MOVE  LNK-PRTKANRI-SRYYM  TO  WRK-SYMD (1:6)
      *         DISPLAY "新"
      *     END-IF
      *     MOVE    "01"                TO  WRK-SYMD (7:2)
      *     DISPLAY "WRK-SYMD"WRK-SYMD
      *     PERFORM 31012-SEIWA-HEN-SEC
      *     MOVE    WRK-HENYMDG(1:16)   TO  WRK-SRYYMWH 
      *=== 旧様式の返戻をまとめて印字 by Yoshikawa(2008/06/17) end
      *     INITIALIZE                      LNK-DAY2-AREA
      *     MOVE    "21"                TO  LNK-DAY2-IRAI
      *     MOVE    LNK-PRTKANRI-SKYYMD     TO  LNK-DAY2-YMD
      *     CALL    "ORCSDAY"           USING   STS-AREA-DAY
      *                                         LNK-DAY2-AREA
      *     IF      STS-DAY-RC1         =   ZERO 
      *             MOVE    LNK-DAY2-EDTYMD3    TO  WRK-SEIYMDWH
      *     END-IF
           MOVE    WRK-SRYYMWH     TO  SKT2220-PRTYM
           DISPLAY "WRK-SRYYMWH"WRK-SRYYMWH
      *    請求年月日
           MOVE    WRK-SEIYMDWH          TO  SKT2220-SEIYMD
      *=== シス管「1901」対応 By Yoshikawa(2007/10/03) start
      *     MOVE    SYS-1002-ADRS         TO  SKT2220-ADRS
           MOVE    WRK-HOSPADRS          TO  SKT2220-ADRS
      *=== シス管「1901」対応 By Yoshikawa(2007/10/03) end
      *    医療機関名
      *=== シス管「1901」対応 By Yoshikawa(2007/10/03) start
      *     MOVE    SYS-1001-HOSPNAME     TO  SKT2220-HOSPNAME
           MOVE    WRK-HOSPNAME          TO  SKT2220-HOSPNAME
      *=== シス管「1901」対応 By Yoshikawa(2007/10/03) end
      *    開設者名
           MOVE    SYS-1001-KAISETUNAME  TO  SKT2220-KAISETUNAME
      *    電話番号
      *=== シス管「1901」対応 By Yoshikawa(2007/10/03) start
      *     MOVE    SYS-1002-TEL          TO  SKT2220-TEL
           MOVE    WRK-HOSPTEL           TO  SKT2220-TEL
      *=== シス管「1901」対応 By Yoshikawa(2007/10/03) end
      *    保険者番号
           INITIALIZE                        WRK-MAE-INPUT
           MOVE    SKT2210TMP-HKNJANUM   TO  WRK-MAE-INPUT
           PERFORM 2009-HENKAN-SEC
           MOVE    WRK-OUT-INPUT         TO  SKT2220-HKNJANUM
      *    保険者名
           MOVE    SKT2210TMP-HKNJANUM   TO  WRK-HKNJANUM
           PERFORM 920-HKNJAINF-SET-SEC
           IF      HKNJA-HKNJANAME    NOT  =  SPACE
             STRING  HKNJA-HKNJANAME    DELIMITED BY SPACE
                     "  殿"             DELIMITED BY SIZE
                     INTO               SKT2220-HKNJANAME
             END-STRING
           ELSE
             MOVE  "殿"           TO  SKT2220-HKNJANAME(23:2)
           END-IF
      *    医療機関コード
           MOVE    SYS-1001-HOSPCD       TO  SKT2220-HOSPCD
      *    在総診・在医総
           IF    SKT2210TMP-ZAITAKU  =  "1"
             MOVE    "在"                TO  SKT2220-ZAIMOJI
             MOVE    "◯"                TO  SKT2220-ZAIMARU
           END-IF
      *
      *    ページ番号の追加
           MOVE    CNT-PAGE              TO  WRK-Z4
           MOVE    WRK-Z4                TO  SKT2220-NO
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
      *    老人編集処理
           
           IF  WRK-CNT2      =     1
             MOVE     ZERO     TO    IDX4
             PERFORM  VARYING  IDX1  FROM   10   BY  1
                      UNTIL    IDX1  >  11
               ADD  1  TO  IDX4
               PERFORM  VARYING  IDX2  FROM  1  BY  1
                        UNTIL    IDX2  >     2
      *    療養の給付：件数
                 MOVE  SKT2210TMP-KENSU(IDX1 IDX2)  TO  WRK-Z5
                 MOVE  WRK-Z5   TO  SKT2220-KENSU(IDX4 IDX2)
      *    療養の給付：日数
                 MOVE  SKT2210TMP-NISSU(IDX1 IDX2)  TO  WRK-Z5
                 MOVE  WRK-Z5   TO  SKT2220-NISSU(IDX4 IDX2)
      *    療養の給付：点数
                 MOVE  SKT2210TMP-TENSU(IDX1 IDX2)  TO  WRK-Z9
                 MOVE  WRK-Z9   TO  SKT2220-TENSU(IDX4 IDX2)
      *    療養の給付：一部負担金
                 MOVE  SKT2210TMP-ITBFTN(IDX1 IDX2) TO  WRK-Z9
                 MOVE  WRK-Z9  TO  SKT2220-ITBFTN(IDX4 IDX2)
               END-PERFORM
      *    食事療養：件数
               MOVE  SKT2210TMP-SKENSU(IDX1)  TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT2220-SKENSU(IDX4)
      *    食事療養：日数
               MOVE  SKT2210TMP-SNISSU(IDX1)  TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT2220-SNISSU(IDX4)
      *    食事療養：金額
               MOVE  SKT2210TMP-SKINGK(IDX1)  TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT2220-SKINGK(IDX4)
      *    食事療養：標準負担額
               MOVE  SKT2210TMP-SFTNGK(IDX1)  TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT2220-SFTNGK(IDX4)
             END-PERFORM
      *
      *    長期
             PERFORM  VARYING  IDX1  FROM  3  BY  1
                      UNTIL    IDX1  >     4
               COMPUTE  IDX4  =  IDX1  -   2
               MOVE  SKT2210TMP-TYOGEN(IDX1)  TO  WRK-Z7
               MOVE  WRK-Z7    TO  SKT2220-TYOKI(IDX4)
             END-PERFORM
           END-IF
      *
      *    公費の印字
           PERFORM  VARYING  IDX3  FROM  1  BY  1
                    UNTIL    IDX3  >     4
                    OR  WRK-CNT2   >     20
                    OR  SKT2210TMP-RKOHNUM(WRK-CNT2) = SPACE
             PERFORM  VARYING  IDX2  FROM  1  BY  1
                      UNTIL    IDX2  >     2
      *    療養の給付：件数
               MOVE  SKT2210TMP-K-RKENSU(WRK-CNT2 IDX2)   TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT2220-K-KENSU(IDX3 IDX2)
      *    療養の給付：日数
               MOVE  SKT2210TMP-K-RNISSU(WRK-CNT2 IDX2)   TO  WRK-Z5
               MOVE  WRK-Z5   TO  SKT2220-K-NISSU(IDX3 IDX2)
      *    療養の給付：点数
               MOVE  SKT2210TMP-K-RTENSU(WRK-CNT2 IDX2)   TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT2220-K-TENSU(IDX3 IDX2)
      *    療養の給付：一部負担金
               MOVE  SKT2210TMP-K-RITBFTN(WRK-CNT2 IDX2)  TO  WRK-Z9
               MOVE  WRK-Z9   TO  SKT2220-K-ITBFTN(IDX3 IDX2)
             END-PERFORM
      *    食事療養：件数
             MOVE  SKT2210TMP-K-RSKENSU(WRK-CNT2)         TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT2220-K-SKENSU(IDX3)
      *    食事療養：日数
             MOVE  SKT2210TMP-K-RSNISSU(WRK-CNT2)         TO  WRK-Z5
             MOVE  WRK-Z5   TO  SKT2220-K-SNISSU(IDX3)
      *    食事療養：金額
             MOVE  SKT2210TMP-K-RSKINGK(WRK-CNT2)         TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT2220-K-SKINGK(IDX3)
      *    食事療養：標準負担額
             MOVE  SKT2210TMP-K-RSFTNGK(WRK-CNT2)         TO  WRK-Z9
             MOVE  WRK-Z9   TO  SKT2220-K-SFTNGK(IDX3)
      *    公費名
             MOVE  SKT2210TMP-RKOHNUM (WRK-CNT2)  TO  WRK-KOHNUM
             PERFORM  950-HKNNUM-SET-SEC
             MOVE  HKN-HBTNUM         TO  SKT2220-HBTNUM(IDX3)
      *=== シス管「2007」対応 by Yoshikawa(2008/09/11) start
      *       MOVE  HKN-TANSEIDONAME   TO  SKT2220-KOHNAME(IDX3)      
             IF  SKT2210TMP-KOHNAME (WRK-CNT2)  NOT =  SPACE
               MOVE  SKT2210TMP-KOHNAME (WRK-CNT2)
                                      TO  SKT2220-KOHNAME(IDX3)
             ELSE
               MOVE  HKN-TANSEIDONAME TO  SKT2220-KOHNAME(IDX3)
             END-IF
      *=== シス管「2007」対応 by Yoshikawa(2008/09/11) end
      *
             ADD  1  TO  WRK-CNT2
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
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE   "SKT2220.red"        TO  SPRT-PRTID
           MOVE   "SKT2220o.red"        TO  SPRT-PRTID
      *---(01.00.05) LINE ADD END   ------------------------------------
           MOVE    "国保請求書"        TO  SPRT-TITLE
           MOVE    SKT2220             TO  SPRT-PRTDATA
           MOVE    LNK-PRTKANRI-TERMID TO  SPRT-TERMID
           MOVE    LNK-PRTKANRI-OPID   TO  SPRT-OPID
           MOVE    LNK-PRTKANRI-PRTNM  TO  SPRT-PRTNM
           CALL    "ORCSPRT"           USING
                                       ORCSPRTAREA
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
                                       SPA-AREA
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
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
      *    公費ソート処理
      *****************************************************************
       KOH-SORT-SEC          SECTION.
      *
      *
           INITIALIZE  SORT-AREA
      *    公費数を取得
           MOVE    ZERO    TO    IDX-MAX
                                 IDX2 
           MOVE    SPACE   TO    WRK-KOHNUM
           PERFORM  VARYING  IDX1  FROM  1  BY  1
                    UNTIL    IDX1  >  20
             IF  SKT2210TMP-KOHNUM(IDX1)  =  SPACE
               MOVE  20    TO    IDX1
             ELSE
               IF    WRK-KOHNUM               =   SPACE   OR
                     SKT2210TMP-KOHNUM(IDX1)  <   WRK-KOHNUM
                 MOVE     IDX1                TO  IDX2
                 MOVE     SKT2210TMP-KOHNUM(IDX1) TO  WRK-KOHNUM
               END-IF
               ADD   1     TO    IDX-MAX
             END-IF
           END-PERFORM
           IF     IDX2     >     ZERO
             MOVE    SKT2210TMP-KOH-TBL(IDX2) TO  SORT-KOH-TBL(1)
           END-IF
      *
      *
           IF      IDX-MAX    >     ZERO
             MOVE    2    TO    IDX1
             MOVE    1    TO    IDX2
             MOVE    1    TO    IDX3
             MOVE   "999"   TO    WRK-KOHNUM
             PERFORM    UNTIL    IDX1  >    IDX-MAX
               PERFORM  VARYING  IDX2  FROM  1  BY  1
                        UNTIL    IDX2  >    IDX-MAX
                 IF  SKT2210TMP-KOHNUM(IDX2)  >   SORT-KOHNUM(IDX1 - 1)
                   IF  SKT2210TMP-KOHNUM(IDX2)  <  WRK-KOHNUM
                     MOVE  SKT2210TMP-KOHNUM(IDX2)  TO WRK-KOHNUM
                     MOVE  IDX2          TO    IDX3
                   END-IF
                 END-IF
               END-PERFORM
               MOVE  SKT2210TMP-KOH-TBL(IDX3)  TO  SORT-KOH-TBL(IDX1)
               MOVE  "999"  TO    WRK-KOHNUM
               ADD   1    TO    IDX1
             END-PERFORM
           END-IF
      *
           INITIALIZE             SKT2210TMP-KOH-AREA
           MOVE  SORT-AREA  TO    SKT2210TMP-KOH-AREA
      *
      *
           INITIALIZE  SORT-AREA
      *    公費数を取得
           MOVE    ZERO    TO    IDX-MAX
                                 IDX2 
           MOVE    SPACE   TO    WRK-KOHNUM
           PERFORM  VARYING  IDX1  FROM  1  BY  1
                    UNTIL    IDX1  >  20
             IF  SKT2210TMP-RKOHNUM(IDX1)  =  SPACE
               MOVE  20    TO    IDX1
             ELSE
               IF    WRK-KOHNUM               =   SPACE   OR
                     SKT2210TMP-RKOHNUM(IDX1)  <   WRK-KOHNUM
                 MOVE     IDX1                TO  IDX2
                 MOVE     SKT2210TMP-RKOHNUM(IDX1) TO  WRK-KOHNUM
               END-IF
               ADD   1     TO    IDX-MAX
             END-IF
           END-PERFORM
           IF     IDX2     >     ZERO
             MOVE    SKT2210TMP-RKOH-TBL(IDX2) TO  SORT-KOH-TBL(1)
           END-IF
      *
           IF      IDX-MAX    >     ZERO
             MOVE    2    TO    IDX1
             MOVE    1    TO    IDX2
             MOVE    1    TO    IDX3
             MOVE   "999"   TO    WRK-KOHNUM
             PERFORM    UNTIL    IDX1  >    IDX-MAX
               PERFORM  VARYING  IDX2  FROM  1  BY  1
                        UNTIL    IDX2  >    IDX-MAX
                 IF  SKT2210TMP-RKOHNUM(IDX2) > SORT-KOHNUM(IDX1 - 1)
                   IF  SKT2210TMP-RKOHNUM(IDX2)  <  WRK-KOHNUM
                     MOVE  SKT2210TMP-RKOHNUM(IDX2)  TO WRK-KOHNUM
                     MOVE  IDX2          TO    IDX3
                   END-IF
                 END-IF
               END-PERFORM
               MOVE  SKT2210TMP-RKOH-TBL(IDX3)  TO  SORT-KOH-TBL(IDX1)
               MOVE  "999"  TO    WRK-KOHNUM
               ADD   1    TO    IDX1
             END-PERFORM
           END-IF
      *
           INITIALIZE             SKT2210TMP-RKOH-AREA
           MOVE  SORT-AREA  TO    SKT2210TMP-RKOH-AREA
      *
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
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
               MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
               MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
               MOVE    WRK-PARA-SHELLID
                                       TO  JOB-SHELLID
               MOVE    WRK-RECEERR     TO  JOB-YOBI
               MOVE    "9999"          TO  JOB-ERRCD
               CALL    "ORCSJOB"       USING
                                       ORCSJOBKANRIAREA  
                                       JOBKANRI-REC
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
                                       SPA-AREA
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
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
      *
                   MOVE    LNK-PRTKANRI-SRYYM
                                           TO  RECE10-SKYYM
                   MOVE    LNK-PRTKANRI-SKYYMD
                                           TO  RECE10-UPDYMD
      *
                   MOVE    RECE10-REC      TO  MCPDATA-REC
                   MOVE    "DBUPDATE"      TO  MCP-FUNC
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *             MOVE    PATH-TBL-SEIKYU-KEY    TO  MCP-PATH
      *             CALL    "MCPSUB"             USING
      *                                          MCPAREA
      *                                          MCPDATA-REC
                   MOVE    "tbl_seikyu"    TO  MCP-TABLE
                   MOVE    "key"           TO  MCP-PATHNAME
                   CALL    "ORCDBMAIN"     USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
                   IF      MCP-RC          =   ZERO
                       PERFORM 900-UPD-FILE-READ-SEC
                   ELSE
                       DISPLAY "UPD ERR KEY="  RECE10-KEY 
                       MOVE  "*** SOKATU2210 SEIKYU UPD ERR ***"
                                           TO  WRK-RECEERR
                       MOVE    RECE10-KEY  TO  WRK-RECEERR(33:)
                       PERFORM 500-ERR-HENSYU-SEC
                       MOVE    1           TO  FLG-UPDFILE
                   END-IF
               ELSE
                       DISPLAY "INV ERR KEY="  RECE10-KEY 
                   MOVE  "*** SOKATU2210 SEIKYU INVALID ***"
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
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *     MOVE  SYS-1001-HOSPID             TO  HKNJA-HOSPID
           MOVE  SPA-HOSPNUM                 TO  HKNJA-HOSPNUM
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
           MOVE  WRK-HKNJANUM                TO  HKNJA-HKNJANUM
           MOVE  HKNJAINF-REC                TO  MCPDATA-REC
           MOVE  "DBSELECT"                  TO  MCP-FUNC
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *     MOVE  PATH-TBL-HKNJAINF-KEY       TO  MCP-PATH
      *     CALL  "MCPSUB"             USING
      *                                MCPAREA
      *                                MCPDATA-REC
           MOVE  "tbl_hknjainf"       TO  MCP-TABLE
           MOVE  "key"                TO  MCP-PATHNAME
           CALL  "ORCDBMAIN"          USING
                                      MCPAREA
                                      MCPDATA-REC
                                      SPA-AREA
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
           IF  MCP-RC  =  ZERO
             PERFORM  925-HKNJAINF-READ-SEC
      *
      *    静岡市の新保険者番号でも静岡市と表示されるように対応
             IF  SKT2210TMP-HKNJANUM  =  "224006"  AND
                 HKNJA-HKNJANAME  =  SPACE
               MOVE  "静岡市"        TO  HKNJA-HKNJANAME
             END-IF
      *
             MOVE  HKNJA-HKNJANAME   TO  WRK-HKNJANAME
           ELSE
             DISPLAY  "HKNJAINF SELECT ERR"
           END-IF
      *
           INITIALIZE  MCPAREA
           MOVE  "DBCLOSECURSOR"         TO  MCP-FUNC
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *     MOVE  PATH-TBL-HKNJAINF-KEY   TO  MCP-PATH
      *     CALL  "MCPSUB"         USING
      *                            MCPAREA
      *                            MCPDATA-REC
           MOVE  "tbl_hknjainf"          TO  MCP-TABLE
           MOVE  "key"                   TO  MCP-PATHNAME
           CALL  "ORCDBMAIN"             USING
                                         MCPAREA
                                         MCPDATA-REC
                                         SPA-AREA
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
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
           MOVE  "DBFETCH"              TO  MCP-FUNC
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *     MOVE  PATH-TBL-HKNJAINF-KEY  TO  MCP-PATH
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC
           MOVE  "tbl_hknjainf"         TO  MCP-TABLE
           MOVE  "key"                  TO  MCP-PATHNAME
           CALL  "ORCDBMAIN"            USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
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
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *     MOVE  SYS-1001-HOSPID             TO  HKN-HOSPID
           MOVE  SPA-HOSPNUM                 TO  HKN-HOSPNUM
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
           MOVE  WRK-KOHNUM                  TO  HKN-HKNNUM
           MOVE  HKNNUM-REC                  TO  MCPDATA-REC
           MOVE  "DBSELECT"                  TO  MCP-FUNC
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *     MOVE  PATH-TBL-HKNNUM-KEY2        TO  MCP-PATH
      *     CALL  "MCPSUB"             USING
      *                                MCPAREA
      *                                MCPDATA-REC
           MOVE  "tbl_hknnum"                TO  MCP-TABLE
           MOVE  "key2"                      TO  MCP-PATHNAME
           CALL  "ORCDBMAIN"                 USING
                                             MCPAREA
                                             MCPDATA-REC
                                             SPA-AREA
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
           IF  MCP-RC  =  ZERO
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *       MOVE  PATH-TBL-HKNNUM-KEY2      TO  MCP-PATH
             MOVE  "tbl_hknnum"              TO  MCP-TABLE
             MOVE  "key2"                    TO  MCP-PATHNAME
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
             PERFORM  955-HKNNUM-READ-SEC
           ELSE
             DISPLAY  "HKNNUM SELECT ERR"
           END-IF
      *
           INITIALIZE  MCPAREA
           MOVE  "DBCLOSECURSOR"         TO  MCP-FUNC
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *     MOVE  PATH-TBL-HKNNUM-KEY2    TO  MCP-PATH
      *     CALL  "MCPSUB"         USING
      *                            MCPAREA
      *                            MCPDATA-REC
           MOVE  "tbl_hknnum"            TO  MCP-TABLE
           MOVE  "key2"                  TO  MCP-PATHNAME
           CALL  "ORCDBMAIN"             USING
                                         MCPAREA
                                         MCPDATA-REC
                                         SPA-AREA
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
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
           MOVE  "DBFETCH"    TO  MCP-FUNC
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC
           CALL  "ORCDBMAIN"  USING
                              MCPAREA
                              MCPDATA-REC
                              SPA-AREA
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
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
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *     MOVE   SYS-1001-HOSPID       TO    RECE10-HOSPID.
           MOVE   SPA-HOSPNUM           TO    RECE10-HOSPNUM.
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
           MOVE   LNK-PRTKANRI-SRYYM    TO    RECE10-SKYYM.
      *
           IF    WRK-PARA-HKNJANUM  NOT = ZERO
      *---(01.00.02) LINE ADD START ------------------------------------
      *         MOVE  WRK-PARA-HKNJANUM     TO  RECE10-XXSTHKNJANUM
      *                                         RECE10-XXEDHKNJANUM
               EVALUATE  WRK-PARA-HKNJANUM(1:3)
      *      名古屋市
               WHEN "234"
                 MOVE  "234000"            TO  RECE10-XXSTHKNJANUM
                 MOVE  "234999"            TO  RECE10-XXEDHKNJANUM
      *      静岡市
               WHEN "224"
                 MOVE  "224000"            TO  RECE10-XXSTHKNJANUM
                 MOVE  "224999"            TO  RECE10-XXEDHKNJANUM
      *      浜松市
               WHEN "225"
                 MOVE  "225000"            TO  RECE10-XXSTHKNJANUM
                 MOVE  "225999"            TO  RECE10-XXEDHKNJANUM
               WHEN OTHER
                 MOVE  WRK-PARA-HKNJANUM   TO  RECE10-XXSTHKNJANUM
                                               RECE10-XXEDHKNJANUM
               END-EVALUATE
      *---(01.00.02) LINE ADD END   ------------------------------------
           ELSE
               MOVE    SPACE               TO  RECE10-XXSTHKNJANUM
               MOVE    "99999999"          TO  RECE10-XXEDHKNJANUM
           END-IF
      *
           MOVE    RECE10-REC              TO  MCPDATA-REC
           MOVE    "DBSELECT"              TO  MCP-FUNC
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *     MOVE    WRK-PATH            TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_seikyu"            TO  MCP-TABLE
           MOVE    WRK-PATH                TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
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
           MOVE    "DBFETCH"               TO  MCP-FUNC
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *     MOVE    WRK-PATH            TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE     "tbl_seikyu"           TO  MCP-TABLE
           MOVE     WRK-PATH               TO  MCP-PATHNAME
           CALL     "ORCDBMAIN"            USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
           IF      MCP-RC              =   ZERO
               MOVE    ZERO                TO  FLG-END
               MOVE    MCPDATA-REC         TO  RECE10-REC
      *
      *        テスト患者のときは読み飛ばす
               MOVE    SPACE               TO  PTINF-REC
               INITIALIZE                      PTINF-REC
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *         MOVE    RECE10-HOSPID       TO  PTINF-HOSPID
               MOVE    SPA-HOSPNUM         TO  PTINF-HOSPNUM
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
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
               MOVE    1                   TO  FLG-END
           END-IF
      *
           .
       900-SEIKYU-READ-EXT.
           EXIT.
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *****************************************************************
      *    請求管理クローズ
      *****************************************************************
       900-SEIKYU-CLOSE-SEC         SECTION.
      *
           MOVE    "DBCLOSECURSOR"      TO  MCP-FUNC
           MOVE    "tbl_seikyu"         TO  MCP-TABLE
           MOVE    WRK-PATH             TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
           .
       900-SEIKYU-CLOSE-EXT.
           EXIT.
      *---(01.00.05) LINE ADD END   ------------------------------------
      *****************************************************************
      *    患者マスタ読込
      *****************************************************************
       800-PTINF-READ-SEC         SECTION.
      *
           MOVE    "DBSELECT"              TO  MCP-FUNC
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *     MOVE    PATH-TBL-PTINF-KEY      TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_ptinf"             TO  MCP-TABLE
           MOVE    "key"                   TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"               TO  MCP-FUNC
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *         MOVE    PATH-TBL-PTINF-KEY         TO  MCP-PATH
      *         CALL    "MCPSUB"             USING
      *                                      MCPAREA
      *                                      MCPDATA-REC
               MOVE    "tbl_ptinf"             TO  MCP-TABLE
               MOVE    "key"                   TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"             USING
                                               MCPAREA
                                               MCPDATA-REC
                                               SPA-AREA
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
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
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *     MOVE    PATH-TBL-PTINF-KEY         TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_ptinf"                 TO  MCP-TABLE
           MOVE    "key"                       TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"                 USING
                                               MCPAREA
                                               MCPDATA-REC
                                               SPA-AREA
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
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
           READ    SKT2210TMP-FILE
               INVALID    KEY
                   MOVE    1           TO  FLG-SKT2210TMP
               NOT INVALID  KEY
                   MOVE    ZERO        TO  FLG-SKT2210TMP
           END-READ
           .
       900-SKTTMP-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    一時ファイル読込
      *****************************************************************
       900-TMP-READ-SEC                SECTION.
      *
           READ  SKT2210TMP-FILE   NEXT
               AT  END
                   MOVE  1  TO  FLG-PRINT
           END-READ
           .
       900-TMP-READ-EXT.
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
           MOVE    "DBSELECT"                   TO  MCP-FUNC
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *     MOVE    PATH-TBL-SYSKANRI-KEY10      TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_syskanri"               TO  MCP-TABLE
           MOVE    "key10"                      TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"                  USING
                                                MCPAREA
                                                MCPDATA-REC
                                                SPA-AREA
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                    TO  MCP-FUNC
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *         MOVE    PATH-TBL-SYSKANRI-KEY10      TO  MCP-PATH
      *         CALL    "MCPSUB"             USING
      *                                      MCPAREA
      *                                      MCPDATA-REC
               MOVE    "tbl_syskanri"               TO  MCP-TABLE
               MOVE    "key10"                      TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"                  USING
                                                    MCPAREA
                                                    MCPDATA-REC
                                                    SPA-AREA
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
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
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *     MOVE    PATH-TBL-SYSKANRI-KEY10      TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_syskanri"               TO  MCP-TABLE
           MOVE    "key10"                      TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"                  USING
                                                MCPAREA
                                                MCPDATA-REC
                                                SPA-AREA
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
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
           MOVE    "DBSELECT"                 TO  MCP-FUNC
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *     MOVE    PATH-TBL-SEIKYU-KEY        TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_seikyu"               TO  MCP-TABLE
           MOVE    "key"                      TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"                USING
                                              MCPAREA
                                              MCPDATA-REC
                                              SPA-AREA
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                  TO  MCP-FUNC
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *         MOVE    PATH-TBL-SEIKYU-KEY        TO  MCP-PATH
      *         CALL    "MCPSUB"             USING
      *                                      MCPAREA
      *                                      MCPDATA-REC
               MOVE    "tbl_seikyu"               TO  MCP-TABLE
               MOVE    "key"                      TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"                USING
                                                  MCPAREA
                                                  MCPDATA-REC
                                                  SPA-AREA
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
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
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *     MOVE    PATH-TBL-SEIKYU-KEY        TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_seikyu"               TO  MCP-TABLE
           MOVE    "key"                      TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"                USING
                                              MCPAREA
                                              MCPDATA-REC
                                              SPA-AREA
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
      *
           .
       910-SEIKYU-INV-EXT.
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
      *=== シス管「2007」対応 by Yoshikawa(2008/09/11) start
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
      *=== シス管「2007」対応 by Yoshikawa(2008/09/11) end
      *=== シス管「1901」対応 By Yoshikawa(2007/10/03) start
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
      *=== シス管「1901」対応 By Yoshikawa(2007/10/03) end
      *****************************************************************
      *    ＤＢ　オープン処理
      *****************************************************************
       100-DBOPEN-SEC                SECTION.
      *
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
           MOVE    "DBOPEN"            TO  MCP-FUNC.
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
      *
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
           MOVE    "DBSTART"           TO  MCP-FUNC.
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
      *
           .
       100-DBOPEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    ＤＢ　クローズ処理
      *****************************************************************
       900-DBDISCONNECT-SEC            SECTION.
      *
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
           MOVE    "DBCOMMIT"          TO  MCP-FUNC.
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
      *
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
           MOVE    "DBDISCONNECT"      TO  MCP-FUNC.
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
      *
           .
       900-DBDISCONNECT-EXT.
           EXIT.
