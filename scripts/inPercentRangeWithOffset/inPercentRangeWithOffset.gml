function inPercentRangeWithOffset(range, outOf, number, offSet){
	var lowerBound = range[0];
	var upperBound = range[1];
	
	var currentPercent = (number - offSet)/outOf;
	
	if(lowerBound <= currentPercent && currentPercent <= upperBound)
		return true;
	else
		return false;
}