import 'package:flutter/material.dart';
import 'package:klinikapp/service/bengkel_service.dart';

class FormReservasiPage extends StatefulWidget {
  final Bengkel bengkel;

  FormReservasiPage({required this.bengkel});

  @override
  _FormReservasiPageState createState() => _FormReservasiPageState();
}

class _FormReservasiPageState extends State<FormReservasiPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _namaController = TextEditingController();
  TextEditingController _alamatController = TextEditingController();
  TextEditingController _noHpController = TextEditingController();
  TextEditingController _tanggalController = TextEditingController();
  TextEditingController _keteranganController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Reservasi'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _namaController,
                decoration: InputDecoration(
                  labelText: 'Nama',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Nama harus diisi';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _alamatController,
                decoration: InputDecoration(
                  labelText: 'Alamat',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Alamat harus diisi';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _noHpController,
                decoration: InputDecoration(
                  labelText: 'No. HP',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'No. HP harus diisi';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _tanggalController,
                decoration: InputDecoration(
                  labelText: 'Tanggal',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Tanggal harus diisi';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _keteranganController,
                decoration: InputDecoration(
                  labelText: 'Keterangan',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Lakukan proses reservasi
                    // Misalnya, panggil fungsi reservasi dari BengkelService
                    Map<String, dynamic> reservasiData = {
                      'nama': _namaController.text,
                      'alamat': _alamatController.text,
                      'noHp': _noHpController.text,
                      'tanggal': _tanggalController.text,
                      'keterangan': _keteranganController.text,
                      'bengkelId': widget.bengkel.id,
                    };
                    BengkelService().reservasiData(reservasiData);

                    // Tampilkan snackbar atau dialog konfirmasi
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Reservasi berhasil')),
                    );

                    // Kembali ke halaman sebelumnya
                    Navigator.pop(context);
                  }
                },
                child: Text('Reservasi'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
