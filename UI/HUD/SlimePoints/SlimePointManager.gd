extends Node


@export var sPoint_obj: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setup_pointManager(player_sPoint: int, player_maxSPoint: int):
	var x = 32
	for i in range(player_maxSPoint):
		var temp: Node = sPoint_obj.instantiate()
		temp.position.x = x
		x += 16
		temp.position.y = 32
		temp.setup("empty")
		add_child(temp)
		
	for i in range(player_sPoint):
		get_child(i).setup("full")

func change_points(new_amount: int):
	for i in range(get_child_count()):
		get_child(i).setup("empty")
	
	for i in range(new_amount):
		get_child(i).setup("full")
			
