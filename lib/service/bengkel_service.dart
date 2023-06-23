// ignore_for_file: avoid_print, unused_local_variable

import 'package:dio/dio.dart';

final Dio dio = Dio(BaseOptions(
  baseUrl: 'https://6491b7c92f2c7ee6c2c8ca64.mockapi.io/',
  connectTimeout: 5000,
  receiveTimeout: 3000,
));

class Bengkel {
  final String id;
  final String namaBengkel;
  final String alamatBengkel;
  final String noHpBengkel;
  final String namaPemilik;

  Bengkel({
    required this.id,
    required this.namaBengkel,
    required this.alamatBengkel,
    required this.noHpBengkel,
    required this.namaPemilik,
  });

  factory Bengkel.fromJson(Map<String, dynamic> json) {
    return Bengkel(
      id: json['id'],
      namaBengkel: json['nama_bengkel'],
      alamatBengkel: json['alamat_bengkel'],
      noHpBengkel: json['no_hp_bengkel'],
      namaPemilik: json['nama_pemilik'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama_bengkel': namaBengkel,
      'alamat_bengkel': alamatBengkel,
      'no_hp_bengkel': noHpBengkel,
      'nama_pemilik': namaPemilik,
    };
  }
}

class BengkelService {
  Future<List<Bengkel>> listData() async {
    try {
      final response = await dio.get('bengkel');
      final List<dynamic> data = response.data as List<dynamic>;
      List<Bengkel> result =
          data.map((json) => Bengkel.fromJson(json)).toList();
      return result;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<bool> simpanData(Bengkel bengkel) async {
    try {
      // Lakukan pengolahan data di sini
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> ubahData(String id, Bengkel bengkel) async {
    try {
      final response = await dio.put('bengkel/$id', data: bengkel.toJson());
      // Lakukan pengolahan data di sini
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<Bengkel?> getDataById(String id) async {
    try {
      final response = await dio.get('bengkel/$id');
      Bengkel result = Bengkel.fromJson(response.data);
      return result;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> hapusData(String id) async {
    try {
      final response = await dio.delete('bengkel/$id');
      // Lakukan pengolahan data di sini
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  void reservasiData(Map<String, dynamic> reservasiData) {}
}
