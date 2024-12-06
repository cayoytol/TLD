extends Node2D


# Таймер для вывода FPS каждые 2 секунды
var timer = 0.0

func _process(delta):
	# Увеличиваем таймер
	timer += delta
	
	# Каждые 2 секунды выводим FPS
	if timer >= 1.0:
		var fps = Engine.get_frames_per_second()
		print("FPS: ", fps)
		timer = 0.0  # Сброс таймера



func _on_texture_button_pressed() -> void:
	get_tree().change_scene_to_file("res://1 level.tscn")
