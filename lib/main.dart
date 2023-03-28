import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const SelectableTextDllExample();
  }
}

class SelectableTextDllExample extends StatefulWidget {
  const SelectableTextDllExample({super.key});

  @override
  State<SelectableTextDllExample> createState() =>
      _SelectableTextDllExampleState();
}

class _SelectableTextDllExampleState extends State<SelectableTextDllExample> {
  List<bool> isSelected = [true, false, false];
  ColorFilter colorFilter =
      const ColorFilter.mode(Colors.blue, BlendMode.screen);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ColorFiltered(
        colorFilter: colorFilter,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("SelectableText, ToggleButtons, ColorFiltered"),
          ),
          body: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SelectableText(
                  "Lorem Ipsum adalah contoh teks atau dummy dalam industri percetakan dan penataan huruf atau typesetting. Lorem Ipsum telah menjadi standar contoh teks sejak tahun 1500an, saat seorang tukang cetak yang tidak dikenal mengambil sebuah kumpulan teks dan mengacaknya untuk menjadi sebuah buku contoh huruf. Ia tidak hanya bertahan selama 5 abad, tapi juga telah beralih ke penataan huruf elektronik, tanpa ada perubahan apapun. Ia mulai dipopulerkan pada tahun 1960 dengan diluncurkannya lembaran-lembaran Letraset yang menggunakan kalimat-kalimat dari Lorem Ipsum, dan seiring munculnya perangkat lunak Desktop Publishing seperti Aldus PageMaker juga memiliki versi Lorem Ipsum.",
                  showCursor: true,
                ),
                ToggleButtons(
                  isSelected: isSelected,
                  fillColor: Colors.blue.withOpacity(0.5),
                  splashColor: Colors.blue.withOpacity(0.2),
                  selectedColor: Colors.white,
                  selectedBorderColor: Colors.blue,
                  borderRadius: BorderRadius.circular(16),
                  onPressed: (index) {
                    if (index == 1) {
                      colorFilter =
                          const ColorFilter.mode(Colors.red, BlendMode.screen);
                    } else if (index == 2) {
                      colorFilter = const ColorFilter.mode(
                          Colors.green, BlendMode.screen);
                    } else {
                      colorFilter =
                          const ColorFilter.mode(Colors.blue, BlendMode.screen);
                    }
                    setState(() {
                      for (var i = 0; i < isSelected.length; i++) {
                        isSelected[i] = (i == index) ? true : false;
                      }
                    });
                  },
                  children: const [
                    Icon(
                      Icons.home,
                      size: 30,
                    ),
                    Icon(
                      Icons.shop,
                      size: 30,
                    ),
                    Icon(
                      Icons.person,
                      size: 30,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
