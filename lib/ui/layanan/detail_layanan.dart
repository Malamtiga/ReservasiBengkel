import 'package:flutter/material.dart';
import 'package:klinikapp/service/layanan_service.dart';

class DetailLayananPage extends StatelessWidget {
  final Layanan layanan;

  DetailLayananPage({required this.layanan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Layanan'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama Layanan: ${layanan.namaLayanan}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Harga Layanan: ${layanan.harga_layanan}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Tutup'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
