REM This indicator will add a mark when adx line is turning

CDiPlusR = 255
CDiPlusG = 0
CDiPlusB = 0
filter = 0.2
adx1 = adx[14][1] 
adx2 = adx[14][2]

if(adx < 25) then 
if (DIplus[14](close) > DIminus[14](close)) then
if(adx crosses over DIminus[14](close)) and adx > adx1 then
DRAWARROWUP(barindex[0],adx - 2)coloured(0,0,200)
endif
endif

if (DIplus[14](close) < DIminus[14](close)) then
if(adx crosses over DIplus[14](close)) and adx > adx1 then
DRAWARROWUP(barindex[0],adx - 2)coloured(CDiPlusR,CDiPlusG,CDiPlusB)
endif
endif

if (adx2 >= (adx1 + filter) and adx >= (adx1 + filter)) then
DRAWARROWUP(barindex[0],adx - 2)coloured(200,0,200)
endif
endif
return adx COLOURED(CDiPlusR,CDiPlusG,CDiPlusB) as "adx"
