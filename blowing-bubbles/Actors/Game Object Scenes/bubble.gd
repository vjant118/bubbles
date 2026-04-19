extends RigidBody2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	check_hazard()

 
func check_hazard(): 
	var bodies = get_colliding_bodies()
	
	for body in bodies:
		if body.is_in_group("hazards"):
			print("Bubble popped")
			queue_free()
