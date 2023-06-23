import 'package:flutter/material.dart';
import 'package:klinikapp/service/bengkel_service.dart';
import 'form_reservasi.dart';

class DetailBengkelPage extends StatelessWidget {
  final Bengkel bengkel;

  DetailBengkelPage({required this.bengkel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Bengkel'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama Bengkel: ${bengkel.namaBengkel}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Alamat Bengkel: ${bengkel.alamatBengkel}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'No. HP Bengkel: ${bengkel.noHpBengkel}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Nama Pemilik: ${bengkel.namaPemilik}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            FormReservasiPage(bengkel: bengkel),
                      ),
                    );
                  },
                  child: Text('Reservasi'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
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
