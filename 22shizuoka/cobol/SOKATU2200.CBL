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
       PROGRAM-ID.             SOKATU2200.
      *****************************************************************
      *  システム名        : ＯＲＣＡ
      *  サブシステム名    : 月次帳票
      *  コンポーネント名  : 国保・総括表（静岡）用集計処理
      *  管理者            : 
      *  作成日付    作業者        記述
      *  05/05/30    山口          ORCAのバージョンアップ(2.5.0)による再作成
      *****************************************************************
      *  プログラム修正履歴
      * Maj/Min/Rev	作業者　　　日付	      内容
      * 2.9.0.ver01     　　 2006/05/19   返戻対応
      *  01.00.01    内田    2006/11/03   前期高齢者７割を８割へ印字修正
      *  01.00.02    内田    2007/04/07   浜松市政令指定都市対応
      *  01.00.03    吉川    2007/10/03   日レセver4.0対応
      *                                   システム管理マスタ「1901」の
      *                                   医療機関情報を参照
      *              内田    2007/10/23   合計欄は最終ページのみに合計を印字
      *  01.00.04    内田    2007/11/16   旧浜松市も浜松市でまとめる
      *  01.00.05    伊藤    2008/04/26   帳票様式に伴う修正
      *  01.00.06    伊藤    2008/05/03   退職者の集計修正
      *                                   後期高齢者を県毎に印字
      *  01.00.07    吉川    2008/05/27   県内2枚目に県外の後期高齢者が
      *                                   印字されてしまう不具合を修正
      *  01.00.08    吉川    2008/06/23   印刷処理の修正
      *                                   H20年4月以前の返戻及び
      *                                   月遅れ処理の修正
      *  01.00.09    吉川    2008/07/04   後期高齢のみの場合でも印刷するよう修正
      *                                   H20年4月以降の返戻分が
      *                                   旧帳票で印字される不具合を修正
      *                                   県外の合計欄に県内分の合計が
      *                                   加算される不具合を修正
      *  01.00.10    吉川    2008/09/05   月遅れの患者を出力すると旧様式に
      *                                   合計が印字される不具合を修正
      *  01.00.11    吉川    2008/10/02   最終ページに合計を印字
      *  01.00.12    吉川    2010/04/05   オンライン返戻対応
      *  01.00.13    吉川    2010/10/13   特別療養費国保対応
      *  01.00.14    吉川    2010/11/25   open-cobol1.0対応
      *  01.00.15    吉川    2012/05/14   全国土木、全国建設、中央建設は
      *                                   県外とするように修正
      *  01.00.16    吉川    2013/01/10   医療機関情報編集対応
      *  01.00.17    吉川    2014/05/19   前期高齢者２割対応
      *  01.00.18    吉川    2014/10/23   ver4.8.0対応（一時ディレクトリ変更）
      *  01.00.19    吉川    2014/12/04   返戻時、再印刷画面のタイトル修正
      *  01.00.20    門間    2017/02/14   医療機関編集情報への開設者名追加対応
      *                                   医療機関コード変更時、
      *                                   医療機関コード別の作成処理対応
      *  01.00.21    萩野    2017/09/15   DBエラー不具合修正
      *****************************************************************
      *
       ENVIRONMENT                 DIVISION.
       CONFIGURATION               SECTION.
       INPUT-OUTPUT                SECTION.
       FILE-CONTROL.

      *    総括表一時ファイル  
           SELECT  SKT2200TMP-FILE   ASSIGN    SKT2200TP
                                   ORGANIZATION    IS  INDEXED
                                   ACCESS  MODE    IS  DYNAMIC
                                   RECORD  KEY     IS  SKT2200TMP-KEY
                                   FILE    STATUS  IS  STS-SKT2200.
      *---(01.00.05) LINE ADD START ------------------------------------
      *
      *    総括表一時ファイル（後期高齢）
           SELECT  SKT2205TMP-FILE   ASSIGN    SKT2205TP
                                   ORGANIZATION    IS  INDEXED
                                   ACCESS  MODE    IS  DYNAMIC
                                   RECORD  KEY     IS  SKT2205TMP-KEY
                                   FILE    STATUS  IS  STS-SKT22002.
      *---(01.00.05) LINE ADD END   ------------------------------------
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
       DATA                        DIVISION.
       FILE                        SECTION.
      *
      *    総括表一時ファイル  
       FD  SKT2200TMP-FILE.
           COPY    "CPSKT2200TMP.INC".
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *    総括表一時ファイル（後期高齢）
       FD  SKT2205TMP-FILE.
           COPY    "CPSKT2205TMP.INC".
      *
      *---(01.00.05) LINE ADD END   ------------------------------------
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
       WORKING-STORAGE             SECTION.
      *
      *    印刷用データ 名称領域 
           COPY    "CPCOMMONPRT.INC".
      *
      *    総括表一時ファイル 名称領域 
           COPY    "CPCOMMONDAT2.INC"
                                   REPLACING  //RECE01PARA//
                                   BY         //SKT2200TP//.
      *---(01.00.05) LINE ADD START ------------------------------------
      *    総括表一時ファイル 名称領域 
           COPY    "CPCOMMONDAT2.INC"
                                   REPLACING  //RECE01PARA//
                                   BY         //SKT2205TP//.
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *    請求ＤＢ更新用ファイル 名称領域 
           COPY    "CPCOMMONDAT2.INC"
                                   REPLACING  //RECE01PARA//
                                   BY         //RECEUPD//.
      *=== ver4.8対応 by Yoshikawa(2014/10/23) start
      *     03  FILLER              PIC X(04)   VALUE   ".dat".
      *=== ver4.8対応 by Yoshikawa(2014/10/23) end
      *
      *    エラーファイル 名称領域 
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *     COPY    "CPCOMMONDAT2.INC"
      *                             REPLACING  //RECE01PARA//
      *                             BY         //RECEERR//.
      *     03  FILLER              PIC X(04)   VALUE   ".dat".
      *=== ver4.8対応 by Yoshikawa(2014/10/23) start
      *     COPY    "CPERRFL.INC"    REPLACING  //ERRFLPARA//
      *                              BY         //RECEERR//.
           COPY    "CPRECEERR.INC".
      *=== ver4.8対応 by Yoshikawa(2014/10/23) end
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
      *     
      *    シェル用領域
           COPY    "CPCOMMONSHELL.INC".
      *
      *    印刷用領域
           COPY    "SKT2200.INC".
      *
      *    スパ領域
       01  STS-AREA.
           03  STS-PARA            PIC X(02).
           03  STS-SKT2200         PIC X(02).
           03  STS-RECE10          PIC X(02).
           03  STS-RECEERR         PIC X(02).
           03  STS-RECEUPD         PIC X(02).
      *---(01.00.05) LINE ADD START ------------------------------------
           03  STS-SKT22002        PIC X(02).
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *    フラグ領域
       01  FLG-AREA.
           03  FLG-END             PIC 9(01).
           03  FLG-SKT2200TMP      PIC 9(01).
           03  FLG-SYSKANRI        PIC 9(01).
           03  FLG-PTINF           PIC 9(01).
           03  FLG-HKNJAINF        PIC 9(01).
           03  FLG-UPD             PIC 9(01).
           03  FLG-UPDFILE         PIC 9(01).
           03  FLG-SEIKYU          PIC 9(01).
           03  FLG-PRINT           PIC 9(01).
      *---(01.00.05) LINE ADD START ------------------------------------
           03  FLG-PRINT2          PIC 9(01).
           03  FLG-KOUKI           PIC 9(01).
           03  FLG-SKT2205TMP     PIC 9(01).
      *---(01.00.05) LINE ADD END   ------------------------------------
      *=== 印刷処理修正 by Yoshikawa(2008/06/23) start
           03  FLG-PRINTCHK        PIC 9(01).
      *=== 印刷処理修正 by Yoshikawa(2008/06/23) end
      *=== 旧様式の返戻・月遅れ処理修正 by Yoshikawa(2008/06/23) start
           03  FLG-CHK             PIC 9(01).
      *=== 旧様式の返戻・月遅れ処理修正 by Yoshikawa(2008/06/23) end
      *
      *    添字領域
       01  IDX-AREA.
           03  IDX1                PIC 9(04).
           03  IDX2                PIC 9(04).
           03  IDX3                PIC 9(04).
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
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *     03  WRK-PARA-HOSPID     PIC X(24).
           03  WRK-PARA-HOSPNUM    PIC 9(02).
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
           03  WRK-PARA-PAGE       PIC 9(10).
      ****2006/05/19 返戻対応
           03  WRK-PARA-SYOKBN     PIC X(01).
      ****	       
      *=== 特別療養費国保対応 by Yoshikawa(2010/10/13) start
           03  WRK-PARA-TOKUBETU   PIC X(01).
      *=== 特別療養費国保対応 by Yoshikawa(2010/10/13) end
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/14) start
           03  WRK-PARA-STSRYYM    PIC 9(06).
           03  WRK-PARA-EDSRYYM    PIC 9(06).
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/14) end
      *
      *    一時領域
       01  WRK-AREA.
           03  WRK-SEIYMD        PIC X(08).
           03  WRK-SEIYMDWH      PIC X(22).
           03  WRK-SRYYMWH       PIC X(16).
           03  WRK-SRYYMD        PIC X(08).
      *  
           03  WRK-SYMD.
               05  WRK-SYY           PIC 9(04).
               05  WRK-SMM           PIC 9(02).
               05  WRK-SDD           PIC 9(02).
           03  WRK-HENYMDG           PIC X(22).
      *
           03  WRK-Z6                PIC ZZ,ZZZ.
           03  WRK-Z9                PIC Z,ZZZ,ZZZ.
           03  WRK-Z10               PIC ZZ,ZZZ,ZZZ.
      *
           03  WRK-RECEERR           PIC X(200). 
      *=== シス管「1901」対応 By Yoshikawa(2007/10/03) start
      *****2006/05/19 返戻対応
      *     03  WRK-PATH.
      *         05  FILLER          PIC S9(09)  BINARY.
      *         05  FILLER          PIC S9(09)  BINARY.
      *         05  FILLER          PIC S9(09)  BINARY.
      *****
           03  WRK-PATH              PIC X(50).
      *---(01.00.05) LINE ADD START ------------------------------------
           03  WRK-PATH2               PIC X(50).
           03  WRK-HKNNUM              PIC X(03).
           03  WRK-TODOUHUKEN          PIC X(100).
           03  WRK-RETSU               PIC 9(02).
      *---(01.00.05) LINE ADD END   ------------------------------------
      *=== 返戻が旧帳票で出る不具合修正 by Yoshikawa(2008/07/04) start
           03  WRK-SRYYM-OLD         PIC X(06).
           03  WRK-SRYYM-NEW         PIC X(06).
      *=== 返戻が旧帳票で出る不具合修正 by Yoshikawa(2008/07/04) end
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
      *=== 医療機関編集情報へ開設者名追加 by Monma(2017/02/14) start
           03  WRK-KAISETUNAME     PIC X(80).
      *=== 医療機関編集情報へ開設者名追加 by Monma(2017/02/14) end
      *
      *    カウント領域
       01  CNT-AREA.
           03  CNT-PAGE              PIC  9(03).
           03  CNT-RECE10            PIC  9(06).
           03  CNT-UPDFILE           PIC  9(06).
      *=== 県外後期の県内印字不具合対応 by Yoshikawa(2008/05/27) start
           03  CNT-KENNAI            PIC  9(02).
      *=== 県外後期の県内印字不具合対応 by Yoshikawa(2008/05/27) end
      *
      *    集計領域
       01  SUM-AREA.
           03  SUM-SYOKEI-TBL.
               05  SUM-TBL          OCCURS   22.
                   07  SUM-KENSU     PIC  9(06).
                   07  SUM-TENSU     PIC  9(07).
           03  SUM-GKENSU            PIC  9(09).
           03  SUM-GTENSU            PIC  9(10).
      *---(01.00.05) LINE ADD START ------------------------------------
           03  SUM-SYOKEI-KOUKI-TBL.
               05  SUM-KOUKI-TBL          OCCURS   26.
                   07  SUM-KOUKI-KENSU     PIC  9(06).
                   07  SUM-KOUKI-TENSU     PIC  9(07).
           03  SUM-KOUKI-GKENSU            PIC  9(09).
           03  SUM-KOUKI-GTENSU            PIC  9(10).
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *    キー用エリア
       01  KEY-AREA  VALUE   LOW-VALUE.
           03  KEY-NEW.
               05  KEY-N-KBN        PIC  9(01).
           03  KEY-OLD.
               05  KEY-O-KBN        PIC  9(01).
      *---(01.00.05) LINE ADD START ------------------------------------
           03  KEY-NEW2.
               05  KEY-N-KBN2       PIC  9(01).
           03  KEY-OLD2.
               05  KEY-O-KBN2       PIC  9(01).
      *---(01.00.05) LINE ADD END   ------------------------------------
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
      *
      *****************************************************************
      *    ファイルレイアウト
      *****************************************************************
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *    患者
       01  PTINF-REC.
           COPY    "CPPTINF.INC".
      *
      *---(01.00.05) LINE ADD END   ------------------------------------
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
      *    システム管理マスタ
           COPY    "CPSYSKANRI.INC".
      *
      *    医療機関情報
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
      *=== 医療機関編集情報へ開設者名追加 by Monma(2017/02/14) start
      *    医療機関住所編集情報（２）
           COPY    "CPSK1903.INC".
      *=== 医療機関編集情報へ開設者名追加 by Monma(2017/02/14) end
      *
      *    請求管理情報
           COPY    "CPRCF010.INC".
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
      *=== ver4.8対応 by Yoshikawa(2014/10/23) start
      *    一時ファイル名編集
           COPY    "CPORCSGETTEMP.INC".
      *=== ver4.8対応 by Yoshikawa(2014/10/23) end
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
           PERFORM  100-INIT-SEC
      *
           PERFORM  200-MAIN-SEC
      *=== 後期高齢のみでも印字 by Yoshikawa(2008/07/04) start
      *              UNTIL   FLG-END   =   1
      *=== 後期高齢のみでも印字 by Yoshikawa(2008/07/04) end
      *
           PERFORM  300-END-SEC
      *
           STOP     RUN
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
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
           INITIALIZE                   SPA-AREA
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
      *=== ver4.8対応 by Yoshikawa(2014/10/23) start
           INITIALIZE                  RECEERR
      *=== ver4.8対応 by Yoshikawa(2014/10/23) end
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
      ****2006/05/19 返戻対応
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *                                         WRK-PARA-HOSPID
                                               WRK-PARA-HOSPNUM
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
                                               WRK-PARA-JOBID
                                               WRK-PARA-SHELLID
                                               WRK-PARA-SYOKBN
      ****
      *=== 特別療養費国保対応 by Yoshikawa(2010/10/13) start
                                               WRK-PARA-TOKUBETU
      *=== 特別療養費国保対応 by Yoshikawa(2010/10/13) end
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/14) start
                                               WRK-PARA-STSRYYM
                                               WRK-PARA-EDSRYYM
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/14) end
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
                                               RECEERR
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
           END-UNSTRING
      *
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
           MOVE    WRK-PARA-HOSPNUM    TO  SPA-HOSPNUM
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
      *
      *    ステップ開始処理
           MOVE    "STS"           TO  SJOBKANRI-MODE
           INITIALIZE                  JOBKANRI-REC
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
           MOVE    SPA-HOSPNUM     TO  JOB-HOSPNUM
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
           MOVE    WRK-PARA-JOBID  TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID
                                   TO  JOB-SHELLID
           MOVE    "SOKATU2200"    TO  JOB-PGID
           MOVE    "国保総括表"    TO  JOB-SHELLMSG
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA
                                   JOBKANRI-REC
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
                                   SPA-AREA
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
      *
      *=== ver4.8対応 by Yoshikawa(2014/10/23) start
      *    サブプログラムより一時ファイル名編集
           INITIALIZE                      SGETTEMP-AREA
      *=== ver4.8対応 by Yoshikawa(2014/10/23) end
           MOVE    "SKT2200"         TO  SKT2200TP-FILE-ID
           MOVE    LNK-PRTKANRI-TERMID     TO  SKT2200TP-TERMID
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
           MOVE    WRK-PARA-HOSPNUM        TO  SKT2200TP-HOSPNUM
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
      *---(01.00.05) LINE ADD START ------------------------------------
           MOVE    "SKT2205"         TO  SKT2205TP-FILE-ID
           MOVE    LNK-PRTKANRI-TERMID     TO  SKT2205TP-TERMID
           MOVE    WRK-PARA-HOSPNUM        TO  SKT2205TP-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
           MOVE    "RECEUPD"           TO  RECEUPD-FILE-ID
           MOVE    LNK-PRTKANRI-TERMID     TO  RECEUPD-TERMID
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
           MOVE    WRK-PARA-HOSPNUM    TO  RECEUPD-HOSPNUM
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
      *
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *     MOVE    "RECEERR"           TO  RECEERR-FILE-ID
      *     MOVE    LNK-PRTKANRI-TERMID     TO  RECEERR-TERMID
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
      *
      *=== ver4.8対応 by Yoshikawa(2014/10/23) start
           MOVE  SKT2200TP-BASENAME      TO  SGETTEMP-BASENAMES (1)
           MOVE  SKT2205TP-BASENAME      TO  SGETTEMP-BASENAMES (2)
           MOVE  RECEUPD-BASENAME        TO  SGETTEMP-BASENAMES (3)
           MOVE  RECEERR                 TO  SGETTEMP-BASENAMES (4)
           CALL  "ORCSGETTEMP"           USING
                                         SGETTEMP-AREA
           MOVE  SGETTEMP-FULLNAMES (1)  TO  SKT2200TP-FULLNAME
           MOVE  SGETTEMP-FULLNAMES (2)  TO  SKT2205TP-FULLNAME
           MOVE  SGETTEMP-FULLNAMES (3)  TO  RECEUPD-FULLNAME
           MOVE  SGETTEMP-FULLNAMES (4)  TO  RECEERR
      *=== ver4.8対応 by Yoshikawa(2014/10/23) end
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/14) start
      *     MOVE    LNK-PRTKANRI-SRYYM(1:6)
      *                            TO      SYS-1001-STYUKYMD(1:6)
      *                                    SYS-1001-EDYUKYMD(1:6)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1001-STYUKYMD(1:6)
                                               SYS-1001-EDYUKYMD(1:6)
           ELSE
               MOVE    WRK-PARA-EDSRYYM    TO  SYS-1001-STYUKYMD(1:6)
                                               SYS-1001-EDYUKYMD(1:6)
           END-IF
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/14) end
           MOVE    "01"           TO      SYS-1001-STYUKYMD(7:2)
                                          SYS-1001-EDYUKYMD(7:2)
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
           MOVE    SPA-HOSPNUM    TO      SYS-1001-HOSPNUM
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/14) start
      *     MOVE     LNK-PRTKANRI-SRYYM(1:6)
      *                            TO      SYS-1002-STYUKYMD(1:6)
      *                                    SYS-1002-EDYUKYMD(1:6)
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1002-STYUKYMD(1:6)
                                               SYS-1002-EDYUKYMD(1:6)
           ELSE
               MOVE    WRK-PARA-EDSRYYM    TO  SYS-1002-STYUKYMD(1:6)
                                               SYS-1002-EDYUKYMD(1:6)
           END-IF
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/14) end
           MOVE     "01"          TO      SYS-1002-STYUKYMD(7:2)
                                          SYS-1002-EDYUKYMD(7:2)
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
           MOVE    SPA-HOSPNUM    TO      SYS-1002-HOSPNUM
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
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
      *=== シス管「1901」対応 By Yoshikawa(2007/10/03) start
           MOVE    SYS-1001-HOSPNAME   TO  WRK-HOSPNAME
      *=== 医療機関編集情報へ開設者名追加 by Monma(2017/02/14) start
           MOVE    SYS-1001-KAISETUNAME
                                       TO  WRK-KAISETUNAME
      *=== 医療機関編集情報へ開設者名追加 by Monma(2017/02/14) end
           MOVE    SYS-1002-ADRS       TO  WRK-HOSPADRS
           MOVE    SYS-1002-TEL        TO  WRK-HOSPTEL
      *    医療機関編集情報
           PERFORM 900-1900-READ-SEC
      *=== シス管「1901」対応 By Yoshikawa(2007/10/03) end
      *
           OPEN     OUTPUT  UPD-FILE
      *=== 特別療養費国保対応 by Yoshikawa(2010/10/13) start
      *****2006/05/19 返戻対応
      *     EVALUATE    WRK-PARA-SYOKBN
      *         WHEN    "2"
      **=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      **             MOVE    PATH-TBL-SEIKYU-KEY37    TO  WRK-PATH
      *             MOVE    "key37"        TO  WRK-PATH
      **=== Ver4.0対応 By Yoshikawa(2007/10/03) end
      **---(01.00.05) LINE ADD START ------------------------------------
      *             MOVE    "key65"     TO  WRK-PATH2
      **---(01.00.05) LINE ADD END   ------------------------------------
      *         WHEN    "1"
      **=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      **             MOVE    PATH-TBL-SEIKYU-KEY38    TO  WRK-PATH
      *             MOVE    "key38"        TO  WRK-PATH
      **=== Ver4.0対応 By Yoshikawa(2007/10/03) end
      **---(01.00.05) LINE ADD START ------------------------------------
      *             MOVE    "key66"     TO  WRK-PATH2
      **---(01.00.05) LINE ADD END   ------------------------------------
      *     END-EVALUATE
      *****
           EVALUATE    WRK-PARA-SYOKBN  ALSO  WRK-PARA-TOKUBETU
               WHEN   "2"               ALSO  "1"
                   MOVE    "key37"        TO  WRK-PATH
                   MOVE    "key65"        TO  WRK-PATH2
               WHEN   "1"               ALSO  "1"
                   MOVE    "key38"        TO  WRK-PATH
                   MOVE    "key66"        TO  WRK-PATH2
               WHEN   "2"               ALSO  "2"
                   MOVE    "key39"        TO  WRK-PATH
                   MOVE    "key65"        TO  WRK-PATH2
               WHEN   "1"               ALSO  "2"
                   MOVE    "key40"        TO  WRK-PATH
                   MOVE    "key66"        TO  WRK-PATH2
           END-EVALUATE
      *=== 特別療養費国保対応 by Yoshikawa(2010/10/13) end
      *
           PERFORM  900-SEIKYU-SELECT-SEC
           .
       100-INIT-EXT.
           EXIT.
      *
      *****************************************************************
      *    主    処理
      *****************************************************************
       200-MAIN-SEC               SECTION.
      *
           OPEN     OUTPUT  SKT2200TMP-FILE
           CLOSE            SKT2200TMP-FILE
           OPEN     I-O     SKT2200TMP-FILE
      *---(01.00.05) LINE ADD START ------------------------------------
           OPEN     OUTPUT  SKT2205TMP-FILE
           CLOSE            SKT2205TMP-FILE
           OPEN     I-O     SKT2205TMP-FILE
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *=== 後期高齢のみでも印字 by Yoshikawa(2008/07/04) start
      *     MOVE     ZERO    TO      FLG-END
      *=== 後期高齢のみでも印字 by Yoshikawa(2008/07/04) end
           MOVE     ZERO    TO      FLG-UPD
           INITIALIZE             SUM-AREA
      *
           PERFORM  2001-KOKUHO-SYUKEI-SEC
                    UNTIL   FLG-END   =   1
      *
      *---(01.00.05) LINE ADD START ------------------------------------
           PERFORM  900-SEIKYU-CLOSE-SEC
      *=== 特別療養費国保対応 by Yoshikawa(2010/10/13) start
           IF  WRK-PARA-TOKUBETU  =  "1"
      *=== 特別療養費国保対応 by Yoshikawa(2010/10/13) end
             MOVE     ZERO    TO        FLG-END
             MOVE     1       TO        FLG-KOUKI
             MOVE    "039"    TO        WRK-HKNNUM
             PERFORM  950-SEIKYU-SELECT-SEC
             PERFORM  2001-KOUKI-SYUKEI-SEC
                      UNTIL   FLG-END   =   1
             PERFORM  950-SEIKYU-CLOSE-SEC
      *=== 特別療養費国保対応 by Yoshikawa(2010/10/13) start
           ELSE
             MOVE     1       TO        FLG-KOUKI
      *=== 特別療養費国保対応 by Yoshikawa(2010/10/13) end
             MOVE     ZERO    TO        FLG-END
             MOVE    "040"    TO        WRK-HKNNUM
             PERFORM  950-SEIKYU-SELECT-SEC
             PERFORM  2001-KOUKI-SYUKEI-SEC
                      UNTIL   FLG-END   =   1
             PERFORM  950-SEIKYU-CLOSE-SEC
      *=== 特別療養費国保対応 by Yoshikawa(2010/10/13) start
           END-IF
      *=== 特別療養費国保対応 by Yoshikawa(2010/10/13) end
      *---(01.00.05) LINE ADD END   ------------------------------------
           CLOSE   UPD-FILE
           CLOSE   SKT2200TMP-FILE
      *---(01.00.05) LINE ADD START ------------------------------------
           CLOSE   SKT2205TMP-FILE
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
           IF  FLG-UPD   =       1
               PERFORM   2002-PRINT-SEC
           END-IF
           .
      *
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
                           PERFORM     3001-SEIKYU-UPDATE-SEC
                   END-IF
           END-IF
           MOVE  CNT-PAGE  TO  WRK-PARA-PAGE
      *
           DISPLAY "*** SOKATU2200 IN  "  CNT-RECE10
           DISPLAY "*** SOKATU2200 END ***"
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
       2001-KOKUHO-SYUKEI-SEC               SECTION.
      *
      *TMP-FILE キーセット
      *
           INITIALIZE       SKT2200TMP-REC
      *
           IF  RECE10-HKNJANUM(7:2)  =     SPACE
             MOVE  RECE10-HKNJANUM(1:6)  TO  SKT2200TMP-HKNJANUM(1:6)
           ELSE
             MOVE  RECE10-HKNJANUM(3:6)  TO  SKT2200TMP-HKNJANUM(1:6)
           END-IF
      *
      *    名古屋市の場合、代表番号セット
           IF  SKT2200TMP-HKNJANUM (1:3) = "234"
             MOVE  "234005"  TO  SKT2200TMP-HKNJANUM
           END-IF
      *
      *    静岡市の場合、代表番号セット
           IF  SKT2200TMP-HKNJANUM (1:3) = "224"
           OR  SKT2200TMP-HKNJANUM(1:5)  = "22001"
             MOVE  "224006"  TO  SKT2200TMP-HKNJANUM
           END-IF
      *---(01.00.02) LINE ADD START ------------------------------------
      *
      *    浜松の場合、代表番号セット
      *---(01.00.04) LINE ADD START ------------------------------------
      *     IF  SKT2200TMP-HKNJANUM (1:3) = "225"
           IF  SKT2200TMP-HKNJANUM (1:3) = "225"
           OR  SKT2200TMP-HKNJANUM (1:5) = "22002"
      *---(01.00.04) LINE ADD END   ------------------------------------
             MOVE  "225003"  TO  SKT2200TMP-HKNJANUM
           END-IF
      *---(01.00.02) LINE ADD END   ------------------------------------
      *
      *    県内・県外判定
             IF    RECE10-PREFKBN    =    "1"
               MOVE    1    TO    SKT2200TMP-KBN
             ELSE
               MOVE    2    TO    SKT2200TMP-KBN
             END-IF
      *=== 全国土木等は県外とする by Yoshikawa(2012/05/14) start
      *       IF    SKT2200TMP-HKNJANUM  =  "133033" OR
      *                                     "133264" OR
      *                                     "133298" 
      *         MOVE    1    TO    SKT2200TMP-KBN
      *         MOVE    1    TO    SKT2200TMP-KUMIAI
      *       END-IF
      *=== 全国土木等は県外とする by Yoshikawa(2012/05/14) end
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *    平成２０年３月以前は旧様式
           IF  RECE10-SRYYM  <  WRK-CONS-SRYYM-200804
      *=== 旧様式の返戻・月遅れ処理修正 by Yoshikawa(2008/06/23) start
      *         MOVE  RECE10-SRYYM        TO  SKT2200TMP-SRYYM
      *=== open-cobol1.0対応 by Yoshikawa(2010/11/25) start
      *       MOVE  "200803"            TO  SKT2200TMP-SRYYM
             MOVE  200803              TO  SKT2200TMP-SRYYM
      *=== open-cobol1.0対応 by Yoshikawa(2010/11/25) end
           ELSE
             IF  WRK-PARA-SYOKBN  =  "2"
      *=== 返戻が旧帳票で出る不具合修正 by Yoshikawa(2008/07/04) start
      *         MOVE  RECE10-SRYYM      TO  SKT2200TMP-SRYYM
      *=== open-cobol1.0対応 by Yoshikawa(2010/11/25) start
      *         MOVE  "200804"      TO  SKT2200TMP-SRYYM
               MOVE  200804        TO  SKT2200TMP-SRYYM
      *=== open-cobol1.0対応 by Yoshikawa(2010/11/25) end
      *=== 返戻が旧帳票で出る不具合修正 by Yoshikawa(2008/07/04) end
             END-IF
      *=== 旧様式の返戻・月遅れ処理修正 by Yoshikawa(2008/06/23) end
           END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
           PERFORM  800-SKTTMP-READ-SEC
           PERFORM  220-HKN-SYUKEI-SEC
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
      *---(01.00.05) LINE ADD START ------------------------------------
      *****************************************************************
      *    後期高齢都道府県別集計処理
      *****************************************************************
       2001-KOUKI-SYUKEI-SEC               SECTION.
      *
      *TMP-FILE キーセット
      *
           INITIALIZE       SKT2205TMP-REC
      *
      *    県内・県外判定
      *       IF    RECE10-PREFKBN    =    "1"
             IF    RECE10-HKNJANUM(3:2)    =    "22"
               MOVE    1    TO    SKT2205TMP-KBN
             ELSE
               MOVE    2    TO    SKT2205TMP-KBN
             END-IF
      *       IF    SKT2205TMP-HKNJANUM  =  "133033" OR
      *                                     "133264" OR
      *                                     "133298" 
      *         MOVE    1    TO    SKT2205TMP-KBN
      *         MOVE    1    TO    SKT2205TMP-KUMIAI
      *       END-IF
      *
      *     MOVE  RECE10-HKNJANUM  TO  SKT2205TMP-HKNJANUM
           MOVE  RECE10-HKNJANUM(3:2)  TO  SKT2205TMP-HKNJANUM
      *
      *=== 返戻が旧帳票で出る不具合修正 by Yoshikawa(2008/07/04) start
      **=== 旧様式の返戻・月遅れ処理修正 by Yoshikawa(2008/06/23) start
      *     IF  WRK-PARA-SYOKBN  =  "2"
      *         MOVE  RECE10-SRYYM      TO  SKT2205TMP-SRYYM
      *     END-IF
      **=== 旧様式の返戻・月遅れ処理修正 by Yoshikawa(2008/06/23) end
      *=== 返戻が旧帳票で出る不具合修正 by Yoshikawa(2008/07/04) start
      *
           PERFORM  850-SKTTMP-READ-SEC
      *
           PERFORM  220-KOUKI-SYUKEI-SEC
      *
      *    集計の対象にならなかったとき
           IF     FLG-UPD        =       1
                  PERFORM   240-UPD-FILE-HENSYU-SEC
      *
                  PERFORM   950-SEIKYU-READ-SEC
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
       2001-KOUKI-SYUKEI-EXT.
           EXIT.
      *---(01.00.05) LINE ADD END   ------------------------------------
      *****************************************************************
      *    一般被保険者・退職者(本人・家族)・老人保健分集計処理
      *****************************************************************
       220-HKN-SYUKEI-SEC               SECTION.
      *
      *    一般か退職者か
      *=== 特別療養費国保対応 by Yoshikawa(2010/10/13) start
      *     IF  RECE10-HKNNUM  =  "060"
           IF  RECE10-HKNNUM  =  "060" OR "068"
      *=== 特別療養費国保対応 by Yoshikawa(2010/10/13) end
      *    年齢チェック
             EVALUATE  TRUE
               WHEN  RECE10-AGE  >= 70
      *---(01.00.01) LINE ADD START ------------------------------------
      *           IF  RECE10-KYURATE  =  8
      *             MOVE  3   TO  IDX1
      *           ELSE
      *             MOVE  1   TO  IDX1
      *           END-IF
      *---(01.00.05) LINE ADD START ------------------------------------
      *           IF  RECE10-KYURATE  =  9
      *             MOVE  1   TO  IDX1
      *           ELSE
      *             MOVE  3   TO  IDX1
      *           END-IF
      *=== 前期高齢者２割対応 by Yoshikawa(2014/05/19) start
      *           IF  RECE10-KYURATE  =  7
      *             MOVE  3   TO  IDX1
      *           ELSE
      *             MOVE  1   TO  IDX1
      *           END-IF
                 EVALUATE  RECE10-KYURATE
                   WHEN  9
                     MOVE    1     TO    IDX1
                   WHEN  8
                     IF  RECE10-RECESYUBETU(4:1)  =  "7" OR "8"
                         MOVE    1    TO    IDX1
                     ELSE
                         MOVE    3    TO    IDX1
                     END-IF
                   WHEN  7
                     MOVE    3     TO    IDX1
                 END-EVALUATE
      *=== 前期高齢者２割対応 by Yoshikawa(2014/05/19) end
      *---(01.00.05) LINE ADD END   ------------------------------------
      *---(01.00.01) LINE ADD END   ------------------------------------
               WHEN  RECE10-AGE  >  2
                 MOVE  5     TO  IDX1
               WHEN  OTHER
                 MOVE  7     TO  IDX1
             END-EVALUATE
      *---(01.00.05) LINE ADD START ------------------------------------
             IF  (RECE10-SRYYM  >=  WRK-CONS-SRYYM-200804)
             AND  (RECE10-FLG (1)   =  1)
                 MOVE    7       TO  IDX1
             END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
           ELSE
             IF  RECE10-HONKZKKBN  =  "1"
      *    年齢チェック
               IF  RECE10-AGE  >=  70
      *---(01.00.01) LINE ADD START ------------------------------------
      *           IF  RECE10-KYURATE  =  8
      *             MOVE  13  TO  IDX1
      *           ELSE
      *             MOVE  11  TO  IDX1
      *           END-IF
      *---(01.00.05) LINE ADD START ------------------------------------
      *           IF  RECE10-KYURATE  =  9
      *             MOVE  11  TO  IDX1
      *           ELSE
      *             MOVE  13  TO  IDX1
      *           END-IF
                 IF  (RECE10-SRYYM  <  WRK-CONS-SRYYM-200804)
                     IF  RECE10-KYURATE  =  7
                         MOVE  13  TO  IDX1
                     ELSE
                         MOVE  11  TO  IDX1
                     END-IF
                 ELSE
                     MOVE  9  TO  IDX1
                 END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
      *---(01.00.01) LINE ADD END   ------------------------------------
               ELSE
                 MOVE  9     TO  IDX1
               END-IF
             ELSE
               IF  RECE10-AGE  >=  70
      *---(01.00.01) LINE ADD START ------------------------------------
      *           IF  RECE10-KYURATE  =  8
      *             MOVE  13  TO  IDX1
      *           ELSE
      *             MOVE  11  TO  IDX1
      *           END-IF
      *---(01.00.05) LINE ADD START ------------------------------------
      *           IF  RECE10-KYURATE  =  9
      *             MOVE  11  TO  IDX1
      *           ELSE
      *             MOVE  13  TO  IDX1
      *           END-IF
                 IF  (RECE10-SRYYM  <  WRK-CONS-SRYYM-200804)
                     IF  RECE10-KYURATE  =  7
                         MOVE  13  TO  IDX1
                     ELSE
                         MOVE  11  TO  IDX1
                     END-IF
                 ELSE
                     MOVE  9     TO  IDX1
                 END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
      *---(01.00.01) LINE ADD START ------------------------------------
               ELSE
      *---(01.00.05) LINE ADD START ------------------------------------
      *           IF RECE10-AGE  >  2
      *              MOVE  15    TO  IDX1
      *           ELSE
      *              MOVE  17    TO  IDX1
      *           END-IF
                 IF  (RECE10-SRYYM  >=  WRK-CONS-SRYYM-200804)
                 AND  (RECE10-FLG (1)   =  1)
                     MOVE    17      TO  IDX1
                 ELSE
                 IF RECE10-AGE  >  2
                    MOVE  15    TO  IDX1
                 ELSE
                    MOVE  17    TO  IDX1
                 END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
      *---(01.00.05) LINE ADD START ------------------------------------
                 END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
               END-IF
             END-IF
           END-IF
      *
      *    老人保健所持者か
      *---(01.00.05) LINE ADD START ------------------------------------
           IF  (RECE10-SRYYM  <  WRK-CONS-SRYYM-200804)
      *---(01.00.05) LINE ADD END   ------------------------------------
           IF  RECE10-RJNHKNNUM NOT = SPACE
             IF  RECE10-KYURATE  =  9
               MOVE  19      TO  IDX1
             ELSE
               MOVE  21      TO  IDX1
             END-IF
           END-IF
      *---(01.00.05) LINE ADD START ------------------------------------
           END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *    入院／外来
           IF  RECE10-NYUGAIKBN  =  2
               ADD   1       TO  IDX1
           END-IF
      *
           PERFORM   2201-HENSYU-SEC
      *
           IF      FLG-SKT2200TMP     =          1
                   WRITE    SKT2200TMP-REC
           ELSE
                   REWRITE  SKT2200TMP-REC
           END-IF
      *
           MOVE    1               TO  FLG-UPD 
      *
           .
       220-HKN-SYUKEI-EXT.
           EXIT.
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *****************************************************************
      *    後期高齢者分集計処理
      *****************************************************************
       220-KOUKI-SYUKEI-SEC               SECTION.
      *
      *    後期高齢者を印字する行
           IF  RECE10-KYURATE  =  7
               MOVE  25      TO  IDX1
           ELSE
               MOVE  23      TO  IDX1
           END-IF
      *
      *    入院／外来
           IF  RECE10-NYUGAIKBN  =  2
               ADD   1       TO  IDX1
           END-IF
      *
           PERFORM  2201-KOUKI-HENSYU-SEC
      *
           IF      FLG-SKT2205TMP  =  1
                   WRITE    SKT2205TMP-REC
           ELSE
                   REWRITE  SKT2205TMP-REC
           END-IF
      *
           MOVE    1               TO  FLG-UPD 
           .
       220-KOUKI-SYUKEI-EXT.
           EXIT.       
      *---(01.00.05) LINE ADD END   ------------------------------------
      *****************************************************************
      *    編集処理
      *****************************************************************
       2201-HENSYU-SEC              SECTION.
      *
      *   件数
          ADD  1  TO  SKT2200TMP-KENSU (IDX1)
      *
      *   点数
          COMPUTE  SKT2200TMP-TENSU (IDX1)  =
                   SKT2200TMP-TENSU (IDX1)  +  RECE10-TOTALTEN (1)
          .
      *
       2201-HENSYU-EXT.
           EXIT.
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *****************************************************************
      *    編集処理（後期高齢）
      *****************************************************************
       2201-KOUKI-HENSYU-SEC              SECTION.
      *
      *   件数
          ADD  1  TO  SKT2205TMP-KENSU (IDX1)
      *
      *   点数
          COMPUTE  SKT2205TMP-TENSU (IDX1)  =
                   SKT2205TMP-TENSU (IDX1)  +  RECE10-TOTALTEN (1)
          .
      *
       2201-KOUKI-HENSYU-EXT.
           EXIT.
      *
      *---(01.00.05) LINE ADD END   ------------------------------------
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
           .
      *
       240-UPD-FILE-HENSYU-EXT.
           EXIT.
      *****************************************************************
      *    帳票ファイル出力処理                    
      *****************************************************************
       2002-PRINT-SEC                          SECTION.
      *
      *=== 印刷処理修正 by Yoshikawa(2008/06/22) start
      *     OPEN       INPUT       SKT2200TMP-FILE
      **---(01.00.05) LINE ADD START ------------------------------------
      *     OPEN       INPUT       SKT2205TMP-FILE
      **---(01.00.05) LINE ADD END   ------------------------------------
      **
      *     MOVE       ZERO        TO        FLG-PRINT
      **---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE       ZERO        TO        FLG-PRINT2
      **---(01.00.05) LINE ADD END   ------------------------------------
      **=== 県外後期の県内印字不具合対応 by Yoshikawa(2008/05/27) start
      *     MOVE       ZERO        TO        CNT-KENNAI
      **=== 県外後期の県内印字不具合対応 by Yoshikawa(2008/05/27) end
      **
      **    一時ファイル読込
      *     PERFORM  900-TMP-READ-SEC
      **
      *     MOVE  KEY-NEW  TO  KEY-OLD
      **---(01.00.05) LINE ADD START ------------------------------------
      *     PERFORM  950-TMP-READ-SEC
      *     MOVE  KEY-NEW2  TO  KEY-OLD2
      **---(01.00.05) LINE ADD END   ------------------------------------
      **
      **---(01.00.05) LINE ADD START ------------------------------------
      **     PERFORM  UNTIL  FLG-PRINT  =  1
      *     PERFORM  UNTIL  FLG-PRINT  =  1 AND FLG-PRINT2  =  1
      *              OR  CNT-KENNAI > 100
      **---(01.00.05) LINE ADD END   ------------------------------------
      **
      **    帳票編集<見出し>処理
      *         PERFORM  310-HEAD-HEN-SEC
      **    帳票編集<明細>処理
      *         PERFORM  320-BODY-HEN-SEC
      **    帳票編集<合計>処理
      **---(01.00.03) LINE ADD START ------------------------------------
      **         PERFORM  325-SUM-HEN-SEC
      *         IF  FLG-PRINT  =  1  OR  KEY-NEW  NOT =  KEY-OLD
      *             PERFORM  325-SUM-HEN-SEC
      *         END-IF
      **---(01.00.05) LINE ADD START ------------------------------------
      *         IF  WRK-SYMD (1:6)  >=  WRK-CONS-SRYYM-200804
      **=== 県外後期の県内印字不具合対応 by Yoshikawa(2008/05/27) start
      *         AND CNT-KENNAI <  2
      **        県内2枚目以降の後期高齢欄には何も印字しない
      **=== 県外後期の県内印字不具合対応 by Yoshikawa(2008/05/27) end
      **    帳票編集<明細>処理（後期高齢）
      *             PERFORM  320-BODY-HEN-KOUKI-SEC
      **    帳票編集<合計>処理（後期高齢）
      *             IF  FLG-PRINT2  =  1  OR  KEY-NEW2  NOT =  KEY-OLD2
      **         IF  FLG-PRINT2  =  1
      *                 PERFORM  325-SUM-HEN-KOUKI-SEC
      *             END-IF
      *         END-IF
      **---(01.00.05) LINE ADD END   ------------------------------------
      **---(01.00.03) LINE ADD END   ------------------------------------
      **    帳票印刷処理
      *         PERFORM  330-PRINT-OUT-SEC
      *     END-PERFORM
      **
      *     CLOSE      SKT2200TMP-FILE
      **---(01.00.05) LINE ADD START ------------------------------------
      *     CLOSE      SKT2205TMP-FILE
      **---(01.00.05) LINE ADD END   ------------------------------------
      **
      *********県内処理*********
           OPEN       INPUT       SKT2200TMP-FILE
           OPEN       INPUT       SKT2205TMP-FILE
      *
           MOVE       ZERO        TO        FLG-PRINT
           MOVE       ZERO        TO        FLG-PRINT2
           MOVE       ZERO        TO        FLG-PRINTCHK
      *
      *    一時ファイル読込
           PERFORM  900-TMP-READ-SEC
           MOVE  KEY-NEW  TO  KEY-OLD
      *=== 返戻が旧帳票で出る不具合修正 by Yoshikawa(2008/07/04) start
           MOVE  WRK-SRYYM-NEW  TO  WRK-SRYYM-OLD
      *=== 返戻が旧帳票で出る不具合修正 by Yoshikawa(2008/07/04) end
      *
           PERFORM  950-TMP-READ-SEC
           MOVE  KEY-NEW2  TO  KEY-OLD2
      *
           PERFORM  UNTIL  FLG-PRINT  =  1  
                    AND    FLG-PRINT2 =  1
      *
      *      H20年3月以前は旧様式
             IF  (SKT2200TMP-SRYYM  NOT  =  ZERO
             AND SKT2200TMP-SRYYM  <  WRK-CONS-SRYYM-200804)
             AND FLG-PRINT  =  ZERO
               IF  SKT2200TMP-KBN  =  1
      *          帳票編集<見出し>処理
                 PERFORM  310-HEAD-HEN-SEC
      *          帳票編集<明細>処理
                 PERFORM  320-BODY-HEN-SEC
      *          帳票編集<合計>処理
      *=== 返戻が旧帳票で出る不具合修正 by Yoshikawa(2008/07/04) start
      *           IF  FLG-PRINT  =  1
                 IF  FLG-PRINT  =  1
                 OR  WRK-SRYYM-NEW  NOT =  WRK-SRYYM-OLD
                 OR  SKT2200TMP-KBN  =  2
      *=== 返戻が旧帳票で出る不具合修正 by Yoshikawa(2008/07/04) end
                   PERFORM  325-SUM-HEN-SEC
                 END-IF
      *          帳票印刷処理
                 PERFORM  330-PRINT-OUT-SEC
               ELSE
                 PERFORM  900-TMP-READ-SEC
                 MOVE  KEY-NEW  TO  KEY-OLD
      *=== 返戻が旧帳票で出る不具合修正 by Yoshikawa(2008/07/04) start
                 MOVE  WRK-SRYYM-NEW  TO  WRK-SRYYM-OLD
      *=== 返戻が旧帳票で出る不具合修正 by Yoshikawa(2008/07/04) end
               END-IF
             ELSE
      *
      *      新様式
      *        県内データ以外は飛ばす
               PERFORM UNTIL SKT2200TMP-KBN = 1 
                       OR    FLG-PRINT = 1
                 PERFORM  900-TMP-READ-SEC
                 MOVE  KEY-NEW  TO  KEY-OLD
      *=== 返戻が旧帳票で出る不具合修正 by Yoshikawa(2008/07/04) start
                 MOVE  WRK-SRYYM-NEW  TO  WRK-SRYYM-OLD
      *=== 返戻が旧帳票で出る不具合修正 by Yoshikawa(2008/07/04) end
               END-PERFORM
               MOVE    ZERO       TO        FLG-PRINTCHK
               IF  SKT2200TMP-KBN  =  1  
               AND  FLG-PRINT NOT  =  1
                 MOVE  1          TO        FLG-PRINTCHK
      *          帳票編集<見出し>処理
                 PERFORM  310-HEAD-HEN-SEC
      *          帳票編集<明細>処理
                 PERFORM  320-BODY-HEN-SEC
      *          帳票編集<合計>処理
      *=== 県内と県外の合計を分ける by Yoshikawa(2008/07/04) start
      *           IF  FLG-PRINT  =  1
                 IF  FLG-PRINT  =  1  OR  SKT2200TMP-KBN  =  2
      *=== 県内と県外の合計を分ける by Yoshikawa(2008/07/04) end
      *=== 合計が旧様式で出る不具合修正 by Yoshikawa(2008/09/05) start
      *=== 合計を最終ページに印字 by Yoshikawa(2008/10/02) start
      *           OR  SKT2200TMP-SRYYM  <  WRK-CONS-SRYYM-200804
                 OR  (SKT2200TMP-SRYYM  NOT =  ZERO
                      AND  SKT2200TMP-SRYYM  <  WRK-CONS-SRYYM-200804)
      *=== 合計を最終ページに印字 by Yoshikawa(2008/10/02) end
      *=== 合計が旧様式で出る不具合修正 by Yoshikawa(2008/09/05) end
                   PERFORM  325-SUM-HEN-SEC
                 END-IF
               ELSE
                 PERFORM  900-TMP-READ-SEC
                 MOVE  KEY-NEW  TO  KEY-OLD
      *=== 返戻が旧帳票で出る不具合修正 by Yoshikawa(2008/07/04) start
                 MOVE  WRK-SRYYM-NEW  TO  WRK-SRYYM-OLD
      *=== 返戻が旧帳票で出る不具合修正 by Yoshikawa(2008/07/04) end
               END-IF
      *
      *        後期高齢
      *        県内データ以外は飛ばす
               PERFORM UNTIL SKT2205TMP-KBN = 1 
                       OR    FLG-PRINT2 = 1
                 PERFORM  950-TMP-READ-SEC
                 MOVE  KEY-NEW2  TO  KEY-OLD2
               END-PERFORM
               IF  SKT2205TMP-KBN  =  1  
               AND  FLG-PRINT2 NOT  =  1
      *          国保がなかった場合見出しを印字
                 IF  FLG-PRINTCHK  =  ZERO
      *            帳票編集<見出し>処理(後期高齢)
                   PERFORM  310-HEAD-HEN-KOUKI-SEC
                   MOVE  1        TO        FLG-PRINTCHK
                 END-IF
      *          帳票編集処理（後期高齢）
                 PERFORM  320-BODY-HEN-KOUKI-SEC
      *          帳票編集<合計>処理（後期高齢）
      *=== 県内と県外の合計を分ける by Yoshikawa(2008/07/04) start
      *           IF  FLG-PRINT2  =  1
                 IF  FLG-PRINT2  =  1  OR  SKT2205TMP-KBN  =  2
      *=== 県内と県外の合計を分ける by Yoshikawa(2008/07/04) end
                   PERFORM  325-SUM-HEN-KOUKI-SEC
                 END-IF
               ELSE
                 PERFORM  950-TMP-READ-SEC
                 MOVE  KEY-NEW2  TO  KEY-OLD2
               END-IF
      *
      *        国保か後期高齢のどちらかがあれば印刷
               IF  FLG-PRINTCHK  =  1
      *=== 返戻が旧帳票で出る不具合修正 by Yoshikawa(2008/07/04) start
                 MOVE  ZERO  TO  FLG-CHK
      *=== 返戻が旧帳票で出る不具合修正 by Yoshikawa(2008/07/04) end
      *          帳票印刷処理
                 PERFORM  330-PRINT-OUT-SEC
               END-IF
             END-IF
           END-PERFORM
      *
           CLOSE      SKT2200TMP-FILE
           CLOSE      SKT2205TMP-FILE
      *
      *********県外処理*********
           OPEN       INPUT       SKT2200TMP-FILE
           OPEN       INPUT       SKT2205TMP-FILE
      *
           MOVE       ZERO        TO        FLG-PRINT
           MOVE       ZERO        TO        FLG-PRINT2
           MOVE       ZERO        TO        FLG-PRINTCHK
      *    一時ファイル読込
           PERFORM  900-TMP-READ-SEC
           MOVE  KEY-NEW  TO  KEY-OLD
      *=== 返戻が旧帳票で出る不具合修正 by Yoshikawa(2008/07/04) start
           MOVE  WRK-SRYYM-NEW  TO  WRK-SRYYM-OLD
      *=== 返戻が旧帳票で出る不具合修正 by Yoshikawa(2008/07/04) end
      *
           PERFORM  950-TMP-READ-SEC
           MOVE  KEY-NEW2  TO  KEY-OLD2
      *
           PERFORM  UNTIL  FLG-PRINT  =  1 
                    AND    FLG-PRINT2 =  1
      *
      *      H20年3月以前は旧様式
             IF  (SKT2200TMP-SRYYM  NOT  =  ZERO
             AND SKT2200TMP-SRYYM  <  WRK-CONS-SRYYM-200804)
             AND FLG-PRINT  =  ZERO
               IF  SKT2200TMP-KBN  =  2
      *          帳票編集<見出し>処理
                 PERFORM  310-HEAD-HEN-SEC
      *          帳票編集<明細>処理
                 PERFORM  320-BODY-HEN-SEC
      *          帳票編集<合計>処理
      *=== 返戻が旧帳票で出る不具合修正 by Yoshikawa(2008/07/04) start
      *           IF  FLG-PRINT  =  1
                 IF  FLG-PRINT  =  1
                 OR  WRK-SRYYM-NEW  NOT =  WRK-SRYYM-OLD
      *=== 返戻が旧帳票で出る不具合修正 by Yoshikawa(2008/07/04) end
                   PERFORM  325-SUM-HEN-SEC
                 END-IF
      *          帳票印刷処理
                PERFORM  330-PRINT-OUT-SEC
               ELSE
                 PERFORM  900-TMP-READ-SEC
                 MOVE  KEY-NEW  TO  KEY-OLD
      *=== 返戻が旧帳票で出る不具合修正 by Yoshikawa(2008/07/04) start
                 MOVE  WRK-SRYYM-NEW  TO  WRK-SRYYM-OLD
      *=== 返戻が旧帳票で出る不具合修正 by Yoshikawa(2008/07/04) end
               END-IF
             ELSE
      *
      *      新様式
      *        県外データ以外は飛ばす
               PERFORM UNTIL SKT2200TMP-KBN = 2 
                       OR    FLG-PRINT = 1
                 PERFORM  900-TMP-READ-SEC
                 MOVE  KEY-NEW  TO  KEY-OLD
      *=== 返戻が旧帳票で出る不具合修正 by Yoshikawa(2008/07/04) start
                 MOVE  WRK-SRYYM-NEW  TO  WRK-SRYYM-OLD
      *=== 返戻が旧帳票で出る不具合修正 by Yoshikawa(2008/07/04) end
               END-PERFORM
               MOVE    ZERO       TO        FLG-PRINTCHK
               IF  SKT2200TMP-KBN  =  2  
               AND  FLG-PRINT NOT  =  1
                 MOVE  1          TO        FLG-PRINTCHK
      *          帳票編集<見出し>処理
                 PERFORM  310-HEAD-HEN-SEC
      *          帳票編集<明細>処理
                 PERFORM  320-BODY-HEN-SEC
      *          帳票編集<合計>処理
      *=== 返戻が旧帳票で出る不具合修正 by Yoshikawa(2008/07/04) start
      *           IF  FLG-PRINT  =  1
                 IF  FLG-PRINT  =  1
                 OR  WRK-SRYYM-NEW  NOT =  WRK-SRYYM-OLD
      *=== 返戻が旧帳票で出る不具合修正 by Yoshikawa(2008/07/04) end
      *=== 合計が旧様式で出る不具合修正 by Yoshikawa(2008/09/05) start
      *=== 合計を最終ページに印字 by Yoshikawa(2008/10/02) start
      *           OR  SKT2200TMP-SRYYM  <  WRK-CONS-SRYYM-200804
                 OR  (SKT2200TMP-SRYYM  NOT =  ZERO
                      AND  SKT2200TMP-SRYYM  <  WRK-CONS-SRYYM-200804)
      *=== 合計を最終ページに印字 by Yoshikawa(2008/10/02) end
      *=== 合計が旧様式で出る不具合修正 by Yoshikawa(2008/09/05) end
                   PERFORM  325-SUM-HEN-SEC
                 END-IF
               ELSE
                 PERFORM  900-TMP-READ-SEC
                 MOVE  KEY-NEW  TO  KEY-OLD
      *=== 返戻が旧帳票で出る不具合修正 by Yoshikawa(2008/07/04) start
                 MOVE  WRK-SRYYM-NEW  TO  WRK-SRYYM-OLD
      *=== 返戻が旧帳票で出る不具合修正 by Yoshikawa(2008/07/04) end
               END-IF
      *
      *        後期高齢
      *        県外データ以外は飛ばす
               PERFORM UNTIL SKT2205TMP-KBN = 2 
                       OR    FLG-PRINT2 = 1
                 PERFORM  950-TMP-READ-SEC
                 MOVE  KEY-NEW2  TO  KEY-OLD2
               END-PERFORM
               IF  SKT2205TMP-KBN  =  2  
               AND  FLG-PRINT2 NOT  =  1
      *          国保がなかった場合見出しを印字
                 IF FLG-PRINTCHK  =  ZERO
      *            帳票編集<見出し>処理(後期高齢)
                   PERFORM  310-HEAD-HEN-KOUKI-SEC
                   MOVE  1        TO        FLG-PRINTCHK
                 END-IF
      *          帳票編集処理（後期高齢）
                 PERFORM  320-BODY-HEN-KOUKI-SEC
      *          帳票編集<合計>処理（後期高齢）
                 IF  FLG-PRINT2  =  1
                   PERFORM  325-SUM-HEN-KOUKI-SEC
                 END-IF
               ELSE
                 PERFORM  950-TMP-READ-SEC
                 MOVE  KEY-NEW2  TO  KEY-OLD2
               END-IF
      *
      *        国保か後期高齢のどちらかがあれば印刷
               IF  FLG-PRINTCHK  =  1
      *=== 返戻が旧帳票で出る不具合修正 by Yoshikawa(2008/07/04) start
                 MOVE  ZERO  TO  FLG-CHK
      *=== 返戻が旧帳票で出る不具合修正 by Yoshikawa(2008/07/04) end
      *          帳票印刷処理
                 PERFORM  330-PRINT-OUT-SEC
               END-IF
             END-IF
           END-PERFORM
      *
           CLOSE      SKT2200TMP-FILE
           CLOSE      SKT2205TMP-FILE
      *=== 印刷処理修正 by Yoshikawa(2008/06/23) end
      *
           .
       2002-PRINT-EXT.
           EXIT.
      *
      *****************************************************************
      *    帳票編集<ヘッダー部>処理
      *****************************************************************
       310-HEAD-HEN-SEC                 SECTION.
      *
           INITIALIZE                        SKT2200
      *
      *    診療年月
      *---(01.00.04) LINE ADD START ------------------------------------
      *     MOVE    WRK-SRYYMWH           TO  SKT2200-PRTYM
      *=== 返戻が旧帳票で出る不具合修正 by Yoshikawa(2008/07/04) start
      *     IF  SKT2200TMP-SRYYM  NOT =  ZERO
           IF  SKT2200TMP-SRYYM  NOT =  ZERO
           AND SKT2200TMP-SRYYM  <      WRK-CONS-SRYYM-200804
      *=== 返戻が旧帳票で出る不具合修正 by Yoshikawa(2008/07/04) end
               MOVE  SKT2200TMP-SRYYM    TO  WRK-SYMD (1:6)
      *=== 旧様式の返戻・月遅れ処理修正 by Yoshikawa(2008/06/23) start
               MOVE  1                   TO  FLG-CHK
      *=== 旧様式の返戻・月遅れ処理修正 by Yoshikawa(2008/06/23) end
           ELSE
               MOVE  LNK-PRTKANRI-SRYYM  TO  WRK-SYMD (1:6)
      *=== 旧様式の返戻・月遅れ処理修正 by Yoshikawa(2008/06/23) start
               MOVE  ZERO                TO  FLG-CHK
      *=== 旧様式の返戻・月遅れ処理修正 by Yoshikawa(2008/06/23) end
           END-IF
      *=== 旧様式の返戻・月遅れ処理修正 by Yoshikawa(2008/06/23) start
      *     MOVE    "01"                  TO  WRK-SYMD (7:2)
      *     PERFORM 31012-SEIWA-HEN-SEC
      *     MOVE    WRK-HENYMDG(1:16)     TO  WRK-SRYYMWH 
      *=== 旧様式の返戻・月遅れ処理修正 by Yoshikawa(2008/06/23) end
           MOVE    WRK-SRYYMWH           TO  SKT2200-PRTYM
      *
      *    医療機関住所
      *=== シス管「1901」対応 By Yoshikawa(2007/10/03) start
      *     MOVE    SYS-1002-ADRS         TO  SKT2200-ADRS
           MOVE    WRK-HOSPADRS          TO  SKT2200-ADRS
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/10) start
           INSPECT SKT2200-ADRS          REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/10) end
      *=== シス管「1901」対応 By Yoshikawa(2007/10/03) end
      *
      *    医療機関名
      *=== シス管「1901」対応 By Yoshikawa(2007/10/03) start
      *     MOVE    SYS-1001-HOSPNAME     TO  SKT2200-HOSPNAME
           MOVE    WRK-HOSPNAME          TO  SKT2200-HOSPNAME
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/10) start
           INSPECT SKT2200-HOSPNAME      REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/10) end
      *=== シス管「1901」対応 By Yoshikawa(2007/10/03) end
      *
      *    医療機関コード
           MOVE    SYS-1001-HOSPCDN      TO  SKT2200-HOSPCDN
      *
      *    点数表区分
           EVALUATE  SYS-1001-TENHYOKBN
             WHEN  1     MOVE  "○"      TO  SKT2200-TENHYOKBN (1)
             WHEN  3     MOVE  "○"      TO  SKT2200-TENHYOKBN (2)
             WHEN  4     MOVE  "○"      TO  SKT2200-TENHYOKBN (3)
             WHEN  6     MOVE  "○"      TO  SKT2200-TENHYOKBN (4)
             WHEN  7     MOVE  "○"      TO  SKT2200-TENHYOKBN (5)
           END-EVALUATE
      *
      *=== 特別療養費国保対応 by Yoshikawa(2010/10/13) start
      *    特別療養費
           IF  WRK-PARA-TOKUBETU  =  "2"
             MOVE  "特別療養費"          TO  SKT2200-TOKUBETU
           END-IF
      *=== 特別療養費国保対応 by Yoshikawa(2010/10/13) end
      *
           .
       310-HEAD-HEN-EXT.
           EXIT.
      *
      *=== 印刷処理修正 by Yoshikawa(2008/06/23) start
      *****************************************************************
      *    帳票編集<ヘッダー部>処理（後期高齢）
      *****************************************************************
       310-HEAD-HEN-KOUKI-SEC            SECTION.
      *
           INITIALIZE                        SKT2200
      *
           MOVE  ZERO                    TO  FLG-CHK
      *    診療年月
           MOVE    WRK-SRYYMWH           TO  SKT2200-PRTYM
      *
      *    医療機関住所
           MOVE    WRK-HOSPADRS          TO  SKT2200-ADRS
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/10) start
           INSPECT SKT2200-ADRS          REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/10) end
      *
      *    医療機関名
           MOVE    WRK-HOSPNAME          TO  SKT2200-HOSPNAME
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/10) start
           INSPECT SKT2200-HOSPNAME      REPLACING ALL "  " BY "　"
      *=== 医療機関情報編集対応 by Yoshikawa(2013/01/10) end
      *
      *    医療機関コード
           MOVE    SYS-1001-HOSPCDN      TO  SKT2200-HOSPCDN
      *
      *    点数表区分
           EVALUATE  SYS-1001-TENHYOKBN
             WHEN  1     MOVE  "○"      TO  SKT2200-TENHYOKBN (1)
             WHEN  3     MOVE  "○"      TO  SKT2200-TENHYOKBN (2)
             WHEN  4     MOVE  "○"      TO  SKT2200-TENHYOKBN (3)
             WHEN  6     MOVE  "○"      TO  SKT2200-TENHYOKBN (4)
             WHEN  7     MOVE  "○"      TO  SKT2200-TENHYOKBN (5)
           END-EVALUATE
      *
      *=== 特別療養費国保対応 by Yoshikawa(2010/10/13) start
      *    特別療養費
           IF  WRK-PARA-TOKUBETU  =  "2"
             MOVE  "特別療養費"          TO  SKT2200-TOKUBETU
           END-IF
      *=== 特別療養費国保対応 by Yoshikawa(2010/10/13) end
      *
           .
       310-HEAD-HEN-KOUKI-EXT.
           EXIT.
      *
      *=== 印刷処理修正 by Yoshikawa(2008/06/23) end
      *****************************************************************
      *    帳票編集<明細行>処理
      *****************************************************************
       320-BODY-HEN-SEC               SECTION.
      *
      *---(01.00.05) LINE ADD START ------------------------------------
           IF  WRK-SYMD (1:6)  >=  WRK-CONS-SRYYM-200804
               MOVE  6  TO  WRK-RETSU
           ELSE
               MOVE  8  TO  WRK-RETSU
           END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
           PERFORM  VARYING  IDX1  FROM  1  BY  1
      *---(01.00.05) LINE ADD START ------------------------------------
      *              UNTIL    IDX1  >     8  OR
                    UNTIL    IDX1  >     WRK-RETSU  OR
      *---(01.00.05) LINE ADD END   ------------------------------------
                             KEY-NEW  NOT =  KEY-OLD  OR
      *=== 返戻が旧帳票で出る不具合修正 by Yoshikawa(2008/07/04) start
                             WRK-SRYYM-NEW  NOT = WRK-SRYYM-OLD  OR
      *=== 返戻が旧帳票で出る不具合修正 by Yoshikawa(2008/07/04) end
                             FLG-PRINT  =  1
           DISPLAY "HKNJANUM =" SKT2200TMP-HKNJANUM
      *    保険者名
             PERFORM  920-HKNJAINF-SET-SEC
      *
             PERFORM  VARYING  IDX2  FROM  1  BY  1
                      UNTIL    IDX2  >     22
      *    件数
               MOVE  SKT2200TMP-KENSU (IDX2)  TO  WRK-Z6
               MOVE  WRK-Z6  TO  SKT2200-KENSU (IDX1 IDX2)
      *
      *    点数
               MOVE  SKT2200TMP-TENSU (IDX2)  TO  WRK-Z9
               MOVE  WRK-Z9  TO  SKT2200-TENSU (IDX1 IDX2)
      *
      *    小計：件数
               ADD   SKT2200TMP-KENSU (IDX2)  TO  SUM-KENSU (IDX2)
      *
      *    小計：点数
               ADD   SKT2200TMP-TENSU (IDX2)  TO  SUM-TENSU (IDX2)
      *
      *    合計：件数
               ADD   SKT2200TMP-KENSU (IDX2)  TO  SUM-GKENSU
      *
      *    合計：点数
               ADD   SKT2200TMP-TENSU (IDX2)  TO  SUM-GTENSU
             END-PERFORM
      *
      *    一時ファイル読込
             PERFORM  900-TMP-READ-SEC
           END-PERFORM
      *=== 印刷処理修正 by Yoshikawa(2008/06/23) start
      **=== 県外後期の県内印字不具合対応 by Yoshikawa(2008/05/27) start
      **    県内分の枚数をカウント
      *     IF  KEY-OLD  =  1
      *         ADD   1  TO  CNT-KENNAI
      *     ELSE
      *         MOVE  0  TO  CNT-KENNAI
      *     END-IF
      **=== 県外後期の県内印字不具合対応 by Yoshikawa(2008/05/27) end
      *=== 印刷処理修正 by Yoshikawa(2008/06/23) end
      *
           .
       320-BODY-HEN-EXT.
           EXIT.
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *****************************************************************
      *    帳票編集<明細行>処理
      *****************************************************************
       320-BODY-HEN-KOUKI-SEC               SECTION.
      *
           PERFORM  VARYING  IDX1  FROM  1  BY  1
                    UNTIL    IDX1  >     6  OR
                             KEY-NEW2  NOT =  KEY-OLD2  OR
                             FLG-PRINT2  =  1
      *    都道府県
            DISPLAY "KOUKI KENNUM =" SKT2205TMP-HKNJANUM
             PERFORM  920-TODOUHUKEN-SET-SEC
      *
             PERFORM  VARYING  IDX2  FROM  23  BY  1
                      UNTIL    IDX2  >     26
      *    件数
               MOVE  SKT2205TMP-KENSU (IDX2)  TO  WRK-Z6
               MOVE  WRK-Z6  TO  SKT2200-KENSU (IDX1 IDX2)
      *
      *    点数
               MOVE  SKT2205TMP-TENSU (IDX2)  TO  WRK-Z9
               MOVE  WRK-Z9  TO  SKT2200-TENSU (IDX1 IDX2)
      *
      *    小計：件数
               ADD   SKT2205TMP-KENSU (IDX2)
                   TO  SUM-KOUKI-KENSU (IDX2)
      *
      *    小計：点数
               ADD   SKT2205TMP-TENSU (IDX2)
                   TO  SUM-KOUKI-TENSU (IDX2)
      *
      *    合計：件数
               ADD   SKT2205TMP-KENSU (IDX2)
                   TO  SUM-KOUKI-GKENSU
      *
      *    合計：点数
               ADD   SKT2205TMP-TENSU (IDX2)
                   TO  SUM-KOUKI-GTENSU
             END-PERFORM
      *
      *    一時ファイル読込
             PERFORM  950-TMP-READ-SEC
           END-PERFORM
      *
           .
       320-BODY-HEN-KOUKI-EXT.
           EXIT.
      *
      *---(01.00.05) LINE ADD END   ------------------------------------
      *****************************************************************
      *    帳票編集<合計>処理
      *****************************************************************
       325-SUM-HEN-SEC               SECTION.
      *
           PERFORM  VARYING  IDX1  FROM  1  BY  1
                    UNTIL    IDX1  >     22
      *    小計：件数
             MOVE  SUM-KENSU (IDX1)  TO  WRK-Z6
             MOVE  WRK-Z6            TO  SKT2200-G-KENSU (IDX1)
      *
      *    小計：点数
             MOVE  SUM-TENSU (IDX1)  TO  WRK-Z9
             MOVE  WRK-Z9            TO  SKT2200-G-TENSU (IDX1)
           END-PERFORM
      *
           INITIALIZE  SUM-SYOKEI-TBL
      *
      *---(01.00.03) LINE ADD START ------------------------------------
      *     IF  FLG-PRINT  =  1  OR  KEY-NEW  NOT =  KEY-OLD
      *---(01.00.03) LINE ADD END   ------------------------------------
      *    合計：件数
             MOVE  SUM-GKENSU          TO  WRK-Z9
             MOVE  WRK-Z9              TO  SKT2200-GKENSU (1)
      *    合計：点数
             MOVE  SUM-GTENSU          TO  WRK-Z10
             MOVE  WRK-Z10             TO  SKT2200-GTENSU (1)
      *
             INITIALIZE  SUM-GKENSU
             INITIALIZE  SUM-GTENSU
             MOVE  KEY-NEW  TO  KEY-OLD
      *=== 返戻が旧帳票で出る不具合修正 by Yoshikawa(2008/07/04) start
             MOVE  WRK-SRYYM-NEW  TO  WRK-SRYYM-OLD
      *=== 返戻が旧帳票で出る不具合修正 by Yoshikawa(2008/07/04) end
      *---(01.00.03) LINE ADD START ------------------------------------
      *     END-IF
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
           .
       325-SUM-HEN-EXT.
           EXIT.
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *****************************************************************
      *    帳票編集<合計>処理（後期高齢）
      *****************************************************************
       325-SUM-HEN-KOUKI-SEC               SECTION.
      *
           PERFORM  VARYING  IDX1  FROM  23  BY  1
                    UNTIL    IDX1  >     26
      *    小計：件数
             MOVE  SUM-KOUKI-KENSU (IDX1)  TO  WRK-Z6
             MOVE  WRK-Z6            TO  SKT2200-G-KENSU (IDX1)
      *
      *    小計：点数
             MOVE  SUM-KOUKI-TENSU (IDX1)  TO  WRK-Z9
             MOVE  WRK-Z9            TO  SKT2200-G-TENSU (IDX1)
           END-PERFORM
      *
           INITIALIZE  SUM-SYOKEI-KOUKI-TBL
      *
      *    合計：件数
             MOVE  SUM-KOUKI-GKENSU          TO  WRK-Z9
             MOVE  WRK-Z9              TO  SKT2200-GKENSU (2)
      *    合計：点数
             MOVE  SUM-KOUKI-GTENSU          TO  WRK-Z10
             MOVE  WRK-Z10             TO  SKT2200-GTENSU (2)
      *
             INITIALIZE  SUM-KOUKI-GKENSU
             INITIALIZE  SUM-KOUKI-GTENSU
             MOVE  KEY-NEW2  TO  KEY-OLD2
      *
           .
       325-SUM-HEN-KOUKI-EXT.
           EXIT.
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *****************************************************************
      *    帳票印刷処理
      *****************************************************************
       330-PRINT-OUT-SEC                   SECTION.
      *
           ADD  1  TO  CNT-PAGE
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
      *     MOVE   "SKT2200.red"        TO  SPRT-PRTID
      *=== 旧様式の返戻・月遅れ処理修正 by Yoshikawa(2008/06/23) start
      *     IF  WRK-SYMD (1:6)  >=  WRK-CONS-SRYYM-200804
           IF  FLG-CHK  =  ZERO
      *=== 旧様式の返戻・月遅れ処理修正 by Yoshikawa(2008/06/23) end
               MOVE   "SKT2200.red"    TO  SPRT-PRTID
           ELSE
               MOVE   "SKT2200o.red"   TO  SPRT-PRTID
           END-IF
      *---(01.00.05) LINE ADD END   ------------------------------------
      *=== 返戻時、再印刷画面のタイトル修正 by Yoshikawa(2014/12/04) start
      **=== 特別療養費国保対応 by Yoshikawa(2010/10/13) start
      **     MOVE    "国保総括表"  TO  SPRT-TITLE
      *     EVALUATE  WRK-PARA-TOKUBETU
      *       WHEN  "1"
      *         MOVE  "国保総括表"               TO  SPRT-TITLE
      *       WHEN  "2"
      *         MOVE  "国保総括表 [特別療養費]"  TO  SPRT-TITLE
      *     END-EVALUATE
      **=== 特別療養費国保対応 by Yoshikawa(2010/10/13) end
           EVALUATE  WRK-PARA-SYOKBN  ALSO  WRK-PARA-TOKUBETU
             WHEN  "1"  ALSO  "1"
               MOVE  "国保総括表"      TO  SPRT-TITLE
             WHEN  "2"  ALSO  "1"
               MOVE  "国保総括表［返戻分］" 
                                       TO  SPRT-TITLE
             WHEN  "1"  ALSO  "2"
               MOVE  "国保総括表［特別療養費］"
                                       TO  SPRT-TITLE
             WHEN  "2"  ALSO  "2"
               MOVE  "国保総括表［返戻分］［特別療養費］"
                                       TO  SPRT-TITLE
           END-EVALUATE
      *=== 返戻時、再印刷画面のタイトル修正 by Yoshikawa(2014/12/04) end
           MOVE    SKT2200             TO  SPRT-PRTDATA
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
               MOVE    "帳票ＤＢに更新できませんでした"
                                          TO  WRK-RECEERR
               PERFORM 500-ERR-HENSYU-SEC
           END-IF
      *
           .
       330-PRINT-OUT-EXT.
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
      *
           END-IF
      *
           CLOSE   RECEERR-FILE
      *
           .
       500-ERR-HENSYU-EXT.
           EXIT.
      *
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
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
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
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
                        IF       MCP-RC =      ZERO
                                 PERFORM       900-UPD-FILE-READ-SEC
                        ELSE
                                 DISPLAY "UPD ERR KEY="  RECE10-KEY 
                                 MOVE    
                                "*** SOKATU2200 SEIKYU UPDATE ERROR ***"
                                           TO  WRK-RECEERR
                                 MOVE    RECE10-KEY     TO
                                         WRK-RECEERR(33:)
                                 PERFORM 500-ERR-HENSYU-SEC
                                 MOVE    1      TO      FLG-UPDFILE
                        END-IF
      *
              ELSE
                       DISPLAY "INV ERR KEY="  RECE10-KEY 
                       MOVE    "*** SOKATU2200 SEIKYU INVALID ***"
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
       3001-SEIKYU-UPDATE-EXT.
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
           INSPECT WRK-HENYMDG    REPLACING  ALL "  "  BY  "  "
           .
       31012-SEIWA-HEN-EXT.
           EXIT.
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *****************************************************************
      *    都道府県
      *****************************************************************
       920-TODOUHUKEN-SET-SEC  SECTION.
      *
      *     EVALUATE  SKT2205TMP-HKNJANUM(3:2)
           EVALUATE  SKT2205TMP-HKNJANUM
             WHEN  "01"  MOVE  "北海道"    TO  WRK-TODOUHUKEN
             WHEN  "02"  MOVE  "青森県"    TO  WRK-TODOUHUKEN
             WHEN  "03"  MOVE  "岩手県"    TO  WRK-TODOUHUKEN
             WHEN  "04"  MOVE  "宮城県"    TO  WRK-TODOUHUKEN
             WHEN  "05"  MOVE  "秋田県"    TO  WRK-TODOUHUKEN
             WHEN  "06"  MOVE  "山形県"    TO  WRK-TODOUHUKEN
             WHEN  "07"  MOVE  "福島県"    TO  WRK-TODOUHUKEN
             WHEN  "08"  MOVE  "茨城県"    TO  WRK-TODOUHUKEN
             WHEN  "09"  MOVE  "栃木県"    TO  WRK-TODOUHUKEN
             WHEN  "10"  MOVE  "群馬県"    TO  WRK-TODOUHUKEN
             WHEN  "11"  MOVE  "埼玉県"    TO  WRK-TODOUHUKEN
             WHEN  "12"  MOVE  "千葉県"    TO  WRK-TODOUHUKEN
             WHEN  "13"  MOVE  "東京都"    TO  WRK-TODOUHUKEN
             WHEN  "14"  MOVE  "神奈川県"  TO  WRK-TODOUHUKEN
             WHEN  "15"  MOVE  "新潟県"    TO  WRK-TODOUHUKEN
             WHEN  "16"  MOVE  "富山県"    TO  WRK-TODOUHUKEN
             WHEN  "17"  MOVE  "石川県"    TO  WRK-TODOUHUKEN
             WHEN  "18"  MOVE  "福井県"    TO  WRK-TODOUHUKEN
             WHEN  "19"  MOVE  "山梨県"    TO  WRK-TODOUHUKEN
             WHEN  "20"  MOVE  "長野県"    TO  WRK-TODOUHUKEN
             WHEN  "21"  MOVE  "岐阜県"    TO  WRK-TODOUHUKEN
             WHEN  "22"  MOVE  "静岡県"    TO  WRK-TODOUHUKEN
             WHEN  "23"  MOVE  "愛知県"    TO  WRK-TODOUHUKEN
             WHEN  "24"  MOVE  "三重県"    TO  WRK-TODOUHUKEN
             WHEN  "25"  MOVE  "滋賀県"    TO  WRK-TODOUHUKEN
             WHEN  "26"  MOVE  "京都府"    TO  WRK-TODOUHUKEN
             WHEN  "27"  MOVE  "大阪府"    TO  WRK-TODOUHUKEN
             WHEN  "28"  MOVE  "兵庫県"    TO  WRK-TODOUHUKEN
             WHEN  "29"  MOVE  "奈良県"    TO  WRK-TODOUHUKEN
             WHEN  "30"  MOVE  "和歌山県"  TO  WRK-TODOUHUKEN
             WHEN  "31"  MOVE  "鳥取県"    TO  WRK-TODOUHUKEN
             WHEN  "32"  MOVE  "島根県"    TO  WRK-TODOUHUKEN
             WHEN  "33"  MOVE  "岡山県"    TO  WRK-TODOUHUKEN
             WHEN  "34"  MOVE  "広島県"    TO  WRK-TODOUHUKEN
             WHEN  "35"  MOVE  "山口県"    TO  WRK-TODOUHUKEN
             WHEN  "36"  MOVE  "徳島県"    TO  WRK-TODOUHUKEN
             WHEN  "37"  MOVE  "香川県"    TO  WRK-TODOUHUKEN
             WHEN  "38"  MOVE  "愛媛県"    TO  WRK-TODOUHUKEN
             WHEN  "39"  MOVE  "高知県"    TO  WRK-TODOUHUKEN
             WHEN  "40"  MOVE  "福岡県"    TO  WRK-TODOUHUKEN
             WHEN  "41"  MOVE  "佐賀県"    TO  WRK-TODOUHUKEN
             WHEN  "42"  MOVE  "長崎県"    TO  WRK-TODOUHUKEN
             WHEN  "43"  MOVE  "熊本県"    TO  WRK-TODOUHUKEN
             WHEN  "44"  MOVE  "大分県"    TO  WRK-TODOUHUKEN
             WHEN  "45"  MOVE  "宮崎県"    TO  WRK-TODOUHUKEN
             WHEN  "46"  MOVE  "鹿児島県"  TO  WRK-TODOUHUKEN
             WHEN  "47"  MOVE  "沖縄県"    TO  WRK-TODOUHUKEN
           END-EVALUATE
      *
           MOVE  WRK-TODOUHUKEN  TO  SKT2200-TODOHUKEN (IDX1)
           .
      *
       920-TDOHUKEN-SET-EXT.
           EXIT.
      *
      *---(01.00.05) LINE ADD END   ------------------------------------
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
           MOVE  SKT2200TMP-HKNJANUM         TO  HKNJA-HKNJANUM
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
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *       MOVE  PATH-TBL-HKNJAINF-KEY      TO  MCP-PATH
             MOVE  "tbl_hknjainf"       TO  MCP-TABLE
             MOVE  "key"                TO  MCP-PATHNAME
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
             PERFORM  925-HKNJAINF-READ-SEC
      *
      *    静岡市の新しい保険者番号にも静岡市と出るように対応
             IF  SKT2200TMP-HKNJANUM  =  "224006"  AND
                 HKNJA-HKNJANAME  =  SPACE
               MOVE  "静岡市"        TO  HKNJA-HKNJANAME
             END-IF
      *
             MOVE  HKNJA-HKNJANAME   TO  SKT2200-HKNJANAME (IDX1)
           ELSE
             DISPLAY  "HKNJAINF SELECT ERR"
           END-IF
      *
           INITIALIZE  MCPAREA
           MOVE  "DBCLOSECURSOR"            TO  MCP-FUNC
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *     MOVE  PATH-TBL-HKNJAINF-KEY      TO  MCP-PATH
      *     CALL  "MCPSUB"         USING
      *                            MCPAREA
      *                            MCPDATA-REC
           MOVE  "tbl_hknjainf"             TO  MCP-TABLE
           MOVE  "key"                      TO  MCP-PATHNAME
           CALL  "ORCDBMAIN"                USING
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
           MOVE  "DBFETCH"      TO  MCP-FUNC
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *     CALL  "MCPSUB"     USING
      *                        MCPAREA
      *                        MCPDATA-REC
           CALL    "ORCDBMAIN"  USING
                                MCPAREA
                                MCPDATA-REC
                                SPA-AREA
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
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
      *    請求管理読込
      *****************************************************************
       900-SEIKYU-SELECT-SEC             SECTION.
      *
      *    請求管理ＤＢ検索
           INITIALIZE         RECE10-REC.
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *     MOVE   SYS-1001-HOSPID          TO    RECE10-HOSPID.
           MOVE   SPA-HOSPNUM              TO    RECE10-HOSPNUM.
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
           MOVE   LNK-PRTKANRI-SRYYM       TO    RECE10-SKYYM.
      *
           MOVE    SPACE                   TO  RECE10-XXSTHKNJANUM
           MOVE    "99999999"              TO  RECE10-XXEDHKNJANUM
      *=== 特別療養費国保対応 by Yoshikawa(2010/10/13) start
           IF  WRK-PARA-TOKUBETU  =  "2"
      *=== open-cobol1.0対応 by Yoshikawa(2010/11/25) start
      *       MOVE  "000000"                TO  RECE10-SRYYM
      *       MOVE  "999999"                TO  RECE10-XXSRYYM
             MOVE  000000                  TO  RECE10-SRYYM
             MOVE  999999                  TO  RECE10-XXSRYYM
      *=== open-cobol1.0対応 by Yoshikawa(2010/11/25) end
           END-IF
      *=== 特別療養費国保対応 by Yoshikawa(2010/10/13) end
      *
           MOVE   RECE10-REC               TO    MCPDATA-REC.
           MOVE   "DBSELECT"               TO    MCP-FUNC.
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *****2006/05/19 返戻対応
      **     MOVE   PATH-TBL-SEIKYU-KEY4     TO    MCP-PATH.
      *     MOVE   WRK-PATH              TO  MCP-PATH
      *****
      *     CALL   "MCPSUB"           USING
      *                               MCPAREA
      *                               MCPDATA-REC.
           MOVE    "tbl_seikyu"            TO  MCP-TABLE
           MOVE    WRK-PATH                TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
      *
           IF     MCP-RC        =       ZERO
                  PERFORM  900-SEIKYU-READ-SEC
           ELSE
                  MOVE    1    TO      FLG-END
           END-IF
           .
      *
       900-SEIKYU-SELECT-EXT.
           EXIT.
      *
      *****************************************************************
      *    総括表一時ファイルＲＥＡＤ処理
      *****************************************************************
       800-SKTTMP-READ-SEC                 SECTION.
      *
           READ   SKT2200TMP-FILE
               INVALID    KEY
                   MOVE   1         TO  FLG-SKT2200TMP
               NOT INVALID    KEY
                   MOVE   ZERO      TO  FLG-SKT2200TMP
           END-READ
      *
           .
       800-SKTTMP-READ-EXT.
           EXIT.
      *
      *---(01.00.05) LINE ADD START ------------------------------------
      *****************************************************************
      *    総括表一時ファイルＲＥＡＤ処理
      *****************************************************************
       850-SKTTMP-READ-SEC                 SECTION.
      *
           READ   SKT2205TMP-FILE
               INVALID    KEY
                   MOVE   1         TO  FLG-SKT2205TMP
               NOT INVALID    KEY
                   MOVE   ZERO      TO  FLG-SKT2205TMP
           END-READ
      *
           .
       850-SKTTMP-READ-EXT.
           EXIT.
      *
      *---(01.00.05) LINE ADD END   ------------------------------------
      *****************************************************************
      *    請求マスター読込
      *****************************************************************
       900-SEIKYU-READ-SEC           SECTION.
      *
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *****2006/05/19 返戻対応
      **     MOVE   PATH-TBL-SEIKYU-KEY4     TO    MCP-PATH.
      *     MOVE   WRK-PATH              TO  MCP-PATH
      *****
      *     MOVE   "DBFETCH"              TO    MCP-FUNC
      *     CALL   "MCPSUB"      USING
      *                          MCPAREA
      *                          MCPDATA-REC
           MOVE     "DBFETCH"             TO  MCP-FUNC
           MOVE     "tbl_seikyu"          TO  MCP-TABLE
           MOVE     WRK-PATH              TO  MCP-PATHNAME
           CALL     "ORCDBMAIN"           USING
                                          MCPAREA
                                          MCPDATA-REC
                                          SPA-AREA
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) end
      *
           IF       MCP-RC  =     ZERO
                    MOVE    MCPDATA-REC   TO      RECE10-REC
                    ADD     1             TO      CNT-RECE10
      *
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/14) start
               IF      WRK-PARA-STSRYYM    =   "999999"
                   CONTINUE
               ELSE
                   IF  ( RECE10-SRYYM      <   WRK-PARA-STSRYYM )
                   OR  ( RECE10-SRYYM      >   WRK-PARA-EDSRYYM )
                       GO  TO  900-SEIKYU-READ-SEC
                   END-IF
               END-IF
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/14) end
      *
      *=== オンライン返戻対応 by Yoshikawa(2010/04/05) start
      *        返戻分でオンライン請求は読み飛ばす
               IF      (WRK-PARA-SYOKBN         =  "2")
               AND     (RECE10-HENREI-SIJI-FLG  =  1)
                   GO  TO  900-SEIKYU-READ-SEC
               END-IF
      *=== オンライン返戻対応 by Yoshikawa(2010/04/05) end
      *
           ELSE
                    MOVE    1             TO      FLG-END
           END-IF
           .
      *
       900-SEIKYU-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    システム管理マスタ読込
      *****************************************************************
       900-SYSKANRI-INV-SEC         SECTION.
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
               MOVE    "tbl_syskanri"           TO  MCP-TABLE
               MOVE    "key10"                  TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"              USING
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
       900-SYSKANRI-INV-EXT.
           EXIT.
      *
      *****************************************************************
      *    請求管理マスタ読込
      *****************************************************************
       900-SEIKYU-INV-SEC             SECTION.
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
               MOVE    "DBFETCH"              TO  MCP-FUNC
      *=== Ver4.0対応 By Yoshikawa(2007/10/03) start
      *         MOVE    PATH-TBL-SEIKYU-KEY    TO  MCP-PATH
      *         CALL    "MCPSUB"             USING
      *                                      MCPAREA
      *                                      MCPDATA-REC
               MOVE    "tbl_seikyu"           TO  MCP-TABLE
               MOVE    "key"                  TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"            USING
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
       900-SEIKYU-INV-EXT.
           EXIT.
      *
      *---(01.00.05) LINE ADD START ------------------------------------
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
           MOVE   WRK-HKNNUM              TO  RECE10-HKNNUM-S
                                              RECE10-HKNNUM
      *
      *     IF    WRK-PARA-HKNJANUM  NOT = ZERO
      *         MOVE    WRK-PARA-HKNJANUM  TO  RECE10-XXSTHKNJANUM
      *                                        RECE10-XXEDHKNJANUM
      *     ELSE
               MOVE    SPACE              TO  RECE10-XXSTHKNJANUM
               MOVE    "99999999"         TO  RECE10-XXEDHKNJANUM
      *     END-IF
      *
           MOVE    RECE10-REC              TO  MCPDATA-REC
           MOVE    "DBSELECT"              TO  MCP-FUNC
           MOVE    "tbl_seikyu"            TO  MCP-TABLE
           MOVE    WRK-PATH2               TO  MCP-PATHNAME
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
           MOVE    WRK-PATH2           TO  MCP-PATHNAME
           MOVE    "DBFETCH"           TO  MCP-FUNC
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
           IF      MCP-RC              =   ZERO
               MOVE    ZERO            TO  FLG-END
               MOVE    MCPDATA-REC         TO  RECE10-REC
      *
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/14) start
               IF      WRK-PARA-STSRYYM    =   "999999"
                   CONTINUE
               ELSE
                   IF  ( RECE10-SRYYM      <   WRK-PARA-STSRYYM )
                   OR  ( RECE10-SRYYM      >   WRK-PARA-EDSRYYM )
      *=== DBエラー不具合修正 by hagino(2017/09/15) start
      *                 GO  TO  900-SEIKYU-READ-SEC
                       GO  TO  950-SEIKYU-READ-SEC
      *=== DBエラー不具合修正 by hagino(2017/09/15) end
                   END-IF
               END-IF
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/14) end
      *
      *=== オンライン返戻対応 by Yoshikawa(2010/04/05) start
      *        返戻分でオンライン請求は読み飛ばす
               IF      (WRK-PARA-SYOKBN         =  "2")
               AND     (RECE10-HENREI-SIJI-FLG  =  1)
                   GO  TO  950-SEIKYU-READ-SEC
               END-IF
      *=== オンライン返戻対応 by Yoshikawa(2010/04/05) end
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
           MOVE    WRK-PATH             TO  MCP-PATHNAME
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
           MOVE    WRK-PATH2            TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"          USING
                                        MCPAREA
                                        MCPDATA-REC
                                        SPA-AREA
           .
       900-SEIKYU-CLOSE-EXT.
           EXIT.
      *****************************************************************
      *    患者マスタ読込
      *****************************************************************
       800-PTINF-READ-SEC         SECTION.
      *
           MOVE    "DBSELECT"               TO  MCP-FUNC
      *---(01.00.03) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-PTINF-KEY       TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           MOVE    "tbl_ptinf"         TO  MCP-TABLE
           MOVE    "key"               TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"                  TO  MCP-FUNC
      *---(01.00.03) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-PTINF-KEY         TO  MCP-PATH
      *         CALL    "MCPSUB"            USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
               MOVE    "tbl_ptinf"     TO  MCP-TABLE
               MOVE    "key"           TO  MCP-PATHNAME
               CALL    "ORCDBMAIN"     USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
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
      *---(01.00.03) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-PTINF-KEY          TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                     MCPAREA
      *                                     MCPDATA-REC
           MOVE    "tbl_ptinf"         TO  MCP-TABLE
           MOVE    "key"               TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.03) LINE ADD END   ------------------------------------
      *
           .
       800-PTINF-READ-EXT.
           EXIT.
      *
      *---(01.00.05) LINE ADD END   ------------------------------------
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
      *    一時ファイル読込
      *****************************************************************
       900-TMP-READ-SEC                SECTION.
      *
           READ  SKT2200TMP-FILE   NEXT
               AT  END
                   MOVE  1  TO  FLG-PRINT
      *=== 印刷処理の修正 by Yoshikawa(2008/06/23) start
                   MOVE  HIGH-VALUE      TO  KEY-NEW
      *=== 印刷処理の修正 by Yoshikawa(2008/06/23) end
               NOT  AT  END
                   MOVE  SKT2200TMP-KBN  TO  KEY-NEW
      *=== 返戻が旧帳票で出る不具合修正 by Yoshikawa(2008/07/04) start
                   MOVE  SKT2200TMP-SRYYM TO  WRK-SRYYM-NEW
      *=== 返戻が旧帳票で出る不具合修正 by Yoshikawa(2008/07/04) end
           END-READ
           .
       900-TMP-READ-EXT.
           EXIT.
      *      
      *---(01.00.05) LINE ADD START ------------------------------------
      *****************************************************************
      *    一時ファイル読込
      *****************************************************************
       950-TMP-READ-SEC                SECTION.
      *
           READ  SKT2205TMP-FILE   NEXT
               AT  END
                   MOVE  1  TO  FLG-PRINT2
      *=== 印刷処理の修正 by Yoshikawa(2008/06/23) start
                   MOVE  HIGH-VALUE      TO  KEY-NEW2
      *=== 印刷処理の修正 by Yoshikawa(2008/06/23) end
               NOT  AT  END
                   MOVE  SKT2205TMP-KBN  TO  KEY-NEW2
           END-READ
           .
       950-TMP-READ-EXT.
           EXIT.
      *      
      *---(01.00.05) LINE ADD END   ------------------------------------
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/14) start
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/14) end
           MOVE    SYS-1900-REC            TO  MCPDATA-REC
           PERFORM 900-SYSKANRI-INV-SEC
           IF      FLG-SYSKANRI        =   ZERO
               MOVE    MCPDATA-REC         TO  SYS-1900-REC
               IF      SYS-1900-PRTKBN(8) NOT =   SPACE
      *            医療機関名称編集情報
                   PERFORM 900-1901-READ-SEC
      *            医療機関住所編集情報
                   PERFORM 900-1902-READ-SEC
      *=== 医療機関編集情報へ開設者名追加 by Monma(2017/02/14) start
      *            医療機関住所編集情報（２）
                   PERFORM 900-1903-READ-SEC
      *=== 医療機関編集情報へ開設者名追加 by Monma(2017/02/14) end
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/14) start
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/14) end
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/14) start
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
      *=== 医療機関コード変更時作成対応 by Monma(2017/02/14) end
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
      *=== シス管「1901」対応 By Yoshikawa(2007/10/03) end
      *
      *=== 医療機関編集情報へ開設者名追加 by Monma(2017/02/14) start
      *****************************************************************
      *    医療機関住所編集情報読み込み
      *****************************************************************
       900-1903-READ-SEC           SECTION.
      *
           MOVE    SPACE               TO  SYS-1903-REC
           INITIALIZE                      SYS-1903-REC
           MOVE    SPA-HOSPNUM         TO  SYS-1903-HOSPNUM
           MOVE    "1903"              TO  SYS-1903-KANRICD
           MOVE    SYS-1900-PRTKBN(8)  TO  SYS-1903-KBNCD
           IF  WRK-PARA-STSRYYM  =  "999999"
               MOVE    LNK-PRTKANRI-SRYYM  TO  SYS-1903-STYUKYMD(1:6)
           ELSE
               MOVE    WRK-PARA-EDSRYYM    TO  SYS-1903-STYUKYMD(1:6)
           END-IF
           MOVE    "01"                TO  SYS-1903-STYUKYMD(7:2)
           MOVE    SYS-1903-STYUKYMD   TO  SYS-1903-EDYUKYMD
           MOVE    SYS-1903-REC        TO  MCPDATA-REC
           PERFORM 900-SYSKANRI-INV-SEC
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
      *=== 医療機関編集情報へ開設者名追加 by Monma(2017/02/14) end
      *
      *****************************************************************
      *    ＤＢ  オープン処理
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
      *    ＤＢ  クローズ処理
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
