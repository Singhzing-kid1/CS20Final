layer_set_visible("Map", false);

view_enabled = true;
view_visible[0] = true;
view_camera[0] = camera_create_view(0, 0, CAM_W, CAM_H, 0, noone, -1, -1, -1, -1);

window_set_rectangle(0, 0, SCREEN_W, SCREEN_H);
window_center();

surface_resize(application_surface, SCREEN_W, SCREEN_H);

global.map = ds_grid_create(MAP_W, MAP_H);

for(var i = 0; i < 256; i++){
	var xx = random_range(-1, 1);
	var yy = random_range(-1, 1);
	
	var length = sqrt(xx * xx + yy * yy);
	
	xx /= length;
	yy /= length;
	
	global.gradTable[i] = xx;
	global.gradTable[i + 256] = yy;
}

for(var i = 0; i < 512; i++){
	global.permTable[i] = irandom_range(0, 255);	
}

global.permTable = array_shuffle(global.permTable);

var tileMap = layer_tilemap_get_id("Map");

for(var tx = 0; tx < MAP_W; tx++){
	for(var ty = 0; ty < MAP_H; ty++){
		show_debug_message(perlin(tx, ty));
	}
}