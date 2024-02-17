class DataAduan {
  final List<Aduan> data;
  DataAduan({required this.data});
  factory DataAduan.fromJson(Map<String, dynamic> json) => DataAduan(
        data: List.from(json['data'].map((aduan) => Aduan.fromModel(aduan))),
      );
}

class Aduan {
  final int id;
  final String noTracking;
  final String judulKeluhan;
  final String keluhan;
  final String kategori;
  final String status;

  Aduan({
    required this.id,
    required this.noTracking,
    required this.judulKeluhan,
    required this.keluhan,
    required this.kategori,
    required this.status,
  });

  factory Aduan.fromModel(Map<String, dynamic> json) => Aduan(
      id: json['id'],
      noTracking: json['no_tracking'],
      judulKeluhan: json['judul_keluhan'],
      keluhan: json['keluhan'],
      kategori: json['kategori'],
      status: json['status']);
}
