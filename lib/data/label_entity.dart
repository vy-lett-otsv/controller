class LabelEntity {
  final String id;
  String name;
  String color;
  String? description;

  LabelEntity({
    required this.id,
    required this.name,
    required this.color,
    this.description,
  });

  factory LabelEntity.fromJson(Map<String, dynamic> json) {
    return LabelEntity(
      id: json["_id"],
      name: json["name"],
      color: json["color"],
      description: json["description"],
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "color": color,
    "description": description,
  };

  Map<String, dynamic> toJsonUpdate() => {
    "id": id,
    "name": name
  };
}
