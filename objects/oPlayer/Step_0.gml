if(!global.openedInv){
	if(keyboard_check(ord("A")) && !keyboard_check(ord("W")) && !keyboard_check(ord("S"))){
		hspeed = -Speed;
	} 

	if(keyboard_check(ord("D")) && !keyboard_check(ord("W")) && !keyboard_check(ord("S"))){
		hspeed = Speed;
	} 

	if(keyboard_check(ord("W")) && !keyboard_check(ord("A")) && !keyboard_check(ord("D"))){
		vspeed = -Speed;
	} 

	if(keyboard_check(ord("S")) && !keyboard_check(ord("A")) && !keyboard_check(ord("D"))){
		vspeed = Speed;
	} 

	if(keyboard_check(ord("W")) && keyboard_check(ord("A"))){
		hspeed = -Speed;
		vspeed = -Speed/2;
	}

	if(keyboard_check(ord("S")) && keyboard_check(ord("A"))){
		hspeed = -Speed;
		vspeed = Speed/2;
	}

	if(keyboard_check(ord("W")) && keyboard_check(ord("D"))){
		hspeed = Speed;
		vspeed = -Speed/2;
	}

	if(keyboard_check(ord("S")) && keyboard_check(ord("D"))){
		hspeed = Speed;
		vspeed = Speed/2;
	}
}