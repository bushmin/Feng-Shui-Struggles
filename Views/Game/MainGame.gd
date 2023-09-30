extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	if event.is_action('press_mouse') and not event.is_pressed():
		get_tree().call_group("FURNITURE", "disable_click")
	elif event is InputEventMouseMotion:
		get_tree().call_group("FURNITURE", "move_mouse", event)
