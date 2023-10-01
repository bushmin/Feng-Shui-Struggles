extends AudioStreamPlayer


var Win = preload("res://sound/win_bell.ogg")


func play_win():
	self.set_stream(Win)
	self.play()
