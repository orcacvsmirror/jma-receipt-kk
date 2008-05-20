        01  SKT2800.
            02  SKT2800-SRYYM   PIC X(16).
            02  SKT2800-MARU1   PIC X(2).
            02  SKT2800-MARU2   PIC X(2).
            02  SKT2800-SRYKAMEI
                    PIC X(34)   OCCURS  3 TIMES.
            02  SKT2800-HOSPCD  PIC X(20).
            02  SKT2800-POST    PIC X(16).
            02  SKT2800-ADRS    PIC X(100).
            02  SKT2800-HOSPNAME    PIC X(100).
            02  SKT2800-KAISETUNAME PIC X(40).
            02  SKT2800-TEL PIC X(15).
            02  SKT2800-HOSPKBN
                    PIC X(2)    OCCURS  4 TIMES.
            02  SKT2800-KENSU-TBL       OCCURS  10 TIMES.
              03  SKT2800-KENSU   PIC X(12).
            02  SKT2800-TENSU-TBL       OCCURS  10 TIMES.
              03  SKT2800-TENSU   PIC X(18).
            02  SKT2800-SEIKYUSYO-TBL           OCCURS  6 TIMES.
              03  SKT2800-SEIKYUSYO   PIC X(6).
            02  SKT2800-SYAHOSEIKYU PIC X(6).
            02  SKT2800-KGIHKNJANAME-TBL        OCCURS  12 TIMES.
              03  SKT2800-KGIHKNJANAME    PIC X(20).
            02  SKT2800-KGIKOUKINAME-TBL        OCCURS  12 TIMES.
              03  SKT2800-KGIKOUKINAME    PIC X(20).
