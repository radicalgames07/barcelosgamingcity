extends CharacterBody2D

@export var speed := 100
var direction
func _ready() -> void:
	direction = ""

func _physics_process(delta):
	var input_vector := Vector2.ZERO
	
	
	if Input.is_action_pressed("move_up"):
		input_vector.y = -1
		direction = "up"
		$Sprite.play("Move_up")
	elif Input.is_action_pressed("move_down"):
		input_vector.y = 1
		direction = "down"
		$Sprite.play("Move_down")
	elif Input.is_action_pressed("move_left"):
		input_vector.x = -1
		direction = "left"
		$Sprite.play("Move_left")
	elif Input.is_action_pressed("move_right"):
		input_vector.x = 1
		direction = "right"
		$Sprite.play("Move_right")

	# Normalize to prevent faster diagonal speed (even though diagonals are blocked)
	velocity = input_vector.normalized() * speed
	if(velocity.x == 0 && velocity.y == 0):
		match direction:
			"up":
				$Sprite.play("Idle_up")
			"down":
				$Sprite.play("Idle_down")
			"left":
				$Sprite.play("Idle_Left")
			"right":
				$Sprite.play("Idle_right")
	
	move_and_slide()
