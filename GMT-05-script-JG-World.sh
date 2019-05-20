#!/bin/sh
# Purpose: Global map in orthographic azimuthal projection (here: North Pacific Ocean)
# GMT modules: pscoast, logo, psconvert
# Step-1. Generate file
ps=GMT_ortho_PO.ps
# Step-2. Add coastmap
gmt pscoast -R140/170/40/60 -JG155/50/6i -Gdarkseagreen1 -Slightcyan -W0.25p -Df \
	-B+t"North Pacific Ocean (Orthographic azimuthal projection)" -Bafg \
    --FORMAT_GEO_MAP=dddF \
    --MAP_FRAME_PEN=dimgray \
    --MAP_TICK_PEN_PRIMARY=thinner,dimgray \
    --FONT_TITLE=14p,Palatino-Roman,black \
    --MAP_GRID_PEN_PRIMARY=thinnest \
	-P  -UBL/-15p/-40p -Vv -K > $ps
# Step-3. Add GMT Logo
gmt logo -R -J -O -Dx6.5/-2.2+o0.1i/0.1i+w2c  >> $ps
# Step-4. Convert to image file using GhostScript
gmt psconvert GMT_ortho_PO.ps -A0.2c -E720 -P -Tj -Z
