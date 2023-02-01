extends Node

var elapsed = 0

func _ready() -> void:
	InputHelper.connect("device_changed", self, "_on_input_device_changed")


func _on_input_device_changed(device: String, device_index: int) -> void:
	print("XBox? ", device == InputHelper.DEVICE_XBOX_CONTROLLER)
	print("Device index? ", device_index)
	print("Device name? ", InputHelper.guess_device_name())
	


# `pre_start()` is called when a scene is loaded.
# Use this function to receive params from `Game.change_scene(params)`.
func pre_start(params):
	var cur_scene: Node = get_tree().current_scene
	print("Current scene is: ", cur_scene.name, " (", cur_scene.filename, ")")
	print("gameplay.gd: pre_start() called with params = ")
	if params:
		for key in params:
			var val = params[key]
			printt("", key, val)
	$Sprite.position = Game.size / 2
	print("Processing...")
	yield(get_tree().create_timer(1), "timeout")
	print("Done")


# `start()` is called when the graphic transition ends.
func start():
	print("gameplay.gd: start() called")



func _process(delta):
	elapsed += delta
	$Sprite.position.x = Game.size.x / 2 + 150 * sin(2 * 0.4 * PI * elapsed)
	$Sprite.position.y = Game.size.y / 2 + 100 * sin(2 * 0.2 *  PI * elapsed)
