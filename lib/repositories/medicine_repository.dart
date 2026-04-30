import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/medicine_model.dart';
import '../providers/auth_provider.dart';

final medicineRepositoryProvider = Provider<MedicineRepository>((ref) {
  final supabase = ref.watch(supabaseClientProvider);
  return MedicineRepository(supabase);
});

class MedicineRepository {
  final SupabaseClient _supabase;
  static const String _table = 'medicines';

  MedicineRepository(this._supabase);

  Future<List<Medicine>> getMedicines() async {
    final data = await _supabase.from(_table).select().order('name');
    return data.map((e) => Medicine.fromJson(e)).toList();
  }

  Future<Medicine> getMedicineById(String id) async {
    final data = await _supabase.from(_table).select().eq('id', id).single();
    return Medicine.fromJson(data);
  }

  Future<Medicine> createMedicine(Medicine medicine) async {
    final data = await _supabase
        .from(_table)
        .insert(medicine.toJson())
        .select()
        .single();
    return Medicine.fromJson(data);
  }

  Future<Medicine> updateMedicine(Medicine medicine) async {
    final data = await _supabase
        .from(_table)
        .update(medicine.toJson())
        .eq('id', medicine.id)
        .select()
        .single();
    return Medicine.fromJson(data);
  }

  Future<void> deleteMedicine(String id) async {
    await _supabase.from(_table).delete().eq('id', id);
  }
}
