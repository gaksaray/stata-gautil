{smcl}
{* version 1.0  07feb2021}{...}
{viewerjumpto "Syntax" "dichotomize##syntax"}{...}
{viewerjumpto "Description" "dichotomize##description"}{...}
{viewerjumpto "Options" "dichotomize##options"}{...}
{viewerjumpto "Examples" "dichotomize##examples"}{...}
{viewerjumpto "Author" "dichotomize##author"}{...}
{cmd:help dichotomize}{right: {browse "https://github.com/gaksaray/stata-utilities/"}}
{hline}

{title:Title}

{phang}
{bf:dichotomize} {hline 2} Dichotomize a categorical variable


{marker syntax}{...}
{title:Syntax}

{p 8}
{cmd: dichotomize}
{varname}{cmd:,}
{opth true(numlist)}
{opth gen:erate(newvar)}
[{opt lab:el("label")}
{opt noafter}]


{marker description}{...}
{title:Description}

{pstd}
{cmd:dichotomize} creates a binary variable out of a categorical {varname}.


{marker options}{...}
{title:Options}

{phang}
{opth true(numlist)} specifies the values of the variable to be converted
to 1. The rest of the values will be automatically converted to 0.

{phang}
{opth generate(newvar)} specifies the name of the created binary variable.

{phang}
{opt lab:el("label")} specifies the label for the created binary variable.

{phang}
{opt noafter} instructs the program to place the created binary variable to
the end of the dataset. The default behavior is to place it after {varname}.


{marker examples}{...}
{title:Examples}

{phang}{cmd:. dichotomize status, true(3/6) gen(stat_hi)}{p_end}

{phang}{cmd:. dichotomize status, true(3/5 6) gen(stat_hi) lab(Low status)}{p_end}

{phang}{cmd:. dichotomize reside, true(1/99) generate(reside_dummy)}{p_end}

{phang}{cmd:. dichotomize marstat, true(2 3 5) generate(married) label("Married") noafter}{p_end}


{marker author}{...}
{title:Author}

{pstd}
Gorkem Aksaray, Koc University.{p_end}
{p 4}Email: {browse "mailto:gaksaray@ku.edu.tr":gaksaray@ku.edu.tr}{p_end}
{p 4}Personal Website: {browse "https://sites.google.com/site/gorkemak/":sites.google.com/site/gorkemak}{p_end}
{p 4}GitHub: {browse "https://github.com/gaksaray/":github.com/gaksaray}{p_end}
