extends Node2D

onready var Levels = [
	$ROOMS/ROOM_1,
	$ROOMS/ROOM_2,
	$ROOMS/ROOM_3,
	$ROOMS/ROOM_4,
	$ROOMS/ROOM_5
]

var currentLevel = 0


func _ready():
	$EffectsLayer.show()
	$ShaderLayer.show()
	
	Levels[currentLevel].activate()
	$Camera2D.move_to(Levels[currentLevel])
	#_on_win_room()

func _input(event: InputEvent):
	if event.is_action('press_mouse') and not event.is_pressed():
		get_tree().call_group("FURNITURE", "disable_click")
	elif event.is_action_pressed('ui_accept'):
		_on_win_room()



func _on_win_room():
	if currentLevel == Levels.size()-1:
		print('FINAL WIN')
		return
		
	currentLevel += 1;
	$UI/currentLevel.text = "LEVEL " + str(currentLevel+1) + "/" + str(Levels.size())
	Levels[currentLevel].activate()
	$Camera2D.move_to(Levels[currentLevel])
	$UI/SOLUTION.show_image(currentLevel)


func _on_Reset_button_down():
	Levels[currentLevel].reset()
