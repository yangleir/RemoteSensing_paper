REM             GMT EXAMPLE xxxx
REM             2019-04-14 leiyang@fio.org.cn
REM
gmt gmtset FORMAT_GEO_MAP = dddF MAP_FRAME_WIDTH=2p
gmt gmtset FONT_ANNOT_PRIMARY 7p,Helvetica,black FONT_LABEL 7p,Helvetica,black 

set ps=fig1.ps
gmt pscoast -JN4.5i -Rd -Dc -A10000/0/1 -Ba --FONT_TITLE=10p -K  -W0.1p --MAP_ANNOT_OBLIQUE=45  > %ps%
gawk "{print $1, $2, log($3)/log(10)/10}" loc | gmt psxy -R -J  -Sc -Gred -K -O -t55 >>%ps%
gawk "{print $2, $3, $4/2000}" loc_c | gmt psxy -R -J  -Sc -Gblue -O -t75 >>%ps%

gmt psconvert %ps%  -A -P -Tg

