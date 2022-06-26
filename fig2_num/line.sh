# GMT EXAMPLE xxxx
gmt gmtset FORMAT_GEO_MAP = dddF MAP_FRAME_WIDTH=2p 
gmt gmtset FONT_ANNOT_PRIMARY 10p,Helvetica,black FONT_LABEL 10p,Helvetica,black 
gmt gmtset MAP_LABEL_OFFSET 30p  MAP_TICK_LENGTH_PRIMARY -2p

ps=fig2.ps

gmt psbasemap -R1970/2022/-10/800 -Ba  -BWS+glightblue -JX4i/3i -K   >$ps
awk 'NR>1 {print $1, $2}' ./cn/allyear.txt  | sort|gmt psxy -R -Bx+lyear -By+l'Global paper numbers' -BWnS -J -W2p,black -O -K  >>$ps

echo 1992 -10 >tmp
echo 1992 100 >>tmp
gmt psxy tmp -R -J -W5p,gray -O -K -t50 >>$ps
echo 2001 -10 >tmp
echo 2001 200 >>tmp
gmt psxy tmp -R -J -W5p,gray -O -K -t50 >>$ps
echo 2008 -10 >tmp
echo 2008 300 >>tmp
gmt psxy tmp -R -J -W5p,gray -O -K -t50 >>$ps

echo 2016 -10 >tmp
echo 2016 500 >>tmp
gmt psxy tmp -R -J -W5p,gray -O -K -t50 >>$ps
echo 2016 10 Ja-3| gmt pstext -F+f10p,Helvetica,black+jML -R -J -Wwhite -To -P -K -O >> $ps

echo 2008 10 Ja-2| gmt pstext -F+f10p,Helvetica,black+jML -R -J -Wwhite -To -P -K -O >> $ps
echo 2001 10 Ja-1| gmt pstext -F+f10p,Helvetica,black+jML -R -J -Wwhite -To -P -K -O >> $ps
echo 1992 50 T/P| gmt pstext -F+f10p,Helvetica,black+jML -R -J -Wwhite -To -P -K -O >> $ps

echo N 1 >le.d
echo S 1c - 1.5c - 2p,black 2c Global papers>>le.d
echo S 1c - 1.5c - 2p,red 2c Global citations>>le.d
gmt pslegend -D+w0.6c+jBL+o.1c/6c -R -J -O  --FONT_ANNOT_PRIMARY=14p le.d -K >> $ps

gmt psbasemap -R1970/2022/-10/30000  -BE -Ba -By+l'Global citation numbers' -J -K -O --MAP_LABEL_OFFSET=5p --MAP_FRAME_PEN=thinner,red --FONT_ANNOT_PRIMARY=10p,red --FONT_LABEL=10p,4,red >>$ps
awk 'NR>1 {print $1, $2}' ./cite/times.txt  | sort|gmt psxy -R -J -W2p,red -O -K >> $ps

gmt psbasemap -R1970/2022/-10/230 -Ba  -BWSe+glightblue -JX4i/3i -K  --MAP_GRID_PEN_PRIMARY=0.01p,0/0/0,2_1_0.25_1:0 -O -X5.5i>>$ps

awk 'NR>1 {print $1, $2}' ./cn/Years.txt  | sort|gmt psxy -R -Bx+lyear -By+l'Paper numbers by country/region' -BWnS -J -W2p,black -O -K  >>$ps
awk 'NR>1 {print $1, $2}' ./ge/Years.txt | sort | gmt psxy -R -J -W2p,yellow -O -K  >>$ps
awk 'NR>1 {print $1, $2}' ./en/Years.txt | sort | gmt psxy -R -J -W2p,blue -O -K  >>$ps
awk 'NR>1 {print $1, $2}' ./fr/Years.txt | sort | gmt psxy -R -J -W2p,green -O -K  >>$ps
awk 'NR>1 {print $1, $2}' ./us/Years.txt | sort | gmt psxy -R -J -W2p,red -O -K  >>$ps

echo N 1 >le.d
echo S 1c - 1.5c - 2p,red 2c USA >>le.d
echo S 1c - 1.5c - 2p,black 2c China >>le.d
echo S 1c - 1.5c - 2p,green 2c France >>le.d
echo S 1c - 1.5c - 2p,blue 2c England >>le.d
echo S 1c - 1.5c - 2p,yellow 2c Germany >>le.d
gmt pslegend -D+w0.6c+jBL+o.1c/4c -R -J -O  --FONT_ANNOT_PRIMARY=14p le.d  >> $ps
gmt psconvert $ps  -A -P -Tf
rm tmp le.d