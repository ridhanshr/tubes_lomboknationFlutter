class HotelJsonModel {
  final int id;
  final String judul;
  final int categoryId;
  final String lokasi;
  final String deskripsi;
  final String image;
  final DateTime createdAt;
  final DateTime updatedAt;

  const HotelJsonModel({
    required this.id,
    required this.judul,
    required this.categoryId,
    required this.lokasi,
    required this.deskripsi,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  factory HotelJsonModel.fromJson(Map<String, dynamic> json) {
    return HotelJsonModel(
      id: json["id"] as int,
      judul: json["judul"] as String,
      categoryId: json["category_id"] as int,
      lokasi: json["lokasi"] as String,
      deskripsi: json["deskripsi"] as String,
      image: json["image"] == null ? null : json["image"],
      createdAt: DateTime.parse(json["created_at"]) as DateTime,
      updatedAt: DateTime.parse(json["updated_at"]) as DateTime,
    );
  }
}
