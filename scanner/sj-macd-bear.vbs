p = 12
q = 26
r = 9

fastMA = exponentialAverage[p](close)
slowMA = exponentialAverage[q](close)

myMACD = fastMA - slowMA
line1 = exponentialAverage[r](myMACD)

hist= myMACD - line1

result = 0

if (myMACd < 0 or line1 <0) and (hist[2] < hist[1] and hist[1] > hist) then
result = 1
endif

SCREENER[Result] (Result AS "enforced")
