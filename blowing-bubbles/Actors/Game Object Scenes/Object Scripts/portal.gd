extends Area2D

@export var linkedPortal: Area2D
@export var cooldownTime: float = 2.0

# Called when the node enters the scene tree for the first time.
func _on_body_entered(body):
	if not linkedPortal:
		return 
	
	if body.has_meta("teleporting"):
		return
	
	var targetPos = linkedPortal.global_position
	
	if body.is_in_group("player") or body.is_in_group("hazards"):
		PhysicsServer2D.body_set_state(
			body.get_rid(),
			PhysicsServer2D.BODY_STATE_TRANSFORM,
			Transform2D(body.global_rotation, targetPos)
		)
	
	linkedPortal.togglePortal(cooldownTime)
	
	
func togglePortal(duration: float):
	monitoring = false
	modulate.a = 0.5
	
	await get_tree().create_timer(duration).timeout
	
	monitoring = true
	modulate.a = 1.0
