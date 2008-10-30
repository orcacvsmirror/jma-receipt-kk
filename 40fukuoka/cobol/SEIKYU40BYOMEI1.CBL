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
       IDENTIFICATION          DIVISION.
       PROGRAM-ID.             SEIKYU40BYOMEI1.
      *****************************************************************
      *  システム名        : ＯＲＣＡ
      *  サブシステム名    : レセプト
      *  コンポーネント名  : 福岡・複写式レセプト用患者病名ファイル作成ＰＧ
      *  管理者            : 
      *  作成日付    作業者        記述
      *  04/09/00    有村     　   新規作成(2.3.1のORCR0050を元に作成)
      *****************************************************************
      *  プログラム修正履歴
      * Maj/Min/Rev  修正者       日付      内容
      ***********************     ORCR0050修正履歴     ****************
      *  01.00.01    MCC-藤原     01.06.29  保険者番号・
      *                                     適用開始年月日の追加
      *  01.00.02    MCC-藤原     01.10.26  保険組合せの判定の修正
      *  01.00.03    MCC-藤原     01.12.13  レセプト表示月の判定の修正
      *  01.00.04    MCC-藤原     02.02.08  転帰日が未来日のとき転帰の
      *                                     表示をやめる
      *  01.00.06    MCC-藤原     02.02.13  保険組合せを３から１０に変更
      *  01.00.07    MCC-藤原     02.05.13  病名の疑いフラグからの編集
      *  01.00.08    NACL-藤原    02.11.11  転帰日が未来日のとき病名の表示
      *                                     をするように修正
      *  01.00.09    NACL-藤原    03.03.12  補助区分の追加
      *                                     診療科数１０から２０へ変更
      *  01.00.10    NACL-藤原    03/07/02  主病名編集フラグによる編集の追加
      *  01.00.11    NACL-藤原    03/09/03  疑いフラグからのコードの編集
      *  01.00.12    NACL-藤原    04/02/01  病名コード２１に変更
      ************************    SEIKYU40BYOMEI1修正履歴    **********
      *  01.00.01    有村         05/05/06  DB参照方法修正(MCPSUB使用)
      *  01.00.02    有村         05/06/15  対象判定修正
      *  01.00.03    内田         07/01/30  印字対象番号の追加（２８１）
      *  01.00.04    内田         07/08/03  印字対象番号の追加（290）
      *  01.00.05    内田         07/10/10  日レセver4.0対応
      *  01.00.06    内田         08/10/04  印字対象番号の追加
      *                                     （280,380,381,390,490）
      *****************************************************************
      *
       ENVIRONMENT             DIVISION.
       CONFIGURATION           SECTION.
       INPUT-OUTPUT            SECTION.
       FILE-CONTROL.
      *
      *
           SELECT  RECE03-FILE     ASSIGN  RECE03PARA
                                   ORGANIZATION    IS  INDEXED
                                   ACCESS  MODE    IS  DYNAMIC
                                   RECORD  KEY     IS  RECE03-KEY
                                   FILE    STATUS  IS  STS-RECE03.
      *    エラーファイル
           SELECT  RECEERR-FILE    ASSIGN  RECEERR
                                   FILE    STATUS  IS  STS-RECEERR.
      *
       DATA                    DIVISION.
       FILE                    SECTION.
      *
      *    レセプト明細書  
      *
       FD  RECE03-FILE.
       01  RECE03-REC. 
           COPY    "CPRCF003.INC".
      *    エラーファイル
       FD  RECEERR-FILE.
       01  RECEERR-REC             PIC X(200). 
      *
       WORKING-STORAGE             SECTION.
      *
      *     レセプト明細ファイル 名称領域 
           COPY    "CPCOMMONDAT2.INC".
      *
           COPY    "CPCOMMONDAT2.INC"
                                   REPLACING  //RECE01//
                                   BY         //RECE03//.
      *
      *    エラーファイル 名称領域 
      *---(01.00.05) LINE ADD START ------------------------------------
      *     COPY    "CPCOMMONDAT2.INC"
      *                             REPLACING  //RECE01PARA//
      *                             BY         //RECEERR//.
      *     03                      PIC X(04)   VALUE   ".dat".
           COPY    "CPERRFL.INC"    REPLACING  //ERRFLPARA//
                                    BY         //RECEERR//.
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *    フラグ領域
       01  STS-AREA.
           03  STS-RECE03          PIC X(02).
           03  STS-RECEERR         PIC X(02).
      *
       01  FLG-AREA.
           03  FLG-END             PIC 9(01).
           03  FLG-PTBYOMEI        PIC 9(01).
           03  FLG-SYSKANRI        PIC 9(01).
           03  FLG-CHK             PIC 9(01).
           03  FLG-PTINF           PIC 9(01).
      *
      *    カウント領域
       01  CNT-AREA.
           03  CNT-IN              PIC 9(06).
           03  CNT-OUT             PIC 9(06).
      *
       01  INDEX-AREA.
           03  IDX                 PIC 9(03). 
           03  IDY                 PIC 9(03). 
           03  IDZ                 PIC 9(03).
      *
      *    一時領域
       01  WRK-AREA.
           03  WRK-PARA.
               05  WRK-PARA-SRYYM   PIC X(06).
               05  WRK-PARA-TERMID  PIC X(16).
               05  WRK-PARA-SYSYMD  PIC X(08).
               05  WRK-PARA-JOBID   PIC 9(07).
               05  WRK-PARA-SHELLID PIC X(08).
      *---(01.00.05) LINE ADD START ------------------------------------
      *         05  WRK-PARA-HOSPID  PIC X(24). 
               05  WRK-PARA-HOSPNUM PIC 9(02).
      *---(01.00.05) LINE ADD END   ------------------------------------
           03  WRK-PATH             PIC X(64). 
           03  WRK-YM               PIC 9(06).
           03  WRK-RENNUM           PIC 9(02).
      *
           03  WRK-HKNJANUM        PIC X(08).
      *
           03  WRK-RECEERR         PIC X(200). 
      *    傷病名編集
           03  WRK-BYOMEI          PIC X(150).
           03  WRK-BYOMEIW         PIC X(150).
      *    傷病名編集フラグ（疑い）
           03  WRK-HENFLG1         PIC X(01).
      *    傷病名編集フラグ（急性）
           03  WRK-HENFLG2         PIC X(01). 
      *    病名文字数         
           03  WRK-MOJISU          PIC 9(03).
      *
       01  KEY-AREA                            VALUE   LOW-VALUE.
           03  KEY-NEW.
               05  KEY-N-SRYYMD    PIC 9(08).
           03  KEY-OLD.
               05  KEY-O-SRYYMD    PIC 9(08).
      *
      *    疑い編集
       01  WRK-UTAGAI-AREA.
      *    疑い
           03  WRK-CONS-UTAGAI     PIC X(06)   VALUE   "の疑い".
           03  WRK-CONS-UTAGAI-MOJISU
                                   PIC 9(02)   VALUE   6.       
      *    急性
           03  WRK-CONS-KYUSEI     PIC X(04)   VALUE   "急性".      
           03  WRK-CONS-KYUSEI-MOJISU
                                   PIC 9(02)   VALUE   4. 
      *
       01  WRK-CONS-AREA.
      *    疑い
           03  WRK-CONS-BYOMEICD-UTAGAI
                                   PIC X(07)   VALUE   "ZZZ8002".   
      *    急性
           03  WRK-CONS-BYOMEICD-KYUSEI
                                   PIC X(07)   VALUE   "ZZZ4012".   
      ***** 05/05/06 INS
      *    DB参照用
      *---(01.00.05) LINE ADD START ------------------------------------
      *     COPY    "ORCA-DBPATH".
           COPY    "COMMON-SPA".
      *---(01.00.05) LINE ADD END   ------------------------------------
      *****
      *
      *****************************************************************
      *    ファイルレイアウト
      *****************************************************************
      *
      *    ジョブ管理マスタ
       01  JOBKANRI-REC.
           COPY    "CPJOBKANRI.INC".
      *
      *    システム管理マスタ
           COPY    "CPSYSKANRI.INC".
      *     
           COPY    "CPSK2005.INC".
      *
      *    患者病名
       01  PTBYOMEI-REC.
           COPY    "CPPTBYOMEI.INC".
      *
      *    公費請求書
           COPY    "CPKOHSKY.INC"
                   REPLACING  //KOHSKY//
                   BY         //RECE02//.
      *
      *    患者マスタ
       01  PTINF-REC.
           COPY    "CPPTINF.INC".
      *
      *****************************************************************
      *    サブプロ用領域
      *****************************************************************
      *
      *   日付変換サブ
           COPY    "CPORCSDAY.INC".
           COPY    "CPORCSLNK.INC".
      *    数字変換領域
           COPY    "CPORCSNUM.INC".
      *   ジョブ管理ＤＢ制御サブ
           COPY    "CPORCSJOBKANRI.INC".
      *
      *    ＤＢ検索
           COPY    "MCPDATA.INC".
      ***** 05/05/06 DEL
      *     COPY    "CPORCMCP.INC".
      *****
      *
           COPY    "MCPAREA".
      *
      ****************************************************************
       LINKAGE                 SECTION.
       01  WRK-PARA-LINK.
           03  WRK-PARA-LINK-SRYYM    PIC  X(06).
           03  WRK-PARA-LINK-TERMID   PIC  X(16).
           03  WRK-PARA-LINK-SYSYMD   PIC  X(08).
           03  WRK-PARA-LINK-JOBID    PIC  9(07).
           03  WRK-PARA-LINK-SHELLID  PIC  X(08).
      *---(01.00.05) LINE ADD START ------------------------------------
      *     03  WRK-PARA-LINK-HOSPID   PIC  X(24).
           03  WRK-PARA-LINK-HOSPNUM  PIC  9(02).
      *---(01.00.05) LINE ADD END   ------------------------------------
      ****************************************************************
       PROCEDURE           DIVISION
               USING    WRK-PARA-LINK.
      *
      *****************************************************************
      *    主処理
      *****************************************************************
       000-PROC-SEC                SECTION.
      *
           PERFORM 100-INIT-SEC
      *
           PERFORM 200-MAIN-SEC    UNTIL   FLG-END =   1 
      *
           PERFORM 300-TERM-SEC
      *
           EXIT    PROGRAM
           .
      *****************************************************************
      *    初期　処理
      *****************************************************************
       100-INIT-SEC                SECTION.
      *
           INITIALIZE                  CNT-AREA
                                       WRK-AREA
      *
           MOVE    ZERO                TO  FLG-END
           MOVE    WRK-PARA-LINK       TO  WRK-PARA
      *---(01.00.05) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  SPA-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
      *    ステップ管理開始処理
           MOVE    "STS"               TO  SJOBKANRI-MODE
           INITIALIZE                      JOBKANRI-REC
      *---(01.00.05) LINE ADD START ------------------------------------
           MOVE    SPA-HOSPNUM         TO  JOB-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
           MOVE    WRK-PARA-JOBID      TO  JOB-JOBID
           MOVE    WRK-PARA-SHELLID    TO  JOB-SHELLID
           MOVE    "SEIKYU40BYOMEI1"   TO  JOB-PGID
           MOVE    "傷病名編集1"       TO  JOB-SHELLMSG
           CALL    "ORCSJOB"       USING
                                   ORCSJOBKANRIAREA  
                                   JOBKANRI-REC
      *---(01.00.05) LINE ADD START ------------------------------------
                                   SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
           MOVE    "RECE030"           TO  RECE03PARA-FILE-ID
           MOVE    WRK-PARA-TERMID     TO  RECE03PARA-TERMID
      *---(01.00.05) LINE ADD START ------------------------------------
           MOVE    WRK-PARA-HOSPNUM    TO  RECE03PARA-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
           OPEN    OUTPUT              RECE03-FILE
           CLOSE                       RECE03-FILE
           OPEN    I-O                 RECE03-FILE
      *     
      *    レセプト編集区分情報
           MOVE    SPACE            TO  SYSKANRI-REC
           INITIALIZE                   SYSKANRI-REC
           MOVE    "2005"           TO  SYS-KANRICD
           MOVE    "*"              TO  SYS-KBNCD
      ***** 05/05/06 INS
           MOVE    WRK-PARA-SRYYM(1:6)
                                    TO  SYS-STYUKYMD(1:6)
                                        SYS-EDYUKYMD(1:6)
           MOVE    "01"             TO  SYS-STYUKYMD(7:2)
                                        SYS-EDYUKYMD(7:2)
      *****
      *---(01.00.05) LINE ADD START ------------------------------------
           MOVE  SPA-HOSPNUM        TO  SYS-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
           PERFORM 900-SYSKANRI-READ-SEC
           IF      FLG-SYSKANRI     =   ZERO
               MOVE    MCPDATA-REC      TO  SYS-2005-REC
                
           ELSE    
               MOVE    SPACE            TO  SYS-2005-REC
           END-IF
           IF      SYS-2005-BYOMEIHENKBN1   =   SPACE
               MOVE    ZERO             TO  SYS-2005-BYOMEIHENKBN1
           END-IF
           IF      SYS-2005-SYUBYOHENFLG    =   SPACE
               MOVE    ZERO             TO  SYS-2005-SYUBYOHENFLG
           END-IF
      *
           .
       100-INIT-EXT.
           EXIT.
      * 
      *****************************************************************
      *    主処理
      *****************************************************************
       200-MAIN-SEC                SECTION.
      *    
           PERFORM 900-KOHSKY-START-SEC
      *
           PERFORM  UNTIL  FLG-END   =   1
      *    患者病名読み込み（患者ＩＤ、診療年月日、診療科順）
             INITIALIZE                  PTBYOMEI-REC
      *---(01.00.05) LINE ADD START ------------------------------------
      *       MOVE    RECE02-HOSPID       TO  PTBYO-HOSPID
             MOVE    SPA-HOSPNUM         TO  PTBYO-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
             MOVE    RECE02-PTID         TO  PTBYO-PTID
             MOVE    PTBYOMEI-REC        TO  MCPDATA-REC
             MOVE    "DBSELECT"          TO  MCP-FUNC
      ***** 05/05/06 DEL
      *       MOVE    "PTBYOMEI-KEY3"     TO  ORC-DBPATH
      *       CALL    "ORCMCPSUB"          USING
      *                                        MCPAREA
      *                                        ORCMCPAREA
      *                                        MCPDATA-REC
      ***** 05/05/06 INS
      *---(01.00.05) LINE ADD START ------------------------------------
      *       MOVE    PATH-TBL-PTBYOMEI-KEY3 TO  MCP-PATH
      *       CALL    "MCPSUB"                USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
             MOVE    "tbl_ptbyomei"      TO  MCP-TABLE
             MOVE    "key3"              TO  MCP-PATHNAME
             CALL    "ORCDBMAIN"         USING
                                         MCPAREA
                                         MCPDATA-REC
                                         SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
      *****
             IF      MCP-RC              =   ZERO
      ***** 05/05/06 DEL
      *           MOVE    "PTBYOMEI-KEY3"     TO  ORC-DBPATH 
      ***** 05/05/06 INS
      *---(01.00.05) LINE ADD START ------------------------------------
      *           MOVE    PATH-TBL-PTBYOMEI-KEY3 
      *                                       TO  MCP-PATH
      *****
                 MOVE    "tbl_ptbyomei"      TO  MCP-TABLE
                 MOVE    "key3"              TO  MCP-PATHNAME
      *---(01.00.05) LINE ADD END   ------------------------------------
                 PERFORM 900-PTBYO-READ-SEC
             ELSE
                 INITIALIZE                  PTBYOMEI-REC
                 MOVE    1                   TO  FLG-PTBYOMEI
             END-IF
      *
             PERFORM 2001-PTBYO-HENSYU-SEC
                             UNTIL       FLG-PTBYOMEI     =   1
      ***** 05/05/06 DEL
      *       INITIALIZE                  MCPAREA
      *       MOVE    "DBCLOSE"           TO  MCP-FUNC
      *       MOVE    "PTBYOMEI-KEY3"     TO  ORC-DBPATH 
      *       CALL    "ORCMCPSUB"          USING
      *                                        MCPAREA
      *                                        ORCMCPAREA
      *                                        MCPDATA-REC
      ***** 05/05/06 INS
             INITIALIZE                  MCPAREA
             MOVE    "DBCLOSECURSOR"        TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *       MOVE    PATH-TBL-PTBYOMEI-KEY3 TO  MCP-PATH
      *       CALL    "MCPSUB"                USING
      *                                           MCPAREA
      *                                           MCPDATA-REC
      *****
             MOVE    "tbl_ptbyomei"      TO  MCP-TABLE
             MOVE    "key3"              TO  MCP-PATHNAME
             CALL    "ORCDBMAIN"         USING
                                         MCPAREA
                                         MCPDATA-REC
                                         SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
      *
             PERFORM  900-KOHSKY-READ-SEC
           END-PERFORM
      *
      ***** 05/05/06 DEL
      *     MOVE    "DBCLOSE"           TO  MCP-FUNC
      *     MOVE    "KOHSKY-KEY2"       TO  ORC-DBPATH
      *     CALL    "ORCMCPSUB"          USING
      *                                  MCPAREA
      *                                  ORCMCPAREA
      *                                  MCPDATA-REC
      *****
      *
           CLOSE   RECE03-FILE
      *
           .
       200-MAIN-EXT.
           EXIT. 
      *            
      * 
      *****************************************************************
      *    患者病名診療年月日別処理
      *****************************************************************
       2001-PTBYO-HENSYU-SEC                SECTION.
      *
           MOVE    PTBYO-SRYYMD            TO  KEY-N-SRYYMD
           MOVE    ZERO                    TO  WRK-RENNUM
      *
           MOVE    KEY-NEW                 TO  KEY-OLD   
           PERFORM             UNTIL       FLG-PTBYOMEI    =   1
                               OR          KEY-NEW     NOT =   KEY-OLD
               PERFORM 2001-PTBYO-CHK-SEC
      * 
      ***** 05/05/06 DEL
      *         MOVE    "PTBYOMEI-KEY3"         TO  ORC-DBPATH 
      ***** 05/05/06 INS
      *---(01.00.05) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-PTBYOMEI-KEY3 TO  MCP-PATH
      *****
               MOVE    "tbl_ptbyomei"      TO  MCP-TABLE
               MOVE    "key3"              TO  MCP-PATHNAME
      *---(01.00.05) LINE ADD END   ------------------------------------
               PERFORM 900-PTBYO-READ-SEC
           END-PERFORM    
           .
       2001-PTBYO-HENSYU-EXT.
           EXIT. 
      *            
070100*****************************************************************
070200*    患者病名チェック処理
070300*****************************************************************
070400 2001-PTBYO-CHK-SEC         SECTION.
      *
      *    診療科
           MOVE    ZERO                TO  FLG-CHK 
           IF      SYS-2005-BYOMEIHENKBN1      =   ZERO     
               PERFORM VARYING IDX FROM    1   BY  1
                       UNTIL   IDX >       20
                       OR      RECE02-SRYKA(IDX)   =   SPACE
                   IF      PTBYO-SRYKA          =   RECE02-SRYKA (IDX)
                       MOVE    1                    TO  FLG-CHK
                       MOVE    20                   TO  IDX
                   END-IF
               END-PERFORM
               IF      FLG-CHK              =   ZERO
                   GO  TO  2001-PTBYO-CHK-EXT
               END-IF
           END-IF        
      *
      *    診療開始日
           IF      PTBYO-SRYYMD(1:6)    =   RECE02-SRYYM
               CONTINUE
           ELSE
               IF      PTBYO-SRYYMD(1:6)    <   RECE02-SRYYM 
                   IF      PTBYO-TENKIKBN       =   SPACE
                       CONTINUE
                   ELSE
      **************** IF      PTBYO-TENKIYMD(1:6)  =   RECE02-SRYYM
                       IF      PTBYO-TENKIYMD(1:6)  >=  RECE02-SRYYM
                           CONTINUE
                       ELSE
                           GO  TO  2001-PTBYO-CHK-EXT
                       END-IF
                   END-IF       
               ELSE
                   GO  TO  2001-PTBYO-CHK-EXT
               END-IF
           END-IF
      *
      *    入外区分
           IF      PTBYO-NYUGAIKBN      =   SPACE
               CONTINUE
           ELSE
               IF      PTBYO-NYUGAIKBN  NOT =   RECE02-NYUGAIKBN
                   GO  TO  2001-PTBYO-CHK-EXT
               END-IF
           END-IF
      *
      *    保険組合せ
           IF      PTBYO-HKNCOMBI     =   ZERO
               CONTINUE
           ELSE 
      *****    IF    ( PTBYO-HKNCOMBI =   RECE02-HKNCOMBI (1) )  OR
      *****          ( PTBYO-HKNCOMBI =   RECE02-HKNCOMBI (2) )  OR
      *****          ( PTBYO-HKNCOMBI =   RECE02-HKNCOMBI (3) )
               MOVE    ZERO            TO  IDZ  
               PERFORM VARYING IDX     FROM    1   BY  1
                       UNTIL   IDX     >       10
                       OR      RECE02-HKNCOMBI (IDX)   =   ZERO 
                   IF      PTBYO-HKNCOMBI   =
                                            RECE02-HKNCOMBI (IDX)
                       MOVE    IDX             TO  IDZ
                       MOVE    10              TO  IDX
                   END-IF
               END-PERFORM
               IF      IDZ            >   ZERO          
                   CONTINUE
               ELSE
                   GO  TO  2001-PTBYO-CHK-EXT
               END-IF
           END-IF
      *
      *    レセプト表示月
           IF      PTBYO-REZEFLG          =   "1"
              GO  TO  2001-PTBYO-CHK-EXT
           END-IF
      *
           IF      PTBYO-REZEMM           >   ZERO
               INITIALIZE                      STS-AREA-DAY
               INITIALIZE                      LNK-DAY6-AREA
               MOVE    "61"                TO  LNK-DAY6-IRAI
      *********MOVE    RECE02-SRYYM        TO  LNK-DAY6-KIJUN (1:6)
               MOVE    PTBYO-SRYYMD        TO  LNK-DAY6-KIJUN 
               MOVE    "2"                 TO  LNK-DAY6-ZOGENPTN
      *********MOVE    PTBYO-REZEMM        TO  LNK-DAY6-ZOGEN 
               COMPUTE LNK-DAY6-ZOGEN  =   PTBYO-REZEMM    -   1    
               CALL    "ORCSDAY"           USING   STS-AREA-DAY
                                                   LNK-DAY6-AREA
               MOVE    LNK-DAY6-KEISAN(1:6)
                                           TO  WRK-YM
      *********IF      PTBYO-SRYYMD(1:6)       <=  WRK-YM
               IF      WRK-YM              >=  RECE02-SRYYM
                   CONTINUE
               ELSE
                   GO  TO  2001-PTBYO-CHK-EXT
               END-IF
           END-IF                    
      *                               
           PERFORM 20011-RECE03-WRITE-SEC
           .
       2001-PTBYO-CHK-EXT.
           EXIT. 
      *            
070100*****************************************************************
070200*    ;レセプト明細０３編集処理
070300*****************************************************************
070400 20011-RECE03-WRITE-SEC              SECTION.
      *
      *    疑いフラグより病名を編集
           MOVE    SPACE               TO  WRK-HENFLG1
                                           WRK-HENFLG2
      *       
           IF      PTBYO-UTAGAIFLG NOT =   SPACE
               COMPUTE WRK-MOJISU   =   PTBYO-BYOMEIMOJI   *   2
               IF      PTBYO-UTAGAIFLG  =   "1" OR  "3"
                   IF      WRK-MOJISU       <   8
                       MOVE    1                TO  IDZ
                   ELSE    
                       COMPUTE IDZ     =   WRK-MOJISU    -   7
                   END-IF    
                   PERFORM VARYING IDX FROM    IDZ BY  2
                           UNTIL   IDX >       WRK-MOJISU
                       IF      PTBYO-BYOMEI (IDX:2)      =   "疑"
                           MOVE    "1"              TO  WRK-HENFLG1
                           MOVE    WRK-MOJISU       TO  IDX
                       END-IF
                   END-PERFORM
               END-IF                
               IF      PTBYO-UTAGAIFLG =   "2" OR  "3"
                   PERFORM VARYING IDX FROM    1   BY  2
                           UNTIL   IDX >       WRK-MOJISU
                       IF      PTBYO-BYOMEI (IDX:4)      =   "急性"
                           MOVE    "1"              TO  WRK-HENFLG2
                           MOVE    WRK-MOJISU       TO  IDX
                       END-IF
                   END-PERFORM
               END-IF
           END-IF
      *     
      *    病名文字数を計算
           COMPUTE WRK-MOJISU          =   PTBYO-BYOMEIMOJI   *   2
           MOVE    PTBYO-BYOMEI      TO  WRK-BYOMEI
      *
      *    疑いフラグがセットされているとき
           IF    ( PTBYO-UTAGAIFLG   =   "1" OR  "3" )
           AND   ( WRK-HENFLG1         =   SPACE     )                         
               MOVE    SPACE               TO  WRK-BYOMEI
               STRING  PTBYO-BYOMEI        DELIMITED BY  SPACE
                       WRK-CONS-UTAGAI     DELIMITED BY  SIZE
                       INTO                WRK-BYOMEI
               END-STRING
               COMPUTE WRK-MOJISU          =      
                                WRK-MOJISU +   WRK-CONS-UTAGAI-MOJISU
               IF      PTBYO-BYOMEICD (21)  NOT =   SPACE             
                   MOVE    "1"                 TO  PTBYO-BYOMEIHENFLG
               ELSE
                   PERFORM VARYING IDX FROM    1   BY  1
                           UNTIL   IDX >       21
                       IF      PTBYO-BYOMEICD (IDX)    =   SPACE
                           MOVE    WRK-CONS-BYOMEICD-UTAGAI
                                               TO  PTBYO-BYOMEICD (IDX)
                           MOVE    21          TO  IDX
                       END-IF
                   END-PERFORM
               END-IF
           END-IF    
           IF    ( PTBYO-UTAGAIFLG   =   "2" OR  "3" )
           AND   ( WRK-HENFLG2         =   SPACE     )                         
               MOVE    SPACE               TO  WRK-BYOMEIW
               STRING  WRK-CONS-KYUSEI     DELIMITED BY  SIZE
                       WRK-BYOMEI          DELIMITED BY  SPACE
                       INTO                WRK-BYOMEIW
               END-STRING
               COMPUTE WRK-MOJISU          =      
                                WRK-MOJISU +   WRK-CONS-KYUSEI-MOJISU
               MOVE    WRK-BYOMEIW         TO  WRK-BYOMEI  
               IF      PTBYO-BYOMEICD (21) NOT =   SPACE             
                   MOVE    "1"                 TO  PTBYO-BYOMEIHENFLG
               ELSE
                   PERFORM VARYING IDX FROM    1   BY  1
                           UNTIL   IDX >       21
                       IF      PTBYO-BYOMEICD (IDX)    =   SPACE
                           MOVE    WRK-CONS-BYOMEICD-KYUSEI
                                               TO  PTBYO-BYOMEICD (IDX)
                           MOVE    21          TO  IDX
                       END-IF
                   END-PERFORM
               END-IF
           END-IF
      *
           ADD     1                   TO  WRK-RENNUM
           
           INITIALIZE                      RECE03-REC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    RECE02-HOSPID       TO  RECE03-HOSPID
           MOVE    SPA-HOSPNUM         TO  RECE03-HOSPNUM
      *---(01.00.05) LINE ADD END   ------------------------------------
           MOVE    RECE02-SRYYM        TO  RECE03-SRYYM
           MOVE    RECE02-NYUGAIKBN    TO  RECE03-NYUGAIKBN
           MOVE    RECE02-PTID         TO  RECE03-PTID
           MOVE    RECE02-RECEKA       TO  RECE03-RECEKA
           MOVE    RECE02-TEISYUTUSAKI TO  RECE03-TEISYUTUSAKI
           MOVE    RECE02-RECESYUBETU  TO  RECE03-RECESYUBETU
           MOVE    RECE02-HKNJANUM-KEY TO  RECE03-HKNJANUM
           MOVE    RECE02-HOJOKBN-KEY  TO  RECE03-HOJOKBN
           MOVE    RECE02-TEKSTYMD     TO  RECE03-TEKSTYMD
           MOVE    PTBYO-SRYYMD        TO  RECE03-SRYYMD
           MOVE    WRK-RENNUM          TO  RECE03-RENNUM
           MOVE    RECE02-PTNUM        TO  RECE03-PTNUM
           MOVE    PTBYO-SRYKA         TO  RECE03-SRYKA
           MOVE    PTBYO-KHNBYOMEICD   TO  RECE03-KHNBYOMEICD   
           MOVE    PTBYO-BYOMEICD-G    TO  RECE03-BYOMEICD-G
           MOVE    PTBYO-UTAGAIFLG     TO  RECE03-UTAGAIFLG
      *****MOVE    PTBYO-SYUBYOFLG     TO  RECE03-SYUBYOFLG   
           IF      SYS-2005-SYUBYOHENFLG    =   ZERO
               MOVE    "9"                 TO  RECE03-SYUBYOFLG 
           ELSE
               IF      PTBYO-SYUBYOFLG     =   "1"
                   MOVE    PTBYO-SYUBYOFLG     TO  RECE03-SYUBYOFLG    
               ELSE
                   MOVE    "9"                 TO  RECE03-SYUBYOFLG 
               END-IF
           END-IF
           MOVE    PTBYO-MANSEIKBN     TO  RECE03-MANSEIKBN
           IF      RECE02-SRYYM        <   PTBYO-TENKIYMD(1:6)
               CONTINUE
           ELSE    
               MOVE    PTBYO-TENKIKBN      TO  RECE03-TENKIKBN
               MOVE    PTBYO-TENKIYMD      TO  RECE03-TENKIYMD   
           END-IF    
           MOVE    WRK-BYOMEI          TO  RECE03-BYOMEI
           COMPUTE RECE03-BYOMEIMOJI    =   WRK-MOJISU    /   2
           MOVE    PTBYO-BYOMEIHENFLG  TO  RECE03-BYOMEIHENFLG   
      *
      *@@@@@@@@@@@@@@
           DISPLAY "====================================="
           DISPLAY "患者番号="  RECE03-PTNUM
           DISPLAY "診療日="    RECE03-SRYYMD
           DISPLAY "基本病名CD" RECE03-KHNBYOMEICD
           DISPLAY "転帰区分="  RECE03-TENKIKBN
           DISPLAY "転帰日="    RECE03-TENKIYMD
      *
           WRITE   RECE03-REC
           ADD     1                   TO  CNT-OUT
076800     .
076900 20011-RECE03-WRITE-EXT.
077000     EXIT.
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
057400*
      *****************************************************************
      *    終了処理
      *****************************************************************
       300-TERM-SEC                SECTION.
      *
           .
       300-TERM-EXT.
           EXIT.
      *
      *****************************************************************
      *    患者病名マスタ　ＲＥＡＤ
      *****************************************************************
       900-PTBYO-READ-SEC         SECTION.
      *
           MOVE    "DBFETCH"           TO  MCP-FUNC
      ***** 05/05/06 DEL
      *     CALL    "ORCMCPSUB"          USING
      *                                  MCPAREA
      *                                  ORCMCPAREA
      *                                  MCPDATA-REC
      ***** 05/05/06 INS
      *---(01.00.05) LINE ADD START ------------------------------------
      *     CALL    "MCPSUB"            USING
      *                                 MCPAREA
      *                                 MCPDATA-REC
      *****
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    ZERO            TO  FLG-PTBYOMEI
               MOVE    MCPDATA-REC     TO  PTBYOMEI-REC 
           ELSE
               MOVE    1               TO  FLG-PTBYOMEI
           END-IF
           .
       900-PTBYO-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    システム管理マスタ読込
      *****************************************************************
       900-SYSKANRI-READ-SEC         SECTION.
      * 
           MOVE    SYSKANRI-REC    TO  MCPDATA-REC
           MOVE    "DBSELECT"      TO  MCP-FUNC
      ***** 05/05/06 DEL
      *     MOVE    "SYSKANRI-KEY"  TO  ORC-DBPATH
      *     MOVE    WRK-PARA-SRYYM  TO  ORC-DBYMD (1:6)
      *     MOVE    "01"            TO  ORC-DBYMD (7:2) 
      *     CALL    "ORCMCPSUB"     USING
      *                             MCPAREA
      *                             ORCMCPAREA
      *                             MCPDATA-REC
      ***** 05/05/06 INS
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SYSKANRI-KEY10 TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
      *****
           MOVE    "tbl_syskanri"          TO  MCP-TABLE
           MOVE    "key10"                 TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"             USING
                                           MCPAREA
                                           MCPDATA-REC
                                           SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           IF      MCP-RC          =   ZERO
      ***** 05/05/06 DEL
      *         MOVE    "SYSKANRI-KEY"  TO  ORC-DBPATH
      *         MOVE    "DBFETCH"       TO  MCP-FUNC
      *         CALL    "ORCMCPSUB"     USING
      *                                 MCPAREA
      *                                 ORCMCPAREA
      *                                 MCPDATA-REC
      ***** 05/05/06 INS
               MOVE    "DBFETCH"               TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-SYSKANRI-KEY10 TO  MCP-PATH
      *         CALL    "MCPSUB"                USING
      *                                             MCPAREA
      *                                             MCPDATA-REC
      *****
               MOVE    "DBFETCH"             TO  MCP-FUNC
               MOVE  "tbl_syskanri"          TO  MCP-TABLE
               MOVE  "key10"                 TO  MCP-PATHNAME
               CALL  "ORCDBMAIN"             USING
                                             MCPAREA
                                             MCPDATA-REC
                                             SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
               IF      MCP-RC          =   ZERO
                   MOVE    ZERO            TO  FLG-SYSKANRI
               ELSE
                   MOVE    1               TO  FLG-SYSKANRI
               END-IF
           ELSE
               MOVE    1               TO  FLG-SYSKANRI
           END-IF
      *
      ***** 05/05/06 DEL
      *     MOVE    "DBCLOSE"           TO  MCP-FUNC
      *     MOVE    "SYSKANRI-KEY"      TO  ORC-DBPATH
      *     CALL    "ORCMCPSUB"         USING
      *                                 MCPAREA
      *                                 ORCMCPAREA
      *                                 MCPDATA-REC
      ***** 05/05/06 INS
           MOVE    "DBCLOSECURSOR"         TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-SYSKANRI-KEY10   TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
      *****
           MOVE  "tbl_syskanri"          TO  MCP-TABLE
           MOVE  "key10"                 TO  MCP-PATHNAME
           CALL  "ORCDBMAIN"             USING
                                         MCPAREA
                                         MCPDATA-REC
                                         SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           .
       900-SYSKANRI-READ-EXT.
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
           MOVE    WRK-PARA-SRYYM      TO  RECE02-SKYYM
           MOVE    RECE02-REC          TO  MCPDATA-REC
      *
           MOVE    "DBSELECT"          TO  MCP-FUNC
      ***** 05/05/06 DEL
      *     MOVE    "KOHSKY-KEY2"       TO  ORC-DBPATH
      *     CALL    "ORCMCPSUB"          USING
      *                                  MCPAREA
      *                                  ORCMCPAREA
      *                                  MCPDATA-REC
      ***** 05/05/06 INS
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-KOHSKY-KEY2    TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
      *****
           MOVE    "tbl_kohsky"        TO  MCP-TABLE
           MOVE    "key2"              TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"         USING
                                       MCPAREA
                                       MCPDATA-REC
                                       SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
      ***** 05/05/06 DEL
      *         MOVE    "KOHSKY-KEY2"       TO  ORC-DBPATH
      *****
               PERFORM 900-KOHSKY-READ-SEC
           ELSE
               MOVE    1                   TO  FLG-END
      ***** 05/05/06 INS
               PERFORM  900-KOHSKY-CLOSE-SEC
      *****
           END-IF
           .
       900-KOHSKY-START-EXT.
           EXIT.
      *      
      *****************************************************************
      *    公費請求書マスタＲＥＡＤ  複写式レセの対象となる公費を設定する
      *****************************************************************
       900-KOHSKY-READ-SEC         SECTION.
      *
           MOVE    "DBFETCH"           TO  MCP-FUNC
      ***** 05/05/06 DEL
      *     MOVE    "KOHSKY-KEY2"       TO  ORC-DBPATH
      *     CALL    "ORCMCPSUB"          USING
      *                                  MCPAREA
      *                                  ORCMCPAREA
      *                                  MCPDATA-REC
      ***** 05/05/06 INS
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-KOHSKY-KEY2    TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
      *****
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
      *---(01.00.03) LINE ADD START ------------------------------------
      *         IF  RECE02-KOHNUM (1)  =  "180" OR "181" OR "190" OR
      *             RECE02-KOHNUM (2)  =  "180" OR "181" OR "190" OR
      *             RECE02-KOHNUM (3)  =  "180" OR "181" OR "190" OR
      *             RECE02-KOHNUM (4)  =  "180" OR "181" OR "190"
      *---(01.00.04) LINE ADD START ------------------------------------
      *         IF  RECE02-KOHNUM(1) = "180" OR "181" OR "190" OR "281"
      *         OR  RECE02-KOHNUM(2) = "180" OR "181" OR "190" OR "281"
      *         OR  RECE02-KOHNUM(3) = "180" OR "181" OR "190" OR "281"
      *         OR  RECE02-KOHNUM(4) = "180" OR "181" OR "190" OR "281"
      *---(01.00.06) LINE ADD START ------------------------------------
      *         IF  RECE02-KOHNUM(1) = "180" OR "181" OR "190" OR "281"
      *                             OR "290"
      *         OR  RECE02-KOHNUM(2) = "180" OR "181" OR "190" OR "281"
      *                             OR "290"
      *         OR  RECE02-KOHNUM(3) = "180" OR "181" OR "190" OR "281"
      *                             OR "290"
      *         OR  RECE02-KOHNUM(4) = "180" OR "181" OR "190" OR "281"
      *                             OR "290"
               IF  RECE02-KOHNUM(1) = "180" OR "181" OR "190" OR "281"
                                   OR "290" OR "280" OR "380" OR "381"
                                   OR "390" OR "490"
               OR  RECE02-KOHNUM(2) = "180" OR "181" OR "190" OR "281"
                                   OR "290" OR "280" OR "380" OR "381"
                                   OR "390" OR "490"
               OR  RECE02-KOHNUM(3) = "180" OR "181" OR "190" OR "281"
                                   OR "290" OR "280" OR "380" OR "381"
                                   OR "390" OR "490"
               OR  RECE02-KOHNUM(4) = "180" OR "181" OR "190" OR "281"
                                   OR "290" OR "280" OR "380" OR "381"
                                   OR "390" OR "490"
      *---(01.00.06) LINE ADD END   ------------------------------------
      *---(01.00.04) LINE ADD END   ------------------------------------
      *---(01.00.03) LINE ADD END   ------------------------------------
      ***** 05/06/15 DEL
      **    入院データ、国保は対象外にする
      *             IF    RECE02-NYUGAIKBN  =  "1" OR
      *                   RECE02-HKNNUM     =  "060" OR "067"
      *               GO    TO    900-KOHSKY-READ-SEC
      *             END-IF
      ***** 05/06/15
      *    県内保険者の国保は対象外にするが、県外保険者(県内扱い含む)の
      *    国保は対称にする
                   IF      RECE02-TEISYUTUSAKI =   "2"
                       IF      RECE02-HKNNUM   =   "060"
                           MOVE    RECE02-HKNJANUM(1:6)
                                               TO  WRK-HKNJANUM(1:6)
                       ELSE
                           MOVE    RECE02-HKNJANUM(3:6)
                                               TO  WRK-HKNJANUM(1:6)
                       END-IF
                       IF      WRK-HKNJANUM(1:2)   =  "40"
                           GO    TO    900-KOHSKY-READ-SEC
                       END-IF
                   END-IF
      *****
      *    テスト患者のときは読み飛ばす
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
      *    老人＋障害は対象から外す
                   IF    RECE02-RJNHKNNUM  NOT  =  SPACE    AND
                        (RECE02-KOHNUM(1) =  "180" OR
                         RECE02-KOHNUM(2) =  "180" OR
                         RECE02-KOHNUM(3) =  "180" OR
                         RECE02-KOHNUM(4) =  "180")
                     GO    TO    900-KOHSKY-READ-SEC
                   END-IF
               ELSE
                 GO  TO  900-KOHSKY-READ-SEC
               END-IF
           ELSE
               MOVE    1               TO  FLG-END
      ***** 05/05/06 INS
               PERFORM  900-KOHSKY-CLOSE-SEC
      *****
           END-IF
           .
       900-KOHSKY-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    公費請求マスタCLOSE 05/05/06 INS
      *****************************************************************
       900-KOHSKY-CLOSE-SEC           SECTION.
      *
           MOVE    "DBCLOSECURSOR"         TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-KOHSKY-KEY2    TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
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
      ***** 05/05/06 DEL
      *     MOVE    "PTINF-KEY"         TO  ORC-DBPATH
      *     CALL    "ORCMCPSUB"          USING
      *                                  MCPAREA
      *                                  ORCMCPAREA
      *                                  MCPDATA-REC
      ***** 05/05/06 INS
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-PTINF-KEY      TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
      *****
           MOVE    "tbl_ptinf"           TO  MCP-TABLE
           MOVE    "key"                 TO  MCP-PATHNAME
           CALL    "ORCDBMAIN"           USING
                                         MCPAREA
                                         MCPDATA-REC
                                         SPA-AREA
      *---(01.00.05) LINE ADD END   ------------------------------------
           IF      MCP-RC              =   ZERO
               MOVE    "DBFETCH"           TO  MCP-FUNC
      ***** 05/05/06 DEL
      *         MOVE    "PTINF-KEY"         TO  ORC-DBPATH
      *         CALL    "ORCMCPSUB"          USING
      *                                      MCPAREA
      *                                      ORCMCPAREA
      *                                      MCPDATA-REC
      ***** 05/05/06 INS
      *---(01.00.05) LINE ADD START ------------------------------------
      *         MOVE    PATH-TBL-PTINF-KEY      TO  MCP-PATH
      *         CALL    "MCPSUB"                USING
      *                                             MCPAREA
      *                                             MCPDATA-REC
      *****
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
      ***** 05/05/06 DEL
      *     MOVE    "DBCLOSE"           TO  MCP-FUNC
      *     MOVE    "PTINF-KEY"         TO  ORC-DBPATH
      *     CALL    "ORCMCPSUB"          USING
      *                                  MCPAREA
      *                                  ORCMCPAREA
      *                                  MCPDATA-REC
      ***** 05/05/06 INS
           MOVE    "DBCLOSECURSOR"         TO  MCP-FUNC
      *---(01.00.05) LINE ADD START ------------------------------------
      *     MOVE    PATH-TBL-PTINF-KEY      TO  MCP-PATH
      *     CALL    "MCPSUB"                USING
      *                                         MCPAREA
      *                                         MCPDATA-REC
      *****
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
