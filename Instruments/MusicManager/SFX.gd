extends AudioStreamPlayer

var scratchingTimer = 0
const MAX_SCRATCH_TIMER = 20

var Win = preload("res://sound/win_bell.ogg")
var Glass = preload("res://sound/glass_long.ogg")
var Scratch = preload("res://sound/scratch.ogg")

func _ready():
	set_bus('SFX')

func _physics_process(delta):
	if scratchingTimer <=0:
		$scratch.stop()
	else:
		scratchingTimer -= 1

func play_win():
	self.set_stream(Win)
	self.set_pitch_scale(1)
	self.play()


func play_glass():
	self.set_stream(Glass)
	self.set_pitch_scale(4)
	self.play()
	self.seek(0.6)

func start_scratch():
	if scratchingTimer >0: return
	scratchingTimer = MAX_SCRATCH_TIMER
	$scratch.set_stream(Scratch)
	$scratch.set_pitch_scale(1)
	$scratch.play()
	$scratch.seek(rand_range(0.0, 16.0))
	
