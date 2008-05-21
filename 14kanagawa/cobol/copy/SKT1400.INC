        01  SKT1400.
            02  SKT1400-SEIYM   PIC X(16).
            02  SKT1400-HOSPNAME    PIC X(100).
            02  SKT1400-HOSPCD  PIC X(20).
            02  SKT1400-HKNJASU PIC X(5).
            02  SKT1400-SEIKYU          OCCURS  7 TIMES.
              03  SKT1400-KENSU   PIC X(7).
              03  SKT1400-TENSU   PIC X(14).
            02  SKT1400-UKETUKE-SU  PIC X(7).
