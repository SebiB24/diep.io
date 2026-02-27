class_name Tank1 extends Tank

func on_shoot():
	if shoot_timer.is_stopped():
		sound_shoot.play()
		var bullet_pos = $Barrels.get_child(0).global_position
		var bullet_dir = $Barrels.get_child(0).global_position - $Barrels.get_child(1).global_position
		force = bullet_dir.normalized() * -15.0  
		shoot.emit(bullet_pos, bullet_dir)
		shoot_timer.start()
