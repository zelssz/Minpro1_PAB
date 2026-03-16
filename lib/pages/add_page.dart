import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  final bool isEdit;
  final Map<String, String>? existingData;

  const AddPage({super.key, this.isEdit = false, this.existingData});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController catatanController = TextEditingController();

  String selectedJenis = "";

  @override
  void initState() {
    super.initState();
    if (widget.isEdit && widget.existingData != null) {
      namaController.text = widget.existingData!["nama"] ?? "";
      selectedJenis = widget.existingData!["jenis"] ?? "";
      catatanController.text = widget.existingData!["catatan"] ?? "";
    }
  }

  @override
  void dispose() {
    namaController.dispose();
    catatanController.dispose();
    super.dispose();
  }

  Future<bool> confirmExit() async {
    final hasData = namaController.text.isNotEmpty ||
        selectedJenis.isNotEmpty ||
        catatanController.text.isNotEmpty;

    final result = await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
            width: 420, 
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.arrow_back,
                  color: Color(0xFFB76E79),
                  size: 32,
                ),
                const SizedBox(height: 10),
                Text(
                  "Kembali ke Homepage?",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFB76E79),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  hasData
                      ? "Perubahan yang belum disimpan akan hilang."
                      : "Data kosong tetap keluar.",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(context, false),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFFB76E79)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text(
                          "Batal",
                          style: TextStyle(
                            color: Color(0xFFB76E79),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context, true),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFB76E79),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        child: const Text(
                          "Ya",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );

    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: confirmExit,
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox.expand(
              child: Image.asset(
                "assets/images/baground.jpeg",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.white.withOpacity(0.4),
            ),
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Container(
                    width: 420,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.85),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          widget.isEdit ? "Edit Skincare" : "Add Skincare",
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFB76E79),
                          ),
                        ),
                        const SizedBox(height: 24),
                        buildField("Nama Produk", namaController),
                        const SizedBox(height: 16),
                        buildDropdownJenis(),
                        const SizedBox(height: 16),
                        buildField("Cara Pakai / Catatan", catatanController),
                        const SizedBox(height: 24),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFB76E79),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () {
                              if (namaController.text.isEmpty ||
                                  selectedJenis.isEmpty ||
                                  catatanController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    behavior: SnackBarBehavior.floating,
                                    backgroundColor: const Color(0xFFB76E79),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    content: const Text(
                                      "Please complete all skincare notes first",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                );
                                return;
                              }
                              Navigator.pop(context, {
                                "nama": namaController.text,
                                "jenis": selectedJenis,
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
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFF8BBD0),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () async {
                              final exit = await confirmExit();
                              if (exit) Navigator.pop(context);
                            },
                            child: const Text(
                              "Kembali ke Homepage",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
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
    );
  }

  Widget buildField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        hintText: label,
        hintStyle: const TextStyle(color: Color(0xFF7A6A6A)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(26),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: const Color(0xFFFFF0F5),
      ),
    );
  }

  Widget buildDropdownJenis() {
    return DropdownButtonFormField<String>(
      value: selectedJenis.isEmpty ? null : selectedJenis,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(26),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: const Color(0xFFFFF0F5),
      ),
      hint: const Text("Jenis Produk"),
      items: const [
        DropdownMenuItem(value: "Cleanser", child: Text("Cleanser")),
        DropdownMenuItem(value: "Toner", child: Text("Toner")),
        DropdownMenuItem(value: "Serum", child: Text("Serum")),
        DropdownMenuItem(value: "Moisturizer", child: Text("Moisturizer")),
        DropdownMenuItem(value: "Sunscreen", child: Text("Sunscreen")),
      ],
      onChanged: (value) {
        setState(() {
          selectedJenis = value!;
        });
      },
    );
  }
}