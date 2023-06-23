class Layanan {
  final String id;
  final String namaLayanan;
  final String harga_layanan;

  Layanan({
    required this.id,
    required this.namaLayanan,
    required this.harga_layanan,
  });

  factory Layanan.fromJson(Map<String, dynamic> json) {
    return Layanan(
      id: json['id'],
      namaLayanan: json['nama_layanan'],
      harga_layanan: json['harga_layanan'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama_layanan': namaLayanan,
      'harga_layanan': harga_layanan,
    };
  }
}
