import 'package:flutter/material.dart';
import 'package:klinikapp/service/regist_service.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final _registrationService = RegistrationService();

  String _nama = '';
  String _password = '';
  String? _level;

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      if (_level == null) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Registrasi Gagal'),
              content: Text('Level Pengguna harus dipilih.'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
        return;
      }

      bool registrationSuccessful =
          await _registrationService.register(_nama, _password, _level!);

      if (registrationSuccessful) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Registrasi Berhasil'),
              content: Text('Registrasi Anda berhasil.'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    _formKey.currentState!.reset();
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Registrasi Gagal'),
              content: Text('Registrasi Anda gagal, Buat Dengan Nama Berbeda.'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrasi'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/d.png'), // Ganti dengan path gambar latar belakang yang diinginkan
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white
                    .withOpacity(0.7), // Memberikan transparansi pada form
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Nama',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nama harus diisi';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _nama = value!;
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Kata Sandi',
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Kata Sandi harus diisi';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _password = value!;
                        },
                      ),
                      SizedBox(height: 16.0),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          labelText: 'Level Pengguna',
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Level Pengguna harus diisi';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            _level = value;
                          });
                        },
                        items: [
                          DropdownMenuItem(
                            value: 'Pelanggan',
                            child: Text('Pelanggan'),
                          ),
                          DropdownMenuItem(
                            value: 'Bengkel',
                            child: Text('Bengkel'),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      ElevatedButton(
                        onPressed: _submitForm,
                        child: Text('Daftar'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
