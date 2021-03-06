//text color
// white = 255,255,255 ; black = 0,0,0
r = 0
g = 0
b = 0

atr = averagetruerange[10](close)*0.5

DojiSize = 0.05
data=(abs(open - close) <= (high - low) * DojiSize)
if data then
  if showText then
    DRAWTEXT("Doji", barindex, high+atr, Dialog, Standard, 12) COLOURED(R,G,B)
  endif
endif

data2=(close[2] > open[2] and min(open[1], close[1]) > close[2] and open < min(open[1], close[1]) and close < open )
if data2 then
  if showText then
    DRAWTEXT("Evening Star", barindex, high[1]+atr*1.5, Dialog, Standard, 12) COLOURED(255,0,10)
  endif
  DRAWARROWDOWN(barindex-1,high[1]) COLOURED(255,0,10)
endif

data3=(close[2] < open[2] and max(open[1], close[1]) < close[2] and open > max(open[1], close[1]) and close > open )
if data3 then
  if showText then
    DRAWTEXT("Morning Star", barindex, low[1]-atr*1.5, Dialog, Standard, 12) COLOURED(0,150,120)
  endif
  DRAWARROWUP(barindex-1,low[1]) COLOURED(0,150,120)
endif

data4=(open[1] < close[1] and open > close[1] and high - max(open, close) >= abs(open - close) * 3 and min(close, open) - low <= abs(open - close))
if data4 then
  if showText then
    DRAWTEXT("Shooting Star", barindex, high+atr*1.5, Dialog, Standard, 12) COLOURED(255,0,10)
  endif
  DRAWARROWDOWN(barindex,high) COLOURED(255,0,10)
endif

data5=(((high - low)>3*(open -close)) and  ((close - low)/(.001 + high - low) > 0.6) and ((open - low)/(.001 + high - low) > 0.6))
if data5 then
  if showText then
    DRAWTEXT("Hammer", barindex, high+atr, Dialog, Standard, 12) COLOURED(R,G,B)
  endif
endif

data5b=(((high - low)>3*(open -close)) and  ((high - close)/(.001 + high - low) > 0.6) and ((high - open)/(.001 + high - low) > 0.6))
if data5b then
  if showText then
    DRAWTEXT("Inverted Hammer", barindex, high+atr, Dialog, Standard, 12) COLOURED(R,G,B)
  endif
endif

data6=(close[1] > open[1] and open > close and open <= close[1] and open[1] <= close and open - close < close[1] - open[1] )
if data6 then
  if showText then
    DRAWTEXT("Bearish Harami", barindex, high+atr*1.5, Dialog, Standard, 12) COLOURED(255,0,10)
  endif
  DRAWARROWDOWN(barindex,high) COLOURED(255,0,10)
endif

data7=(open[1] > close[1] and close > open and close <= open[1] and close[1] <= open and close - open < open[1] - close[1] )
if data7 then
  if showText then
    DRAWTEXT("Bullish Harami", barindex, low-atr*1.5, Dialog, Standard, 12) COLOURED(0,150,120)
  endif
  DRAWARROWUP(barindex,low) COLOURED(0,150,120)
endif

data8=(close[1] > open[1] and open > close and open >= close[1] and open[1] >= close and open - close > close[1] - open[1] )
if data8 then
  if showText then
    DRAWTEXT("Bearish Engulfing", barindex, high+atr*1.5, Dialog, Standard, 12) COLOURED(255,0,10)
  endif
  DRAWARROWDOWN(barindex,high) COLOURED(255,0,10)
endif

data9=(open[1] > close[1] and close > open and close >= open[1] and close[1] >= open and close - open > open[1] - close[1] )
if data9 then
  if showText then
    DRAWTEXT("Bullish Engulfing", barindex, low-atr*1.5, Dialog, Standard, 12) COLOURED(0,150,120)
  endif
  DRAWARROWUP(barindex,low) COLOURED(0,150,120)
endif

data10=(close[1] < open[1] and  open < low[1] and close > close[1] + ((open[1] - close[1])/2) and close < open[1])
if data10 then
  if showText then
    DRAWTEXT("Piercing Line", barindex, low-atr*1.5, Dialog, Standard, 12) COLOURED(0,150,120)
  endif
  DRAWARROWUP(barindex,low) COLOURED(0,150,120)
endif

data14=(((high-low>4*(open-close))and((close-low)/(.001+high-low)>=0.75)and((open-low)/(.001+high-low)>=0.75)) and high[1] < open and high[2] < open)
if data14 then
  if showText then
    DRAWTEXT("Hanging Man", barindex, high+atr*1.5, Dialog, Standard, 12) COLOURED(255,0,10)
  endif
  DRAWARROWDOWN(barindex,high) COLOURED(255,0,10)
endif

data15=((close[1]>open[1])and(((close[1]+open[1])/2)>close)and(open>close)and(open>close[1])and(close>open[1])and((open-close)/(.001+(high-low))>0.6))
if data15 then
  if showText then
    DRAWTEXT("Dark Cloud Cover", barindex, high+atr*1.5, Dialog, Standard, 12) COLOURED(255,0,10)
  endif
  DRAWARROWDOWN(barindex,high) COLOURED(255,0,10)
endif

RETURN
