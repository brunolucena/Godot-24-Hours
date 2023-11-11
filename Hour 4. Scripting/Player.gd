extends Node2D

signal shot(damage)
signal shot_by_friendly(ally)
signal died()

var health = 250.0

func im_calling_you():
	print('called me ')

func _ready() -> void:
	self.connect("died", self, "on_death")
	self.connect("shot", self, "on_shot")
	self.connect("shot_by_friendly", self, "on_shot_by_friendly")

func on_death() -> void:
	print('died')
	self.queue_free()

func on_shot(damage: int):
	print('on shot', damage)

func shot_by_friendly(friend) -> void:
	print('shot by friend ', friend)

func _on_Area2D_area_exited(area: Area2D) -> void:
	print('area exited', area)

func _on_Area2D_area_entered(area: Area2D) -> void:
	print("area entered")
	if area.is_in_group("bullet"):
		emit_signal("shot", area.owner.damage)

		if area.owner.is_in_group("ally"):
			emit_signal("shot_by_friendly", area.owner)

		health -= area.owner.damage

		if health < 0:
			emit_signal("died")

		print("health is ", health)
		print("owner is ", area.owner)
		print("parent is ", area.get_parent())

		area.owner.queue_free()
