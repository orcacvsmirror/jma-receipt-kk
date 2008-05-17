        01  SKT2020.
            02  SKT2020-SRYYM   PIC X(16).
            02  SKT2020-HKNJANAME   PIC X(20).
            02  SKT2020-SEIYMD  PIC X(22).
            02  SKT2020-ADRS    PIC X(100).
            02  SKT2020-HOSPNAME    PIC X(100).
            02  SKT2020-KAISETUNAME PIC X(80).
            02  SKT2020-TEL PIC X(15).
            02  SKT2020-HKNJANUM    PIC X(12).
            02  SKT2020-HOSPCD  PIC X(14).
            02  SKT2020-ZAI1    PIC X(2).
            02  SKT2020-ZAI2    PIC X(2).
            02  SKT2020-NO  PIC X(4).
            02  SKT2020-SEIKYU-TBL      OCCURS  7 TIMES.
              03  SKT2020-NYUGAI-TBL      OCCURS  2 TIMES.
                04  SKT2020-KENSU   PIC X(8).
                04  SKT2020-NISSU   PIC X(8).
                04  SKT2020-TENSU   PIC X(18).
                04  SKT2020-ITBFTN  PIC X(16).
              03  SKT2020-SKENSU  PIC X(8).
              03  SKT2020-SNISSU  PIC X(8).
              03  SKT2020-SKINGK  PIC X(18).
              03  SKT2020-SFTNGK  PIC X(18).
