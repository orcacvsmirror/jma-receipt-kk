        01  SKT0100.
            02  SKT0100-SEIYMD  PIC X(22).
            02  SKT0100-HOSPCD  PIC X(7).
            02  SKT0100-ADRS    PIC X(100).
            02  SKT0100-HOSPNAME    PIC X(100).
            02  SKT0100-ZAI1    PIC X(2).
            02  SKT0100-ZAI2    PIC X(2).
            02  SKT0100-HKN-TBL         OCCURS  2 TIMES.
              03  SKT0100-MAISU   PIC X(5).
              03  SKT0100-NYUGAI-TBL      OCCURS  2 TIMES.
                04  SKT0100-KENSU   PIC X(5).
                04  SKT0100-TENSU   PIC X(14).
            02  SKT0100-ETC-TBL         OCCURS  2 TIMES.
              03  SKT0100-ETC-KENSU   PIC X(5).
              03  SKT0100-ETC-TENSU   PIC X(14).
            02  SKT0100-FUKUSI-TBL      OCCURS  2 TIMES.
              03  SKT0100-F-KENSU
                      PIC X(5)    OCCURS  4 TIMES.
              03  SKT0100-F-TENSU
                      PIC X(11)   OCCURS  4 TIMES.
