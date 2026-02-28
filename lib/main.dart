import 'package:flutter/material.dart';

void main() {
  runApp(const GlowArchiveApp());
}

class GlowArchiveApp extends StatelessWidget {
  const GlowArchiveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GlowArchive',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFF8BBD0),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, String>> skincareList = [
    {
      "nama": "𝖢𝖾𝗍𝖺𝗉𝗁𝗂𝗅 𝖦𝖾𝗇𝗍𝗅𝖾 𝖲𝗄𝗂𝗇 𝖢𝗅𝖾𝖺𝗇𝗌𝖾𝗋",
      "jenis": "Cleanser",
      "catatan": "Dipakai pagi & malam, cocok untuk kulit sensitifku"
    },
    {
      "nama": "COSRX Low pH Good Morning Gel Cleanser",
      "jenis": "Cleanser",
      "catatan": "Dipakai pagi hari untuk menjaga pH kulit"
    },
    {
      "nama": "Somethinc Vitamin C / Glass-C Serum",
      "jenis": "Serum / Treatment",
      "catatan": "Dipakai pagi hari, bantu mencerahkan bekas jerawat"
    },
    {
      "nama": "La Roche Posay Cicaplast B5",
      "jenis": "Treatment / Barrier Repair",
      "catatan": "Dipakai saat skin barrier terasa rusak atau iritasi"
    },
    {
      "nama": "Skintific 5X Ceramide Moisture Gel",
      "jenis": "Moisturizer",
      "catatan": "Dipakai setiap malam agar kulit tetap lembap"
    },
    {
      "nama": "Labore Biomeprotect Sunscreen",
      "jenis": "Sunscreen",
      "catatan": "Wajib dipakai pagi & reapply tiap 3 jam"
    },
  ];

  void addProduct(Map<String, String> product) {
    setState(() {
      skincareList.add(product);
    });
  }

  void deleteProduct(int index) {
    setState(() {
      skincareList.removeAt(index);
    });
  }

  void updateProduct(int index, Map<String, String> product) {
    setState(() {
      skincareList[index] = product;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            const Text(
              "🎀 𝑮𝒍𝒐𝒘 𝑨𝒓𝒄𝒉𝒊𝒗𝒆 🎀",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFFB76E79),
              ),
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE4EC),
                  borderRadius: BorderRadius.circular(35),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(28),
                  child: Image.asset(
                    "assets/images/banner.jpg",
                    fit: BoxFit.cover,
                    height: 240,
                    width: double.infinity,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 18),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "𝘒𝘶𝘭𝘪𝘵 𝘴𝘦𝘩𝘢𝘵 𝘥𝘪𝘮𝘶𝘭𝘢𝘪 𝘥𝘢𝘳𝘪 𝘱𝘦𝘳𝘢𝘸𝘢𝘵𝘢𝘯 𝘺𝘢𝘯𝘨 𝘬𝘰𝘯𝘴𝘪𝘴𝘵𝘦𝘯 𝘴𝘦𝘵𝘪𝘢𝘱 𝘩𝘢𝘳𝘪 🌷",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFB76E79),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: skincareList.length,
                itemBuilder: (context, index) {
                  final item = skincareList[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 22),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFEBC4CC),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.all(4),
                      child: Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFF0F5),
                          borderRadius: BorderRadius.circular(26),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFB76E79)
                                  .withOpacity(0.15),
                              blurRadius: 15,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item["nama"]!,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF3A3A3A),
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    item["jenis"]!,
                                    style: const TextStyle(
                                      color: Color(0xFF9E6C75),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    item["catatan"]!,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Color(0xFF6D6D6D),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Color(0xFFB76E79),
                                  ),
                                  onPressed: () async {
                                    final updated =
                                        await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            AddPage(
                                          isEdit: true,
                                          existingData: item,
                                        ),
                                      ),
                                    );
                                    if (updated != null) {
                                      updateProduct(index, updated);
                                    }
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Color(0xFFB76E79),
                                  ),
                                  onPressed: () =>
                                      deleteProduct(index),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFFF8BBD0),
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddPage(),
            ),
          );
          if (result != null) {
            addProduct(result);
          }
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class AddPage extends StatefulWidget {
  final bool isEdit;
  final Map<String, String>? existingData;

  const AddPage({super.key, this.isEdit = false, this.existingData});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {final TextEditingController namaController = TextEditingController();
  final TextEditingController jenisController = TextEditingController();
  final TextEditingController catatanController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.isEdit && widget.existingData != null) {
      namaController.text = widget.existingData!["nama"]!;
      jenisController.text = widget.existingData!["jenis"]!;
      catatanController.text = widget.existingData!["catatan"]!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEdit ? "𝑬𝒅𝒊𝒕 𝑺𝒌𝒊𝒏𝒄𝒂𝒓𝒆" : "𝑨𝒅𝒅 𝑺𝒌𝒊𝒏𝒄𝒂𝒓𝒆"),
        backgroundColor: const Color(0xFFB76E79),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            buildField("𝐍𝐚𝐦𝐚 𝐏𝐫𝐨𝐝𝐮𝐤", namaController),
            const SizedBox(height: 18),
            buildField("𝐉𝐞𝐧𝐢𝐬 𝐏𝐫𝐨𝐝𝐮𝐤", jenisController),
            const SizedBox(height: 18),
            buildField("𝐂𝐚𝐫𝐚 𝐏𝐚𝐤𝐚𝐢 / 𝐂𝐚𝐭𝐚𝐭𝐚𝐧", catatanController),
            const SizedBox(height: 30),

            // 🔥 TOMBOL 2 LAPIS
            SizedBox(
              width: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFEBC4CC),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.all(4),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFB76E79),
                    padding:
                        const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(26),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigator.pop(context, {
                      "nama": namaController.text,
                      "jenis": jenisController.text,
                      "catatan": catatanController.text,
                    });
                  },
                  child: const Text(
                    "Simpan",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildField(
    String label, TextEditingController controller) {
  return Container(
    decoration: BoxDecoration(
      color: const Color(0xFFEBC4CC),
      borderRadius: BorderRadius.circular(30),
    ),
    padding: const EdgeInsets.all(4),
    child: Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFF0F5),
        borderRadius: BorderRadius.circular(26),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 18,
          ),
          hintText: label,
          hintStyle: const TextStyle(
            color: Color(0xFF7A6A6A),
          ),
          border: InputBorder.none,
        ),
      ),
    ),
  );
}}
  