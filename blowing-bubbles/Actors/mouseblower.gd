extends Area2D

func _process(_delta):
	global_position = get_global_mouse_position()
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		print("Button press")
		$CollisionShape2D.set_deferred("disabled", false)
		$Sprite2D.set_deferred("visible", true)
	else:
		print("Button not pressed")
		$CollisionShape2D.set_deferred("disabled", true)
		$Sprite2D.set_deferred("visible", false)
		
