AGR := $(wildcard *.agr)
EPS := $(patsubst %.agr, out/%.eps, $(AGR))
PNG := $(patsubst %.agr, out/%.png, $(AGR))
SVG := $(patsubst %.agr, out/%.svg, $(AGR))

.PHONY : all clean
all : out $(EPS) $(PNG) $(SVG)

out :
	mkdir out

out/%.eps : %.agr
	gracebat -hdevice EPS -hardcopy -printfile $@ $<

out/%.png : %.agr
	gracebat -hdevice PNG -hardcopy -printfile $@ $<

out/%.svg : %.agr
	gracebat -hdevice SVG -hardcopy -printfile $@ $<

clean:
	rm -f $(EPS) $(PNG) $(SVG)
	rmdir out
