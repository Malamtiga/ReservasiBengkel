import 'package:flutter/material.dart';
import 'package:klinikapp/service/bengkel_service.dart';


class BengkelPage extends StatefulWidget {
  @override
  _BengkelPageState createState() => _BengkelPageState();
}

class _BengkelPageState extends State<BengkelPage> {
  final BengkelService _bengkelService = BengkelService();
  List<Bengkel> _listBengkel = [];

  @override
  void initState() {
    super.initState();
    _fetchBengkelData();
  }

  Future<void> _fetchBengkelData() async {
    List<Bengkel> bengkelList = await _bengkelService.listData();
    setState(() {
      _listBengkel = bengkelList;
    });
  }

  void _showBengkelDetail(Bengkel bengkel) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Detail Bengkel'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Nama Bengkel: ${bengkel.namaBengkel}'),
              Text('Alamat Bengkel: ${bengkel.alamatBengkel}'),
              Text('No. HP Bengkel: ${bengkel.noHpBengkel}'),
              Text('Nama Pemilik: ${bengkel.namaPemilik}'),
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
        title: Text('Daftar Bengkel'),
      ),
      body: ListView.builder(
        itemCount: _listBengkel.length,
        itemBuilder: (context, index) {
          Bengkel bengkel = _listBengkel[index];
          return ListTile(
            title: Text(bengkel.namaBengkel),
            subtitle: Text(bengkel.alamatBengkel),
            trailing: Text(bengkel.noHpBengkel),
            onTap: () {
              _showBengkelDetail(bengkel);
            },
          );
        },
      ),
    );
  }
}
