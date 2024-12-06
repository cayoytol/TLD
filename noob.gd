extends CharacterBody2D

@export var speed = 200  # Скорость движения персонажа

func _ready():
	print("Скрипт прикреплен и запущен. Персонаж готов к движению.")

func _physics_process(delta):
	# Обнуляем текущую скорость по оси X
	velocity.x = 0

	# Управление движением влево и вправо
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
		if not $AnimatedSprite2D.is_playing() or $AnimatedSprite2D.animation != "Run":
			print("Движение вправо, запускаем анимацию 'Run'")
			$AnimatedSprite2D.play("Run")
		$AnimatedSprite2D.flip_h = false

	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed
		if not $AnimatedSprite2D.is_playing() or $AnimatedSprite2D.animation != "Run":
			print("Движение влево, запускаем анимацию 'Run'")
			$AnimatedSprite2D.play("Run")
		$AnimatedSprite2D.flip_h = true

	else:
		if not $AnimatedSprite2D.is_playing() or $AnimatedSprite2D.animation != "Idle":
			print("Персонаж стоит на месте, запускаем анимацию 'Idle'")
			$AnimatedSprite2D.play("Idle")

	# Применение скорости к персонажу
	move_and_slide()
