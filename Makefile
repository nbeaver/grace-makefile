AGR := $(wildcard *.agr)
EPS := $(patsubst %.agr, %.eps, $(AGR))
GMF := $(patsubst %.agr, %.gmf, $(AGR))
JPEG := $(patsubst %.agr, %.jpg, $(AGR))
MIF := $(patsubst %.agr, %.mif, $(AGR))
PNG := $(patsubst %.agr, %.png, $(AGR))
PNM := $(patsubst %.agr, %.pnm, $(AGR))
PS := $(patsubst %.agr, %.ps, $(AGR))
PDF := $(patsubst %.agr, %.pdf, $(AGR))
SVG := $(patsubst %.agr, %.svg, $(AGR))
IMAGES := $(EPS) $(GMF) $(JPEG) $(MIF) $(PNG) $(PNM) $(PS) $(PDF) $(SVG)
ARCHIVES := grace-plots.zip grace-plots.tar.gz

.PHONY : images
images : $(IMAGES)

.PHONY : all
all : $(IMAGES) $(ARCHIVES)

%.ps : %.agr
	xmgrace -printfile $@ -hdevice PostScript -hardcopy $<

%.pdf : %.ps
	gs -dBATCH -dNOPAUSE \
		-sDEVICE=pdfwrite \
		-dEmbedAllFonts=true \
		-sOutputFile=$@ $<

%.eps : %.agr
	xmgrace -printfile $@ -hdevice EPS -hardcopy $<

%.gmf : %.agr
	xmgrace -printfile $@ -hdevice Metafile -hardcopy $<

%.jpg : %.agr
	xmgrace -printfile $@ -hdevice JPEG -hardcopy $<

%.mif : %.agr
	xmgrace -printfile $@ -hdevice MIF -hardcopy $<

%.png : %.agr
	xmgrace -printfile $@ -hdevice PNG -hardcopy $<

%.pnm : %.agr
	xmgrace -printfile $@ -hdevice PNM -hardcopy $<

%.svg : %.agr
	xmgrace -printfile $@ -hdevice SVG -hardcopy $<

grace-plots.zip : $(AGR) $(IMAGES) Makefile
	zip $@ $^

grace-plots.tar.gz : $(AGR) $(IMAGES) Makefile
	tar -czf $@ $^

.PHONY : clean
clean:
	rm -f -- $(IMAGES) $(ARCHIVES)
