import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(ScreeningPendengaranApp());
}

class ScreeningPendengaranApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Screening Pendengaran',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ScreeningPendengaranScreen(),
    );
  }
}

class ScreeningPendengaranScreen extends StatefulWidget {
  @override
  _ScreeningPendengaranScreenState createState() =>
      _ScreeningPendengaranScreenState();
}

class _ScreeningPendengaranScreenState
    extends State<ScreeningPendengaranScreen> {
  String selectedYear = '0 tahun';
  String selectedMonth = '0 bulan';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screening Pendengaran'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 64,
                    height: 64,
                  ),
                  Text(
                    'dr. Hamsu Kadriyan, SpTHT-KL(K)',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'dr. Sapto Sutardi',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'Universitas Mataram',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Tentang Kami'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutUsScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Silakan mengisi usia anak',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      // TODO: Implement action for TextField 1
                    },
                    child: DropdownButtonFormField<String>(
                      value: selectedYear,
                      items: <String>['0 tahun', '1 tahun', '2 tahun']
                          .map<DropdownMenuItem<String>>(
                            (String value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            ),
                          )
                          .toList(),
                      onChanged: (String? value) {
                        setState(() {
                          selectedYear = value!;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      // TODO: Implement action for TextField 2
                    },
                    child: DropdownButtonFormField<String>(
                      value: selectedMonth,
                      items:
                          List<String>.generate(12, (index) => '$index bulan')
                              .map<DropdownMenuItem<String>>(
                                (String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                ),
                              )
                              .toList(),
                      onChanged: (String? value) {
                        setState(() {
                          selectedMonth = value!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                int ageInMonths = (int.parse(selectedYear.split(' ')[0]) * 12) +
                    int.parse(selectedMonth.split(' ')[0]);

                String questionText = getQuestion(ageInMonths);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuestionScreen(
                      selectedAge: '$selectedYear, $selectedMonth',
                      questionText: questionText,
                    ),
                  ),
                );
              },
              child: Text('Berikutnya'),
            ),
          ],
        ),
      ),
    );
  }

  String getQuestion(int ageInMonths) {
    if (ageInMonths < 4) {
      return "Terkejut bila mendengar sumber berisik.";
    } else if (ageInMonths < 8) {
      return "Menoleh ke arah sumber suara.";
    } else if (ageInMonths == 8) {
      return "- Bersuara satu suku kata, misalnya: ma/pa atau ta, atau da\n"
          "- Bersuara bersambung, misalnya: ma-ma-ma-ma, pa-pa-pa-pa, da-da-da-da-, ta-ta-ta-ta?";
    } else if (ageInMonths == 9 || ageInMonths == 10) {
      return "Bersuara bersambung, misalnya: ma-ma-ma-ma, pa-pa-pa-pa, da-da-da-da-, ta-ta-ta-ta?";
    } else if (ageInMonths == 11 || ageInMonths == 12) {
      return "Memanggil: mama!, papa!?";
    } else if (ageInMonths == 13) {
      return "- Memanggil: mama!, papa!\n"
          "- Mengucapkan 1 kata, misal: mimik, minum, pipis?";
    } else if (ageInMonths == 14) {
      return "Mengucapkan 1 kata, misal: mimik, minum, pipis?";
    } else if (ageInMonths == 15) {
      return "- Mengucapkan 1 kata, misal: mimik, minum, pipis.\n"
          "- Mengucapkan 2 kata?";
    } else if (ageInMonths == 16 || ageInMonths == 17) {
      return "Mengucapkan 2-3 kata?";
    } else if (ageInMonths == 18) {
      return "Mengucapkan 3 kata?";
    } else if (ageInMonths == 19 ||
        ageInMonths == 20 ||
        ageInMonths == 21 ||
        ageInMonths == 22) {
      return "Mengucapkan 6 kata?";
    } else if (ageInMonths == 24 || ageInMonths == 25) {
      return "- Menggabungkan beberapa kata: mimik cucu.\n"
          "- Menyebutkan nama benda, gambar?";
    } else if (ageInMonths == 26) {
      return "- Menggabungkan beberapa kata: mimik cucu.\n"
          "- Menyebutkan nama benda, gambar.\n"
          "- Bicaranya 50% dapat dimengerti orang lain?";
    } else if (ageInMonths == 27 || ageInMonths == 28) {
      return "- Menyebutkan nama benda, gambar.\n"
          "- Bicaranya 50% dapat dimengerti orang lain?";
    } else {
      return "Bicaranya 50% dapat dimengerti orang lain?";
    }
  }
}

class QuestionScreen extends StatelessWidget {
  final String selectedAge;
  final String questionText;

  const QuestionScreen({required this.selectedAge, required this.questionText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedAge),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Apakah anak bisa:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              questionText,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Kesimpulan awal'),
                          content: Text('Tidak diduga gangguan pendengaran'),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text('Ya'),
                ),
                SizedBox(
                    width:
                        16), // Tambahkan widget SizedBox dengan properti width untuk memberikan ruang horizontal

                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Kesimpulan awal'),
                          content: Text(
                              'Diduga gangguan pendengaran! Silakan rujuk/konsultasikan dengan dokter spesialis THT!'),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text('Tidak'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang Aplikasi'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Aplikasi Deteksi Dini Gangguan Pendengaran adalah aplikasi deteksi dini (screening) ketulian dengan melihat respon terhadap suara dan kemampuan bicara, pada anak < 3 tahun.\nAplikasi ini dikembangkan oleh dr. Hamsu Kadriyan, Sp.THT-KL(K) dan dr. Sapto Sutardi.\nBerikan masukan anda untuk pengembangan aplikasi ini dengan menekan tombol di bawah ini:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () async {
                    // Cek apakah WhatsApp Business tersedia di perangkat
                    bool isWhatsAppBusinessInstalled =
                        await canLaunch('whatsapp://app');

                    // Tentukan URL yang akan dibuka berdasarkan ketersediaan WhatsApp Business
                    String url = isWhatsAppBusinessInstalled
                        ? 'whatsapp://app'
                        : 'https://wa.me/+6287740040041';

                    // Buka WhatsApp Business atau WhatsApp biasa
                    launch(url);
                  },
                  icon: Icon(Icons.message),
                  label: Text('WhatsApp'),
                ),
                SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: () {
                    // Tindakan saat tombol E-Mail ditekan
                    launch('mailto:xup2sutardi@gmail.com');
                  },
                  icon: Icon(Icons.mail),
                  label: Text('E-Mail'),
                ),
              ],
            ), /* 
            SizedBox(height: 16),
            Text(
              'WhatsApp: +6287740040041',
              style: TextStyle(fontSize: 16), 
            ),
            SizedBox(height: 8),
            Text(
              'Email: xup2sutardi@gmail.com',
              style: TextStyle(fontSize: 16),
            ), */
          ],
        ),
      ),
    );
  }
}
