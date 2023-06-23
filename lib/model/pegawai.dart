class Pegawai { 
  String? id; 
  String nip;
  String nama;
  String tanggallahir;
  String nomortelepon;
  String email;
  String password; 
 
  Pegawai({
    this.id, 
    required this.nip,
    required this.nama,
    required this.tanggallahir,
    required this.nomortelepon,
    required this.email,
    required this.password,
  }); 
 
  factory Pegawai.fromJson(Map<String, dynamic> json) => Pegawai(
    id: json["id"], 
    nip: json['nip'],
    nama: json['nama'],
    tanggallahir: json['tanggallahir'],
    nomortelepon: json['nomortelepon'],
    email: json['email'],
    password: json['password'],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nip": nip,
    "nama": nama,
    "tanggallahir": tanggallahir,
    "nomortelepon": nomortelepon,
    "email": email,
    "password": password,
  }; 
}
