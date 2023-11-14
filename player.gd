extends AnimatedSprite2D

@export_category("Stamina")
var maxStamina: float = 93
@export var stamina: float = 93
@export var staminaDelay: bool = false

@export_category("Health")
var maxHealth: int = 4
@export var health: int = 4

@export_category("State")
var stateMachine: StateMachine
@export var state: State 

@export_category("Movement")
@export var speed: int = 100
var direction: Vector2
var rollDelay: bool = false
var movePoint: Marker2D

signal stamina_change
signal health_change

# Called when the node enters the scene tree for the first time.
func _ready():
	stateMachine = $StateMachine
	change_state("idle")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if get_distance(position, movePoint.position) <= .05 and state.state_name != "rolling":
		position = movePoint.position
		
		if Input.is_action_pressed("move_left"):
			movePoint.position.x -= 32
		elif Input.is_action_pressed("move_right"):
			movePoint.position.x += 32
		elif Input.is_action_pressed("move_down"):
			movePoint.position.y += 32
		elif Input.is_action_pressed("move_up"):
			movePoint.position.y -= 32
			
	if position != movePoint.position:
		if state.state_name != "rolling":
			
			if Input.is_action_pressed("run"):
				change_state('running')
			else:
				change_state('walking')
				
			if Input.is_action_just_pressed("roll") and rollDelay == false:
				change_state('rolling')
				$RollTimer.start()
				rollDelay = true
	else: 
		change_state("idle")
		
			
	#if Input.is_action_just_released("run") and staminaDelay == true: $StaminaTimer.start()
			
	state.run(delta)
	if staminaDelay == false:
		stamina += .3
		if stamina > maxStamina: stamina = maxStamina
		stamina_change.emit()
	
	#DEbug
	
	if Input.is_action_just_pressed("debug1"):
		change_health(1)
		health_change.emit()
	if Input.is_action_just_pressed("debug2"):
		change_health(-1)
		health_change.emit()
	
func get_distance(position1, position2) -> float:
	return sqrt(pow((position1.x - position2.x), 2) + pow((position1.y - position2.y), 2))
	
func change_health(amount: int):
	health += amount
	if health > maxHealth: health = maxHealth
	elif health < 0: health = 0
	
func change_state(state_name: String):
	
	if state == null:
		state = stateMachine.get_state(state_name).new(self)
		return
		
	if state.state_name != state_name:
		state = stateMachine.get_state(state_name).new(self)
		
func _on_stamina_timer_timeout():
	staminaDelay = false

func _on_roll_timer_timeout():
	change_state("idle")
	rollDelay = false
