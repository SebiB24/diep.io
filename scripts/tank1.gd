class_name Tank1 extends Tank

func shoot_bullets():
	var bullet_pos = $Barrels.get_child(0).global_position
	var bullet_dir = $Barrels.get_child(0).global_position - $Barrels.get_child(1).global_position
	shoot.emit(bullet_pos, bullet_dir)
	
	# apply recoil force in the opposite direction of the bullet
	force = bullet_dir.normalized() * -15.0  
