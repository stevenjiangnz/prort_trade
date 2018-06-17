rem this is to indicator the re-enforce
r = 9
q = 26
p = 12


fastMA = exponentialAverage[p](close)
slowMA = exponentialAverage[q](close)

myMACD = fastMA - slowMA
line1 = exponentialAverage[r](myMACD)
hist = myMACD - line1
if (myMACd > 0 and line1 >0) and (hist < 0) and (ABS(hist[2]) < abs(hist[1]) and abs(hist[1]) > abs(hist)) then
DRAWARROWUP(barindex[0],hist )coloured(200,0,200)
endif

RETURN hist AS "MACD Histogram", myMACD coloured (0,0,120), line1 coloured(220,0,0)