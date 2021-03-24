extends Node

export(String, "DAY", "NIGHT") var TIME
export (NodePath) var TWEEN

onready var night_overlay = $NightOverlay
onready var tween = get_node(TWEEN)
onready var days = $Days

onready var current_day = days.get_node("1")

func _ready():
	set_daytime()
	current_day.day_start()
	
func next_day():
	current_day = days.get_node(str(int(current_day.name) + 1))
	
func set_daytime():
	TIME = "DAY"
	tween.interpolate_property(night_overlay, "color",
		night_overlay.color, Color(0, 0, 0, 0), 3,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	
func set_nighttime():
	TIME = "NIGHT"
	tween.interpolate_property(night_overlay, "color",
		night_overlay.color, Color(0, 0, 0, 0.5), 3,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
