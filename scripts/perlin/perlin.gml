function perlin(x, y){
	var xx = floor(x);
	var yy = floor(y);
	
	var xxx = x - xx;
	var yyy = y - yy;
	
	xx = xx & 255;
	yy = yy & 255;
	
	var gradX1 = global.gradTable[global.permTable[xx + global.permTable[yy]]];
	var gradY1 = global.gradTable[global.permTable[xx + global.permTable[yy + 1]]];
	var gradX2 = global.gradTable[global.permTable[xx + 1 + global.permTable[yy]]];
	var gradY2 = global.gradTable[global.permTable[xx + 1 + global.permTable[yy + 1]]];
	
	var dotProd1 = dot_product_normalized(gradX1, gradY1, xxx, yyy);
	var dotProd2 = dot_product_normalized(gradX2, gradY2, xxx - 1, yyy)
	
	var lerpX = lerp(dotProd1, dotProd2, fade(xxx));
	
	gradX1 = global.gradTable[global.permTable[xx + global.permTable[yy + 1]]];
	gradY1 = global.gradTable[global.permTable[xx + global.permTable[yy + 2]]];
	gradX2 = global.gradTable[global.permTable[xx + 1 + global.permTable[yy + 1]]];
	gradY2 = global.gradTable[global.permTable[xx + 1 + global.permTable[yy + 2]]];
	
	dotProd1 = dot_product_normalized(gradX1, gradY1, xxx, yyy - 1);
	dotProd2 = dot_product_normalized(gradX2, gradY2, xxx - 1, yyy - 1);
	
	var lerpY = lerp(dotProd1, dotProd2, fade(yyy));
	
	return lerp(lerpX, lerpY, fade(y));
}