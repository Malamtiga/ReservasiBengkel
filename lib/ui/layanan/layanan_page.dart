import 'package:flutter/material.dart';
import 'package:klinikapp/service/layanan_service.dart';

class LayananPage extends StatefulWidget {
  @override
  _LayananPageState createState() => _LayananPageState();
}

class _LayananPageState extends State<LayananPage> {
  final LayananService _layananService = LayananService();
  List<Layanan> _listLayanan = [];

  @override
  void initState() {
    super.initState();
    _fetchLayananData();
  }

  Future<void> _fetchLayananData() async {
    List<Layanan> layananList = await _layananService.listData();
    setState(() {
      _listLayanan = layananList;
    });
  }

  void _showLayananDetail(Layanan layanan) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Detail Layanan'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Nama Layanan: ${layanan.namaLayanan}'),
              Text('Harga Layanan: ${layanan.harga_layanan}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Tutup'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Layanan'),
      ),
      body: ListView.builder(
        itemCount: _listLayanan.length,
        itemBuilder: (context, index) {
          Layanan layanan = _listLayanan[index];
          return ListTile(
            title: Text(layanan.namaLayanan),
            subtitle: Text(layanan.harga_layanan),
            onTap: () {
              _showLayananDetail(layanan);
            },
          );
        },
      ),
    );
  }
}
