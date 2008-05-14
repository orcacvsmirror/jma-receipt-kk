        01  SKT0200.
            02  SKT0200-SRYYM   PIC X(16).
            02  SKT0200-HOSPCDN PIC X(40).
            02  SKT0200-ADRS    PIC X(100).
            02  SKT0200-HOSPNAME    PIC X(100).
            02  SKT0200-KAISETUNAME PIC X(40).
            02  SKT0200-TEL PIC X(15).
            02  SKT0200-SEIKYU-TBL      OCCURS  13 TIMES.
              03  SKT0200-NYUGAI-TBL      OCCURS  2 TIMES.
                04  SKT0200-KENSU   PIC X(5).
                04  SKT0200-NISSU   PIC X(5).
                04  SKT0200-TENSU   PIC X(9).
                04  SKT0200-ITBFTN  PIC X(9).
              03  SKT0200-S-KENSU PIC X(5).
              03  SKT0200-S-NISSU PIC X(5).
              03  SKT0200-S-KINGAKU   PIC X(9).
              03  SKT0200-S-FTNGAKU   PIC X(9).
