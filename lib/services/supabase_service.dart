import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {

  final supabase = Supabase.instance.client;

  /// ================= READ DATA =================

  Future<List<Map<String, dynamic>>> getskincare() async {

    final user = supabase.auth.currentUser;

    final data = await supabase
        .from('skincare')
        .select()
        .eq('user_id', user!.id)
        .order('id', ascending: true);

    return List<Map<String, dynamic>>.from(data);
  }

  /// ================= CREATE DATA =================

  Future<void> addskincare(
    String nama,
    String jenis,
    String catatan,
  ) async {

    final user = supabase.auth.currentUser;

    await supabase.from('skincare').insert({
      'nama_produk': nama,
      'jenis_produk': jenis,
      'catatan': catatan,
      'favorite': false,
      'user_id': user!.id
    });
  }

  /// ================= UPDATE DATA =================

  Future<void> updateskincare(
    int id,
    String nama,
    String jenis,
    String catatan,
  ) async {

    final user = supabase.auth.currentUser;

    await supabase
        .from('skincare')
        .update({
          'nama_produk': nama,
          'jenis_produk': jenis,
          'catatan': catatan,
        })
        .eq('id', id)
        .eq('user_id', user!.id);
  }

  /// ================= FAVORITE =================

  Future<void> toggleFavorite(int id, bool currentValue) async {

    final user = supabase.auth.currentUser;

    await supabase
        .from('skincare')
        .update({
          'favorite': !currentValue,
        })
        .eq('id', id)
        .eq('user_id', user!.id);
  }

  /// ================= DELETE DATA =================

  Future<void> deleteskincare(int id) async {

    final user = supabase.auth.currentUser;

    await supabase
        .from('skincare')
        .delete()
        .eq('id', id)
        .eq('user_id', user!.id);
  }

}
