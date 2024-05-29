/// @desc place remove


if(mouse_check_button(mb_right)){
	var tile = [1, -15, 0];
	var currentTileData = global.placeablesAndResources [# screenToTileX(mouse_x, mouse_y) + 1, screenToTileY(mouse_x, mouse_y) + 1];
	
	if(currentTileData[2] == 0) global.placeablesAndResources[# screenToTileX(mouse_x, mouse_y) + 1, screenToTileY(mouse_x, mouse_y) + 1] = tile;			
}

if(mouse_check_button(mb_left)){
	var tile = [0, -15, 0];
	var currentTileData = global.placeablesAndResources [# screenToTileX(mouse_x, mouse_y) + 1, screenToTileY(mouse_x, mouse_y) + 1];
	
	if(currentTileData[2] == 0) global.placeablesAndResources[# screenToTileX(mouse_x, mouse_y) + 1, screenToTileY(mouse_x, mouse_y) + 1] = tile;			
	
	if(currentTileData[2] == 1){
		var breakOutOfAllLoops;
		for(var xx = 0; xx < 4; xx++){
			for(var yy = 0; yy < 9; yy++){
				var currentItem = global.inventory[# xx, yy];
				var item = [0, 0];
				breakOutOfAllLoops = false;
				
				if(currentItem[0] == 0){
					item = [1, 1];
					global.inventory[# xx, yy] = item;
					breakOutOfAllLoops = true;
					break;
				}
				
				if(currentItem[0] == 1 && currentItem[1] < 128){
					item = [1, currentItem[1] + 1];
					global.inventory[# xx, yy] = item;
					breakOutOfAllLoops = true;
					break;
				}
			}
			
			if(breakOutOfAllLoops) break;
		}
	}
}

// for dev testing
if(mouse_wheel_up()){
	cameraZoom -= 0.1;
	cameraZoom = cameraZoom < 0.1 ? 0.1 : cameraZoom;
}

if(mouse_wheel_down()){

	cameraZoom += 0.1;
	cameraZoom = cameraZoom > 99 ? 99 : cameraZoom;
}