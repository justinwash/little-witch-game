extends "res://old/inventory/Item.gd"

class_name Elderberry

var tex = preload("res://old/items/Elderberry/Elderberry.png")

func _init():
	id = 1
	item_name = "Elderberry"
	quantity = 0
	price = 1
	description = "A berry that grows on bushes"
	texture = tex
