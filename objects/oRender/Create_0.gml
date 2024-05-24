layer_set_visible("Map", false);

view_enabled = true;
view_visible[0] = true;
view_camera[0] = camera_create_view(0, 0, CAM_W, CAM_H, 0, noone, -1, -1, -1, -1);

window_set_rectangle(0, 0, SCREEN_W, SCREEN_H);
window_center();

surface_resize(application_surface, SCREEN_W, SCREEN_H);

global.map = ds_grid_create(MAP_W, MAP_H);

random_set_seed(current_time);

var heightMapIndex = irandom_range(0, 9);
var moistureMapIndex = irandom_range(0, 8);
var tempMapIndex = irandom_range(0, 7);

show_debug_message("{0} {1} {2}", heightMapIndex, moistureMapIndex, tempMapIndex);

moistureMapIndex = moistureMapIndex == heightMapIndex ? moistureMapIndex - 1 : moistureMapIndex;
tempMapIndex = (tempMapIndex == moistureMapIndex) || (tempMapIndex == heightMapIndex) ? tempMapIndex - 2 : tempMapIndex;

var mapWidth = sprite_get_width(sPerlinNoiseMaps);
var mapHeight = sprite_get_width(sPerlinNoiseMaps);

var heightMap = surface_create(mapWidth, mapHeight, surface_rgba8unorm);
var moistureMap = surface_create(mapWidth, mapHeight, surface_rgba8unorm);
var tempMap = surface_create(mapWidth, mapHeight, surface_rgba8unorm);

surface_set_target(heightMap);
draw_sprite(sPerlinNoiseMaps, heightMapIndex, 0, 0);
surface_reset_target();

surface_set_target(moistureMap);
draw_sprite(sPerlinNoiseMaps, moistureMapIndex, 0, 0);
surface_reset_target();

surface_set_target(tempMap);
draw_sprite(sPerlinNoiseMaps, tempMapIndex, 0, 0);
surface_reset_target();

show_debug_message(mapWidth);

for(var tx = 0; tx < MAP_W; tx++){
	for(var ty = 0; ty < MAP_H; ty++){
		var heightVal = color_get_red(surface_getpixel(heightMap, tx, ty));
		var moistureVal = color_get_red(surface_getpixel(moistureMap, tx, ty));
		var tempVal = color_get_red(surface_getpixel(tempMap, tx, ty));
		
		// SPRITE, Z
		var tileData = [0, 0];
		
		if(inPercentRangeWithOffset([0.7, 1.0], 255, heightVal, 0) && inPercentRangeWithOffset([0.0, 0.3], 255, moistureVal, 0) && inPercentRangeWithOffset([0.0, 0.3], 255, tempVal, 0)) // Tundra
			tileData = [1, 0];
		else if(inPercentRangeWithOffset([0.5, 0.8], 255, heightVal, 0) && inPercentRangeWithOffset([0.3, 0.6], 255, moistureVal, 0) && inPercentRangeWithOffset([0.2, 0.4], 255, tempVal, 0)) // Boreal Forset
			tileData = [2, 0]; 
		else if(inPercentRangeWithOffset([0.3, 0.6], 255, heightVal, 0) && inPercentRangeWithOffset([0.4, 0.7], 255, moistureVal, 0) && inPercentRangeWithOffset([0.4, 0.6], 255, tempVal, 0)) // Temperate Forest
			tileData = [3, 0];
		else if(inPercentRangeWithOffset([0.0, 0.3], 255, heightVal, 0) && inPercentRangeWithOffset([0.7, 1.0], 255, moistureVal, 0) && inPercentRangeWithOffset([0.7, 1.0], 255, tempVal, 0)) // Tropical Rainforest
			tileData = [4, 0];
		else if(inPercentRangeWithOffset([0.2, 0.5], 255, heightVal, 0) && inPercentRangeWithOffset([0.2, 0.4], 255, moistureVal, 0) && inPercentRangeWithOffset([0.6, 0.8], 255, tempVal, 0)) // Savanna
			tileData = [5, 0];
		else if(inPercentRangeWithOffset([0.4, 0.8], 255, heightVal, 0) && inPercentRangeWithOffset([0.0, 0.2], 255, moistureVal, 0) && inPercentRangeWithOffset([0.0, 0.3], 255, tempVal, 0)) // Cold Desert
			tileData = [6, 0];
		else if(inPercentRangeWithOffset([0.4, 0.8], 255, heightVal, 0) && inPercentRangeWithOffset([0.0, 0.2], 255, moistureVal, 0) && inPercentRangeWithOffset([0.7, 1.0], 255, tempVal, 0)) // Hot Desert
			tileData = [7, 0];
		else if(inPercentRangeWithOffset([0.8, 1.0], 255, heightVal, 0) && inPercentRangeWithOffset([0.0, 0.4], 255, moistureVal, 0) && inPercentRangeWithOffset([0.0, 0.2], 255, tempVal, 0)) // Apline
			tileData = [8, 0];
		else // Grasslands
			tileData = [9, 0];
		
		global.map[# tx, ty] = tileData;
	}
}