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

.PHONY : images all clean

images : $(IMAGES)

all : $(IMAGES) $(ARCHIVES)

%.ps : %.agr
	xmgrace -hdevice PostScript -hardcopy -printfile $@ $<

%.pdf : %.ps
	gs -dBATCH -dNOPAUSE \
		-sDEVICE=pdfwrite \
		-dEmbedAllFonts=true \
		-sOutputFile=$@ $<

%.eps : %.agr
	xmgrace -hdevice EPS -hardcopy -printfile $@ $<

%.gmf : %.agr
	xmgrace -hdevice Metafile -hardcopy -printfile $@ $<

%.jpg : %.agr
	xmgrace -hdevice JPEG -hardcopy -printfile $@ $<

%.mif : %.agr
	xmgrace -hdevice MIF -hardcopy -printfile $@ $<

%.png : %.agr
	xmgrace -hdevice PNG -hardcopy -printfile $@ $<

%.pnm : %.agr
	xmgrace -hdevice PNM -hardcopy -printfile $@ $<

%.svg : %.agr
	xmgrace -hdevice SVG -hardcopy -printfile $@ $<

grace-plots.zip : $(AGR) $(OUT) Makefile
	zip $@ $^

grace-plots.tar.gz : $(AGR) $(OUT) Makefile
	tar -czf $@ $^

clean:
	rm -f $(IMAGES) $(ARCHIVES)
