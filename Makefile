PDFLATEX=pdflatex -interaction=nonstopmode
PDF=rpz.pdf
MAINTEX=rpz.tex
TEX=tex
STYLES=$(TEX)/GostBase.clo $(TEX)/G7-32.sty $(TEX)/G7-32.cls $(TEX)/G2-105.sty

all: $(PDF)

.PHONY: all tarball clean

$(PDF): $(TEX)/$(MAINTEX) $(STYLES)
	cd tex && $(PDFLATEX) $(MAINTEX) && $(PDFLATEX) $(MAINTEX) && cp $(PDF) ..

clean:
	find $(TEX)/ -regextype posix-egrep -type f ! -regex ".*\.(sty|tex|clo|cls)" -exec rm -f {} \; ;

tarball: $(PDF) clean
	rm latex-G7-32.tar.gz; cd $(TEX) && tar -cjf ../latex-G7-32.tar.gz *