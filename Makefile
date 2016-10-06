AGR := $(wildcard *.agr)
EPS := $(patsubst %.agr, out/%.eps, $(AGR))
PNG := $(patsubst %.agr, out/%.png, $(AGR))
SVG := $(patsubst %.agr, out/%.svg, $(AGR))
OUT := $(EPS) $(PNG) $(SVG)
ARCHIVES := grace-plots.zip grace-plots.tar.gz

.PHONY : all clean
all : out $(OUT)

out :
	mkdir out

out/%.eps : %.agr
	gracebat -hdevice EPS -hardcopy -printfile $@ $<

out/%.png : %.agr
	gracebat -hdevice PNG -hardcopy -printfile $@ $<

out/%.svg : %.agr
	gracebat -hdevice SVG -hardcopy -printfile $@ $<

grace-plots.zip : $(AGR) $(OUT) Makefile
	zip $@ $^

grace-plots.tar.gz : $(AGR) $(OUT) Makefile
	tar -czf $@ $^

clean:
	rm -f $(OUT) $(ARCHIVES)
	rmdir out
