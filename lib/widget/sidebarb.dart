import 'package:flutter/material.dart';
import '../admin_home.dart';
import '../login.dart';
import '../ui/bengkel/bengkel_page.dart';
import '../ui/layanan/layanan_page.dart';

class sidebarb extends StatelessWidget {
  const sidebarb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 1), // Change header color to black
            ),
            accountName: const Text("BENGKEL/MEKANIK"),
            accountEmail: const Text(""),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/images/logomotorcuy.png"),
              backgroundColor:
                  Colors.transparent, // Set background color to transparent
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Beranda"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Beranda()),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.account_box_sharp),
            title: const Text("Bengkel"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BengkelPage()),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.account_box_sharp),
            title: const Text("Layanan"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LayananPage()),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout_rounded),
            title: const Text("Keluar"),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                (Route<dynamic> route) => false,
              );
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
