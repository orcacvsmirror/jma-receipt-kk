        01  SKT2000.
            02  SKT2000-SRYYM   PIC X(16).
            02  SKT2000-SEIKYU-TBL      OCCURS  32 TIMES.
              03  SKT2000-HKNJANAME   PIC X(20).
              03  SKT2000-KENSU   PIC X(5).
            02  SKT2000-SKENSU  PIC X(6).
            02  SKT2000-GKENSU  PIC X(6).
            02  SKT2000-KOUREI-TBL      OCCURS  10 TIMES.
              03  SKT2000-KHKNJANAME  PIC X(20).
              03  SKT2000-KKENSU  PIC X(5).
            02  SKT2000-KSKENSU PIC X(6).
            02  SKT2000-KGKENSU PIC X(6).
            02  SKT2000-TOKUBETU    PIC X(5).
            02  SKT2000-HKNJASU PIC X(3).
            02  SKT2000-TENHYO-TBL      OCCURS  3 TIMES.
              03  SKT2000-TENHYOKBN   PIC X(2).
            02  SKT2000-HOSPCD  PIC X(14).
            02  SKT2000-SRYKA
                    PIC X(20)   OCCURS  3 TIMES.
            02  SKT2000-ADRS    PIC X(100).
            02  SKT2000-HOSPNAME    PIC X(100).
            02  SKT2000-KAISETUNAME PIC X(80).
            02  SKT2000-TYOKI
                    PIC X(7)    OCCURS  32 TIMES.
            02  SKT2000-STYOKI  PIC X(8).
            02  SKT2000-GTYOKI  PIC X(8).
