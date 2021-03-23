tool

extends Node

export(String, "DAY", "NIGHT") var TIME
export (NodePath) var TWEEN

onready var night_overlay = $NightOverlay
onready var tween = get_node(TWEEN)

func _ready():
	set_day()
	
func set_day():
	TIME = "DAY"
	tween.interpolate_property(night_overlay, "color",
		night_overlay.color, Color(0, 0, 0, 0), 3,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	
func set_night():
	TIME = "NIGHT"
	tween.interpolate_property(night_overlay, "color",
		night_overlay.color, Color(0, 0, 0, 0.5), 3,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
