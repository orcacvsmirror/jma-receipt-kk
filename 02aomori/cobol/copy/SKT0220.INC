        01  SKT0220.
            02  SKT0220-SRYYM   PIC X(16).
            02  SKT0220-HKNJANAME   PIC X(26).
            02  SKT0220-HOSPCDN PIC X(40).
            02  SKT0220-SEIYMD  PIC X(22).
            02  SKT0220-ADRS    PIC X(100).
            02  SKT0220-HOSPNAME    PIC X(100).
            02  SKT0220-KAISETUNAME PIC X(40).
            02  SKT0220-TEL PIC X(15).
            02  SKT0220-NO  PIC X(4).
            02  SKT0220-KYURATE-TBL     OCCURS  2 TIMES.
              03  SKT0220-KYURATE PIC X(1).
            02  SKT0220-SEIKYU-TBL      OCCURS  12 TIMES.
              03  SKT0220-NYUGAI-TBL      OCCURS  2 TIMES.
                04  SKT0220-KENSU   PIC X(5).
                04  SKT0220-NISSU   PIC X(5).
                04  SKT0220-TENSU   PIC X(9).
                04  SKT0220-ITBFTN  PIC X(9).
              03  SKT0220-S-KENSU PIC X(5).
              03  SKT0220-S-NISSU PIC X(5).
              03  SKT0220-S-KINGAKU   PIC X(9).
              03  SKT0220-S-FTNGAKU   PIC X(9).
