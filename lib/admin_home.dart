import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'widget/sidebar.dart';

class Beranda extends StatefulWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  _BerandaState createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  double _width = 200.0;
  double _height = 200.0;

  void _animateContainer() {
    setState(() {
      _width = _width == 200.0 ? 300.0 : 200.0;
      _height = _height == 200.0 ? 300.0 : 200.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text("Beranda ADMIN"),
        backgroundColor: const Color.fromARGB(
            255, 0, 0, 0), // Ubah warna background AppBar menjadi merah
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height -
                  AppBar().preferredSize.height -
                  MediaQuery.of(context).padding.top,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    top: 0,
                    child: GestureDetector(
                      onTap: _animateContainer,
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        width: _width,
                        height: _height,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/fotor22.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(16.0),
                          color: Colors.black.withOpacity(0.6),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "PLATFORM PENYEDIA BENGKEL",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Text(
                                      "Untuk menunjang pelayanan yang baik,",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    const Text(
                                      "kami menghadirkan platform yang memudahkan pengguna,",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    const Text(
                                      "untuk melakukan pengorderan serta mendaftarkan bengkelnya.",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "KEUNTUNGAN YANG DIHARAPKAN,",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Text(
                                      "Dalam hal ini kami menyediakan platform penyedia bengkel.",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    const Text(
                                      "kami berharap dapat mempermudah pengguna untuk",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    const Text(
                                      "melakukan pengorderan, mencari bengkel yang tersedia",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    const Text(
                                      "dan memudahkan bengkel dalam menerima orderan pelanggan.",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Tentang Kami",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Reservasi Homeservice Berbasis Web merupakan tugas Web Programming kami pada Semester 4. Kami adalah layanan reservasi homeservice berbasis web yang berfokus pada memberikan kemudahan dan kenyamanan bagi Anda dalam memesan jasa layanan service di rumah secara online dan memperoleh layanan tersebut di rumah Anda sendiri. Kami berlokasi di Pontianak dan siap melayani kebutuhan layanan homeservice Anda di wilayah Pontianak dan sekitarnya. Jangan ragu untuk menghubungi kami melalui Whatsapp atau Instagram untuk informasi lebih lanjut\n",
                  ),
                  const Text(
                    "VISI\n",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Menjadi platform reservasi bengkel terdepan yang mampu memberikan kemudahan dan kepuasan bagi pengguna, serta memberikan peluang bagi para mitra bengkel untuk berkembang dan meningkatkan kualitas pelayanan.\n",
                  ),
                  const Text(
                    "MISI 1\n",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Memberikan kemudahan bagi pengguna dalam melakukan reservasi bengkel melalui platform online.\n",
                  ),
                  const Text(
                    "MISI 2\n",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Menjaga kualitas pelayanan bengkel mitra melalui evaluasi dan pelatihan berkala.\n",
                  ),
                  const Text(
                    "MISI 3\n",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Meningkatkan pengalaman pengguna dan kepuasan pelanggan dengan memberikan layanan yang cepat, mudah, dan terpercaya.\n",
                  ),
                  const Text(
                    "MISI 4\n",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Terus berinovasi dan mengembangkan platform untuk memenuhi kebutuhan pengguna dan bengkel mitra.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.only(top: 20, bottom: 30),
                    alignment: Alignment.center,
                    child: const Text(
                      "OUR TEAM",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Daftar foto dengan judul
                  const PhotoCard(
                    image: AssetImage("assets/images/bella.jpeg"),
                    title: "Bella Pesta",
                    link: '',
                  ),
                  const SizedBox(height: 10),
                  const PhotoCard(
                    image: AssetImage("assets/images/gafri.jpeg"),
                    title: "Gafriansyah",
                    link: '',
                  ),
                  const SizedBox(height: 10),
                  const PhotoCard(
                    image: AssetImage("assets/images/bonadev.jpg"),
                    title: "Bona Ventura Vito Cinta Karunia",
                    link: '',
                  ),
                  const SizedBox(height: 10),
                  const PhotoCard(
                    image: AssetImage("assets/images/raka.jpeg"),
                    title: "Raka Sahal Septian",
                    link: '',
                  ),
                  const SizedBox(height: 10),
                  const PhotoCard(
                    image: AssetImage("assets/images/g.png"),
                    title: "Eva Novianti Malamtiga",
                    link: '',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: Container(
                color: Colors.black,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 8,
                      backgroundColor: Color.fromARGB(255, 0, 0, 0),
                      child: Text(
                        '',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 252, 252),
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '©'
                      'opyright 2023 | Sistem Informasi | Teknik Informatika | UB21 PONTIANAK',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PhotoCard extends StatelessWidget {
  final ImageProvider image;
  final String title;
  final String link;

  const PhotoCard({
    Key? key,
    required this.image,
    required this.title,
    required this.link,
  }) : super(key: key);

  void _openLink() async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      throw 'Tidak dapat membuka tautan';
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageWidth = screenWidth * 0.7;

    return InkWell(
      onTap: _openLink,
      child: Center(
        child: Container(
          width: imageWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.shade300,
              width: 2.0,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                height: imageWidth,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: image,
                    fit: BoxFit.cover,
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
