
gmt gmtset FORMAT_GEO_MAP = dddF MAP_FRAME_WIDTH=2p
gmt gmtset FONT_ANNOT_PRIMARY 7p,Helvetica,black FONT_LABEL 7p,Helvetica,black 

set ps=3d.ps
gmt pscoast -JQ0/37.5/10c -R-180/180/-90/90 -Dc -A10000/0/1 -Sazure2 -Gwheat -Bxa60 -Bya30 --FONT_TITLE=10p -K  --MAP_ANNOT_OBLIQUE=45 -p200/30 > %ps%
gawk "NF>1 {print $1, $2, $3}" loc | gmt psxyz  -R-180/180/-90/90/0/1000 -J -JZ1.5i -So0.1c -Gred -O -K -p -Bza200+l"Publication numbers by affiliation" -BWSneZ -t20 >>%ps%

gmt pscoast -JQ0/37.5/10c -R-180/180/-90/90 -Dc -A10000/0/1 -Sazure2 -Gwheat -Bxa60 -Bya30 --FONT_TITLE=10p -K -O --MAP_ANNOT_OBLIQUE=45 -p200/30 -Y6c >> %ps%
gawk "{print $2, $3, $4}" loc_c | gmt psxyz -R-180/180/-90/90/0/3200 -J -JZ1.5i -So0.2c -Gblue -Bza500+l"Publication numbers by country/region" -BWSneZ -O  -p -hi1 >>%ps%
gmt psconvert %ps%  -A -P -Tf

pause
