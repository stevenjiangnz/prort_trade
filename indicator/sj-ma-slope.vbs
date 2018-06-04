// ------------------------------
// Moving Average Slope
// Author: Maz @ prorealcode.com
// ------------------------------

// maPeriod = 200 // Moving Average Period
// maType   = 1   // Moving Average function - 1: exponential

ma = average[maPeriod, maType](customClose)
slope = ma - ma[1]

// -- Colour management -----
if slope > 0 then
if slope > slope[1] then
g = 255
r = 0
elsif slope < slope[1] then
g = 200
r = 0
endif
elsif slope < 0 then
if slope < slope[1] then
r = 255
g = 0
elsif slope > slope[1] then
r = 200
g = 0
endif
endif

return slope coloured(r, g, 10) style(histogram, 1) as "Moving Average Slope"
