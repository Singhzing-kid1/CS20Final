#macro TILE_W 16
#macro TILE_H 8
#macro ROOM_W room_width
#macro ROOM_H room_height
#macro MAP_W floor(ROOM_W/TILE_W)
#macro MAP_H floor(ROOM_H/TILE_W)
#macro CAM_W 1920
#macro CAM_H 1080
#macro SCREEN_W 1920
#macro SCREEN_H 1080
#macro INV_STACK_SIZE 128

display_set_gui_size(SCREEN_W, SCREEN_H);

enum TILE{
	SPRITE = 0,
	Z = 1
}

var oneXOne = [4];

var twoXTwo = [4, 4, 
			   4, 4];
			   
var twoXThree = [7, 7,
				 4, 4,
				 1, 1];
				 
var threeXThree = [9, 3, 2,
				   7, 4, 1,
				   6, 5, 8];
				   
global.resourceVariations = [oneXOne, twoXTwo, twoXThree, threeXThree];
	