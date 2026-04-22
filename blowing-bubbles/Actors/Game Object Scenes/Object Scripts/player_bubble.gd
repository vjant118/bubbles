extends RigidBody2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	check_bodies()
	checkWin()

func check_bodies(): 
	var bodies = get_colliding_bodies()
	
	for body in bodies:
		if body.is_in_group("hazards"):
			print("Bubble popped")
			queue_free()
			
func checkWin():
	var bodies = $Area2D.get_overlapping_areas()
	
	for body in bodies:
		if body.is_in_group("levelEndPoint"):
			%Timer.stopTimer()
