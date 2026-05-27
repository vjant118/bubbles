extends Node2D

@export var projectile: PackedScene
@export var shootSpeed: int = 2
@export var fireRate: float = 3.0
@export var startDelay: float = 0.0

@onready var animatedSprite  = $AnimatedSprite2D

func _ready():
	animatedSprite.frame_changed.connect(_on_animated_sprite_frame_changed)
	
	if startDelay > 0:
		await get_tree().create_timer(startDelay).timeout
	$Timer.wait_time = fireRate
	animatedSprite.speed_scale = 1.0 / fireRate
	$Timer.start()

func _on_timer_timeout():
	animatedSprite.play()

func _on_animated_sprite_frame_changed():
	if animatedSprite.frame == 4:
		shoot()


func shoot():
	var bullet = projectile.instantiate()
	if owner:
		owner.add_child(bullet)
	else:
		get_parent().add_child(bullet)
	bullet.global_position = global_position
	bullet.global_rotation = global_rotation
	var direction = Vector2.RIGHT.rotated(global_rotation)
	bullet.apply_central_impulse(direction * shootSpeed * -100)
