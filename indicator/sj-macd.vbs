REM This example computes the MACD indicator
hist = MACD[12,26,9](close)
si = MACDline[12,26,9](close)

ma=  si - hist
RETURN ma as "macd", hist as "hist", si as "signal"