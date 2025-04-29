extends Node

var poster1 = false
var poster2 = false
var poster3 = false
var galo2 = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(_check_posters)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if poster1 and poster2 and poster3 and !galo2:
		print("galo2p")
		galo2 = true
		Dialogic.start("galo2")

func _check_posters(arg: String):
	if arg == "poster1":
		poster1 = true
	if arg == "poster2":
		poster2 = true
	if arg == "poster3":
		poster3 = true
	
