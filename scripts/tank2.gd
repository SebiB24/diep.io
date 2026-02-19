class_name Tank2 extends Tank

func on_shoot():
	if $Timer.is_stopped():
		var bullet_pos = $barrel_1.global_position
		var bullet_dir = $barrel_1.global_position - $barrel_base_1.global_position
		shoot.emit(bullet_pos, bullet_dir)
		bullet_pos = $barrel_2.global_position
		bullet_dir = $barrel_2.global_position - $barrel_base_2.global_position
		shoot.emit(bullet_pos, bullet_dir)
		$Timer.start()
		

	
