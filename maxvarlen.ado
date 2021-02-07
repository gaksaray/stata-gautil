*! maxvarlen: calculate maximum character length of variables

capture program drop maxvarlen
qui program maxvarlen, rclass
	syntax varlist[, LABels]
			
	local maxvarlen 0
	foreach var of local varlist {
		if "`labels'" != "" {
			local varlen = strlen("`: variable label `var''")
		}
		else if "`labels'" == "" {
			local varlen = strlen("`var'")
		}
		if `varlen' > `maxvarlen' {
			local maxvarlen `varlen'
		}
	}
	
	return scalar chars = `maxvarlen'
	di as text `maxvarlen'
end
