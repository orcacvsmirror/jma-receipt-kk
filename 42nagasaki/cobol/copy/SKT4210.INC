        01  SKT4210.
            02  SKT4210-SRYYM   PIC X(16).
            02  SKT4210-SEIYMD  PIC X(22).
            02  SKT4210-ADRS    PIC X(100).
            02  SKT4210-HOSPNAME    PIC X(100).
            02  SKT4210-KAISETUNAME PIC X(40).
            02  SKT4210-TEL PIC X(15).
            02  SKT4210-HOSPCD  PIC X(7).
            02  SKT4210-HKNJANUM    PIC X(6).
            02  SKT4210-HKNJANAME   PIC X(20).
            02  SKT4210-ZAI1    PIC X(2).
            02  SKT4210-ZAI2    PIC X(2).
            02  SKT4210-TYOKI1  PIC X(2).
            02  SKT4210-TYOKI2  PIC X(2).
            02  SKT4210-KYURATE PIC X(3).
            02  SKT4210-NO  PIC X(4).
            02  SKT4210-SEIKYU-TBL      OCCURS  11 TIMES.
              03  SKT4210-NYUGAI-TBL      OCCURS  2 TIMES.
                04  SKT4210-KENSU   PIC X(5).
                04  SKT4210-NISSU   PIC X(5).
                04  SKT4210-TENSU   PIC X(9).
                04  SKT4210-ITBFTN  PIC X(9).
              03  SKT4210-SKENSU  PIC X(5).
              03  SKT4210-SNISSU  PIC X(5).
              03  SKT4210-SKINGK  PIC X(9).
              03  SKT4210-SFTNGK  PIC X(9).
            02  SKT4210-KOH-TBL         OCCURS  3 TIMES.
              03  SKT4210-KOHNAME PIC X(8).
              03  SKT4210-KOHNUM  PIC X(2).
              03  SKT4210-KNYUGAI-TBL     OCCURS  2 TIMES.
                04  SKT4210-KKENSU  PIC X(5).
                04  SKT4210-KNISSU  PIC X(5).
                04  SKT4210-KTENSU  PIC X(9).
                04  SKT4210-KITBFTN PIC X(9).
              03  SKT4210-KSKENSU PIC X(5).
              03  SKT4210-KSNISSU PIC X(5).
              03  SKT4210-KSKINGK PIC X(9).
              03  SKT4210-KSFTNGK PIC X(9).
