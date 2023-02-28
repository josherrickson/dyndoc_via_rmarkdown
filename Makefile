# Set this to the name of the folder containing your Stata .md files
stata_file_path = stata_markdown


# File all md files to process
md = $(shell find $(stata_file_path) -name "*.md")
Stata_Rmd = $(md:.md=.Rmd)

stata_markdown/%.Rmd: $(stata_file_path)/%.md
	@echo "$< -> $@"
	@/Applications/Stata/StataSE.app/Contents/MacOS/stata-se -b 'dyntext "$<", saving("$@") replace nostop'
# Using <<dd_do: quiet>> produces empty codeblocks in output, remove them
	@perl -0777 -i -pe 's/~~~~\n~~~~//g' $@

index.html: index.Rmd $(Stata_Rmd)
	@echo "$< -> $@"
# Bring images temporarily up to main directory
	@cp $(stata_file_path)/*.svg . 2>/dev/null || :
	@Rscript -e "rmarkdown::render('$<')"
#	Remove any images copies up
	@rm -rf *.svg

.PHONY:default
default: $(Stata_Rmd)  index.html

.PHONY:clean
clean:
	@git clean -xdf

.PHONY:fresh
fresh: clean default

.PHONY:open
open:
	@open index.html
