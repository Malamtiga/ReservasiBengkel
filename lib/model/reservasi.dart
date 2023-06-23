class Bengkel {
  final String id;
  final DateTime tanggalreservasi;
  final String nama_bengkel;
  final String alamat_bengkel;
  final String nama_pemesan;
  final String alamat_pemesan;
  final String no_hp_pemesan;

  Bengkel({
    required this.id,
    required this.tanggalreservasi,
    required this.nama_bengkel,
    required this.alamat_bengkel,
    required this.nama_pemesan,
    required this.alamat_pemesan,
    required this.no_hp_pemesan,
  });

  factory Bengkel.fromJson(Map<String, dynamic> json) {
    return Bengkel(
      id: json['id'].toString(),
      tanggalreservasi: DateTime.parse(json['tanggalreservasi']),
      nama_bengkel: json['nama_bengkel'],
      alamat_bengkel: json['alamat_bengkel'],
      nama_pemesan: json['nama_pemesan'],
      alamat_pemesan: json['alamat_pemesan'],
      no_hp_pemesan: json['no_hp_pemesan'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tanggalreservasi': tanggalreservasi.toString(),
      'nama_bengkel': nama_bengkel,
      'alamat_bengkel': alamat_bengkel,
      'nama_pemesan': nama_pemesan,
      'alamat_pemesan': alamat_pemesan,
      'no_hp_pemesan': no_hp_pemesan,
    };
  }
}
