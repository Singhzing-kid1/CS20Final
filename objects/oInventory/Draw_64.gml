/// @description Insert description here
// You can write your code in this editor

draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_font(fMainFont);
draw_set_color(c_black);

if(!global.openedInv){
	for(var yy = 0; yy < 9; yy ++){
		var guiTile = global.inventory[# 0, yy];
		
		draw_sprite(sInventory, guiTile[0], 366 + (yy*132), 948);
		if(guiTile[0] != 0) draw_text((432 + (yy*132)) - 2, 948 + 96, guiTile[1]);
	}
} else {
	for(var xx = 0; xx < 4; xx++){
		for(var yy = 0; yy < 9; yy++){
			var guiTile = global.inventory[# xx, yy];
			
			if(xx = 0){ 
				draw_sprite(sInventory, guiTile[0], 366 + (yy*132), 948);
				if(guiTile[0] != 0) draw_text((432 + (yy*132)) -2, 948 + 96, guiTile[1]);
			} else { 
				draw_sprite(sInventory, guiTile[0], 366 + (yy*132), 816 - (xx*132));
				if(guiTile[0] != 0) draw_text((432 + (yy*132)) - 2, (816 - (xx*132))+96, guiTile[1]);
			}
		}
	}
}