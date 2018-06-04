REM This indicator will add a mark when adx line is turning

CDiPlusR = 255
CDiPlusG = 0
CDiPlusB = 0

threholdLow = 20
threholdHigh = 30

adxAvg = Average[avgDays](adx)

if(adx crosses over adxAvg and adxavg <= threholdLow) then
DRAWARROWUP(barindex[0],adxAvg - 2)coloured(55,40,40)
endif
if(adx crosses under adxAvg and adxavg >= threholdHigh) then
DRAWARROWDOWN(barindex[0],adxAvg + 2)coloured(255,40,40)
endif

return adxAvg COLOURED(CDiPlusR,CDiPlusG,CDiPlusB) as "adxAvg"
