        01  SKT2640.
            02  SKT2640-SRYYM   PIC X(16).
            02  SKT2640-SRYKA   PIC X(20).
            02  SKT2640-POST    PIC X(8).
            02  SKT2640-ADRS    PIC X(100).
            02  SKT2640-HOSPNAME    PIC X(100).
            02  SKT2640-KAISETUNAME PIC X(40).
            02  SKT2640-TEL PIC X(15).
            02  SKT2640-HOSPCDN PIC X(7).
            02  SKT2640-SEIKYU-TBL      OCCURS  4 TIMES.
              03  SKT2640-NYUGAI-TBL      OCCURS  2 TIMES.
                04  SKT2640-KENSU   PIC X(6).
                04  SKT2640-TENSU   PIC X(9).
                04  SKT2640-ITBFTN  PIC X(9).
                04  SKT2640-TAKOH   PIC X(2).
                04  SKT2640-TYOKI   PIC X(2).
                04  SKT2640-GENBAKU PIC X(2).
                04  SKT2640-NISSU   PIC X(3).
                04  SKT2640-S-KENSU PIC X(6).
                04  SKT2640-S-KINGAKU   PIC X(9).
                04  SKT2640-S-FTNGAKU   PIC X(9).
            02  SKT2640-GENMEN-TBL      OCCURS  2 TIMES.
              03  SKT2640-G-KESNU PIC X(6).
              03  SKT2640-G-TENSU PIC X(9).
            02  SKT2640-TOKUBETUKEN PIC X(3).
            02  SKT2640-TOKUBEUTTEN PIC X(9).
