class_name AddButton extends Button

func _on_button_down() -> void:
	SignalBus.add_currency.emit(1)
