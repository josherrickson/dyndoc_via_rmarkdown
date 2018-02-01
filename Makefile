default: stata fixRmd book

stata:
	/Applications/Stata/StataSE.app/Contents/MacOS/stata-se -b do build-stata.do

fixRmd:
	R -q -f fixRmd.R
	find . -type f -name '0*.Rmd' | xargs sed -i '' 's|href="|target="_blank" href="|g'

book:
	Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"

clean:
	@rm -rf 0*.Rmd _book build-stata.log

fresh: clean default

open:
	@open _book/index.html

publish:
	@cp -r _book/* ~/repositories/josherrickson.github.io/stata1/.
	@cp images/* ~/repositories/josherrickson.github.io/images/.
