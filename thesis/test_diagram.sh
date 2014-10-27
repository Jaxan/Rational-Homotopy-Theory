#!/bin/bash
set -e

file=$1
sed "s|__INPUT__|$file|" test_diagram.tex | xelatex -file-line-error -output-directory=build
mv build/texput.pdf test_diagram.pdf
#exo-open test_diagram.pdf
rm build/texput.*
