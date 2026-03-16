import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'add_page.dart';
import '../services/supabase_service.dart';
import 'login_page.dart';
import 'favorite_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final SupabaseService service = SupabaseService();
  final supabase = Supabase.instance.client;

  final TextEditingController searchController = TextEditingController();

  String selectedFilter = "All";
 Set<int> selectedItems = {}; 
bool multiSelectMode = false; 

  Icon getIcon(String jenis) {
  switch (jenis) {
    case "Cleanser": return Icon(Icons.clean_hands, size:40, color: getColor(jenis));
    case "Toner": return Icon(Icons.inventory_2, size:40, color: getColor(jenis));
    case "Serum": return Icon(Icons.science, size:40, color: getColor(jenis));
    case "Moisturizer": return Icon(Icons.local_drink, size:40, color: getColor(jenis));
    case "Sunscreen": return Icon(Icons.wb_sunny, size:40, color: getColor(jenis));
    default: return Icon(Icons.favorite, size:40, color: getColor(jenis));
  }
}

Color getColor(String jenis) {
  switch(jenis){
    case "Cleanser": return const Color(0xFF64B5F6);
    case "Toner": return const Color(0xFF4DD0E1);
    case "Serum": return const Color(0xFF9575CD);
    case "Moisturizer": return const Color(0xFFEC407A);
    case "Sunscreen": return const Color(0xFFFFB74D);
    default: return const Color(0xFFB76E79);
  }
}



  /// ================= DELETE =================

void deleteProduct(int id) async {
  await service.deleteskincare(id);

  setState(() {});

  Navigator.pop(context);

  final deletedCount = 1;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: const Color(0xFFB76E79),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: Row(
        children: [
          const Icon(Icons.delete, color: Colors.white),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              "$deletedCount skincare berhasil dihapus",
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    ),
  );
}
  /// ================= UPDATE =================

  Future<void> updateProduct(int id, Map<String, dynamic> updated) async {

    await service.updateskincare(
      id,
      updated["nama"],
      updated["jenis"],
      updated["catatan"],
    );

    setState(() {});
  }

  /// ================= LOGOUT =================

  Future<void> logout() async {

    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(

          title: const Text("Logout"),
          content: const Text("Apakah anda ingin logout?"),

          actions: [

            TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: const Text("Batal"),
            ),

            TextButton(
              onPressed: () async {

                await supabase.auth.signOut();

                if(!mounted) return;

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                      (route) => false,
                );

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: const Color(0xFFB76E79),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    content: const Text(
                      "Berhasil logout",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );

              },
              child: const Text("Logout"),
            ),

          ],

        );
      },
    );
  }

  /// ================= PROFILE MENU =================

  void showProfileMenu() {

  final user = supabase.auth.currentUser;

  showModalBottomSheet(

  context: context,
  isScrollControlled: true,
  backgroundColor: Colors.transparent,

  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(
      top: Radius.circular(25),
    ),
  ),

  builder: (context) {

    return Container(

      margin: const EdgeInsets.only(top:100),

      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),

            child: Padding(
        padding: const EdgeInsets.all(20),

        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),

              const SizedBox(height:15),

              const Text(
                "Calméra 🌸",
                style: TextStyle(
                  fontSize:22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFB76E79),
                ),
              ),

              const SizedBox(height:10),

              CircleAvatar(
                radius:35,
                backgroundColor: const Color(0xFFFDE4EC),
                child: const Icon(
                  Icons.account_circle,
                  size:50,
                  color: Color(0xFFB76E79),
                ),
              ),

              const SizedBox(height:10),

              Text(
                user?.email ?? "",
                style: const TextStyle(fontSize:16),
              ),

              const SizedBox(height:10),

              const Divider(),

              const SizedBox(height:10),

            

              ListTile(
                leading: const Icon(Icons.star,color: Color(0xFFB76E79)),
                title: const Text("Favorite Skincare"),
                onTap: (){
                  Navigator.pop(context);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const FavoritePage(),
                    ),
                  );
                },
              ),

              const SizedBox(height:5),

              ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: Color(0xFFB76E79),
                ),
                title: const Text("Logout"),
                onTap: (){
                  Navigator.pop(context);
                  logout();
                },
              ),

              const SizedBox(height:10),

            ],
          ),
        ),
      ),
    );
  },
);

}

  /// ================= BUILD =================

  @override
  Widget build(BuildContext context) {

    final user = supabase.auth.currentUser;

    return Scaffold(

      backgroundColor: const Color(0xFFFDE4EC),

      body: SingleChildScrollView(

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            const SizedBox(height:30),

            /// ===== HEADER =====

            Padding(

              padding: const EdgeInsets.symmetric(horizontal:20),

              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [

                  const Text(
                    "𝑪𝒂𝒍𝒎é𝒓𝒂🌸",
                    style: TextStyle(
                      fontSize:26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFB76E79),
                    ),
                  ),

                  IconButton(
                    icon: const Icon(
                      Icons.account_circle,
                      size:32,
                      color: Color(0xFFB76E79),
                    ),
                    onPressed: showProfileMenu,
                  )

                ],
              ),
            ),


            if(user != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20),
                child: Text(
                  "Hi, ${user.email} 🌸",
                  style: const TextStyle(
                    fontSize:18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFB76E79),
                  ),
                ),
              ),

            const SizedBox(height:20),


            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20),
              child: Container(
                height:140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: const DecorationImage(
                    image: AssetImage("assets/images/banner.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            const SizedBox(height:20),

            /// ===== SEARCH =====

            Padding(
              padding: const EdgeInsets.symmetric(horizontal:20),
              child: TextField(

                controller: searchController,

                onChanged: (value){
                  setState(() {});
                },

                decoration: InputDecoration(
                  hintText: "Search skincare...",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            const SizedBox(height:20),

            /// ===== FILTER =====

            SingleChildScrollView(

              scrollDirection: Axis.horizontal,

              child: Row(

                children: [

                  const SizedBox(width:20),

                  filterChip("All"),
                  const SizedBox(width:10),

                  filterChip("Cleanser"),
                  const SizedBox(width:10),

                  filterChip("Toner"),
                  const SizedBox(width:10),

                  filterChip("Serum"),
                  const SizedBox(width:10),

                  filterChip("Moisturizer"),

                  const SizedBox(width:10),

                  filterChip("Sunscreen"),
                  const SizedBox(width:10),


                ],
              ),
            ),

            const SizedBox(height:25),

            Padding(

              padding: const EdgeInsets.symmetric(horizontal:20),

              child: FutureBuilder<List<Map<String,dynamic>>>(

                future: service.getskincare(),

                builder: (context,snapshot){

                  if(!snapshot.hasData){
                    return const Center(child: CircularProgressIndicator());
                  }

                  final skincareList = snapshot.data!;

                  final filteredList = skincareList.where((item){

  final nama = item["nama_produk"].toString().toLowerCase();
  final jenis = item["jenis_produk"].toString().toLowerCase();
  final search = searchController.text.toLowerCase();

  final matchSearch =
      nama.contains(search) || jenis.contains(search);

  final matchFilter =
      selectedFilter == "All" ||
      jenis == selectedFilter.toLowerCase();

  return matchSearch && matchFilter;

}).toList();


                  if(filteredList.isEmpty){
                    return const Padding(
                      padding: EdgeInsets.only(top:40),
                      child: Center(
                        child: Column(
                          children: [
                            Icon(Icons.spa,size:60,color: Colors.grey),
                            SizedBox(height:10),
                            Text(
                              "Belum ada skincare",
                              style: TextStyle(fontSize:16,color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                    );
                  }

                  return ListView.builder(

                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),

                    itemCount: filteredList.length,

                    itemBuilder: (context,index){

                      final item = filteredList[index];

                      return Container(

                        margin: const EdgeInsets.only(bottom:20),

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.08),
                              blurRadius:15,
                              offset: const Offset(0,6),
                            ),
                          ],
                        ),

                        child: Padding(

                          padding: const EdgeInsets.all(20),

                          child: Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [

    Checkbox(
      value: selectedItems.contains(item["id"]),
      activeColor: const Color(0xFFB76E79),
      onChanged: (value){
        setState(() {
          if(value == true){
            selectedItems.add(item["id"]);
          } else {
            selectedItems.remove(item["id"]);
          }

          multiSelectMode = selectedItems.isNotEmpty; 
        });
      },
    ),

                              getIcon(item["jenis_produk"]),

                              const SizedBox(width:15),

                              Expanded(

                                child: Column(

                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [

                                    Text(
                                      item["nama_produk"],
                                      style: const TextStyle(
                                        fontSize:19,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF3A3A3A),
                                      ),
                                    ),

                                    const SizedBox(height:4),

                                    Text(
                                      item["jenis_produk"],
                                      style: const TextStyle(
                                        fontSize:14,
                                        color: Color(0xFFB76E79),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),

                                    const SizedBox(height:4),

                                    Text(
                                      item["catatan"],
                                      style: const TextStyle(
                                        fontSize:13,
                                        color: Colors.grey,
                                      ),
                                    )

                                  ],
                                ),
                              ),

                              Column(
  children: [

IconButton(
  icon: Icon(
    item["favorite"] == true
        ? Icons.favorite
        : Icons.favorite_border,
    color: const Color(0xFFB76E79),
  ),
  onPressed: () async {

    final newValue = !(item["favorite"] ?? false);

    await service.toggleFavorite(item["id"], item["favorite"] ?? false);

    setState(() {
      item["favorite"] = newValue;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: const Color(0xFFB76E79),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        content: Row(
          children: [
            Icon(
              newValue ? Icons.favorite : Icons.favorite_border,
              color: Colors.white,
            ),
            const SizedBox(width:10),
            Expanded(
              child: Text(
                newValue
                    ? "Berhasil ditambahkan ke Favorite"
                    : "Berhasil dihapus dari Favorite",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  },
),

    IconButton(
      icon: const Icon(
        Icons.edit,
        color: Color(0xFFB76E79),
      ),
      onPressed: () async {

        final updated = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddPage(
              isEdit: true,
              existingData: {
                "nama": item["nama_produk"],
                "jenis": item["jenis_produk"],
                "catatan": item["catatan"],
              },
            ),
          ),
        );

        if(updated != null){

  if(updated["nama"] == item["nama_produk"] &&
     updated["jenis"] == item["jenis_produk"] &&
     updated["catatan"] == item["catatan"]) {

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: const Color(0xFFB76E79),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        content: const Text(
          "Tidak ada perubahan data",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

    return;
  }

          await updateProduct(
            item["id"],
            Map<String,dynamic>.from(updated),
          );

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: const Color(0xFFB76E79),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              content: const Text(
                "Data skincare berhasil diperbarui",
                style: TextStyle(color: Colors.white),
              ),
            ),
          );

        }

      },
    ),

    IconButton(
      icon: const Icon(
        Icons.delete,
        color: Color(0xFFB76E79),
      ),
      onPressed: (){

        showDialog(
          context: context,
          builder:(context){
            return AlertDialog(
              title: const Text("Konfirmasi"),
              content: const Text("Apakah kamu yakin ingin menghapus Skincare ini?"),
              actions:[

                TextButton(
                  onPressed:()=>Navigator.pop(context),
                  child: const Text("Batal"),
                ),

                TextButton(
                  onPressed:()=>deleteProduct(item["id"]),
                  child: const Text("Hapus"),
                )

              ],
            );
          }
        );

      },
    ),

  ],
)

                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            )

          ],
        ),
      ),

      floatingActionButton: multiSelectMode ? FloatingActionButton.extended(
  onPressed: () async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Hapus beberapa skincare?"),
        content: Text("Kamu yakin ingin menghapus ${selectedItems.length} skincare?"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context,false), child: const Text("Batal")),
          ElevatedButton(onPressed: () => Navigator.pop(context,true), child: const Text("Ya")),
        ],
      )
    );

    if(confirm == true){

  final deletedCount = selectedItems.length; 

  for(int id in selectedItems){
    await service.deleteskincare(id);
  }

  setState(() {
    selectedItems.clear();
    multiSelectMode = false;
  });

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: const Color(0xFFB76E79),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      content: Text(
        "$deletedCount skincare berhasil dihapus",
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}
  },
  backgroundColor: const Color(0xFFE91E63),
  icon: const Icon(Icons.delete),
  label: const Text("Hapus"),
) : FloatingActionButton(
  onPressed: () async {

  final result = await Navigator.push(
    context,
    MaterialPageRoute(builder: (_) => const AddPage()),
  );

  if(result != null){

    await service.addskincare(
      result["nama"],
      result["jenis"],
      result["catatan"],
    );

    setState(() {});

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: const Color(0xFFB76E79),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        content: const Text(
          "Skincare berhasil ditambahkan",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

  }

},

        child: const Icon(Icons.add,color: Colors.white),
      ),
    );
  }

  Widget filterChip(String label){

    final isSelected = selectedFilter == label;

    return ChoiceChip(

      label: Text(label),

      selected: isSelected,

      selectedColor: const Color(0xFFB76E79),

      backgroundColor: Colors.white,

      labelStyle: TextStyle(
        color: isSelected ? Colors.white : const Color(0xFFB76E79),
      ),

      onSelected: (_){
        setState(() {
          selectedFilter = label;
        });
      },
    );
  }
}