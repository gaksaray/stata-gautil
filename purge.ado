*! version 1.0  07feb2021  Gorkem Aksaray
program purge	
	preserve
	quietly query memory
	set segmentsize `r(segmentsize)'
	restore
end
