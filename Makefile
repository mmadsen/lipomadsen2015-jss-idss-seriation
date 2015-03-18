.PHONY : clean

pdf:
	./knit pdf
	pandoc -s --biblio lipomadsen2015-jss-idss-seriation.bib lipomadsen2015-jss-idss-seriation.md --template=article-template.tex --no-tex-ligatures --latex-engine=xelatex -o lipomadsen2015-jss-idss-seriation.tex --natbib --number-sections --listings
	sed -f dblquote2latex.sed lipomadsen2015-jss-idss-seriation.tex > lipomadsen2015-jss-idss-seriation.tmp
	mv lipomadsen2015-jss-idss-seriation.tmp lipomadsen2015-jss-idss-seriation.tex
	latexmk -pdf lipomadsen2015-jss-idss-seriation
	open -a /Applications/Skim.app lipomadsen2015-jss-idss-seriation.pdf

clean:
	latexmk -CA
	rm -rf *.log *.bbl *.blg *.out *.md lipomadsen2015-jss-idss-seriation.pdf *.epub


