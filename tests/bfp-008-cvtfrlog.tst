*Testcase bfp-008-cvtfrlog.tst:   CELFBR, CDLFBR, CXLFBR

#Testcase bfp-008-cvtfrlog.tst: IEEE Convert From Logical
#..Includes CONVERT FROM LOGICAL 32 (3).  Also tests traps and exceptions
#..and results from different rounding modes (CELFBR only).

sysclear
archmode esame

#
# Following suppresses logging of program checks.  This test program, as part
# of its normal operation, generates 2 program check messages that have no
# value in the validation process.  (The messages, not the program checks.)
#
ostailor quiet

loadcore "$(testpath)/bfp-008-cvtfrlog.core"

runtest 1.0

ostailor default   # restore messages for subsequent tests


# inputs converted to BFP short - result values
*Compare
r 1000.10
*Want "CELFBR result pairs 1-2" 3F800000 3F800000 40000000 40000000
r 1010.10
*Want "CELFBR result pairs 3-4" 40800000 40800000 4F800000 4F800000
r 1020.10
*Want "CELFBR result pairs 5-6" 4F7FFFFF 4F7FFFFF 4F800000 4F800000 

# inputs converted to BFP short - FPCR contents
*Compare
r 1100.10
*Want "CELFBR FPC pairs 1-2" 00000000 F8000000 00000000 F8000000
r 1110.10
*Want "CELFBR FPC pairs 3-4" 00000000 F8000000 00080000 F8000C00
r 1120.10
*Want "CELFBR FPC pairs 5-6" 00000000 F8000000 00080000 F8000C00


# inputs converted to BFP short - rounding mode test results
*Compare
r 1200.10
*Want "CELFBR maxint-32 result FPC modes 1-3, 7" 4F7FFFFF 4F800000 4F7FFFFF 4F7FFFFF
r 1210.10
*Want "CELFBR maxint-32 result M3 modes 1, 3-5"  4F800000 4F7FFFFF 4F800000 4F7FFFFF
r 1220.08
*Want "CELFBR maxint-32 result M3 modes 6, 7"    4F800000 4F7FFFFF

r 1230.10
*Want "CELFBR 0xFFFFFF00 result FPC modes 1-3, 7" 4F7FFFFF 4F7FFFFF 4F7FFFFF 4F7FFFFF
r 1240.10
*Want "CELFBR 0xFFFFFF00 result M3 modes 1, 3-5"  4F7FFFFF 4F7FFFFF 4F7FFFFF 4F7FFFFF 
r 1250.08
*Want "CELFBR 0xFFFFFF00 result M3 modes 6, 7"    4F7FFFFF 4F7FFFFF

r 1260.10
*Want "CELFBR 0xFFFFFF40 result FPC modes 1-3, 7" 4F7FFFFF 4F800000 4F7FFFFF 4F7FFFFF
r 1270.10
*Want "CELFBR 0xFFFFFF40 result M3 modes 1, 3-5"  4F800000 4F7FFFFF 4F800000 4F7FFFFF
r 1280.08
*Want "CELFBR 0xFFFFFF40 result M3 modes 6, 7"    4F800000 4F7FFFFF


# inputs converted to BFP short - rounding mode test FPCR contents
*Compare
r 1500.10
*Want "CELFBR maxint-32 FPC modes 1-3, 7 FPCR"  00000001 00000002 00000003 00000007
r 1510.10
*Want "CELFBR maxint-32 M3 modes 1, 3-5 FPCR"   00080000 00080000 00080000 00080000
r 1520.08
*Want "CELFBR maxint-32 M3 modes 5-7"           00080000 00080000

r 1530.10
*Want "CELFBR 0xFFFFFF00 FPC modes 1-3, 7 FPCR"  00000001 00000002 00000003 00000007
r 1540.10
*Want "CELFBR 0xFFFFFF00 M3 modes 1, 3-5 FPCR"   00000000 00000000 00000000 00000000
r 1550.08
*Want "CELFBR 0xFFFFFF00 M3 modes 6-7"           00000000 00000000

r 1560.10
*Want "CELFBR 0xFFFFFF40 FPC modes 1-3, 7 FPCR"  00000001 00000002 00000003 00000007
r 1570.10
*Want "CELFBR 0xFFFFFF40 M3 modes 1, 3-5 FPCR"   00080000 00080000 00080000 00080000
r 1580.08
*Want "CELFBR 0xFFFFFF40 M3 modes 6-7"           00080000 00080000


# inputs converted to BFP long - result values
*Compare
r 2000.10
*Want "CDLFBR result pair 1" 3FF00000 00000000 3FF00000 00000000
r 2010.10
*Want "CDLFBR result pair 2" 40000000 00000000 40000000 00000000 
r 2020.10
*Want "CDLFBR result pair 3" 40100000 00000000 40100000 00000000
r 2030.10
*Want "CDLFBR result pair 4" 41EFFFFF FFC00000 41EFFFFF FFC00000
r 2040.10
*Want "CDLFBR result pair 5" 41EFFFFF E0000000 41EFFFFF E0000000
r 2050.10
*Want "CDLFBR result pair 6" 41EFFFFF F0000000 41EFFFFF F0000000

# Inputs converted to BFP long - FPCR contents
*Compare
r 2100.10
*Want "CDLFBR FPC pairs 1-2" 00000000 F8000000 00000000 F8000000
r 2110.10
*Want "CDLFBR FPC pairs 3-4" 00000000 F8000000 00000000 F8000000
r 2120.10
*Want "CDLFBR FPC pairs 5-6" 00000000 F8000000 00000000 F8000000


# Inputs converted to BFP extended - result values
*Compare
r 3000.10
*Want "CXLFBR result 1a" 3FFF0000 00000000 00000000 00000000
r 3010.10
*Want "CXLFBR result 1b" 3FFF0000 00000000 00000000 00000000
r 3020.10
*Want "CXLFBR result 2a" 40000000 00000000 00000000 00000000
r 3030.10
*Want "CXLFBR result 2b" 40000000 00000000 00000000 00000000
r 3040.10
*Want "CXLFBR result 3a" 40010000 00000000 00000000 00000000
r 3050.10
*Want "CXLFBR result 3b" 40010000 00000000 00000000 00000000
r 3060.10
*Want "CXLFBR result 4a" 401EFFFF FFFC0000 00000000 00000000
r 3070.10
*Want "CXLFBR result 4b" 401EFFFF FFFC0000 00000000 00000000
r 3080.10
*Want "CXLFBR result 5a" 401EFFFF FE000000 00000000 00000000
r 3090.10
*Want "CXLFBR result 5b" 401EFFFF FE000000 00000000 00000000
r 30A0.10
*Want "CXLFBR result 6a" 401EFFFF FF000000 00000000 00000000
r 30B0.10
*Want "CXLFBR result 6b" 401EFFFF FF000000 00000000 00000000

# Inputs converted to BFP extended - FPCR contents
*Compare
r 3200.10
*Want "CXLFBR FPC pairs 1-2" 00000000 F8000000 00000000 F8000000
r 3210.10
*Want "CXLFBR FPC pairs 3-4" 00000000 F8000000 00000000 F8000000
r 3220.10
*Want "CXLFBR FPC pairs 5-6" 00000000 F8000000 00000000 F8000000


*Done

