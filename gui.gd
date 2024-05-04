extends CanvasLayer

@onready var labelka : Label = %Label
@onready var fps : Label = %fps_label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	labelka.text = "Host OS: " + OS.get_name()

func _physics_process( _delta : float) -> void:
	fps.text = "FPS: " + str( Engine.get_frames_per_second() )
