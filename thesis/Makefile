
.PHONY: thesis fast images dirs

# We don want to pollute the root dir, so we use a build dir
# http://tex.stackexchange.com/questions/12686/how-do-i-run-bibtex-after-using-the-output-directory-flag-with-pdflatex-when-f
thesis: dirs
	xelatex -file-line-error -output-directory=build thesis.tex
	cd build; bibtex thesis
	xelatex -file-line-error -output-directory=build thesis.tex
	xelatex -file-line-error -output-directory=build thesis.tex
	cp build/thesis.pdf ./

fast: dirs
	xelatex -file-line-error -output-directory=build thesis.tex
	cd build; bibtex thesis
	cp build/thesis.pdf ./

haltfast: dirs
	xelatex -file-line-error -output-directory=build --halt-on-error thesis.tex
	cd build; bibtex thesis
	cp build/thesis.pdf ./

symbols: dirs
	xelatex -file-line-error -output-directory=build symbols.tex
	xelatex -file-line-error -output-directory=build symbols.tex
	scp build/symbols.pdf moerman@stitch.science.ru.nl:~/rathtpy_images.pdf
	ssh moerman@stitch.science.ru.nl 'pdf2svg rathtpy_images.pdf rathtpy_images.svg'
	scp moerman@stitch.science.ru.nl:~/rathtpy_images.svg ./symbols.svg

dirs:
	mkdir -p build
	mkdir -p build/notes
	mkdir -p build/diagrams
	mkdir -p build/chapters
	cp references.bib build/
