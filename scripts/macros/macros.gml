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

enum TILE{
	SPRITE = 0,
	Z = 1
}


global.resourceVariations = array_create(4, Array);

var oneXOne = [4];

var twoXTwo = [4, 4, 
			   4, 4];
			   
var twoXThree = [1, 4, 7,
				 1, 4, 7];
				 
var threeXThree = [2, 3, 2,
				   7, 4, 1,
				   6, 5, 8];
				   
global.resourceVariations = [oneXOne, twoXTwo, twoXThree, threeXThree];
	