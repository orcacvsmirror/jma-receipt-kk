        01  SKT3620.
            02  SKT3620-SRYYM   PIC X(16).
            02  SKT3620-SEIYMD  PIC X(22).
            02  SKT3620-HOSPCDN PIC X(20).
            02  SKT3620-HKNJANUM    PIC X(12).
            02  SKT3620-KYURATE
                    PIC X(2)    OCCURS  4 TIMES.
            02  SKT3620-ADRS    PIC X(100).
            02  SKT3620-HOSPNAME    PIC X(100).
            02  SKT3620-TEL PIC X(15).
            02  SKT3620-KAISETUNAME PIC X(40).
            02  SKT3620-ZAI1    PIC X(2).
            02  SKT3620-ZAI2    PIC X(2).
            02  SKT3620-NO  PIC X(4).
            02  SKT3620-SEIKYU          OCCURS  9 TIMES.
              03  SKT3620-NYUGAIKBN       OCCURS  2 TIMES.
                04  SKT3620-KENSU   PIC X(5).
                04  SKT3620-NISSU   PIC X(5).
                04  SKT3620-TENSU   PIC X(9).
                04  SKT3620-ITBFTN  PIC X(9).
              03  SKT3620-SKENSU PIC X(5).
              03  SKT3620-SNISSU PIC X(5).
              03  SKT3620-SKINGK PIC X(9).
              03  SKT3620-SFTNGK PIC X(9).
