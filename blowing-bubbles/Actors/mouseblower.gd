extends Area2D

@export var wind_force: float = 2.5

func _process(_delta):
	global_position = get_global_mouse_position()
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		print("Button press")
		$CollisionShape2D.set_deferred("disabled", false)
		$Sprite2D.set_deferred("visible", true)
		blow()
	else:
		print("Button not pressed")
		$CollisionShape2D.set_deferred("disabled", true)
		$Sprite2D.set_deferred("visible", false)
		
func blow():
	var bodies = get_overlapping_bodies()
	
	for body in bodies:
		if body is RigidBody2D:
			var direction = (body.global_position - global_position).normalized()
			body.apply_central_impulse(direction * wind_force)
