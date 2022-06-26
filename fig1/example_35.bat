REM             GMT EXAMPLE xxxx
REM             2019-04-14 leiyang@fio.org.cn
REM Purpose:    Using grdmath to show the distance from GSHHG  coastline data
REM
gmt gmtset FORMAT_GEO_MAP = dddF MAP_FRAME_WIDTH=2p
gmt gmtset FONT_ANNOT_PRIMARY 7p,Helvetica,black FONT_LABEL 7p,Helvetica,black 

set ps=fig1.ps
rem gmt makecpt -Ccopper -T-0/50/1> t.cpt
rem gmt coast -Rd -JN12c -Bg -Dc -A10000 -Ggoldenrod -Ssnow2 --GMT_THEME=cookbook -pdf GMT_robinson
gmt pscoast -JN4.5i -Rd -Dc -A10000/0/1 -Ba --FONT_TITLE=10p -K  -W0.1p --MAP_ANNOT_OBLIQUE=45  > %ps%
rem gawk "$2>70 {print $1, $2, $3}" loc >test
rem pause
gawk "{print $1, $2, log($3)/log(10)/10}" loc | gmt psxy -R -J  -Sc -Gred -K -O -t55 >>%ps%
gawk "{print $2, $3, $4/2000}" loc_c | gmt psxy -R -J  -Sc -Gblue -O -t75 >>%ps%
rem gmt psxy -R -J ..\..\..\wet\fig\1\hy2.dat -W1p,red -O -K -t95 >>%ps% 
rem gmt psxy -R -J  153.txt -W1p,black -O -K >>%ps%
rem gmt psxy -R -J *_full.txt ..\zmw\362.txt -W1p,red -O -K >> %ps%

rem rem gmt psxy -R -J trc.dat -Sc0.05 -Gblack -O -K >>%ps%


rem gawk "{print $3, $4, 4, 0, 1, 1, $1}" yh_tide.txt2 >temp.d
rem gawk "{print $1, $2, 4, 0, 1, 1, $4}" gnss.txt >temp.d01
rem gmt psxy temp.d  -R  -J  -K -O  -Glightred -St0.05i  >>%ps%
rem gmt psxy temp.d01  -R  -J  -K -O  -Gblack -St0.07i  >>%ps% 
rem gawk "{print $1, $2, 4, 0, 1, 1, $4}" gnss2.txt | gmt psxy -R -J -O -Gred -Sc0.08i -K>>%ps%
rem echo 114.1479 21.99 0 1 1 Wanshan | gmt psxy -R -J -O -Gred -Sc0.08i -K>>%ps%
rem rem gmt psxy -R -J subset.d2 -Ss0.15 -GDEEPSKYBLUE1 -O -K>>%ps%
rem rem gmt psxy -R -J subset.d2 -Sc0.1 -Gred -O -K >>%ps%

rem rem gmt psxy -R -J gnss3.txt -Ss0.2 -Gred -O -K>>%ps%
rem rem gmt psxy -R -J gnss3.txt -Ss0.12 -Gblue -O -K >>%ps%

rem rem gmt pstext gnss3.txt -R -J -F+f7p,black+jTL -O -K -Gwhite -D0.2/0.1>> %ps%
rem gawk "{print $1, $2, $4}" gnss2.txt | gmt pstext -R -J -F+f7p,black+jTL -O -K -Gwhite -D0.2/0.1>> %ps%
rem echo 114.1479 21.99 Wanshan | gmt pstext -R -J -F+f7p,black+jTL -O -K -Gwhite -D0.2/0.1>> %ps%

rem gmt select -R100/140/15/45 0024_0319_full.txt | gmt mapproject -R -JM4.5i -Af   | gmt gmtmath STDIN -i2 -Sl MEAN 360 SUB 90 SUB NEG =
rem rem echo 123 44 P077 | gmt pstext -R -J -F+a53+f7p,black+jMC -O -K -Gwhite -D0./0.>> %ps%
rem echo 127 44 JaP153 | gmt pstext -R -J -F+a53+f7p,black+jMC -O -K -Gwhite -D0./0.>> %ps%
rem rem echo 117. 44 JaP138 | gmt pstext -R -J -F+a300+f7p,black+jMC -O -K -Gwhite -D0./0.>> %ps%
rem echo 119. 44 HY2P319 | gmt pstext -R -J -F+a103+f7p,black+jMC -O -K -Gwhite -D0./0.>> %ps%
rem echo 108.5 44 HY2P375 | gmt pstext -R -J -F+a103+f7p,black+jMC -O -K -Gwhite -D0./0.>> %ps%
rem echo 122 44 HY2P362 | gmt pstext -F+f7p,Helvetica,black+jMC+a74 -R -J -Wwhite -Gwhite -To -P -K -O  >> %ps%

rem rem echo 109.3 44 P164 | gmt pstext -R -J -F+a305+f7p,black+jMC -O -K -Gwhite -D0./0.>> %ps%

rem rem echo S 0.1i s 0.1c DEEPSKYBLUE1 1p,DEEPSKYBLUE1 0.3i CMONOC GNSS>le.d
rem echo S 0.1i t 0.1c lightred 1p,lightred 0.3i TIDE GAUGE >le.d
	
rem rem echo S 0.1i s 0.2c blue 0.7p,red 0.3i CAL CMONOC GNSS >le.d
rem echo S 0.1i t 0.1c black 1p,black 0.3i GNSS+TIDE GAUGE >>le.d
rem echo S 0.1i c 0.2c red 1.p,red 0.3i CAL site >>le.d
rem gmt pslegend -D+w1.4i+jBL+o3.0i/0.2i -R -J -O -F+p1p+gwhite --FONT_ANNOT_PRIMARY=7p le.d -K -O >> %ps%

rem REM gmt psxy -R -J coastal.txt -W0.4p,green -O >>%ps%

rem gmt pscoast -Rg -JG120/30/3.5c  -Dc -A5000 -Gpink -Swhite  -O -X0.3c -Y1c -K >> %ps%
rem echo 100 15 >tmp.d
rem echo 100 45 >>tmp.d
rem echo 130 45 >>tmp.d
rem echo 130 15 >>tmp.d
rem echo 100 15 >>tmp.d
rem gmt psxy tmp.d -W1p,red -R -J -O  >> %ps%

gmt psconvert %ps%  -A -P -Tg

rem del coastal.txt *.history *.d *.d2 out.* *.cpt temp.*
rem pause