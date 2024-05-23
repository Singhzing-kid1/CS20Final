layer_set_visible("Map", false);

view_enabled = true;
view_visible[0] = true;
view_camera[0] = camera_create_view(0, 0, CAM_W, CAM_H, 0, noone, -1, -1, -1, -1);

window_set_rectangle(0, 0, SCREEN_W, SCREEN_H);
window_center();

surface_resize(application_surface, SCREEN_W, SCREEN_H);

global.map = ds_grid_create(MAP_W, MAP_H);

random_set_seed(current_time);

var randomPerlin = irandom_range(0, 9);
var randomPerlin2 = irandom_range(0, 8)

randomPerlin2 = randomPerlin2 == randomPerlin ? randomPerlin2 - 1 : randomPerlin2;

var mapWidth = sprite_get_width(sPerlinNoiseMaps);
var mapHeight = sprite_get_width(sPerlinNoiseMaps);

var heightMap = surface_create(mapWidth, mapHeight, surface_rgba8unorm);
var moistureMap = surface_create(mapWidth, mapHeight, surface_rgba8unorm);

surface_set_target(heightMap);
draw_sprite(sPerlinNoiseMaps, randomPerlin, 0, 0);
surface_reset_target();

surface_set_target(moistureMap);
draw_sprite(sPerlinNoiseMaps, randomPerlin2, 0, 0);
surface_reset_target();


show_debug_message(mapWidth);


for(var tx = 0; tx < MAP_W; tx++){
	for(var ty = 0; ty < MAP_H; ty++){
		var i = tx * ty;
		var h = color_get_red(surface_getpixel (heightMap, tx, ty));
		var m = surface_getpixel(moistureMap, tx, ty);

		var avgH = h/255;
		var avgM = m;
		
		show_debug_message(avgH);
		
		// SPRITE, Z
		var tileData = [0, 0];
		
		if((avgH >= 0.5 && avgH <= 1.0)){
			tileData = [1, 0];	
		} else {
			tileData = [2, 0];	
		}
		
		global.map[# tx, ty] = tileData;
	}
	
	show_debug_message("\n");
}