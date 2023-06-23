// ignore_for_file: avoid_print, unused_local_variable

import 'package:dio/dio.dart';

final Dio dio = Dio(BaseOptions(
  baseUrl: 'https://6491b7c92f2c7ee6c2c8ca64.mockapi.io/',
  connectTimeout: 5000,
  receiveTimeout: 3000,
));

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

class LayananService {
  Future<List<Layanan>> listData() async {
    try {
      final response = await dio.get('layanan');
      final List<dynamic> data = response.data as List<dynamic>;
      List<Layanan> result =
          data.map((json) => Layanan.fromJson(json)).toList();
      return result;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<bool> simpanData(Layanan layanan) async {
    try {
      // Lakukan pengolahan data di sini
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> ubahData(String id, Layanan layanan) async {
    try {
      final response = await dio.put('layanan/$id', data: layanan.toJson());
      // Lakukan pengolahan data di sini
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<Layanan?> getDataById(String id) async {
    try {
      final response = await dio.get('layanan/$id');
      Layanan result = Layanan.fromJson(response.data);
      return result;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<bool> hapusData(String id) async {
    try {
      final response = await dio.delete('layanan/$id');
      // Lakukan pengolahan data di sini
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
