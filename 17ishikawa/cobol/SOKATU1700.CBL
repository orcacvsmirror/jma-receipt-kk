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
       PROGRAM-ID.             SOKATU1700.
      *****************************************************************
      *  システム名        : ＯＲＣＡ
      *  サブシステム名    : 月次帳票
      *  コンポーネント名  : 石川・国保総括票
      *  管理者            : 
      *  作成日付    作業者        記述
      *  05/11/08    山口          再作成(2.5.0対応)
      *****************************************************************
      *  プログラム修正履歴
      * Maj/Min/Rev    修正者	日付		内容
      *  01.00.01      内田     06/11/28    帳票様式の変更に伴う修正
      *                                     食事がない場合でも生活療養費を印字
      *  01.00.02      内田     07/07/27    日レセver4.0対応
      *                                     システム管理マスタ「1901」の
      *                                     医療機関情報を参照
      *                                     返戻対応
      *****************************************************************
       ENVIRONMENT                 DIVISION.
       CONFIGURATION               SECTION.
       INPUT-OUTPUT                SECTION.
       FILE-CONTROL.

      *    請求書一時ファイル  
           SELECT  SKT1700TMP-FILE ASSIGN    SKT1700TP
                                   ORGANIZATION    IS  INDEXED
                                   ACCESS  MODE    IS  DYNAMIC
                                   RECORD  KEY     IS  SKT1700TMP-KEY
                                   FILE    STATUS  IS  STS-SKT1700.
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
      *
       DATA                        DIVISION.
       FILE                        SECTION.
      *
      *    請求書一時ファイル
       FD  SKT1700TMP-FILE.
           COPY    "CPSKT1700TMP.INC".
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
       WORKING-STORAGE             SECTION.
      *
      *    請求書一時ファイル 名称領域 
           COPY    "CPCOMMONDAT2.INC"
                                   REPLACING  //RECE01PARA//
                                   BY         //SKT1700TP//.
      *
006900*    請求ＤＢ更新用ファイル 名称領域 
           COPY    "CPCOMMONDAT2.INC"
                                   REPLACING  //RECE01PARA//
                                   BY         //RECEUPD//.
           03  FILLER              PIC X(04)   VALUE   ".dat".
      *
      *    エラーファイル 名称領域 
      *---(01.00.02) LINE ADD START ------------------------------------
      *     COPY    "CPCOMMONDAT2.INC"
      *                             REPLACING  //RECE01PARA//
      *                             BY         //RECEERR//.
      *     03  FILLER              PIC X(04)   VALUE   ".dat".
           COPY    "CPERRFL.INC"    REPLACING  //ERRFLPARA//
                                    BY         //RECEERR//.
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
      *    シェル用領域
           COPY    "CPCOMMONSHELL.INC".
      *
           COPY    "SKT1700.INC".
           COPY    "SKT1701.INC".
      *
      *    スパ領域
       01  STS-AREA.
           03  STS-SKT1700         PIC X(02).
           03  STS-RECE10          PIC X(02).
           03  STS-RECEERR         PIC X(02).
           03  STS-RECEUPD         PIC X(02).
           03  STS-SRYKA           PIC X(02).
      *
      *    フラグ領域
       01  FLG-AREA.
           03  FLG-END             PIC 9(01).
           03  FLG-SKT1700TMP      PIC 9(01).
           03  FLG-RECE10          PIC 9(01).
           03  FLG-SYSKANRI        PIC 9(01).
           03  FLG-UPD             PIC 9(01).
           03  FLG-UPDFILE         PIC 9(01).
           03  FLG-SEIKYU          PIC 9(01).
           03  FLG-PTINF           PIC 9(01).
           03  FLG-PRINT           PIC 9(01).
      *
      *    添字領域
       01  IDX-AREA.
           03  IDX1                PIC 9(04).
           03  IDX2                PIC 9(04).
           03  IDX3                PIC 9(04).
           03  IDX4                PIC 9(04).
           03  IDX5                PIC 9(04).
      *
      *
      *##  パラメタ領域（地方公費仕様）
       01  WRK-PARA.
           COPY    "CPORCSPRTLNK.INC".
           03  WRK-PARA-JOBID      PIC 9(07).
           03  WRK-PARA-SHELLID    PIC X(08).
      *---(01.00.02) LINE ADD START ------------------------------------
      *     03  WRK-PARA-HOSPID     PIC X(24).
           03  WRK-PARA-HOSPNUM    PIC 9(02).
      *---(01.00.02) LINE ADD END   ------------------------------------
           03  WRK-PARA-PAGE       PIC 9(10).
      *---(01.00.02) LINE ADD START ------------------------------------
           03  WRK-PARA-SYOKBN     PIC X(01).
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
      *
      *    一時領域
       01  WRK-AREA.
           03  WRK-SEIYMD          PIC X(08).
           03  WRK-SEIYMDWH        PIC X(22).
           03  WRK-SRYYMWH         PIC X(16).
           03  WRK-SRYYMD          PIC X(08).
      *
      *  
           03  WRK-SYMD.
               05  WRK-SYY         PIC 9(04).
               05  WRK-SMM         PIC 9(02).
               05  WRK-SDD         PIC 9(02).
           03  WRK-HENYMDG         PIC X(22).
      *
           03  WRK-Z5              PIC Z,ZZZ.
           03  WRK-Z7              PIC ZZZ,ZZZ.
           03  WRK-Z9              PIC Z,ZZZ,ZZZ.
      *
           03  WRK-RECEERR         PIC X(200).
      *
      *    文字変換
           03  WRK-MAE-INPUT       PIC X(200).
           03  WRK-OUT-INPUT       PIC X(200).
      *
      *---(01.00.02) LINE ADD START ------------------------------------
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
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
      *    カウント領域
       01  CNT-AREA.
           03  CNT-LINE            PIC 9(02).
           03  CNT-PAGE            PIC 9(03).
           03  CNT-RECE10          PIC 9(06).
           03  CNT-UPDFILE         PIC 9(06).
           03  CNT-IN              PIC 9(02).
      *
           COPY    "CPSHELLTBL.INC".
      *
      *---(01.00.02) LINE ADD START ------------------------------------
      *     COPY    "ORCA-DBPATH".
           COPY    "COMMON-SPA".
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
      *****************************************************************
      *    ファイルレイアウト
      *****************************************************************
      *
      *    患者
       01  PTINF-REC.
           COPY    "CPPTINF.INC".
      *
      *    医療機関情報情報
           COPY    "CPSK1001.INC".
      *
      *    医療機関情報−所在地、連絡先
           COPY    "CPSK1002.INC".
      *
      *---(01.00.02) LINE ADD START ------------------------------------
      *    医療機関編集情報
           COPY    "CPSK1900.INC".
      *
      *    医療機関名称編集情報
           COPY    "CPSK1901.INC".
      *
      *    医療機関住所編集情報
           COPY    "CPSK1902.INC".
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
      *    診療科目情報
           COPY    "CPSK1005.INC".
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
      *
           DISPLAY  "START"
      *
           PERFORM 100-DBOPEN-SEC
      *
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
      *---(01.00.02) LINE ADD START ------------------------------------
      *                                         WRK-PARA-JOBID
      *                                         WRK-PARA-SHELLID
      *                                         WRK-PARA-HOSPID
                                               WRK-PARA-HOSPNUM
                                               WRK-PARA-JOBID
                                               WRK-PARA-SHELLID
                                               WRK-PARA-SYOKBN
                                               RECEERR
      *---(01.00.02) LINE ADD END   ------------------------------------
           END-UNSTRING
      *---(01.00.02) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  SPA-HOSPNUM
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
      *    ステップ管理開始処理
           MOVE    "STS"               TO  SJOBKANRI-MODE
           INITIALIZE                      JOBKANRI-REC
      *---(01.00.02) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM         TO  JOB-HOSPNUM
      *---(01.00.02) LINE ADD END   ------------------------------------
           MOVE    WRK-PARA-JOBID      TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID    TO  JOB-SHELLID
           MOVE    "SOKATU1700"        TO  JOB-PGID
           MOVE    "国保総括票"        TO  JOB-SHELLMSG
           CALL    "ORCSJOB"           USING
                                       ORCSJOBKANRIAREA
                                       JOBKANRI-REC
      *---(01.00.02) LINE ADD START ------------------------------------
                                       SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
           MOVE    "SKT1700TP"         TO  SKT1700TP-FILE-ID
           MOVE    LNK-PRTKANRI-TERMID TO  SKT1700TP-TERMID
      *---(01.00.02) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  SKT1700TP-HOSPNUM
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
           MOVE    "RECEUPD"           TO  RECEUPD-FILE-ID
           MOVE    LNK-PRTKANRI-TERMID TO  RECEUPD-TERMID
      *---(01.00.02) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  RECEUPD-HOSPNUM
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
      *---(01.00.02) LINE ADD START ------------------------------------
      *     MOVE    "RECEERR"           TO  RECEERR-FILE-ID
      *     MOVE    LNK-PRTKANRI-TERMID TO  RECEERR-TERMID
      *---(01.00.02) LINE ADD START ------------------------------------
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
      *    医療機関ＩＤ編集
           INITIALIZE                  SYS-1001-REC
           MOVE    "1001"              TO  SYS-1001-KANRICD
           MOVE    "*"                 TO  SYS-1001-KBNCD
           MOVE    LNK-PRTKANRI-SRYYM(1:6)
                                       TO  SYS-1001-STYUKYMD(1:6)
                                           SYS-1001-EDYUKYMD(1:6)
           MOVE    "01"                TO  SYS-1001-STYUKYMD(7:2)
                                           SYS-1001-EDYUKYMD(7:2)
      *---(01.00.02) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM         TO  SYS-1001-HOSPNUM
      *---(01.00.02) LINE ADD END   ------------------------------------
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
      *---(01.00.02) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM         TO  SYS-1002-HOSPNUM
      *---(01.00.02) LINE ADD END   ------------------------------------
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
      *---(01.00.02) LINE ADD START ------------------------------------
           MOVE    SYS-1001-HOSPNAME   TO  WRK-HOSPNAME
           MOVE    SYS-1002-ADRS       TO  WRK-HOSPADRS
           MOVE    SYS-1002-TEL        TO  WRK-HOSPTEL
      *    医療機関編集情報
           PERFORM 900-1900-READ-SEC
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
           OPEN    OUTPUT  UPD-FILE
      *
      *---(01.00.02) LINE ADD START ------------------------------------
           EVALUATE    WRK-PARA-SYOKBN
               WHEN    "2"
                   MOVE    "key37"     TO  WRK-PATH
               WHEN    "1"
                   MOVE    "key38"     TO  WRK-PATH
           END-EVALUATE
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
           PERFORM 900-SEIKYU-SELECT-SEC
           .
       100-INIT-EXT.
           EXIT.
      *
      *****************************************************************
      *    主　　処理
      *****************************************************************
       200-MAIN-SEC                SECTION.
      *
           OPEN     OUTPUT  SKT1700TMP-FILE
           CLOSE            SKT1700TMP-FILE
           OPEN     I-O     SKT1700TMP-FILE
      *
           MOVE     ZERO    TO      FLG-END
           MOVE     ZERO    TO      FLG-UPD
      *
           PERFORM  2001-KOKUHO-SYUKEI-SEC
                    UNTIL   FLG-END   =   1
      *
      *
           CLOSE   UPD-FILE
           CLOSE   SKT1700TMP-FILE
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
           DISPLAY "*** SOKATU1700 IN  "  CNT-RECE10 
           DISPLAY "*** SOKATU1700 END ***"
      *
      *    ステップ終了処理
           MOVE    "STE"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
      *
           MOVE    WRK-PARA-PAGE   TO  JOB-UPDCNT
      *---(01.00.02) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.02) LINE ADD END   ------------------------------------
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA
                                   JOBKANRI-REC
      *---(01.00.02) LINE ADD START ------------------------------------
                                   SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
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
           INITIALIZE       SKT1700TMP-REC
      *
      *---(01.00.01) LINE ADD START ------------------------------------
      *    診療科
           MOVE    RECE10-RECEKA  TO  SKT1700TMP-RECEKA
      *---(01.00.01) LINE ADD END   ------------------------------------
      *
           PERFORM  900-SKTTMP-READ-SEC
      *
           PERFORM  210-HKN-SYUKEI-SEC
      *
      *---(01.00.01) LINE ADD START ------------------------------------
      *    合計集計
           INITIALIZE                 SKT1700TMP-REC
           MOVE    "99"           TO  SKT1700TMP-RECEKA
      *
           PERFORM  900-SKTTMP-READ-SEC
      *
           PERFORM  210-HKN-SYUKEI-SEC
      *---(01.00.01) LINE ADD END   ------------------------------------
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
      *    集計場所設定
           IF  RECE10-NYUGAIKBN    =    "1"
             MOVE     1           TO    IDX2
           ELSE
             MOVE     2           TO    IDX2
           END-IF
      *
      *    老人かどうか
           IF  RECE10-RJNHKNNUM  NOT =  SPACE
             IF  RECE10-KYURATE = 9
               MOVE  13      TO  IDX1
               MOVE   5      TO  IDX3
             ELSE
               MOVE  14      TO  IDX1
               MOVE   6      TO  IDX3
             END-IF
           ELSE
      *    一般か退職者か
             IF  RECE10-HKNNUM  =  "060"
      *    年齢チェック
               IF  RECE10-AGE  >=  70
                 IF  RECE10-KYURATE  =  9
                    MOVE   1    TO    IDX1
                                      IDX3
                 ELSE
                    MOVE   2    TO    IDX1
                                      IDX3
                 END-IF
               ELSE
                 IF  RECE10-AGE  <  3
                   MOVE    6    TO    IDX1
                 ELSE
                   EVALUATE  RECE10-KYURATE
                   WHEN    7
                     MOVE    5    TO    IDX1
                   WHEN    8
                     MOVE    4    TO    IDX1
                   WHEN    OTHER
                     MOVE    3    TO    IDX1
                   END-EVALUATE
                 END-IF
               END-IF
             ELSE
               IF  RECE10-AGE  >=  70
                 IF  RECE10-KYURATE  =  9
                   MOVE  7        TO  IDX1
                   MOVE  3        TO  IDX3
                 ELSE
                   MOVE  8        TO  IDX1
                   MOVE  4        TO  IDX3
                 END-IF
               ELSE
                 IF  RECE10-HONKZKKBN  =  "1"
                   MOVE   9    TO  IDX1
                 ELSE
                   IF  RECE10-AGE    <    3
                       MOVE   11    TO    IDX1
                   ELSE
                       MOVE   10    TO    IDX1
                   END-IF
                 END-IF
               END-IF
             END-IF
           END-IF
      *
      *    保険分集計
           IF  RECE10-ZAITAKU     =    SPACE
             PERFORM  2101-SYUKEI-SEC
           ELSE
             PERFORM  2101-Z-SYUKEI-SEC
           END-IF
      *
      *    合計分集計
           IF    IDX1       <     13
             MOVE    12    TO     IDX1  
           ELSE
             MOVE    15    TO     IDX1
           END-IF
           PERFORM  2101-SYUKEI-SEC
      *
      *    公費分集計
           IF  RECE10-KOHNUM(1)  NOT  =  SPACE
             PERFORM  220-KOH-SYUKEI-SEC
           END-IF
      *
           IF  FLG-SKT1700TMP  =  1
               WRITE    SKT1700TMP-REC
           ELSE
               REWRITE  SKT1700TMP-REC
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
      *療養の給付
      *    件数
           ADD   1                   TO  SKT1700TMP-KENSU(IDX1 IDX2)
      *    日数
           ADD   RECE10-JNISSU(1)    TO  SKT1700TMP-NISSU(IDX1 IDX2)
      *    点数
           ADD   RECE10-TOTALTEN(1)  TO  SKT1700TMP-TENSU(IDX1 IDX2)
      *    薬剤一部負担金
           ADD   RECE10-YKZFTN(1)    TO  SKT1700TMP-YKZFTN(IDX1 IDX2)
      *    一部負担金
           ADD   RECE10-FTNMONEY(1)  TO  SKT1700TMP-ITBFTN(IDX1 IDX2)
      *食事療養
      *    件数
           IF  RECE10-SHOKUJINISSU(1)  >  0
             ADD  1                  TO  SKT1700TMP-SKENSU(IDX1)
      *---(01.00.01) LINE ADD START ------------------------------------
           END-IF
      *---(01.00.01) LINE ADD END   ------------------------------------
      *    日数
           ADD  RECE10-SHOKUJINISSU(1)
                                     TO  SKT1700TMP-SNISSU(IDX1)
      *    金額
           ADD  RECE10-SHOKUJIRYOYOHI(1)
                                     TO  SKT1700TMP-SKINGK(IDX1)
      *    標準負担額
           ADD  RECE10-SHOKUJIFTN(1)
                                     TO  SKT1700TMP-SFTNGK(IDX1)
      *---(01.00.01) LINE ADD START ------------------------------------
      *     END-IF
      *---(01.00.01) LINE ADD END   ------------------------------------
      *
           .
       2101-SYUKEI-EXT.
           EXIT.
      *
      *****************************************************************
      *    医療保険・在宅分集計処理
      *****************************************************************
       2101-Z-SYUKEI-SEC         SECTION.
      *
      *療養の給付
      *    件数
           ADD   1                   TO  SKT1700TMP-Z-KENSU(IDX3)
      *    日数
           ADD   RECE10-JNISSU(1)    TO  SKT1700TMP-Z-NISSU(IDX3)
      *    点数
           ADD   RECE10-TOTALTEN(1)  TO  SKT1700TMP-Z-TENSU(IDX3)
      *    一部負担金
           ADD   RECE10-FTNMONEY(1)  TO  SKT1700TMP-Z-ITBFTN(IDX3)
      *
           .
       2101-Z-SYUKEI-EXT.
           EXIT.
      *
      *****************************************************************
      *    公費負担分集計処理
      *****************************************************************
       220-KOH-SYUKEI-SEC        SECTION.
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
      *    集計場所設定
             EVALUATE  RECE10-KOHNUM(IDX3)
             WHEN "010"
               IF  RECE10-NYUGAIKBN    =    "1"
                 MOVE    1            TO    IDX1
               ELSE
                 MOVE    2            TO    IDX1
               END-IF
             WHEN "011"
               MOVE      3            TO    IDX1
             WHEN "020"
               MOVE      4            TO    IDX1
             WHEN "021"
               MOVE      5            TO    IDX1
             WHEN "100"
               IF  RECE10-NYUGAIKBN    =    "1"
                 MOVE    6            TO    IDX1
               ELSE
                 MOVE    7            TO    IDX1
               END-IF
             WHEN OTHER
               IF  RECE10-NYUGAIKBN    =    "1"
                 MOVE    8            TO    IDX1
               ELSE
                 MOVE    9            TO    IDX1
               END-IF
             END-EVALUATE
      *
      *    療養の給付：件数
             ADD   1  TO  SKT1700TMP-K-KENSU(IDX1)
      *    療養の給付:診療実日数
             ADD  RECE10-JNISSU(IDX3 + 1)    TO
                               SKT1700TMP-K-NISSU(IDX1)
      *    療養の給付：点数
             ADD  RECE10-TOTALTEN(IDX3 + 1)  TO
                               SKT1700TMP-K-TENSU(IDX1)
      *
      *    療養の給付：一部負担金
             ADD  RECE10-FTNMONEY(IDX3 + 1)  TO
                               SKT1700TMP-K-ITBFTN(IDX1)
      *
      *---(01.00.01) LINE ADD START ------------------------------------
      *       IF  (RECE10-SHOKUJINISSU(IDX3 + 1)  >  0 ) AND
      *           (IDX1                 =  3 OR 4 OR 8 )
      *    食事療養:件数
      *         ADD   1  TO  SKT1700TMP-K-SKENSU(IDX1)
             IF  IDX1  =  3 OR 4 OR 8
               IF RECE10-SHOKUJINISSU(IDX3 + 1)  >  0
      *    食事療養:件数
                 ADD   1  TO  SKT1700TMP-K-SKENSU(IDX1)
               END-IF
      *---(01.00.01) LINE ADD END   ------------------------------------
      *    食事療養:日数
               ADD  RECE10-SHOKUJINISSU(IDX3 + 1)    TO
                               SKT1700TMP-K-SNISSU(IDX1)
      *    食事療養：金額
               ADD  RECE10-SHOKUJIRYOYOHI(IDX3 + 1)  TO
                               SKT1700TMP-K-SKINGK(IDX1)
      *    食事療養：標準負担額
               ADD  RECE10-SHOKUJIFTN(IDX3 + 1)      TO
                               SKT1700TMP-K-SFTNGK(IDX1)
             END-IF
           END-PERFORM
      *
           .
       220-KOH-SYUKEI-EXT.
           EXIT.
      *
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
           OPEN     INPUT       SKT1700TMP-FILE
      *
           MOVE     ZERO        TO       FLG-PRINT
      *
      *    一時ファイル読込
           PERFORM  900-TMP-READ-SEC
      *
           PERFORM  UNTIL     FLG-PRINT   =   1
      *
      *---(01.00.01) LINE ADD START ------------------------------------
      *    合計を印字するか
             IF   SKT1700TMP-RECEKA  NOT =  "99"
             OR   CNT-PAGE           NOT =  1
      *---(01.00.01) LINE ADD END   ------------------------------------
      *    帳票編集<見出し>処理
               PERFORM 310-HEAD-HEN-SEC
      *    帳票編集<明細>処理
               PERFORM 320-BODY-HEN-SEC
      *    帳票印刷処理
               PERFORM 330-PRINT-OUT-SEC
      *---(01.00.01) LINE ADD START ------------------------------------
             END-IF
      *    帳票編集<見出し>処理
      *         PERFORM 311-HEAD-HEN-SEC
      *    帳票編集<明細>処理
      *         PERFORM 321-BODY-HEN-SEC
      *    帳票印刷処理
      *         PERFORM 331-PRINT-OUT-SEC
      *---(01.00.01) LINE ADD START ------------------------------------
      *    一時ファイル読込
             PERFORM  900-TMP-READ-SEC
           END-PERFORM
      *
           CLOSE    SKT1700TMP-FILE
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
           INITIALIZE                    SKT1700
      *
      *    診療年月
           MOVE    WRK-SRYYMWH           TO  SKT1700-SRYYM
      *
      *    請求日付
           MOVE    WRK-SEIYMDWH          TO  SKT1700-SEIYMD
      *
      *    医療機関コード
           MOVE    SYS-1001-HOSPCD       TO  WRK-MAE-INPUT
           PERFORM 2009-HENKAN-SEC
           MOVE    WRK-OUT-INPUT         TO  SKT1700-HOSPCD
      *
      *---(01.00.02) LINE ADD START ------------------------------------
      *    医療機関住所
      *     MOVE    SYS-1002-ADRS         TO  SKT1700-ADRS
      *
      *    医療機関名
      *     MOVE    SYS-1001-HOSPNAME     TO  SKT1700-HOSPNAME
      *
      *    医療機関住所
           MOVE    WRK-HOSPADRS          TO  SKT1700-ADRS
      *
      *    医療機関名
           MOVE    WRK-HOSPNAME          TO  SKT1700-HOSPNAME
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
      *---(01.00.01) LINE ADD START ------------------------------------
      *    診療科
      *     MOVE    SKT1700TMP-RECEKA    TO  SKT1700-RECEKA
      *
      *    診療科目情報
           INITIALIZE                  SYS-1005-REC
           MOVE    "1005"              TO  SYS-1005-KANRICD
           MOVE    SKT1700TMP-RECEKA   TO  SYS-1005-KBNCD
           MOVE    LNK-PRTKANRI-SRYYM(1:6)
                                       TO  SYS-1005-STYUKYMD(1:6)
                                           SYS-1005-EDYUKYMD(1:6)
           MOVE    "01"                TO  SYS-1005-STYUKYMD(7:2)
                                           SYS-1005-EDYUKYMD(7:2)
      *---(01.00.02) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM         TO  SYS-1005-HOSPNUM
      *---(01.00.02) LINE ADD END   ------------------------------------
           MOVE    SYS-1005-REC        TO  MCPDATA-REC
           PERFORM 910-SYSKANRI-INV-SEC
           IF      FLG-SYSKANRI        =   ZERO
               MOVE    MCPDATA-REC        TO  SYS-1005-REC
               MOVE    SYS-1005-SRYKANAME(1:10) TO  SKT1700-RECEKA
           END-IF
      *---(01.00.01) LINE ADD END   ------------------------------------
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
      *    一般・退職・老人分
           PERFORM  VARYING  IDX1  FROM  1  BY  1
      *---(01.00.01) LINE ADD START ------------------------------------
      *              UNTIL    IDX1  >    12
                    UNTIL    IDX1  >    15
      *---(01.00.01) LINE ADD END   ------------------------------------
             PERFORM  VARYING  IDX2  FROM  1  BY  1
                       UNTIL   IDX2  >     2
      *    件数
               MOVE     SKT1700TMP-KENSU (IDX1 IDX2)  TO   WRK-Z5
               MOVE     WRK-Z5       TO   SKT1700-KENSU (IDX1 IDX2)
      *    日数
               MOVE     SKT1700TMP-NISSU (IDX1 IDX2)  TO   WRK-Z5
               MOVE     WRK-Z5       TO   SKT1700-NISSU (IDX1 IDX2)
      *    点数
               MOVE     SKT1700TMP-TENSU (IDX1 IDX2)  TO   WRK-Z9
               MOVE     WRK-Z9       TO   SKT1700-TENSU (IDX1 IDX2)
      *---(01.00.01) LINE ADD START ------------------------------------
      *    薬剤一部負担金
      *         MOVE     SKT1700TMP-YKZFTN (IDX1 IDX2) TO   WRK-Z7
      *         MOVE     WRK-Z7       TO   SKT1700-YKZFTN(IDX1 IDX2)
      *---(01.00.01) LINE ADD START ------------------------------------
      *    一部負担金
               MOVE     SKT1700TMP-ITBFTN (IDX1 IDX2)  TO   WRK-Z9
               MOVE     WRK-Z9       TO   SKT1700-ITBFTN (IDX1 IDX2)
             END-PERFORM
      *    食事療養：件数
             MOVE     SKT1700TMP-SKENSU (IDX1)     TO   WRK-Z5
             MOVE     WRK-Z5       TO   SKT1700-SKENSU (IDX1)
      *    食事療養：日数
             MOVE     SKT1700TMP-SNISSU (IDX1)     TO   WRK-Z5
             MOVE     WRK-Z5       TO   SKT1700-SNISSU (IDX1)
      *    食事療養：金額
             MOVE     SKT1700TMP-SKINGK (IDX1)     TO   WRK-Z9
             MOVE     WRK-Z9       TO   SKT1700-SKINGK (IDX1)
      *    食事療養：標準負担額
             MOVE     SKT1700TMP-SFTNGK (IDX1)     TO   WRK-Z9
             MOVE     WRK-Z9       TO   SKT1700-SFTNGK (IDX1)
           END-PERFORM
      *
      *    在宅分
           PERFORM  VARYING  IDX1  FROM  1  BY  1
      *---(01.00.01) LINE ADD START ------------------------------------
      *              UNTIL    IDX1  >     4
                    UNTIL    IDX1  >     6
      *---(01.00.01) LINE ADD END   ------------------------------------
      *    件数
             MOVE     SKT1700TMP-Z-KENSU (IDX1)  TO   WRK-Z5
             MOVE     WRK-Z5       TO   SKT1700-Z-KENSU (IDX1)
      *    日数
             MOVE     SKT1700TMP-Z-NISSU (IDX1)  TO   WRK-Z5
             MOVE     WRK-Z5       TO   SKT1700-Z-NISSU (IDX1)
      *    点数
             MOVE     SKT1700TMP-Z-TENSU (IDX1)  TO   WRK-Z9
             MOVE     WRK-Z9       TO   SKT1700-Z-TENSU (IDX1)
      *    一部負担金
             MOVE     SKT1700TMP-Z-ITBFTN (IDX1)  TO   WRK-Z9
             MOVE     WRK-Z9       TO   SKT1700-Z-ITBFTN (IDX1)
           END-PERFORM
      *
      *---(01.00.01) LINE ADD START ------------------------------------
      *    公費分
           PERFORM  VARYING  IDX1  FROM  1  BY  1
                    UNTIL    IDX1  >     9
      *    件数
             MOVE     SKT1700TMP-K-KENSU (IDX1)     TO   WRK-Z5
             MOVE     WRK-Z5       TO   SKT1700-KKENSU (IDX1)
      *    日数
             MOVE     SKT1700TMP-K-NISSU (IDX1)     TO   WRK-Z5
             MOVE     WRK-Z5       TO   SKT1700-KNISSU (IDX1)
      *    点数
             MOVE     SKT1700TMP-K-TENSU (IDX1)     TO   WRK-Z9
             MOVE     WRK-Z9       TO   SKT1700-KTENSU (IDX1)
      *    一部負担金
             MOVE     SKT1700TMP-K-ITBFTN(IDX1)     TO   WRK-Z9
             MOVE     WRK-Z9       TO   SKT1700-KITBFTN (IDX1)
      *    食事療養：件数
             MOVE     SKT1700TMP-K-SKENSU(IDX1)     TO   WRK-Z5
             MOVE     WRK-Z5       TO   SKT1700-KSKENSU (IDX1)
      *    食事療養：日数
             MOVE     SKT1700TMP-K-SNISSU(IDX1)     TO   WRK-Z5
             MOVE     WRK-Z5       TO   SKT1700-KSNISSU (IDX1)
      *    食事療養：金額
             MOVE     SKT1700TMP-K-SKINGK(IDX1)     TO   WRK-Z9
             MOVE     WRK-Z9       TO   SKT1700-KSKINGK (IDX1)
      *    食事療養：標準負担額
             MOVE     SKT1700TMP-K-SFTNGK(IDX1)     TO   WRK-Z9
             MOVE     WRK-Z9       TO   SKT1700-KSFTNGK (IDX1)
           END-PERFORM
      *---(01.00.01) LINE ADD END   ------------------------------------
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
           MOVE   "SKT1700.red"        TO  SPRT-PRTID
           MOVE    "国保総括票"        TO  SPRT-TITLE
           MOVE    SKT1700             TO  SPRT-PRTDATA
           MOVE    LNK-PRTKANRI-TERMID TO  SPRT-TERMID
           MOVE    LNK-PRTKANRI-OPID   TO  SPRT-OPID
           MOVE    LNK-PRTKANRI-PRTNM  TO  SPRT-PRTNM
           CALL    "ORCSPRT"           USING
                                       ORCSPRTAREA
      *---(01.00.02) LINE ADD START ------------------------------------
                                       SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
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
057400*
      *****************************************************************
      *    帳票編集<ヘッダー部>処理
      *****************************************************************
      * 311-HEAD-HEN-SEC          SECTION.
      *
      *     ADD     1                     TO  CNT-PAGE
      *
      *     INITIALIZE                    SKT1701
      *
      *    医療機関コード
      *     MOVE    SYS-1001-HOSPCD       TO  WRK-MAE-INPUT
      *     PERFORM 2009-HENKAN-SEC
      *     MOVE    WRK-OUT-INPUT         TO  SKT1701-HOSPCD
      *
      *     .
      * 311-HEAD-HEN-EXT.
      *     EXIT.
      *
      *****************************************************************
      *    帳票編集<明細行>処理
      *****************************************************************
      * 321-BODY-HEN-SEC      SECTION.
      *
      *    老人分
      *     PERFORM  VARYING  IDX1  FROM 13  BY  1
      *              UNTIL    IDX1  >    15
      *       COMPUTE  IDX3         =    IDX1    -    12
      *       PERFORM  VARYING  IDX2  FROM  1  BY  1
      *                 UNTIL   IDX2  >     2
      *    件数
      *         MOVE     SKT1700TMP-KENSU (IDX1 IDX2)  TO   WRK-Z5
      *         MOVE     WRK-Z5       TO   SKT1701-KENSU (IDX3 IDX2)
      *    日数
      *         MOVE     SKT1700TMP-NISSU (IDX1 IDX2)  TO   WRK-Z5
      *         MOVE     WRK-Z5       TO   SKT1701-NISSU (IDX3 IDX2)
      *    点数
      *         MOVE     SKT1700TMP-TENSU (IDX1 IDX2)  TO   WRK-Z9
      *         MOVE     WRK-Z9       TO   SKT1701-TENSU (IDX3 IDX2)
      *    一部負担金
      *         MOVE     SKT1700TMP-ITBFTN (IDX1 IDX2)  TO   WRK-Z9
      *         MOVE     WRK-Z9       TO   SKT1701-ITBFTN(IDX3 IDX2)
      *       END-PERFORM
      *    食事療養：件数
      *       MOVE     SKT1700TMP-SKENSU (IDX1)     TO   WRK-Z5
      *       MOVE     WRK-Z5       TO   SKT1701-SKENSU (IDX3)
      *    食事療養：日数
      *       MOVE     SKT1700TMP-SNISSU (IDX1)     TO   WRK-Z5
      *       MOVE     WRK-Z5       TO   SKT1701-SNISSU (IDX3)
      *    食事療養：金額
      *       MOVE     SKT1700TMP-SKINGK (IDX1)     TO   WRK-Z9
      *       MOVE     WRK-Z9       TO   SKT1701-SKINGK (IDX3)
      *    食事療養：標準負担額
      *       MOVE     SKT1700TMP-SFTNGK (IDX1)     TO   WRK-Z9
      *       MOVE     WRK-Z9       TO   SKT1701-SFTNGK (IDX3)
      *     END-PERFORM
      *
      *    在宅分
      *     PERFORM  VARYING  IDX1  FROM  5  BY  1
      *              UNTIL    IDX1  >     6
      *       COMPUTE  IDX3   =     IDX1     -   4
      *    件数
      *       MOVE     SKT1700TMP-Z-KENSU (IDX1)  TO   WRK-Z5
      *       MOVE     WRK-Z5       TO   SKT1701-Z-KENSU (IDX3)
      *    日数
      *       MOVE     SKT1700TMP-Z-NISSU (IDX1)  TO   WRK-Z5
      *       MOVE     WRK-Z5       TO   SKT1701-Z-NISSU (IDX3)
      *    点数
      *       MOVE     SKT1700TMP-Z-TENSU (IDX1)  TO   WRK-Z9
      *       MOVE     WRK-Z9       TO   SKT1701-Z-TENSU (IDX3)
      *    一部負担金
      *       MOVE     SKT1700TMP-Z-ITBFTN (IDX1)  TO   WRK-Z9
      *       MOVE     WRK-Z9       TO   SKT1701-Z-ITBFTN (IDX3)
      *     END-PERFORM
      *
      *    公費分
      *     PERFORM  VARYING  IDX1  FROM  1  BY  1
      *              UNTIL    IDX1  >     9
      *    件数
      *       MOVE     SKT1700TMP-K-KENSU (IDX1)     TO   WRK-Z5
      *       MOVE     WRK-Z5       TO   SKT1701-K-KENSU (IDX1)
      *    日数
      *       MOVE     SKT1700TMP-K-NISSU (IDX1)     TO   WRK-Z5
      *       MOVE     WRK-Z5       TO   SKT1701-K-NISSU (IDX1)
      *    点数
      *       MOVE     SKT1700TMP-K-TENSU (IDX1)     TO   WRK-Z9
      *       MOVE     WRK-Z9       TO   SKT1701-K-TENSU (IDX1)
      *    薬剤一部負担金
      *       MOVE     SKT1700TMP-K-YKZFTN(IDX1)     TO   WRK-Z7
      *       MOVE     WRK-Z7       TO   SKT1701-K-YKZFTN (IDX1)
      *    一部負担金
      *       MOVE     SKT1700TMP-K-ITBFTN(IDX1)     TO   WRK-Z9
      *       MOVE     WRK-Z9       TO   SKT1701-K-ITBFTN (IDX1)
      *    食事療養：件数
      *       MOVE     SKT1700TMP-K-SKENSU(IDX1)     TO   WRK-Z5
      *       MOVE     WRK-Z5       TO   SKT1701-K-SKENSU (IDX1)
      *    食事療養：日数
      *       MOVE     SKT1700TMP-K-SNISSU(IDX1)     TO   WRK-Z5
      *       MOVE     WRK-Z5       TO   SKT1701-K-SNISSU (IDX1)
      *    食事療養：金額
      *       MOVE     SKT1700TMP-K-SKINGK(IDX1)     TO   WRK-Z9
      *       MOVE     WRK-Z9       TO   SKT1701-K-SKINGK (IDX1)
      *    食事療養：標準負担額
      *       MOVE     SKT1700TMP-K-SFTNGK(IDX1)     TO   WRK-Z9
      *       MOVE     WRK-Z9       TO   SKT1701-K-SFTNGK (IDX1)
      *     END-PERFORM
      *
      *     .
      * 321-BODY-HEN-EXT.
      *     EXIT.
      *
      *****************************************************************
      *    帳票印刷処理
      *****************************************************************
      * 331-PRINT-OUT-SEC                SECTION.
      *
      *     DISPLAY  "PRINT"
      *     INITIALIZE                  ORCSPRTAREA
      *     MOVE    "INS"               TO  SPRT-MODE
      *     MOVE    LNK-PRTKANRI-RENNUM TO  SPRT-RENNUM
      *     MOVE    LNK-PRTKANRI-TBL-KEY
      *                                 TO  SPRT-TBL-KEY
      *     MOVE    LNK-PRTKANRI-TBL-GROUP
      *                                 TO  SPRT-TBL-GROUP
      *     MOVE    LNK-PRTKANRI-SRYYM  TO  SPRT-SRYYM
      *     MOVE    LNK-PRTKANRI-SKYYMD TO  SPRT-SKYYMD
      *     MOVE    LNK-PRTKANRI-SHELLID 
      *                                 TO  SPRT-SHELLID
      *     MOVE    LNK-PRTKANRI-SHORI-RENNUM
      *                                 TO  SPRT-SHORI-RENNUM
      *     MOVE    LNK-PRTKANRI-PRIORITY
      *                                 TO  SPRT-PRIORITY
      *     MOVE   "SKT1701.red"        TO  SPRT-PRTID
      *     MOVE    "国保総括表"        TO  SPRT-TITLE
      *     MOVE    SKT1701             TO  SPRT-PRTDATA
      *     MOVE    LNK-PRTKANRI-TERMID TO  SPRT-TERMID
      *     MOVE    LNK-PRTKANRI-OPID   TO  SPRT-OPID
      *     MOVE    LNK-PRTKANRI-PRTNM  TO  SPRT-PRTNM
      *     CALL    "ORCSPRT"           USING
      *                                 ORCSPRTAREA
      *     IF      SPRT-RETURN         =   ZERO
      *         CONTINUE
      *     ELSE
      *         MOVE    "印刷ＤＢに更新できませんでした"
      *                                    TO  WRK-RECEERR
      *         PERFORM 500-ERR-HENSYU-SEC
      *     END-IF
      *     .
      * 331-PRINT-OUT-EXT.
      *     EXIT.
057400*
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
      *---(01.00.02) LINE ADD START ------------------------------------
               MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *---(01.00.02) LINE ADD END   ------------------------------------
               MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
               MOVE    WRK-PARA-SHELLID
                                       TO  JOB-SHELLID
               MOVE    WRK-RECEERR     TO  JOB-YOBI
               MOVE    "9999"          TO  JOB-ERRCD
               CALL    "ORCSJOB"       USING
                                       ORCSJOBKANRIAREA
                                       JOBKANRI-REC
      *---(01.00.02) LINE ADD START ------------------------------------
                                       SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
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
                   MOVE    RECE10-REC      TO  MCPDATA-REC
                   MOVE    "DBUPDATE"      TO  MCP-FUNC
      *---(01.00.02) LINE ADD START ------------------------------------
      *             MOVE    PATH-TBL-SEIKYU-KEY  TO  MCP-PATH
      *             CALL    "MCPSUB"             USING
      *                                          MCPAREA
      *                                          MCPDATA-REC
                   MOVE    "tbl_seikyu"    TO  MCP-TABLE
                   MOVE    "key"           TO  MCP-PATHNAME
                   CALL    "ORCDBMAIN"     USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
                   IF      MCP-RC          =   ZERO
                       PERFORM 900-UPD-FILE-READ-SEC
                   ELSE
                       DISPLAY "UPD ERR KEY="  RECE10-KEY 
                       MOVE  "*** SOKATU1700 SEIKYU UPD ERR ***"
                                           TO  WRK-RECEERR
                       MOVE    RECE10-KEY  TO  WRK-RECEERR(33:)
                       PERFORM 500-ERR-HENSYU-SEC
                       MOVE    1           TO  FLG-UPDFILE
                   END-IF
               ELSE
                       DISPLAY "INV ERR KEY="  RECE10-KEY 
                   MOVE  "*** SOKATU1700 SEIKYU INVALID ***"
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
      *---(01.00.02) LINE ADD START ------------------------------------
      *     MOVE   SYS-1001-HOSPID       TO    RECE10-HOSPID.
           MOVE    SPA-HOSPNUM         TO  RECE10-HOSPNUM
      *---(01.00.02) LINE ADD START ------------------------------------
           MOVE   LNK-PRTKANRI-SRYYM   TO  RECE10-SKYYM.
      *
           MOVE    SPACE               TO  RECE10-XXSTHKNJANUM
           MOVE    "99999999"          TO  RECE10-XXEDHKNJANUM
      *
           MOVE    RECE10-REC          TO  MCPDATA-REC
           MOVE    "DBSELECT"          TO  MCP-FUNC
      *---(01.00.02) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SEIKYU-KEY4  TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_seikyu"        TO  MCP-TABLE
           MOVE    WRK-PATH            TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
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
      *---(01.00.02) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SEIKYU-KEY4  TO  MCP-PATH
      *     MOVE    "DBFETCH"             TO  MCP-FUNC
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_seikyu"            TO  MCP-TABLE
           MOVE    WRK-PATH                TO  MCP-PATHNAME
           MOVE    "DBFETCH"               TO  MCP-FUNC
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    ZERO                TO  FLG-END
               MOVE    MCPDATA-REC         TO  RECE10-REC
      *
      *        テスト患者のときは読み飛ばす
               MOVE    SPACE               TO  PTINF-REC
               INITIALIZE                      PTINF-REC
      *---(01.00.02) LINE ADD START ------------------------------------
      *         MOVE    RECE10-HOSPID       TO  PTINF-HOSPID
               MOVE    SPA-HOSPNUM         TO  PTINF-HOSPNUM
      *---(01.00.02) LINE ADD END   ------------------------------------
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
      *****************************************************************
      *    患者マスタ読込
      *****************************************************************
       800-PTINF-READ-SEC         SECTION.
      *
           MOVE    "DBSELECT"          TO  MCP-FUNC
      *---(01.00.02) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-PTINF-KEY  TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_ptinf"         TO  MCP-TABLE
           MOVE    "key"               TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"           TO  MCP-FUNC
      *---(01.00.02) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-PTINF-KEY  TO  MCP-PATH
      *         CALL    "MCPSUB"             USING
      *                                      MCPAREA
      *                                      MCPDATA-REC
               MOVE    "tbl_ptinf"     TO  MCP-TABLE
               MOVE    "key"           TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"     USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
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
           MOVE    "DBCLOSECURSOR"     TO  MCP-FUNC
      *---(01.00.02) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-PTINF-KEY  TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_ptinf"         TO  MCP-TABLE
           MOVE    "key"               TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
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
           READ    SKT1700TMP-FILE
               INVALID    KEY
                   MOVE    1           TO  FLG-SKT1700TMP
               NOT INVALID  KEY
                   MOVE    ZERO        TO  FLG-SKT1700TMP
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
           READ  SKT1700TMP-FILE   NEXT
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
           MOVE    "DBSELECT"               TO  MCP-FUNC
      *---(01.00.02) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SYSKANRI-KEY10  TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_syskanri"           TO  MCP-TABLE
           MOVE    "key10"                  TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"              USING
                                            MCPAREA
                                            MCPDATA-REC
                                            SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                TO  MCP-FUNC
      *---(01.00.02) LINE ADD START ------------------------------------
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
      *---(01.00.02) LINE ADD END   ------------------------------------
               IF      MCP-RC              =   ZERO
                   MOVE    ZERO                TO  FLG-SYSKANRI
               ELSE
                   MOVE    1                   TO  FLG-SYSKANRI
               END-IF
           ELSE
               MOVE    1                   TO  FLG-SYSKANRI
           END-IF
      *
           MOVE    "DBCLOSECURSOR"          TO  MCP-FUNC
      *---(01.00.02) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SYSKANRI-KEY10  TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_syskanri"       TO  MCP-TABLE
           MOVE    "key10"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
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
      *---(01.00.02) LINE ADD START ------------------------------------
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
      *---(01.00.02) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"            TO  MCP-FUNC
      *---(01.00.02) LINE ADD START ------------------------------------
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
      *---(01.00.02) LINE ADD END   ------------------------------------
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
           MOVE    "DBCLOSECURSOR"        TO  MCP-FUNC
      *---(01.00.02) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SEIKYU-KEY    TO  MCP-PATH
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC
           MOVE    "tbl_seikyu"         TO  MCP-TABLE
           MOVE    "key"                TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
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
      *---(01.00.02) LINE ADD START ------------------------------------
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
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
      *****************************************************************
      *    ＤＢ　オープン処理
      *****************************************************************
       100-DBOPEN-SEC                SECTION.
      *
      *---(01.00.02) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.02) LINE ADD END   ------------------------------------
           MOVE    "DBOPEN"            TO  MCP-FUNC.
      *---(01.00.02) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
      *---(01.00.02) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.02) LINE ADD END   ------------------------------------
           MOVE    "DBSTART"           TO  MCP-FUNC.
      *---(01.00.02) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
           .
       100-DBOPEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    ＤＢ　クローズ処理
      *****************************************************************
       900-DBDISCONNECT-SEC            SECTION.
      *
      *---(01.00.02) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.02) LINE ADD END   ------------------------------------
           MOVE    "DBCOMMIT"          TO  MCP-FUNC.
      *---(01.00.02) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
      *---(01.00.02) LINE ADD START ------------------------------------
           MOVE    LOW-VALUE           TO  MCP-TABLE
                                           MCP-PATHNAME
      *---(01.00.02) LINE ADD END   ------------------------------------
           MOVE    "DBDISCONNECT"      TO  MCP-FUNC.
      *---(01.00.02) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"             USING
      *                                  MCPAREA
      *                                  MCPDATA-REC.
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.02) LINE ADD END   ------------------------------------
           .
       900-DBDISCONNECT-EXT.
           EXIT.
