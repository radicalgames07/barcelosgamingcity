extends Area2D

var player_in_area = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player_in_area:
		if Input.is_action_just_pressed("interact"):
			Dialogic.start("livro_5")




func _on_area_entered(area: Area2D) -> void:
	if area.name == "Hitbox":
		player_in_area = true
		
func _on_area_exited(area: Area2D) -> void:
	if area.name == "Hitbox":
		player_in_area = false
