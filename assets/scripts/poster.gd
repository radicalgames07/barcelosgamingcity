extends Node

var player_in_area = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("area_entered", Callable(self, "_on_area_entered"))
	connect("area_exited", Callable(self, "_on_area_exited"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player_in_area:
		if Input.is_action_just_pressed("interact"):
			var timeline = String(self.name)
			Dialogic.start(timeline)
			queue_free()


func _on_area_entered(area: Area2D):
	if area.name == "Hitbox":
		player_in_area = true
		
func _on_area_exited(area: Area2D):
	if area.name == "Hitbox":
		player_in_area = false
