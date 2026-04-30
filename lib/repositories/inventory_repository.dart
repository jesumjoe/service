import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/inventory_model.dart';
import '../providers/auth_provider.dart';

final inventoryRepositoryProvider = Provider<InventoryRepository>((ref) {
  final supabase = ref.watch(supabaseClientProvider);
  return InventoryRepository(supabase);
});

class InventoryRepository {
  final SupabaseClient _supabase;
  static const String _table = 'inventory';

  InventoryRepository(this._supabase);

  Future<List<Inventory>> getInventory() async {
    final data = await _supabase.from(_table).select().order('expiry_date');
    return data.map((e) => Inventory.fromJson(e)).toList();
  }

  Future<List<Inventory>> getInventoryByMedicineId(String medicineId) async {
    final data = await _supabase
        .from(_table)
        .select()
        .eq('medicine_id', medicineId)
        .order('expiry_date');
    return data.map((e) => Inventory.fromJson(e)).toList();
  }

  Future<Inventory> addInventory(Inventory inventory) async {
    final data = await _supabase
        .from(_table)
        .insert(inventory.toJson())
        .select()
        .single();
    return Inventory.fromJson(data);
  }

  Future<Inventory> updateInventory(Inventory inventory) async {
    final data = await _supabase
        .from(_table)
        .update(inventory.toJson())
        .eq('id', inventory.id)
        .select()
        .single();
    return Inventory.fromJson(data);
  }

  Future<void> deleteInventory(String id) async {
    await _supabase.from(_table).delete().eq('id', id);
  }
}
