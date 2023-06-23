import 'package:flutter/material.dart';
import 'login.dart';
import 'admin_home.dart';
import 'user_home.dart';
import 'bengkel_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<bool> _mockCheckForSession() async {
    // Tambahkan proses simulasi pengecekan sesi atau loading yang berlangsung
    await Future.delayed(Duration(seconds: 8));
    return true; // Kembalikan true jika loading selesai
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false, // Menghilangkan tulisan "debug"
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingPage(checkForSession: _mockCheckForSession),
        '/login': (context) => LoginPage(),
        '/admin_home': (context) => Beranda(),
        '/user_home': (context) => Berandap(),
        '/bengkel_home': (context) => Berandab(),
      },
    );
  }
}

class LoadingPage extends StatefulWidget {
  final Future<bool> Function() checkForSession;

  const LoadingPage({required this.checkForSession});

  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();

    // Inisialisasi animasi
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _navigateToNextScreen() async {
    final bool sessionExists = await widget.checkForSession();

    String nextPage;
    if (sessionExists) {
      nextPage = '/login';
    } else {
      nextPage = '/login';
    }

    Navigator.of(context).pushReplacementNamed(nextPage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.width * 0.6,
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: FadeTransition(
                    opacity: _opacityAnimation,
                    child: Image.asset(
                      'assets/images/1.png',
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: ScaleTransition(
                  scale: _animationController,
                  child: Text(
                    'Aplikasi Ini dalam Pengembangan!!!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
