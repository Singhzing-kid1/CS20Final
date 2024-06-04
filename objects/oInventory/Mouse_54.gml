/// @description Insert description here
// You can write your code in this editor
var indX = -floor((device_mouse_y_to_gui(0) - 816)/132);
indX = indX == -1 ? 0 : indX;

var indY = floor((device_mouse_x_to_gui(0) - 366)/132);

if(inRange([0, 3], indX) && inRange([0, 9], indY) && global.itemSelected && global.openedInv){
	var currentItem = global.inventory[# indX, indY];
	
	if(currentItem[0] == global.currentSelectedItem[0] && (indX != global.currentSelectedItem[2] || indY != global.currentSelectedItem[3])){
		global.inventory[# indX, indY] = [currentItem[0], currentItem[1] + global.currentSelectedItem[1]];
		global.inventory[# global.currentSelectedItem[2], global.currentSelectedItem[3]] = [0, 0];
		global.currentSelectedItem = [0, 0, 0, 0];
		global.itemSelected = false;
	}
		
} else {
	global.currentSelectedItem = [0, 0, 0, 0];
	global.itemSelected = false;
}


	