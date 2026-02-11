extends Node

const BASE_TICK_TIME: float = 2

var tick_time: float = BASE_TICK_TIME

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_decrement_ticks(delta)
	
	if (tick_time <= 0):
		_on_tick()

func _decrement_ticks(delta: float):
	tick_time -= delta

func _on_tick():
	SignalBus.on_tick.emit()
	tick_time = _get_tick_time()

func _get_tick_time() -> float:
	return BASE_TICK_TIME
