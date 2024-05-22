/// @desc place remove


if(mouse_check_button(mb_right)){
	var tile = [1, 0];
	global.map[# screenToTileX(mouse_x, mouse_y), screenToTileY(mouse_x, mouse_y)] = tile;			
}

if(mouse_check_button(mb_left)){
	var tile = [0, 0];
	global.map[# screenToTileX(mouse_x, mouse_y), screenToTileY(mouse_x, mouse_y)] = tile;			
}

// for dev testing
//if(mouse_wheel_up()){
//	cameraZoom -= 0.1;
//	cameraZoom = cameraZoom < 0.1 ? 0.1 : cameraZoom;
//}

//if(mouse_wheel_down()){

//	cameraZoom += 0.1;
//	cameraZoom = cameraZoom > 99 ? 99 : cameraZoom;
//}