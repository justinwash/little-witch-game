extends "res://old/inventory/Item.gd"

class_name WeakPotionOfGreaterEnergy

var tex = preload("res://old/items/WeakPotionOfGreaterEnergy/WeakPotionOfGreaterEnergy.png")

func _init():
	id = 54
	item_name = "Weak Potion of Greater Energy"
	quantity = 0
	price = 70
	description = "A weak potion, buzzing with power."
	texture = tex

