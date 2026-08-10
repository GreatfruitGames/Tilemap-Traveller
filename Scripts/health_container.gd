extends HBoxContainer

@export var icons : Array[AnimatedSprite2D]
var living : Array[bool]
var nums : Array [int]


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for icon in icons:
		living.append(true)
		var number = randi_range(0,4)
		nums.append(number)
		icon.frame = number
	blink()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func blink():
	await get_tree().create_timer(randf_range(1.0,5.0)).timeout
	var chosen = randi_range(0,icons.size() - 1)
	var selected = icons[chosen]
	if living[chosen] == true:
		selected.frame = 5
		await get_tree().create_timer(randf_range(0,1)).timeout
		selected.frame = nums[chosen]
	blink()

func kill_heart():
	var value = false
	var times = 0
	var index = 5
	while value != true and times < 5:
		value = living[4-times]
		times += 1
		index -= 1
	living[index] = false
	icons[index].frame = 6
	
