extends Node2D

var door_opened = false  # Флаг для отслеживания, была ли дверь уже открыта

func _ready():
	# Подключаем сигнал animation_finished, если он ещё не подключён в редакторе
	var anim_player = get_node("AnimationPlayer")
	if anim_player:
		anim_player.connect("animation_finished", Callable(self, "_on_AnimationPlayer_animation_finished"))
	else:
		print("Ошибка: Узел 'AnimationPlayer' не найден в _ready()")

	# Запуск анимации первой двери для проверки
	var door1_anim_player = get_node("AnimationPlayer1")
	if door1_anim_player:
		if door1_anim_player.has_animation("doorscayo"):
			print("Запуск анимации 'doorscayo' вручную")
			door1_anim_player.play("doorscayo")

func _process(delta):
	# Проверяем, двигается ли игрок влево или вправо и анимация двери ещё не запущена
	if (Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left")) and not door_opened:
		var anim_player = get_node("AnimationPlayer")  # Ссылаемся на узел AnimationPlayer, который управляет дверью
		if anim_player:
			if anim_player.has_animation("doorsopen"):
				print("Игрок двигается, запускаем анимацию 'doorsopen'")
				anim_player.play("doorsopen")
				door_opened = true  # Устанавливаем флаг, чтобы не запускать анимацию повторно
			else:
				print("Ошибка: Анимация 'doorsopen' не найдена в AnimationPlayer")
		else:
			print("Ошибка: Узел 'AnimationPlayer' не найден")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "doorsopen":
		print("Первая анимация завершена, запускаем падение дверей")

		# Запуск падения первой двери
		var door1_anim_player = get_node("AnimationPlayer1")
		if door1_anim_player:
			print("Узел 'AnimationPlayer1' найден")
			if door1_anim_player.has_animation("doorscayo"):
				print("Анимация 'doorscayo' найдена для первой двери, запускаем её")
				door1_anim_player.play("doorscayo")
			else:
				print("Ошибка: Анимация 'doorscayo' не найдена для первой двери")
		else:
			print("Ошибка: Узел 'AnimationPlayer1' не найден")

		# Запуск падения второй двери
		var door2_anim_player = get_node("AnimationPlayer2")
		if door2_anim_player:
			print("Узел 'AnimationPlayer2' найден")
			if door2_anim_player.has_animation("doorsfalling2"):
				print("Анимация 'doorsfalling2' найдена для второй двери, запускаем её")
				door2_anim_player.play("doorsfalling2")
			else:
				print("Ошибка: Анимация 'doorsfalling2' не найдена для второй двери")
		else:
			print("Ошибка: Узел 'AnimationPlayer2' не найден")
