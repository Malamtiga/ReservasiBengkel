import 'package:flutter/material.dart';
import 'ui/api_service.dart';
import 'ui/registration_form.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({Key? key});

  Future<void> login(BuildContext context) async {
    final username = usernameController.text;
    final password = passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Silahkan Login'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    try {
      // Panggil API login
      final response = await ApiService().login(username, password);

      // Memeriksa data respons dari API, misalnya level pengguna
      final level = response['level'];

      // Navigasi ke halaman yang sesuai berdasarkan level pengguna
      if (level == 'admin') {
        Navigator.pushReplacementNamed(context, '/admin_home');
      } else if (level == 'Bengkel') {
        Navigator.pushReplacementNamed(context, '/bengkel_home');
      } else if (level == 'Pelanggan') {
        Navigator.pushReplacementNamed(context, '/user_home');
      } else {
        // Tampilkan pesan kesalahan jika level tidak dikenali
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Level pengguna tidak valid.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (error) {
      // Menangani kesalahan pemanggilan API
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Gagal melakukan login.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background2.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Silahkan Masukan Username Dan password",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage("assets/images/d.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      TextFormField(
                        style: TextStyle(
                          color: Color.fromARGB(
                              255, 0, 0, 0), // Warna teks menjadi hitam
                        ),
                        decoration: InputDecoration(
                          labelText: 'Username',
                          border: OutlineInputBorder(),
                          labelStyle: TextStyle(
                            color: const Color.fromARGB(
                                255, 0, 0, 0), // Warna label menjadi hitam
                          ),
                          filled: true, // Mengaktifkan background warna putih
                          fillColor:
                              Colors.white, // Mengatur warna background putih
                        ),
                        controller: usernameController,
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        obscureText: true,
                        style: TextStyle(
                          color: const Color.fromARGB(
                              255, 0, 0, 0), // Warna teks menjadi hitam
                        ),
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                          labelStyle: TextStyle(
                            color: const Color.fromARGB(
                                255, 0, 0, 0), // Warna label menjadi hitam
                          ),
                          filled: true, // Mengaktifkan background warna putih
                          fillColor:
                              Colors.white, // Mengatur warna background putih
                        ),
                        controller: passwordController,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () => login(context),
                        child: Text('Login'),
                      ),
                      SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          // Navigasi ke halaman registrasi
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegistrationForm(),
                            ),
                          );
                        },
                        child: Text('Registrasi'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
