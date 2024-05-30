/// @description Insert description here
// You can write your code in this editor

// x = 0 is the hotbar.
global.inventory = ds_grid_create(4, 9);
global.itemSelected = false;
global.currentSelectedItem = [0, 0, 0, 0];

for(var xx = 0; xx < 4; xx++){
	for(var yy = 0; yy < 9; yy++){
		// item, amount
		var data = [0, 0];
		global.inventory[# xx, yy] = data;
	}
}

global.openedInv = false;