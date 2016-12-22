AGR := $(wildcard *.agr)
EPS := $(patsubst %.agr, out/%.eps, $(AGR))
PNG := $(patsubst %.agr, out/%.png, $(AGR))
OUT := $(EPS) $(PNG)
ARCHIVES := grace-plots.zip grace-plots.tar.gz

.PHONY : all clean
all : $(OUT)

out/%.eps : %.agr
	gracebat -hdevice EPS -hardcopy -printfile $@ $<

out/%.png : %.agr
	gracebat -hdevice PNG -hardcopy -printfile $@ $<

grace-plots.zip : $(AGR) $(OUT) Makefile
	zip $@ $^

grace-plots.tar.gz : $(AGR) $(OUT) Makefile
	tar -czf $@ $^

clean:
	rm -f $(OUT) $(ARCHIVES)
