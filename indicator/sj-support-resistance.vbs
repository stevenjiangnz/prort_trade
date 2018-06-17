//LEO MOVING AVERAGE

//Formula: LMA=WMA+(WMA-SMA)
LMA=2*weightedaverage[period](close)-average[period](close)


//supports and resistances
once support=low
once resistance=high

smoothLMA=weightedaverage[period](LMA)

IF LMA crosses over smoothLMA THEN
 support=lowest[period](low)
ENDIF

IF LMA crosses under smoothLMA THEN
 resistance=highest[period](high)
ENDIF

support=min(low,support)
resistance=max(high,resistance)


RETURN support as "support", resistance as "resistance"