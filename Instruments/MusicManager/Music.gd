extends AudioStreamPlayer


var MainMusic = preload("res://sound/Lo-fi gamejam.ogg")


func play_main():
	self.set_stream(MainMusic)
	self.play()
