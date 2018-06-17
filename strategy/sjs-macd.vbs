DEFPARAM CumulateOrders = false

p=12
q=26
r=9

mLine = MACDLINE[p,q,r](close)
sLine =exponentialaverage[r](mLine)

ma= Average[20](close)
buy1 = mLine < sLine and mline[2] > mline[1] and mline[1] < mline
buy2 = ma > ma[1] and mline < 0
sell1 = mLine > sLine and mline[2] < mline[1] and mline[1] > mline
sell2 = close > BollingerUp[20](close) - (BollingerBandWidth[20](close)* 0)

// Conditions to enter long positions
IF not LongOnMarket and buy1 and buy2 THEN
BUY 9500 cash AT MARKET
ENDIF

// Conditions to exit long positions
If LongOnMarket AND (sell1 or sell2) THEN
SELL AT MARKET
ENDIF

SET STOP %LOSS 3
//
//// Conditions to enter short positions
//IF NOT ShortOnMarket AND YourConditions THEN
//SELLSHORT 1 CONTRACTS AT MARKET
//ENDIF
//
//// Conditions to exit short positions
//IF ShortOnMarket AND YourConditions THEN
//EXITSHORT AT MARKET
//ENDIF
//
//// Stops and targets : Enter your protection stops and profit targets here
//
