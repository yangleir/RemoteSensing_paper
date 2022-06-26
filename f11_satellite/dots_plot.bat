REM             GMT EXAMPLE xxxx
gmt gmtset FORMAT_GEO_MAP = dddF MAP_FRAME_WIDTH=2p 
gmt gmtset FONT_ANNOT_PRIMARY 7p,Helvetica,black FONT_LABEL 14p,Helvetica,black 
gmt gmtset MAP_LABEL_OFFSET 0 
rem FONT_LABEL 3p,4,black MAP_FRAME_PEN thinner,black
rem --MAP_FRAME_PEN=thinner,black --MAP_TICK_LENGTH_PRIMARY=-2p --FONT_ANNOT_PRIMARY=3p --FONT_LABEL=3p,4,black
set ps=fig1.ps

gmt psbasemap -R1970/2022/-1/15 -BwSen -By+l"Paper numbers" -Bx+lyear -Bxa -JX7i/4i -K  --MAP_GRID_PEN_PRIMARY=0.01p,0/0/0,2_1_0.25_1:0 >%ps%
gawk "NR>1 {print $1,0, $2/200}" ./data/skylab.txt  | gmt psxy -R -BWN -J -Sc -Gred -O -K  >>%ps%
gawk "NR>1 {print $1,1, $2/200}" ./data/geos.txt  | gmt psxy -R  -J -Sc -Gred -O -K  >>%ps%

gawk "NR>1 {print $1,2, $2/200}" ./data/seasat.txt  | gmt psxy -R -J -Sc -Gred -O -K  >>%ps%
gawk "NR>1 {print $1,3, $2/200}" ./data/geosat.txt  | gmt psxy -R -J -Sc -Gred -O -K  >>%ps%
gawk "NR>1 {print $1,4, $2/200}" ./data/ers.txt  | gmt psxy -R -J -Sc -Gred -O -K  >>%ps%
gawk "NR>1 {print $1,5, $2/200}" ./data/tp.txt  | gmt psxy -R -J -Sc -Gred -O -K  >>%ps%
gawk "NR>1 {print $1,6, $2/200}" ./data/icesat.txt  | gmt psxy -R -J -Sc -Gred -O -K  >>%ps%
gawk "NR>1 {print $1,7, $2/200}" ./data/jason.txt  | gmt psxy -R -J -Sc -Gred -O -K  >>%ps%
gawk "NR>1 {print $1,8, $2/200}" ./data/ENVISAT.txt  | gmt psxy -R -J -Sc -Gred -O -K  >>%ps%
gawk "NR>1 {print $1,9, $2/200}" ./data/cryosat.txt  | gmt psxy -R -J -Sc -Gred -O -K  >>%ps%
gawk "NR>1 {print $1,10, $2/200}" ./data/hy.txt  | gmt psxy -R -J -Sc -Gred -O -K  >>%ps%
gawk "NR>1 {print $1,11, $2/200}" ./data/saral.txt  | gmt psxy -R -J -Sc -Gred -O -K  >>%ps%
gawk "NR>1 {print $1,12, $2/200}" ./data/sentinel.txt  | gmt psxy -R -J -Sc -Gred -O -K  >>%ps%
gawk "NR>1 {print $1,13, $2/200}" ./data/swot.txt  | gmt psxy -R -J -Sc -Gred -O -K  >>%ps%

echo 2022 0 Skylab | gmt pstext -F+f10p,Helvetica,black+jML  -R1970/2027/-1/15 -JX7.5i/4i -Wwhite -K -O -X0.5c>> %ps%
echo 2022 1 GEOS | gmt pstext -F+f10p,Helvetica,black+jML  -R -J -Wwhite -K -O >> %ps%
echo 2022 2 Seasat | gmt pstext -F+f10p,Helvetica,black+jML  -R -J -Wwhite -K -O >> %ps%
echo 2022 3 Geosat | gmt pstext -F+f10p,Helvetica,black+jML  -R -J -Wwhite -K -O >> %ps%
echo 2022 4 ERS | gmt pstext -F+f10p,Helvetica,black+jML  -R -J -Wwhite -K -O >> %ps%
echo 2022 5 T/P | gmt pstext -F+f10p,Helvetica,black+jML  -R -J -Wwhite -K -O >> %ps%
echo 2022 6 ICESAT | gmt pstext -F+f10p,Helvetica,black+jML  -R -J -Wwhite -K -O >> %ps%
echo 2022 7 Jason | gmt pstext -F+f10p,Helvetica,black+jML  -R -J -Wwhite -K -O >> %ps%
echo 2022 8 ENVISAT | gmt pstext -F+f10p,Helvetica,black+jML  -R -J -Wwhite -K -O >> %ps%
echo 2022 9 cryosat | gmt pstext -F+f10p,Helvetica,black+jML  -R -J -Wwhite -K -O >> %ps%
echo 2022 10 HY-2 | gmt pstext -F+f10p,Helvetica,black+jML  -R -J -Wwhite -K -O >> %ps%
echo 2022 11 Saral | gmt pstext -F+f10p,Helvetica,black+jML  -R -J -Wwhite -K -O >> %ps%
echo 2022 12 Sentinel | gmt pstext -F+f10p,Helvetica,black+jML  -R -J -Wwhite -K -O >> %ps%
echo 2022 13 SWOT | gmt pstext -F+f10p,Helvetica,black+jML  -R -J -Wwhite -K -O >> %ps%


echo 1975 14 0.5 | gmt psxy -R -J -Sc -Gred -O -K >>%ps%
echo 1976 14 100 per year | gmt pstext -F+f10p,Helvetica,black+jML  -R -J -Wwhite -K -O >> %ps%

rem pause
rem echo N 1 >le.d
rem echo S 0.5c c 0.3c - 1p,red 0.3c "100/year" >>le.d
rem rem echo S 0.1c - 0.3c - 1p,red 0.3c CN >>le.d
rem gmt pslegend -D+w0.6c+jBL+o.1c/0.7c -R -J -O  --FONT_ANNOT_PRIMARY=2p le.d  >> %ps%

gmt psconvert %ps%  -A -P -Tf
