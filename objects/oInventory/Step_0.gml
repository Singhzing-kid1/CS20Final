/// @description Insert description here
// You can write your code in this editor

var indX = -floor((device_mouse_y_to_gui(0) - 816)/132);
indX = indX == -1 ? 0 : indX;

var indY = floor((device_mouse_x_to_gui(0) - 366)/132);

if(mouse_check_button(mb_left)){
	if(inRange([0, 3], indX) && inRange([0, 9], indY) && !global.itemSelected && global.openedInv){
		var currentItem = global.inventory[# indX, indY];
		
		global.currentSelectedItem = [currentItem[0], currentItem[1], indX, indY];
		global.itemSelected = true;		
	}
	
	if(inRange([0, 3], indX) && inRange([0, 9], indY) && global.itemSelected && global.openedInv){
		var currentItem = global.inventory[# indX, indY];
		
		if(currentItem[0] == 0){
			global.inventory[# global.currentSelectedItem[2], global.currentSelectedItem[3]] = [0, 0];
			global.inventory[# indX, indY] = [global.currentSelectedItem[0], global.currentSelectedItem[1]];
			global.currentSelectedItem = [0, 0, 0, 0];
			global.itemSelected = false;
		}
		
		//if(currentItem[0] == global.currentSelectedItem[0] && global.currentSelectedItem[2] != indX && global.currentSelectedItem[3] != indY){
		//	global.inventory[# global.currentSelectedItem[2], global.currentSelectedItem[3]] = [global.currentSelectedItem[0], global.currentSelectedItem[1] - 1];
		//	global.inventory[# indX, indY] = [global.currentSelectedItem[0], currentItem[1] + 1];
		//	global.currentSelectedItem[1] = global.currentSelectedItem[1] - 1;
			
		//}
		
	}
}
