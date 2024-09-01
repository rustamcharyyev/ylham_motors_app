// ignore_for_file: public_member_api_docs, sort_constructors_first
class OrderStatus {
  final int id;
  final String nameTm;
  final String nameRu;
  final String nameEn;

//<editor-fold desc="Data Methods">
  const OrderStatus({
    required this.id,
    required this.nameTm,
    required this.nameRu,
    required this.nameEn,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderStatus &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          nameTm == other.nameTm &&
          nameRu == other.nameRu &&
          nameEn == other.nameEn);

  @override
  int get hashCode =>
      id.hashCode ^ nameTm.hashCode ^ nameRu.hashCode ^ nameEn.hashCode;

  @override
  String toString() {
    return 'OrderStatus{'
        ' id: $id,'
        ' nameTm: $nameTm,'
        ' nameRu: $nameRu,'
        ' nameEn: $nameEn, '
        '}';
  }

  String name(String locale) {
    if (locale == 'ru') {
      return nameRu;
    } else if (locale == 'en') {
      return nameEn;
    } else {
      return nameTm;
    }
  }

  OrderStatus copyWith({
    int? id,
    String? nameTm,
    String? nameRu,
    String? nameEn,
  }) {
    return OrderStatus(
      id: id ?? this.id,
      nameTm: nameTm ?? this.nameTm,
      nameRu: nameRu ?? this.nameRu,
      nameEn: nameEn ?? this.nameEn,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name_tm': nameTm,
      'name_ru': nameRu,
      'name_en': nameEn,
    };
  }

  factory OrderStatus.fromMap(Map<String, dynamic> map) {
    return OrderStatus(
      id: map['id'] as int,
      nameTm: map['name_tm'] as String,
      nameRu: map['name_ru'] as String,
      nameEn: map['name_en'] as String,
    );
  }

//</editor-fold>
}
