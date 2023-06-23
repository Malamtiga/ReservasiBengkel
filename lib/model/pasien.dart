class Pasien { 
  String? id; 
  String nomorrm;
  String namap;
  String tanggallahirp;
  String nomorteleponp;
  String alamat;
 
  Pasien({
    this.id, 
    required this.nomorrm,
    required this.namap,
    required this.tanggallahirp,
    required this.nomorteleponp,
    required this.alamat,
  }); 
 
  factory Pasien.fromJson(Map<String, dynamic> json) => Pasien(
    id: json["id"], 
    nomorrm: json['nomorrm'],
    namap: json['namap'],
    tanggallahirp: json['tanggallahirp'],
    nomorteleponp: json['nomorteleponp'],
    alamat: json['alamat'],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nomorrm": nomorrm,
    "namap": namap,
    "tanggallahirp": tanggallahirp,
    "nomorteleponp": nomorteleponp,
    "alamat": alamat,
  }; 
}
