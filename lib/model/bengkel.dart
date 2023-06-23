class Bengkel {
  String? id;
  String nama_bengkel;
  String id_layanan_bengkel;
  String no_hp_bengkel;
  String id_user;
  String id_layanan;

  Bengkel({
    this.id,
    required this.nama_bengkel,
    required this.id_layanan_bengkel,
    required this.no_hp_bengkel,
    required this.id_user,
    required this.id_layanan,
  });

  factory Bengkel.fromJson(Map<String, dynamic> json) => Bengkel(
        id: json["id"],
        nama_bengkel: json['nama_bengkel'],
        id_layanan_bengkel: json['id_layanan_bengkel'],
        no_hp_bengkel: json['no_hp_bengkel'],
        id_user: json['id_user'],
        id_layanan: json['id_layanan'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_bengkel": nama_bengkel,
        "id_layanan_bengkel": id_layanan_bengkel,
        "no_hp_bengkel": no_hp_bengkel,
        "id_user": id_user,
        "id_layanan": id_layanan,
      };
}
