        01  SKT4000.
            02  SKT4000-SRYM    PIC X(6).
            02  SKT4000-SRYKA
                    PIC X(20)   OCCURS  3 TIMES.
            02  SKT4000-POST    PIC X(7).
            02  SKT4000-ADRS    PIC X(100).
            02  SKT4000-TEL PIC X(15).
            02  SKT4000-HOSPNAME    PIC X(100).
            02  SKT4000-KANRINAME   PIC X(40).
            02  SKT4000-HOSPCD  PIC X(20).
            02  SKT4000-SEIKYU          OCCURS  8 TIMES.
              03  SKT4000-HKNJANUM    PIC X(12).
              03  SKT4000-KO-HKNJANUM PIC X(16).
              03  SKT4000-NYUGAIKBN       OCCURS  2 TIMES.
                04  SKT4000-KKH-KENSU   PIC X(5).
                04  SKT4000-KKH-TENSU   PIC X(9).
                04  SKT4000-TAK-KENSU   PIC X(5).
                04  SKT4000-TAK-TENSU   PIC X(9).
                04  SKT4000-RJN-KENSU   PIC X(5).
                04  SKT4000-RJN-TENSU   PIC X(9).
                04  SKT4000-KO-KENSU    PIC X(5).
                04  SKT4000-KO-TENSU    PIC X(9).
            02  SKT4000-SSEIKYU         OCCURS  2 TIMES.
              03  SKT4000-KKH-SKENSU  PIC X(5).
              03  SKT4000-KKH-STENSU  PIC X(9).
              03  SKT4000-TAK-SKENSU  PIC X(5).
              03  SKT4000-TAK-STENSU  PIC X(9).
              03  SKT4000-RJN-SKENSU  PIC X(5).
              03  SKT4000-RJN-STENSU  PIC X(9).
              03  SKT4000-KO-SKENSU   PIC X(5).
              03  SKT4000-KO-STENSU   PIC X(9).
            02  SKT4000-SUM.
              03  SKT4000-N-GKENSU    PIC X(5).
              03  SKT4000-N-GTENSU    PIC X(9).
              03  SKT4000-N-AVG   PIC X(9).
              03  SKT4000-G-GKENSU    PIC X(5).
              03  SKT4000-G-GTENSU    PIC X(9).
              03  SKT4000-G-AVG   PIC X(9).
              03  SKT4000-N-SGKENSU   PIC X(5).
              03  SKT4000-N-SGTENSU   PIC X(9).
              03  SKT4000-G-SGKENSU   PIC X(5).
              03  SKT4000-G-SGTENSU   PIC X(9).
              03  SKT4000-KOH-GKENSU  PIC X(5).
              03  SKT4000-KOH-GTENSU  PIC X(9).
