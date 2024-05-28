/// @description Insert description here
// You can write your code in this editor

// x = 0 is the hotbar.
global.inventory = ds_grid_create(4, 9);

for(var xx = 0; xx < 4; xx++){
	for(var yy = 0; yy < 9; yy++){
		// item, amount
		var data = [0, 0];
		global.inventory[# xx, yy] = data;
	}
}

global.openedInv = false;