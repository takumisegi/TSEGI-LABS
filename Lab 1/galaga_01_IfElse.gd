extends Sprite2D

@export var health = 10
@export var booleanVar = true

@export var speed = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_right"):
		position.x += speed
	if Input.is_action_pressed("ui_left"):
		position.x += -speed
	if Input.is_action_pressed("ui_up"):
		position.y += -speed
	if Input.is_action_pressed("ui_down"):
		position.y += speed
	
		#if Input . is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			#position.x += 1.
		
		
		#if health < 0:
			#hide()
		#else:
			#show()
		
		
