//Reglas en Heikin-Ashi:
//1- Secuencia de cuerpos blancos = tendencia alcista.
//   Secuencia de cuerpos negros = tendencia bajista.
//2- Tendencia alcista fuerte = Grandes cuerpos blancos y sin sombras inferiores.
//   Tendencia bajista fuerte = Grandes cuerpos negros sin sombras superiores.
//3- Cuando la tendencia se debilita surgen cuerpos pequeños con posibles sombras superior y/o inferior.
//4- Una consolidación se da cuando aparecen cuerpos pequeños con ambas sombras tanto arriba como abajo.
//5- La reversión de una tendencia se puede sospechar con la aparición de pequeños cuerpos con sombras largas tanto superiores como inferiores, o un cambio repentino de color.

//    parámetros
//ONCE SmoothPeriod=2      valor por defecto
//ONCE period=5            valor por defecto
ONCE flecha=0
ONCE Dflech=barindex
//    ciclo normal
IF BarIndex=0 THEN
xClose = (open+high+low+close)/4
xOpen = open
xHigh = high
xLow = low
ELSE
xClose = (open+high+low+close)/4
xOpen = (xOpen[1]+xClose[1])/2
xHigh = Max(max(high, xOpen), xClose)
xLow = Min(min(Low, xOpen), xClose)
endif
//  SUAVIZADO con la media de 2 en las velas
if barindex>=(period+SmoothPeriod) then
AvOpen=exponentialAverage[SmoothPeriod](xOpen)
AvHigh=exponentialAverage[SmoothPeriod](xHigh)
AvLow=exponentialAverage[SmoothPeriod](xLow)
Avclose=exponentialAverage[SmoothPeriod](xClose)
endif
//    y ésta es la que uso
DRAWCANDLE(AvOpen, AvHigh, AvLow, AvClose)
//ha7  para indicar cruces
//   los valores para barindex<2 son especiales
If Barindex < SmoothPeriod then
Opcl=Open[1]
else
Opcl=Open
ENDIF
//    calculo dos medias de 7 y de 10
Media7 = Average[7](Opcl)
Media10 = Average[10](Opcl)
rango= Media7/10
//   uso rango para el dibujo
Alcista = AvOPen<AvClose
Alcista1 = AvOpen[1]<AvClose[1]
Bajista = AvOpen>AvClose
Bajista1 = AvOpen[1]>AvClose[1]
//Doji = Range[1] > ABS(AvOpen[1]-AvClose[1])*5
//no puede haber dos operaciones en dos dias
//valor representa mi compra cuando estoy dentro
//  y el precio de venta cuando me salgo
IF Dflech < barindex[2] then
IF (Opcl>Media7 or Opcl>Media10) and not (Bajista and Bajista1) and flecha<1 then
//  uso Range para que salgan visibles las flechas
DRAWARROWUP (barindex, AvHigh+Range) COLOURED (0, 0, 255)
flecha=1
Dflech = barindex
valor = AvClose
ELSIF (Opcl<Media7 or Opcl<Media10) and not (Alcista and Alcista1) and flecha>=1 then
DRAWARROWDOWN (barindex, AvHigh+Range) COLOURED (255, 0, 0)
flecha=-1
Dflech = barindex
valor = AvClose
ENDIF
ENDIF

RETURN Media7 COLOURED (0,0,255), Opcl-rango COLOURED(0,0,0) as "op-cl", Media7-rango coloured (0,0,255) as "media7", Media10-rango coloured(250,0,250) as "media10", valor COLOURED (255,0,0) as "valor"
