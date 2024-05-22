function screenToTileY(){
	var roomX = argument0;
	var roomY = argument1;
	
	return floor(((roomY / TILE_H) - (roomX / TILE_W)));
}