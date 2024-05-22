function tileToRoomX(){
	var tx = argument0;
	var ty = argument1;
	
	return ((tx - ty) * (TILE_W * 0.5));
}