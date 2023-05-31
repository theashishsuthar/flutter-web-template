class LenderModel {
  LenderModel({
    this.subtitle,
    this.isSelected,
    this.name,
    this.id,
  });
  String? id;
  String? subtitle;
  bool? isSelected;
  String? name;

  factory LenderModel.fromJson(Map<String, dynamic> json) => LenderModel(
        id: json["id"],
        subtitle: json["subtitle"],
        isSelected: json["isSelected"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() =>
      {"subtitle": subtitle, "isSelected": isSelected, "name": name, "id": id};
}
