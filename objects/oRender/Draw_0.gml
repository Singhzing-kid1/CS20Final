/// @desc Render
var roomX, roomY, mapTileIndex, mapTileZ, placeableTileZ, placeableTileIndex, Tx, Ty;
var mapTileData, placeableTileData;

camera_set_view_size(view_camera[0], CAM_W * cameraZoom, CAM_H * cameraZoom);

var playerTileX = screenToTileX(oPlayer.x, oPlayer.y);
var playerTileY = screenToTileY(oPlayer.x, oPlayer.y);

var renderAreaX = playerTileX > 60 ? playerTileX - 60 : 1;
var renderAreaY = playerTileY > 60 ? playerTileY - 60 : 1;

renderAreaX = renderAreaX < (MAP_W - 120) ? renderAreaX : MAP_W - 120;
renderAreaY = renderAreaY < (MAP_H - 120) ? renderAreaY : MAP_H - 120;

for(var tx = 0; tx < 120; tx++){
	for(var ty = 0; ty < 120; ty++){
		Tx = tx + renderAreaX - 1;
		Ty = ty + renderAreaY - 1;
		mapTileData = global.map[# Tx, Ty];
		placeableTileData = global.placeables[# Tx, Ty];
		roomX = tileToRoomX(Tx, Ty);
		roomY = tileToRoomY(Tx, Ty);
		
		mapTileIndex = mapTileData[TILE.SPRITE];
		mapTileZ = mapTileData[TILE.Z];
		
		placeableTileIndex = placeableTileData[TILE.SPRITE];
		placeableTileZ = placeableTileData[TILE.Z];
		
		if(mapTileIndex != 0) draw_sprite(sStatic, mapTileIndex, roomX, roomY + mapTileZ);
		if(placeableTileIndex != 0) draw_sprite(sStatic, placeableTileIndex, roomX, roomY + placeableTileZ);
		
		if(screenToTileX(mouse_x, mouse_y) == Tx - 1 && screenToTileY(mouse_x, mouse_y) == Ty - 1){
				draw_sprite(sOutline, 0, roomX, roomY + placeableTileZ);
		}
	}
}

