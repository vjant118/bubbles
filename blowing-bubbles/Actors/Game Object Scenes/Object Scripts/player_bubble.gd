extends RigidBody2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	if ! freeze: 
		check_bodies()
		checkWin()

func check_bodies(): 
	var bodies = get_colliding_bodies()
	
	for body in bodies:
		if body.is_in_group("hazards"):
			%Timer.stopTimer()
			$AnimatedSprite2D.hide()
			$McIdle.hide()
			$AudioStreamPlayer.play
			set_deferred("freeze", true)
			$CanvasLayer/DiedUi.show()
			
			
func checkWin():
	var bodies = $Area2D.get_overlapping_areas()
	
	for body in bodies:
		if body.is_in_group("levelEndPoint"):
			%Timer.stopTimer()
			set_deferred("freeze", true)
			$CanvasLayer/Control.show()
			$CanvasLayer/Control/ColorRect/Label2.text = "Time: " + str(%Timer.text)
