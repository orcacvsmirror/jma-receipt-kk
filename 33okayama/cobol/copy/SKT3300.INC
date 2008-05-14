        01  SKT3300.
            02  SKT3300-SEIYM   PIC X(16).
            02  SKT3300-HOSPCD  PIC X(14).
            02  SKT3300-KAMOKU  PIC X(26).
            02  SKT3300-ADRS    PIC X(100).
            02  SKT3300-HOSPNAME    PIC X(100).
            02  SKT3300-KAISETUNAME PIC X(40).
            02  SKT3300-TEL PIC X(15).
            02  SKT3300-SEIKYUYMD   PIC X(22).
            02  SKT3300-SYUKEI-TBL      OCCURS  3 TIMES.
              03  SKT3300-NYUGAI-TBL      OCCURS  2 TIMES.
                04  SKT3300-HKN-TBL         OCCURS  4 TIMES.
                  05  SKT3300-KENSU   PIC X(5).
                  05  SKT3300-TENSU   PIC X(9).
              03  SKT3300-KINGK   PIC X(9).
              03  SKT3300-RKINGK  PIC X(9).
