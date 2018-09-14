p = 12
q = 26
r = 9

fastMA = exponentialAverage[p](close)
slowMA = exponentialAverage[q](close)

myMACD = fastMA - slowMA
line1 = exponentialAverage[r](myMACD)

hist= myMACD - line1

result = 0

IF hist > 0 and hist[1] > 0 and hist[2] > 0 then
if hist[2] > hist[1] and hist[0] > hist[1] then
result = 1
endif
endif

SCREENER[Result] (Result AS "enforced")
