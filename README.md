# Combining Stata's Dynamic documents and R's RMarkdown

(Version 2.0 - supports Stata 17)

Stata's [Dynamic documents](https://www.stata.com/manuals/rpt.pdf) is a terrific
start towards an RMarkdown-like support, but it doesn't have the same ecosystem
of support that RMarkdown does.

This repository demostrates how to use a dyndoc file inside a larger RMarkdown
document. If you want to see this in practice, take a look at my Intro to Stata
workshop notes:
[https://github.com/CSCAR/workshop-stata-intro](https://github.com/CSCAR/workshop-stata-intro).

Create any Rmarkdown files that you want in the main directory and include them
in index.Rmd as usual. Create any Stata markdown files (with extension .md) that
you want inside the "stata_markdown" folder. See index.rmd with details how to
include a built Stata file. Remember to refer to the .Rmd version of the file
(which is created automatically), not the original .md version.

Files:

- "index.Rmd" - This file contains all the RMarkdown front-matter, some
  introductory text, and calls to include all other files.
- "stata_markdown/*.md" - Any Stata markdown files in here will be processed by
  Stata and the corresponding Rmd file built in the main directory.
- "Makefile" - The Makefile to build this.
    - `make` - Compiles all Stata dyndoc files and then builds the file output.
    - `make clean` - Removes any temporary and output files.
    - `make fresh` - Cleans and rebuilds everything.
    - `make stata_markdown/___.Rmd` - Will compile a specific .md file into a
      .Rmd file with all cleaning. Useful for debugging. Called if needed during
      `make`.
    - `make index.html` - Compiles just the index.Rmd into an html. Useful for
      debugging. Called if needed during `make`.
