// ignore_for_file: avoid_print, unused_local_variable

import 'package:dio/dio.dart';

final Dio dio = Dio(BaseOptions(
  baseUrl: 'https://6491b7c92f2c7ee6c2c8ca64.mockapi.io/',
  connectTimeout: 5000,
  receiveTimeout: 3000,
));

class Bengkel {
  final String id;
  final String tanggalreservasi;
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
      id: json['id'],
      tanggalreservasi: json['tanggalreservasi'],
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
      'tanggalreservasi': tanggalreservasi,
      'nama_bengkel': nama_bengkel,
      'alamat_bengkel': alamat_bengkel,
      'nama_pemesan': nama_pemesan,
      'alamat_pemesan': alamat_pemesan,
      'no_hp_pemesan': no_hp_pemesan,
    };
  }
}

class BengkelService {
  Future<List<Bengkel>> listData() async {
    try {
      final response = await dio.get('reservasi');
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
      final response = await dio.post('reservasi', data: bengkel.toJson());
      // Lakukan pengolahan data di sini
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> ubahData(String id, Bengkel bengkel) async {
    try {
      final response = await dio.put('reservasi/$id', data: bengkel.toJson());
      // Lakukan pengolahan data di sini
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<Bengkel?> getDataById(String id) async {
    try {
      final response = await dio.get('reservasi/$id');
      Bengkel result = Bengkel.fromJson(response.data);
      return result;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> hapusData(String id) async {
    try {
      final response = await dio.delete('reservasi/$id');
      // Lakukan pengolahan data di sini
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  void reservasiData(Map<String, dynamic> reservasiData) {}
}
