class_name Tank1 extends Tank

func on_shoot():
	if $Timer.is_stopped():
		$Sound.play()
		var bullet_pos = $barrel.global_position
		var bullet_dir = $barrel.global_position - $barrle_base.global_position
		force = bullet_dir.normalized() * -15.0  
		shoot.emit(bullet_pos, bullet_dir)
		$Timer.start()
