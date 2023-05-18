
class CategoryModel{

  String? id;
  List<dynamic>? icons;
  String? href;
  String? name;
  String? type;

//<editor-fold desc="Data Methods">
  CategoryModel({
    this.id,
    this.icons,
    this.href,
    this.name,
    this.type,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          icons == other.icons &&
          href == other.href &&
          name == other.name &&
          type == other.type);

  @override
  int get hashCode =>
      id.hashCode ^
      icons.hashCode ^
      href.hashCode ^
      name.hashCode ^
      type.hashCode;

  @override
  String toString() {
    return 'CategoryModel{' +
        ' id: $id,' +
        ' icons: $icons,' +
        ' href: $href,' +
        ' name: $name,' +
        ' type: $type,' +
        '}';
  }

  CategoryModel copyWith({
    String? id,
    List<dynamic>? icons,
    String? href,
    String? name,
    String? type,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      icons: icons ?? this.icons,
      href: href ?? this.href,
      name: name ?? this.name,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'icons': this.icons,
      'href': this.href,
      'name': this.name,
      'type': this.type,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as String,
      icons: map['icons'] as List<dynamic>,
      href: map['href'] as String,
      name: map['name'] as String,
      type: map['type'] as String,
    );
  }

//</editor-fold>
}