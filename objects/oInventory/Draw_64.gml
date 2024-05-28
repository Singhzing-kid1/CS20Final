/// @description Insert description here
// You can write your code in this editor



for(var xx = 0; xx < 4; xx++){
	for(var yy = 0; yy < 9; yy++){
		if(global.openedInv == false && xx = 0) {
			var guiTile = global.inventory[# xx, yy];
			
			if(guiTile[0] == 0){
				draw_sprite(sEmptyInv, 0, 462 + (yy*132), 948);
			}
		}
	}
}