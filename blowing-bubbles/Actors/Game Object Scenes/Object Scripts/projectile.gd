extends RigidBody2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if(get_contact_count() > 0):
		queue_free()
