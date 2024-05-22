function fractalNoise2D(x, y, octaves, persistence, gap){
	var total = 0.0;
	var freq = 1.0;
	var amplitude = 1.0;
	var maxVal = 0.0;
	
	for(var i = 0; i < octaves + 1; i++){
		total += perlin(x * freq, y*freq) * amplitude;
		maxVal += amplitude;
		amplitude *= persistence;
		freq *= gap;
		
	}
	
	return total / maxVal;
}