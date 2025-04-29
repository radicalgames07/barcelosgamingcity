extends StaticBody2D

var player_in_area = false
var is_chatting

var galo = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(_on_dialogic_signal)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player_in_area:
		if Input.is_action_just_pressed("interact"):
			if !galo:
				_run_dialogue("mestre_intro")
			if galo:
				_run_dialogue("mestre_agradecimentos")

func _run_dialogue(dialogue_string):
	is_chatting = true
	Dialogic.start(dialogue_string)

func _on_dialogue_range_area_entered(area: Area2D) -> void:
	if area.name == "Hitbox":
		player_in_area = true


func _on_dialogue_range_area_exited(area: Area2D) -> void:
	if area.name == "Hitbox":
		player_in_area = false

func _on_dialogic_signal(arg: String):
	if arg == "galo":
		galo = true
