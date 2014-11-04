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
       IDENTIFICATION              DIVISION.
       PROGRAM-ID.                 PRGOPTIONSET.
      *****************************************************************
      *  システム名        : ＯＲＣＡ
      *  サブシステム名    : プラグイン処理
      *  コンポーネント名  : プログラムオプション更新処理
      *                    : 
      *  管理者            : 
      *  作成日付    作業者        記述
      *  14/10/02    uchi    新規作成
      *****************************************************************
      *  プログラム修正履歴
      * Maj/Min/Rev  修正者       日付      内容
      *****************************************************************
      *
       ENVIRONMENT                 DIVISION.
       CONFIGURATION               SECTION.
       INPUT-OUTPUT                SECTION.
       FILE-CONTROL.
      *
      *    入力：システム管理更新ファイル
           SELECT  IN-FILE         ASSIGN
                                   ASS-IN
                                   ORGANIZATION    IS  LINE SEQUENTIAL
                                   FILE    STATUS  IS  STS-IN.
      *
       DATA                        DIVISION.
       FILE                        SECTION.
      *
      *    入力：システム管理更新ファイル
       FD  IN-FILE.
       01  IN-PRG-REC.
           03  IN-PRG-DATA         PIC  X(150).
      *
       WORKING-STORAGE             SECTION.
      *
           COPY    "COMMON-SPA".
      *
      *    ファイル指定領域
       01  ASS-AREA.
           03  ASS-IN                  PIC X(256).
      *
      *    フラグ領域
       01  STS-AREA.
           03  STS-IN                  PIC X(02).
      *
      *    フラグ領域
       01  FLG-AREA.
           03  FLG-PARA                PIC 9(01).
           03  FLG-IN                  PIC 9(01).
      *
           03  FLG-SYS                 PIC 9(01).
           03  FLG-CHECK               PIC 9(01).
      *
      *    添字領域
       01  IDX-AREA.
           03  IDX                     PIC 9(04).
           03  IDY                     PIC 9(04).
           03  IDX-LIKE                PIC 9(04).
      *
      *
       01  SYS-DATE.
           03  SYS-YY                  PIC 9(02).
           03  SYS-MM                  PIC 9(02).
           03  SYS-DD                  PIC 9(02).
      *    一時領域
       01  WRK-AREA.
           03  WRK-SYMD.
               05  WRK-SYY             PIC 9(04).
               05  WRK-SMM             PIC 9(02).
               05  WRK-SDD             PIC 9(02).
           03  WRK-SYMD2.
               05  WRK-SYY2            PIC 9(02).
               05  WRK-SMM2            PIC 9(02).
               05  WRK-SDD2            PIC 9(02).
           03  WRK-LAST-STYUKYMD       PIC X(08).
           03  WRK-LAST-EDYUKYMD       PIC X(08).
      *
      *　　主キー更新用項目
           03  WRK-SYSUPD-KEY.
               05  WRK-SYSUP-HOSPNUM   PIC 9(02).
               05  WRK-SYSUP-KANRICD   PIC X(04).
               05  WRK-SYSUP-KBNCD     PIC X(08).
               05  WRK-SYSUP-STYUKYMD  PIC X(08).
               05  WRK-SYSUP-EDYUKYMD  PIC X(08).
      *
           03  WRK-FILENAME            PIC X(40).
           03  WRK-PRGID               PIC X(20).
           03  WRK-KBNCD               PIC X(20).
           03  WRK-DATA                PIC X(1000).
      *
       01  LNK-AREA.
           03  LNK-HOSPNUM             PIC  X(02).
           03  LNK-YMD                 PIC  X(08).
           03  LNK-HMS                 PIC  X(06).
           03  LNK-DIR                 PIC  X(100).
           03  LNK-FILENAME            PIC  X(30).
           03  LNK-KAKU                PIC  X(03).
      *
      *****************************************************************
      *    ファイル定義
      *****************************************************************
      *
      *    数字変換領域
           COPY    "CPORCSNUM.INC".
      *
      *****************************************************************
      *    ファイル定義
      *****************************************************************
      *
      *    システム管理マスタ
           COPY    "CPSYSKANRI.INC".
      *
      *    プログラムオプション
       01  PRGOPTION-REC.
           COPY    "CPPRGOPTION.INC".
      *
      *    ジョブ管理情報
       01  JOBKANRI-REC.
           COPY    "CPJOBKANRI.INC".
      *
      *    共通パラメタ
           COPY    "MCPAREA".
           COPY    "MCPDATA.INC".
      *
      *****************************************************************
      *    連絡　領域
      *****************************************************************
       LINKAGE                     SECTION.
       01  COMMAND-PARAM.
           02  FILLER  PIC X(256).
      *
       PROCEDURE                       DIVISION
           USING
           COMMAND-PARAM.
      *
      ****************************************************************
      *    主　　処理
      *****************************************************************
       000-PROC-SEC                SECTION.
      *
           PERFORM 100-INIT-SEC
      *
           IF  FLG-IN  =  ZERO
               PERFORM 200-MAIN-SEC
           END-IF
      *
           PERFORM 300-END-SEC
      *
      *****STOP    RUN
           .
           EXIT    PROGRAM
           .
      *
      *****************************************************************
      *    初期処理
      *****************************************************************
       100-INIT-SEC                SECTION.
      *
           MOVE    ZERO            TO  FLG-AREA
           MOVE    ZERO            TO  IDX-AREA
           INITIALIZE                  WRK-AREA
                                       SPA-AREA
      *    引数
           UNSTRING  COMMAND-PARAM  DELIMITED  BY  ","
                                    INTO  LNK-HOSPNUM
                                          LNK-YMD
                                          LNK-HMS
                                          LNK-DIR
                                          LNK-FILENAME
                                          LNK-KAKU
           END-UNSTRING
      *
           DISPLAY "START"
      *    対象となるファイル名の作成
           STRING  LNK-FILENAME  DELIMITED  BY  SPACE
                   "."           DELIMITED  BY  SIZE
                   LNK-KAKU      DELIMITED  BY  SPACE
                                 INTO       WRK-FILENAME
           END-STRING
      *    PRGID,KBNCDを割り出す
           IF  LNK-KAKU = "opt"
               UNSTRING  LNK-FILENAME  DELIMITED  BY  "-"
                                       INTO  WRK-PRGID
                                             WRK-KBNCD
               END-UNSTRING
               IF  WRK-KBNCD = SPACE
                 MOVE  "*"  TO  WRK-KBNCD
               END-IF
           ELSE
               MOVE   LNK-FILENAME     TO  WRK-PRGID
               MOVE   "EXPLANATION"    TO  WRK-KBNCD
           END-IF
           DISPLAY  "PRGID  :  "  WRK-PRGID
           DISPLAY  "KBNCD  :  "  WRK-KBNCD
      *
           MOVE    LNK-HOSPNUM     TO  SPA-HOSPNUM
      *
      *    DB OPEN
           PERFORM 100-DBOPEN-SEC
      *
      *    ファイル情報
           PERFORM 101-ASSIN-GET-SEC
      *
      *    入力　初期処理
           OPEN    INPUT           IN-FILE
           IF  STS-IN          NOT =   ZERO
               MOVE    1           TO  FLG-IN
               DISPLAY "*(SYS3004)* IN-FILE OPN STS["
                                       STS-IN "]"
           END-IF
      *
           .
       100-INIT-EXT.
           EXIT.
      *
      *****************************************************************
      *    ファイル情報取得
      *****************************************************************
       101-ASSIN-GET-SEC                SECTION.
      *
      *    入力ファイル
           MOVE    SPACE               TO  ASS-IN
           STRING  LNK-DIR             DELIMITED  BY  SPACE
                   "/"                 DELIMITED  BY  SIZE
                   WRK-FILENAME        DELIMITED  BY  SPACE
                                       INTO    ASS-IN
           END-STRING
      *
           .
       101-ASSIN-GET-EXT.
           EXIT.
      *
      *****************************************************************
      *    メイン処理
      *****************************************************************
       200-MAIN-SEC                    SECTION.
      *
      *    プログラムオプションの存在チェック
           PERFORM  2001-DATA-CHECK-SEC
           IF  FLG-CHECK  =  0
      *        データ追加
               PERFORM  201-DATA-INSERT-SEC
           END-IF
      *
           .
       200-MAIN-EXT.
           EXIT.
      *
      *****************************************************************
      *    プログラムオプション存在チェック  処理
      *****************************************************************
       2001-DATA-CHECK-SEC               SECTION.
      *
      *    同様のPRGID,KBNCDのデータがあるかどうか
           INITIALIZE                  PRGOPTION-REC
      *
           MOVE    SPA-HOSPNUM         TO  PRGOPTION-HOSPNUM
           MOVE    WRK-PRGID           TO  PRGOPTION-PRGID
           MOVE    WRK-KBNCD           TO  PRGOPTION-KBNCD
      *
           MOVE    PRGOPTION-REC       TO  MCPDATA-REC
           MOVE    "DBSELECT"          TO  MCP-FUNC
           MOVE    "tbl_prgoption"     TO  MCP-TABLE
           MOVE    "key"               TO  MCP-PATHNAME
           PERFORM 900-ORCDBMAIN-SEC
           IF      MCP-RC          =   ZERO
               MOVE    "tbl_prgoption"     TO  MCP-TABLE
               MOVE    "key"               TO  MCP-PATHNAME
               PERFORM  910-PRGOPTION-READ-SEC
               
               IF  FLG-SYS  =  0
                   MOVE      1             TO  FLG-CHECK
                   DISPLAY  "ALREADY  SET!"
               END-IF
           END-IF
      *
           MOVE  "tbl_prgoption"       TO  MCP-TABLE
           MOVE  "key"                 TO  MCP-PATHNAME
           PERFORM 990-DBCLOSE-SEC
      *
           .
       2001-DATA-CHECK-EXT.
           EXIT.
      *
      *****************************************************************
      *    データ追加メイン  処理
      *****************************************************************
       201-DATA-INSERT-SEC               SECTION.
      *
      *    ファイル読み込み
           PERFORM  900-DATA-READ-SEC
           MOVE  IN-PRG-DATA    TO  WRK-DATA
      *
           PERFORM  UNTIL    FLG-IN  =  1
      *        ファイル読み込み
               PERFORM  900-DATA-READ-SEC
               IF  FLG-IN  =  ZERO
      *            改行文字・データ追加
      *             STRING  WRK-DATA       DELIMITED  BY  SPACE
      *                     X"0A"          DELIMITED  BY  SIZE
      *                     IN-PRG-DATA    DELIMITED  BY  SPACE
      *                                    INTO   WRK-DATA
      *             END-STRING
      * 「STORED-CHAR-LENGTH」は末尾の空白を除いた長さを返す。優秀。
                   STRING  WRK-DATA
                           (1:FUNCTION STORED-CHAR-LENGTH(WRK-DATA))
                                          DELIMITED  BY  SIZE
                           X"0A"          DELIMITED  BY  SIZE
                           IN-PRG-DATA
                           (1:FUNCTION STORED-CHAR-LENGTH(IN-PRG-DATA))
                                          DELIMITED  BY  SIZE
                                          INTO   WRK-DATA
                   END-STRING
               END-IF
           END-PERFORM
      *
      *    データ登録（追加）
           PERFORM  2010-DATA-INSERT-SEC
      *
           .
       201-DATA-INSERT-EXT.
           EXIT.
      *
      *****************************************************************
      *    データ追加  処理
      *****************************************************************
       2010-DATA-INSERT-SEC               SECTION.
      *
      *    データ追加処理
           INITIALIZE                  PRGOPTION-REC
      *
           MOVE    SPA-HOSPNUM         TO  PRGOPTION-HOSPNUM
           MOVE    WRK-PRGID           TO  PRGOPTION-PRGID
           MOVE    WRK-KBNCD           TO  PRGOPTION-KBNCD
           MOVE    WRK-DATA            TO  PRGOPTION-OPTION
           MOVE    "1"                 TO  PRGOPTION-ADDKBN
           MOVE    LNK-YMD             TO  PRGOPTION-CREYMD
           MOVE    LNK-HMS             TO  PRGOPTION-UPHMS
      *
           MOVE    PRGOPTION-REC       TO  MCPDATA-REC
           MOVE    "DBINSERT"          TO  MCP-FUNC
           MOVE    "tbl_prgoption"     TO  MCP-TABLE
           MOVE    "key"               TO  MCP-PATHNAME
           PERFORM 900-ORCDBMAIN-SEC
           IF      MCP-RC              =   ZERO
               DISPLAY  "DATA INSERT!"
           END-IF
      *
           .
       2010-DATA-INSERT-EXT.
           EXIT.
      *
      *****************************************************************
      *    終了処理
      *****************************************************************
       300-END-SEC                     SECTION.
      *
      *    DB DISCONNECT
           PERFORM 900-DBDISCONNECT-SEC
      *
           DISPLAY "END"
      *    出力ファイル　終了処理
           CLOSE                       IN-FILE
      *
           .
       300-END-EXT.
           EXIT.
      *
      *****************************************************************
      *    プログラムオプション更新ファイル読込み処理
      *****************************************************************
       900-DATA-READ-SEC          SECTION.
      *
          READ    IN-FILE
              AT  END
                  MOVE    1               TO  FLG-IN
              NOT AT  END
                  MOVE    ZERO            TO  FLG-IN
          END-READ
      *
          .
       900-DATA-READ-EXT.
          EXIT.
      *
      *****************************************************************
      *    プログラムオプション読込
      *****************************************************************
       910-PRGOPTION-READ-SEC         SECTION.
      *
           MOVE    "DBFETCH"           TO  MCP-FUNC
           PERFORM 900-ORCDBMAIN-SEC
           IF      MCP-RC              =   ZERO
               MOVE    MCPDATA-REC     TO  PRGOPTION-REC
               MOVE    ZERO            TO  FLG-SYS
           ELSE
               INITIALIZE              PRGOPTION-REC
               MOVE    1               TO  FLG-SYS
           END-IF
      *
           .
       910-PRGOPTION-READ-EXT.
           EXIT.
      *
      *****************************************************************
      *    カーソルクローズ処理
      *****************************************************************
       990-DBCLOSE-SEC               SECTION.
      *
           MOVE    "DBCLOSECURSOR"     TO  MCP-FUNC
           PERFORM 900-ORCDBMAIN-SEC
           .
      *
       990-DBCLOSE-EXT.
           EXIT.
      *
      *****************************************************************
      *    ＤＢ　オープン処理
      *****************************************************************
       100-DBOPEN-SEC                SECTION.
      *
           MOVE    LOW-VALUE       TO  MCP-TABLE
                                       MCP-PATHNAME
           MOVE    "DBOPEN"        TO  MCP-FUNC
           PERFORM 900-ORCDBMAIN-SEC
      *
           MOVE    LOW-VALUE       TO  MCP-TABLE
                                       MCP-PATHNAME
           MOVE    "DBSTART"       TO  MCP-FUNC
           PERFORM 900-ORCDBMAIN-SEC
           .
       100-DBOPEN-EXT.
           EXIT.
      *
      *****************************************************************
      *    ＤＢ　クローズ処理
      *****************************************************************
       900-DBDISCONNECT-SEC            SECTION.
      *
           MOVE    LOW-VALUE       TO  MCP-TABLE
                                       MCP-PATHNAME
           MOVE    "DBCOMMIT"      TO  MCP-FUNC
           PERFORM 900-ORCDBMAIN-SEC
      *
           MOVE    LOW-VALUE       TO  MCP-TABLE
                                       MCP-PATHNAME
           MOVE    "DBDISCONNECT"  TO  MCP-FUNC
           PERFORM 900-ORCDBMAIN-SEC
           .
       900-DBDISCONNECT-EXT.
           EXIT.
      *
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
