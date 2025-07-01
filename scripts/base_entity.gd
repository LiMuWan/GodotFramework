extends RefCounted

class_name BaseEntity

var id: int

func _init(data = null):
	if data != null and data is Dictionary:
		if data.has("id"):
			id = data.id
