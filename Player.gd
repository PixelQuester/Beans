extends CharacterBody2D

@export var speed : float = 600.0

@export var weapon_strength : float = 500.0

var is_attacking := false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	var ymove = Input.get_axis("player_up","player_down")
	var xmove = Input.get_axis("player_left","player_right")
	var direction = Vector2(xmove, ymove).normalized()
	
	if is_attacking:
		$Weapon.show()
		for body in $Weapon/Area2D.get_overlapping_bodies():
			if body.has_method("knockback"):
				print("WHAM")
				body.knockback(global_position, weapon_strength)
	else:
		$Weapon.rotation = (get_global_mouse_position()-global_position).angle() + PI/4
		$Weapon.hide()
	
	global_position += direction * delta * speed
	
func _input(event):
	if event.is_action_pressed("hammer") and is_attacking == false:
		print("Beans")
		is_attacking = true
		await get_tree().create_timer(.5).timeout
		is_attacking = false
