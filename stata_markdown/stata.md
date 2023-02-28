# Including a Stata Chunk

This document is a Stata markdown file. Any normal markdown (e.g. **bold** text,
`code chunks` or sections) is preserved in the conversion to Rmarkdown.

We can include Stata code easily:

~~~~
<<dd_do>>
sysuse auto
mean mpg
<</dd_do>>
~~~~

Plots require one extra line.

~~~~
<<dd_do>>
twoway scatter mpg trunk
<</dd_do>>
~~~~

<<dd_graph: replace>>


~~~~
<<dd_do: quietly>>
mean trunk
<</dd_do>>
~~~~

We can also include equations inline ($y = 3$) or full-line:

$$
\frac{1}{\sqrt{2\pi}}e^{-\frac{1}{2}\left(\frac{x-\mu}{\sigma}\right)^2}
$$
