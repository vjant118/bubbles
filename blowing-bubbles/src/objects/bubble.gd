extends RigidBody2D



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	check_bodies()
 
func check_bodies(): 
	var bodies = get_colliding_bodies()
	
	for body in bodies:
		if body.is_in_group("hazards"):
			print("Bubble popped")
			queue_free()
