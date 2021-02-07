*! version 1.0  07feb2021  Gorkem Aksaray

capture program compformat
program compformat
	
	quietly describe, varlist
	local sortvars "`r(sortlist)'"
	
	quietly foreach var of varlist _all {
		
		// skip if datevar
		local format : format `var'
		if strpos("`format'", "t") != 0 continue
		
		generate _`var' = `var'
		capture label variable _`var' "`: variable label `var''"
		capture label values _`var' "`: value label `var''"
		order _`var', after(`var')
		drop `var'
		rename _`var' `var'
	}
	
	if "`sortvars'" != "" {
		sort `sortvars'
	}
	
	qui compress
end
