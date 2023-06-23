class Login {
  String? id;
  String? nama;
  String? password;
  String? level;

  Login({
    this.id,
    required this.nama,
    required this.password,
    required this.level,
  });

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
      id: json["id"],
      nama: json['nama'],
      password: json['password'],
      level: json['level'],
    );
  }

  // Hapus konstruktor factory untuk daftar

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "password": password,
        "level": level,
      };
}
