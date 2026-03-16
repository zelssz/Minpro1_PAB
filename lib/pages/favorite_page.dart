import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../services/supabase_service.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {

  final service = SupabaseService();

  final List<String> kategori = [
    "Cleanser",
    "Toner",
    "Serum",
    "Moisturizer",
    "Sunscreen",
    "All Favorite"
  ];

  IconData getIcon(String jenis){
    switch(jenis){
      case "Cleanser":
        return Icons.clean_hands;
      case "Toner":
        return Icons.inventory_2;
      case "Serum":
        return Icons.science;
      case "Moisturizer":
        return Icons.local_drink;
      case "Sunscreen":
        return Icons.wb_sunny;
      case "All Favorite":
        return Icons.favorite;
      default:
        return Icons.favorite;
    }
  }

  Color getColor(String jenis){
    switch(jenis){
      case "Cleanser":
        return const Color(0xFF64B5F6);
      case "Toner":
        return const Color(0xFF4DD0E1);
      case "Serum":
        return const Color(0xFF9575CD);
      case "Moisturizer":
        return const Color(0xFFEC407A);
      case "Sunscreen":
        return const Color(0xFFFFB74D);
      case "All Favorite":
        return const Color(0xFFE57373);
      default:
        return const Color(0xFFB76E79);
    }
  }

  @override
  Widget build(BuildContext context){

    final user = Supabase.instance.client.auth.currentUser;

    return Scaffold(
      backgroundColor: const Color(0xFFFDE4EC),

      appBar: AppBar(
  iconTheme: const IconThemeData(
    color: Colors.white, 
  ),
  title: const Text(
    "Favorite Skincare",
    style: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white, 
    ),
  ),
  backgroundColor: const Color(0xFFB76E79),
  elevation: 0,
),

      body: FutureBuilder(

        future: Supabase.instance.client
            .from('skincare')
            .select()
            .eq('favorite', true)
            .eq('user_id', user!.id),

        builder:(context,snapshot){

          if(!snapshot.hasData){
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data as List;

          if(data.isEmpty){
            return const Center(
              child: Text("Belum ada skincare favorit"),
            );
          }

          return GridView.builder(

            padding: const EdgeInsets.all(24),

            itemCount: kategori.length,

            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 1.3,
            ),

            itemBuilder:(context,index){

              final jenis = kategori[index];

              final jumlah = jenis == "All Favorite"
                  ? data.length
                  : data.where((item)=>item["jenis_produk"]==jenis).length;

              if(jumlah == 0){
                return const SizedBox();
              }

              return GestureDetector(

                onTap:(){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => FavoriteJenisPage(
                        jenis: jenis == "All Favorite" ? "" : jenis,
                      ),
                    ),
                  );
                },

                child: HoverCard(
                  child: Container(
                    padding: const EdgeInsets.all(18),

                    decoration: BoxDecoration(

                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFFFFFFFF),
                          Color(0xFFFFF0F4),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),

                      borderRadius: BorderRadius.circular(18),

                      border: Border.all(
                        color: const Color(0xFFF8BBD0),
                        width: 1.5,
                      ),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children:[

                        SkincareIcon(
                          icon: getIcon(jenis),
                          color: getColor(jenis),
                        ),

                        const SizedBox(height:12),

                        Text(
                          jenis,
                          style: const TextStyle(
                            fontSize:16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height:4),

                        Text(
                          "$jumlah produk",
                          style: const TextStyle(
                            fontSize:12,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class FavoriteJenisPage extends StatefulWidget {

  final String jenis;

  const FavoriteJenisPage({super.key, required this.jenis});

  @override
  State<FavoriteJenisPage> createState() => _FavoriteJenisPageState();
}

class _FavoriteJenisPageState extends State<FavoriteJenisPage> {

  IconData getIcon(String jenis){
    switch(jenis){
      case "Cleanser":
        return Icons.clean_hands;
      case "Toner":
        return Icons.inventory_2;
      case "Serum":
        return Icons.science;
      case "Moisturizer":
        return Icons.local_drink;
      case "Sunscreen":
        return Icons.wb_sunny;
      default:
        return Icons.favorite;
    }
  }

  Color getColor(String jenis){
    switch(jenis){
      case "Cleanser":
        return const Color(0xFF64B5F6);
      case "Toner":
        return const Color(0xFF4DD0E1);
      case "Serum":
        return const Color(0xFF9575CD);
      case "Moisturizer":
        return const Color(0xFFEC407A);
      case "Sunscreen":
        return const Color(0xFFFFB74D);
      default:
        return const Color(0xFFB76E79);
    }
  }

  @override
  Widget build(BuildContext context){

    final user = Supabase.instance.client.auth.currentUser;

    return Scaffold(

      backgroundColor: const Color(0xFFFDE4EC),

      appBar: AppBar(
        title: Text(widget.jenis.isEmpty ? "All Favorite" : "Favorite ${widget.jenis}"),
        backgroundColor: const Color(0xFFB76E79),
      ),

      body: FutureBuilder(

        future: widget.jenis.isEmpty
            ? Supabase.instance.client
                .from('skincare')
                .select()
                .eq('favorite', true)
                .eq('user_id', user!.id)
            : Supabase.instance.client
                .from('skincare')
                .select()
                .eq('favorite', true)
                .eq('jenis_produk', widget.jenis)
                .eq('user_id', user!.id),

        builder:(context,snapshot){

          if(!snapshot.hasData){
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data as List;

          return GridView.builder(

            padding: const EdgeInsets.all(24),

            itemCount: data.length,

            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: 1.2,
            ),

            itemBuilder:(context,index){

              final item = data[index];

              return HoverCard(
                child: Container(

                  padding: const EdgeInsets.all(16),

                  decoration: BoxDecoration(

                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFFFFFFF),
                        Color(0xFFFFF0F4),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),

                    borderRadius: BorderRadius.circular(18),

                    border: Border.all(
                      color: const Color(0xFFF8BBD0),
                      width: 1.5,
                    ),

                    boxShadow:[
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius:12,
                        offset: const Offset(0,6),
                      )
                    ]

                  ),

                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.center,

                    children:[

                      SkincareIcon(
                        icon: getIcon(item["jenis_produk"]),
                        color: getColor(item["jenis_produk"]),
                      ),

                      const SizedBox(height:10),

                      Text(
                        item["nama_produk"],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height:4),

                      RatingStars(),

                      const SizedBox(height:6),

                      Text(
                        item["catatan"],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize:12,
                          color: Colors.grey,
                        ),
                      ),

                      const SizedBox(height:8),

                      FavoriteHeart(),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class RatingStars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
        (index) => const Icon(Icons.star, size: 14, color: Colors.amber),
      ),
    );
  }
}

class FavoriteHeart extends StatefulWidget {
  @override
  State<FavoriteHeart> createState() => _FavoriteHeartState();
}

class _FavoriteHeartState extends State<FavoriteHeart> {
  bool active = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          active = !active;
        });
      },
      child: AnimatedScale(
        duration: const Duration(milliseconds:300),
        scale: active ? 1.2 : 1,
        child: Icon(
          active ? Icons.favorite : Icons.favorite_border,
          color: Colors.pink,
        ),
      ),
    );
  }
}

class SkincareIcon extends StatelessWidget {

  final IconData icon;
  final Color color;

  const SkincareIcon({
    super.key,
    required this.icon,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Icon(icon,size:40,color:color),
    );
  }
}

class HoverCard extends StatefulWidget {

  final Widget child;

  const HoverCard({super.key, required this.child});

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {

  bool hover = false;

  @override
  Widget build(BuildContext context) {

    return MouseRegion(

      onEnter: (_) => setState(()=>hover=true),
      onExit: (_) => setState(()=>hover=false),

      child: AnimatedScale(
        duration: const Duration(milliseconds:200),
        scale: hover ? 1.05 : 1,
        child: widget.child,
      ),
    );
  }
}
