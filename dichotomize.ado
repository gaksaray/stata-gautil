*! version 1.0  07feb2021  Gorkem Aksaray

capture program drop dichotomize
program define dichotomize
	syntax varname, true(numlist) GENerate(name) [LABel(string) noAFTER]
	
	confirm new variable `generate'
	
	local true = subinstr("`true'", " ", ", ", .)
	
	if "`after'" == "noafter" {
		local after
	}
	else if "`after'" == "" | "`after'" == "after" {
		local after ", after(`varlist')"
	}
	
	generate `generate' = cond(inlist(`varlist', `true'), 1, 0) if !missing(`varlist') `after'
	if "`label'" != "" {
		label variable `generate' `"`label'"'
	}
end
