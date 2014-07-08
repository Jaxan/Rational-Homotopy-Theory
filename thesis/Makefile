
.PHONY: thesis fast images

# We don want to pollute the root dir, so we use a build dir
# http://tex.stackexchange.com/questions/12686/how-do-i-run-bibtex-after-using-the-output-directory-flag-with-pdflatex-when-f
thesis:
	mkdir -p build
	cp references.bib build/
	xelatex -file-line-error -output-directory=build thesis.tex
	cd build; bibtex thesis
	xelatex -file-line-error -output-directory=build thesis.tex
	xelatex -file-line-error -output-directory=build thesis.tex
	cp build/thesis.pdf ./

fast:
	mkdir -p build
	xelatex -file-line-error -output-directory=build thesis.tex
	cp build/thesis.pdf ./

images:
	mkdir -p build
	xelatex -file-line-error -output-directory=build images.tex
	xelatex -file-line-error -output-directory=build images.tex
	scp build/images.pdf moerman@stitch.science.ru.nl:~/wvlt_images.pdf
	ssh moerman@stitch.science.ru.nl 'pdf2svg wvlt_images.pdf wvlt_images.svg'
	scp moerman@stitch.science.ru.nl:~/wvlt_images.svg ./images.svg
