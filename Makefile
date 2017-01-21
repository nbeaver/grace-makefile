AGR := $(wildcard *.agr)
EPS := $(patsubst %.agr, %.eps, $(AGR))
PNG := $(patsubst %.agr, %.png, $(AGR))
PS := $(patsubst %.agr, %.ps, $(AGR))
IMAGES := $(EPS) $(PNG) $(PS)
ARCHIVES := grace-plots.zip grace-plots.tar.gz

.PHONY : images all clean

images : $(IMAGES)

all : $(IMAGES) $(ARCHIVES)

%.ps : %.agr
	xmgrace -hdevice PostScript -hardcopy -printfile $@ $<

%.eps : %.agr
	xmgrace -hdevice EPS -hardcopy -printfile $@ $<

%.png : %.agr
	xmgrace -hdevice PNG -hardcopy -printfile $@ $<

grace-plots.zip : $(AGR) $(OUT) Makefile
	zip $@ $^

grace-plots.tar.gz : $(AGR) $(OUT) Makefile
	tar -czf $@ $^

clean:
	rm -f $(IMAGES) $(ARCHIVES)
