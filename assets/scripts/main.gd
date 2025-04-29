extends Node2D

var mestre_fora = false
var mestre_dentro = false

var torre_fora = false
var torre_dentro = false
var entrou_torre = false

var rua_d_fora = false
var rua_d_dentro = false

var teatro_fora = false
var teatro_dentro = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogic.signal_event.connect(_on_dialogic_signal)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if mestre_fora:
		if Input.is_action_just_pressed("move_up"):	
			$MainCam.position = Vector2(274, -350)
			$MainCam.zoom = Vector2(2, 2)
			$Tiago.position = Vector2(272, -290)
	
	if mestre_dentro:
		if Input.is_action_just_pressed("move_down"):
			$MainCam.position = Vector2(0, 0)
			$MainCam.zoom = Vector2(1, 1)
			$Tiago.position = Vector2(256, -78)


	if torre_fora:
		if Input.is_action_just_pressed("move_up"):
			$MainCam.position = Vector2(672,411)
			$MainCam.zoom = Vector2(1.5, 1.5)
			$Tiago.position = Vector2(672, 494)
			if !entrou_torre:
				Dialogic.start("fantasma_intro")
				entrou_torre = true
	
	if torre_dentro:
		if Input.is_action_just_pressed("move_down"):
			$MainCam.position = Vector2(768,48)
			$MainCam.zoom = Vector2(1, 1)
			$Tiago.position = Vector2(625, 181)
	
	
	if rua_d_fora:
		if Input.is_action_just_pressed("move_right"):
			$MainCam.position = Vector2(768,48)
			$MainCam.zoom = Vector2(1, 1)
			$Tiago.position = Vector2(496, -50)
	
	if rua_d_dentro:
		if Input.is_action_just_pressed("move_left"):
			$MainCam.position = Vector2(0, 0)
			$MainCam.zoom = Vector2(1, 1)
			$Tiago.position = Vector2(275, -36)
			
	if teatro_fora:
		if Input.is_action_just_pressed("move_down"):
			$MainCam.position = Vector2(0, 485)
			$MainCam.zoom = Vector2(1.5, 1.5)
			$Tiago.position = $Teatro_Dentro.position
	
	if teatro_dentro:
		if Input.is_action_just_pressed("move_up"):
			$MainCam.position = Vector2(0, 0)
			$MainCam.zoom = Vector2(1, 1)
			$Tiago.position = $Teatro_Fora.position
# mestre casa
func _on_entrada_mestre_area_entered(area: Area2D) -> void:
	if area.name == "Hitbox":
		mestre_fora = true

func _on_entrada_mestre_area_exited(area: Area2D) -> void:
	if area.name == "Hitbox":
		mestre_fora = false


func _on_saida_mestre_area_entered(area: Area2D) -> void:
	if area.name == "Hitbox":
		mestre_dentro = true

func _on_saida_mestre_area_exited(area: Area2D) -> void:
	if area.name == "Hitbox":
		mestre_dentro = false


#torre
func _on_entrada_torre_area_entered(area: Area2D) -> void:
	if area.name == "Hitbox":
		torre_fora = true

func _on_entrada_torre_area_exited(area: Area2D) -> void:
	if area.name == "Hitbox":
		torre_fora = false


func _on_saida_torre_area_entered(area: Area2D) -> void:
	if area.name == "Hitbox":
		torre_dentro = true

func _on_saida_torre_area_exited(area: Area2D) -> void:
	if area.name == "Hitbox":
		torre_dentro = false
		

#rua_d
func _on_rua_d_entrada_area_entered(area: Area2D) -> void:
	if area.name == "Hitbox":
		rua_d_fora = true
		

func _on_rua_d_entrada_area_exited(area: Area2D) -> void:
	if area.name == "Hitbox":
		rua_d_fora = false


func _on_rua_d_saida_area_entered(area: Area2D) -> void:
	if area.name == "Hitbox":
		rua_d_dentro = true

func _on_rua_d_saida_area_exited(area: Area2D) -> void:
	if area.name == "Hitbox":
		rua_d_dentro = false

#Teatro
func _on_teatro_fora_area_entered(area: Area2D) -> void:
	if area.name == "Hitbox":
		teatro_fora = true	

func _on_teatro_fora_area_exited(area: Area2D) -> void:
	if area.name == "Hitbox":
		teatro_fora = false	


func _on_teatro_dentro_area_entered(area: Area2D) -> void:
	if area.name == "Hitbox":
		teatro_dentro = true	

func _on_teatro_dentro_area_exited(area: Area2D) -> void:
	if area.name == "Hitbox":
		teatro_dentro = false	

func _on_dialogic_signal(arg: String):
	if arg == "fim":
		$MainCam.position_smoothing_enabled = false
		$MainCam.position = Vector2(-1055, 0)
		$MainCam.zoom = Vector2(0, 0)
