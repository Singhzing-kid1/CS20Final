/// @desc place remove


if(mouse_check_button(mb_right)){
	var tile = [1, -16];
	global.placeables[# screenToTileX(mouse_x, mouse_y) + 1, screenToTileY(mouse_x, mouse_y) + 1] = tile;			
}

if(mouse_check_button(mb_left)){
	var tile = [0, -16];
	global.placeables[# screenToTileX(mouse_x, mouse_y) + 1, screenToTileY(mouse_x, mouse_y) + 1] = tile;			
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