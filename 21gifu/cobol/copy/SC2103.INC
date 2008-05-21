        01  SC03.
            02  SC03-PRTYM    PIC X(16).
            02  SC03-HOSPCDN  PIC X(20).
            02  SC03-SEIYMD   PIC X(22).
            02  SC03-SRYKA    PIC X(2).
            02  SC03-ADRS PIC X(100).
            02  SC03-HOSPNAME PIC X(100).
            02  SC03-KAISETUNAME  PIC X(60).
            02  SC03-TEL  PIC X(26).
            02  SC03-SRYTBL           OCCURS  10 TIMES.
              03  SC03-JKYSNUM1 PIC X(6).
              03  SC03-JKYSNUM2 PIC X(22).
              03  SC03-NAME PIC X(20).
              03  SC03-NYUGAIKBN
                      PIC X(2)    OCCURS  2 TIMES.
              03  SC03-HKNKBN
                      PIC X(2)    OCCURS  4 TIMES.
              03  SC03-KOREI    PIC X(1).
              03  SC03-TYOKI    PIC X(1).
              03  SC03-TENSU
                      PIC X(7)    OCCURS  3 TIMES.
              03  SC03-KOHTENSU PIC X(7).
              03  SC03-YKZFTN   PIC X(6).
              03  SC03-ITBFTN   PIC X(6).
              03  SC03-SKINGK   PIC X(6).
              03  SC03-SFTNGK   PIC X(6).
              03  SC03-BIKO PIC X(16).
            02  SC03-SUM-TBL.
              03  SC03-GKENSU
                      PIC X(2)    OCCURS  3 TIMES.
              03  SC03-GTENSU
                      PIC X(9)    OCCURS  3 TIMES.
              03  SC03-GKOHTENSU    PIC X(7).
              03  SC03-GYKZFTN  PIC X(7).
              03  SC03-GITBFTN  PIC X(7).
              03  SC03-GSKENSU  PIC X(2).
              03  SC03-GSKINGK  PIC X(7).
              03  SC03-GSFTNGK  PIC X(7).
              03  SC03-KOHSYUBETU
                      PIC X(2)    OCCURS  4 TIMES.
