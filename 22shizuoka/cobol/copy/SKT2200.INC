        01  SKT2200.
            02  SKT2200-PRTYM   PIC X(16).
            02  SKT2200-DATA            OCCURS  8 TIMES.
              03  SKT2200-HKNJANAME   PIC X(20).
              03  SKT2200-TODOHUKEN   PIC X(20).
              03  SKT2200-KENSU-TBL       OCCURS  26 TIMES.
                04  SKT2200-KENSU   PIC X(6).
              03  SKT2200-TENSU-TBL       OCCURS  26 TIMES.
                04  SKT2200-TENSU   PIC X(9).
            02  SKT2200-G-KENSU-TBL     OCCURS  26 TIMES.
              03  SKT2200-G-KENSU PIC X(6).
            02  SKT2200-G-TENSU-TBL     OCCURS  26 TIMES.
              03  SKT2200-G-TENSU PIC X(9).
            02  SKT2200-GKENSU
                    PIC X(9)    OCCURS  2 TIMES.
            02  SKT2200-GTENSU
                    PIC X(10)   OCCURS  2 TIMES.
            02  SKT2200-RYOYOHI
                    PIC X(10)   OCCURS  2 TIMES.
            02  SKT2200-HOSPCDN PIC X(40).
            02  SKT2200-ADRS    PIC X(100).
            02  SKT2200-HOSPNAME    PIC X(100).
            02  SKT2200-TENHYOKBN-TBL           OCCURS  5 TIMES.
              03  SKT2200-TENHYOKBN   PIC X(2).
