extends Node

var galo1 = false
var galo2 = false
var galo = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(_on_dialogic_signal)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if galo1 && galo2 && !galo:
		galo = true	

func _on_dialogic_signal(arg: String) -> void:
	if arg == "galo1":
		var galo1 = true
		print("galo1")
