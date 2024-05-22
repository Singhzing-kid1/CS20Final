function screenToTileX(){
	var roomX = argument0;
	var roomY = argument1;
	
	return floor(((roomX / TILE_W) + (roomY / TILE_H)));
}