        01  SKT3200.
            02  SKT3200-PRTYM   PIC X(16).
            02  SKT3200-HOSPCD  PIC X(7).
            02  SKT3200-HOSPNAME    PIC X(100).
            02  SKT3200-IKENSU
                    PIC X(5)    OCCURS  36 TIMES.
            02  SKT3200-TKENSU
                    PIC X(5)    OCCURS  36 TIMES.
            02  SKT3200-RKENSU
                    PIC X(5)    OCCURS  36 TIMES.
            02  SKT3200-KNKENSU PIC X(7).
            02  SKT3200-KGKENSU PIC X(7).
            02  SKT3200-FKKENSU PIC X(7).
            02  SKT3200-FRKENSU PIC X(7).
            02  SKT3200-NYKENSU PIC X(7).
            02  SKT3200-HKNJANAME
                    PIC X(10)   OCCURS  10 TIMES.
            02  SKT3200-KOUKI           OCCURS  13 TIMES.
              03  SKT3200-KOU-KEN PIC X(10).
              03  SKT3200-KOU-KENSU   PIC X(5).
            02  SKT3200-KOUKENSU    PIC X(7).
