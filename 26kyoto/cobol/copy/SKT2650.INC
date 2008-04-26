        01  SKT2650.
            02  SKT2650-SRYYM   PIC X(16).
            02  SKT2650-SRYKA   PIC X(20).
            02  SKT2650-POST    PIC X(8).
            02  SKT2650-ADRS    PIC X(100).
            02  SKT2650-HOSPNAME    PIC X(100).
            02  SKT2650-KAISETUNAME PIC X(40).
            02  SKT2650-TEL PIC X(15).
            02  SKT2650-HOSPCDN PIC X(7).
            02  SKT2650-SEIKYU-TBL      OCCURS  11 TIMES.
              03  SKT2650-NYUGAI-TBL      OCCURS  2 TIMES.
                04  SKT2650-KENSU   PIC X(6).
                04  SKT2650-TENSU   PIC X(9).
                04  SKT2650-ITBFTN  PIC X(9).
                04  SKT2650-TYOKI   PIC X(2).
                04  SKT2650-GENBAKU PIC X(2).
                04  SKT2650-NISSU   PIC X(3).
                04  SKT2650-S-KENSU PIC X(6).
                04  SKT2650-S-KINGAKU   PIC X(9).
                04  SKT2650-S-FTNGAKU   PIC X(9).
            02  SKT2650-GENMEN-TBL      OCCURS  2 TIMES.
              03  SKT2650-G-KESNU PIC X(6).
              03  SKT2650-G-TENSU PIC X(9).
            02  SKT2650-TOKUBETUKEN PIC X(3).
            02  SKT2650-TOKUBETUTEN PIC X(9).
