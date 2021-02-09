*! version 1.1  09feb2021  Gorkem Aksaray

capture program drop dichotomize
program define dichotomize
	syntax varname, GENerate(name) ///
					[ ///
					inlist(numlist) leq(numlist min=1 max=1) geq(numlist min=1 max=1) ///
					LABel(string) ///
					first last after(varname) before(varname)]
	
	confirm new variable `generate'
	
	if "`inlist'" != "" & "`leq'" != "" {
		di as err "inlist() may not be combined with leq()"
		exit 198
	}
	if "`inlist'" != "" & "`geq'" != "" {
		di as err "inlist() may not be combined with geq()"
		exit 198
	}
	
	if "`inlist'" != "" {
		local inlist = subinstr("`inlist'", " ", ", ", .)
		local cond inlist(`varlist', `inlist')
	}
	if "`leq'" != "" {
		local cond `varlist' <= `leq'
	}
	if "`geq'" != "" {
		local cond `varlist' >= `geq'
	}
	if "`leq'" != "" & "`geq'" != "" {
		cap assert `leq' >= `geq'
		if _rc {
			di as err "leq() may no be less than geq()"
			exit 198
		}
		local cond inrange(`varlist', `geq', `leq')
	}
	
	if "`before'" != "" & "`after'" != "" {
		di as err "before() may not be combined with after"
		exit 198
	}
	if "`before'" != "" & "`first'" != "" {
		di as err "before() may not be combined with first"
		exit 198
	}
	if "`before'" != "" & "`last'" != "" {
		di as err "before() may not be combined with last"
		exit 198
	}
	if "`after'" != "" & "`first'" != "" {
		di as err "before() may not be combined with after"
		exit 198
	}
	if "`after'" != "" & "`last'" != "" {
		di as err "before() may not be combined with after"
		exit 198
	}
	if "`first'" != "" & "`last'" != "" {
		di as err "first may not be combined with last"
		exit 198
	}
	
	local placement ", after(`varlist')" // default placement is after dichotomized variable
	if "`before'" != "" {
		local placement ", before(`before')"
	}
	if "`after'" != "" {
		local placement ", after(`after')"
	}
	if "`first'" != "" {
		local placement ", first"
	}
	if "`last'" != "" {
		local placement ", last"
	}
	
	generate `generate' = cond(`cond', 1, 0) if !missing(`varlist')
	if "`label'" != "" {
		label variable `generate' `"`label'"'
	}
	order `generate' `placement'
end
