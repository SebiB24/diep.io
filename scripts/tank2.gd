class_name Tank2 extends Tank

func on_shoot():
	if shoot_timer.is_stopped():
		var bullet_pos = $Barrels.get_child(0).global_position
		var bullet_dir = $Barrels.get_child(0).global_position - $Barrels.get_child(2).global_position
		shoot.emit(bullet_pos, bullet_dir)
		sound_shoot.play()
		bullet_pos = $Barrels.get_child(1).global_position
		bullet_dir = $Barrels.get_child(1).global_position - $Barrels.get_child(3).global_position
		shoot.emit(bullet_pos, bullet_dir)
		shoot_timer.start()


	
