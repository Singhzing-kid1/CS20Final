/// @description Insert description here
// You can write your code in this editor
if(global.currentSelectedItem[0] != 0 && global.currentSelectedItem[1] == 0 && global.currentSelectedItem){
	global.inventory[# global.currentSelectedItem[2], global.currentSelectedItem[3]] = [0, 0];
	global.currentSelectedItem = [0, 0, 0, 0];
	global.itemSelected = false;
}

for(var xx = 0; xx < 4; xx++){
	for(var yy = 0; yy < 9; yy++){
		currentItem = global.inventory[# xx, yy];
		
		if(currentItem[0] == 0 && currentItem[1] != 0){
			global.inventory[# xx, yy] = [0, 0];	
		}
	}
}