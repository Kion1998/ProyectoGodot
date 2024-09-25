extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Variables de movimiento
var velocidad = 200  # Velocidad del personaje
var direccion = Vector2.ZERO  # Dirección de movimiento

# Función para detectar la entrada de teclas y mover al personaje
func _process(delta):
	direccion = Vector2.ZERO  # Reiniciar la dirección

	# Detectar las teclas de movimiento
	if Input.is_action_pressed("move_right"):
		direccion.x += 1
	if Input.is_action_pressed("move_left"):
		direccion.x -= 1
	if Input.is_action_pressed("move_down"):
		direccion.y += 1
	if Input.is_action_pressed("move_up"):
		direccion.y -= 1

	# Si el personaje se está moviendo, normalizamos la dirección para evitar velocidad diagonal más alta
	if direccion != Vector2.ZERO:
		direccion = direccion.normalized()

	# Aplicar el movimiento
	velocity = direccion * velocidad
	move_and_slide()
