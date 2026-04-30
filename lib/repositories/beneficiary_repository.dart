import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/beneficiary_model.dart';
import '../providers/auth_provider.dart';

final beneficiaryRepositoryProvider = Provider<BeneficiaryRepository>((ref) {
  final supabase = ref.watch(supabaseClientProvider);
  return BeneficiaryRepository(supabase);
});

class BeneficiaryRepository {
  final SupabaseClient _supabase;
  static const String _table = 'beneficiaries';

  BeneficiaryRepository(this._supabase);

  Future<List<Beneficiary>> getBeneficiaries() async {
    final data = await _supabase.from(_table).select().order('name');
    return data.map((e) => Beneficiary.fromJson(e)).toList();
  }

  Future<Beneficiary> getBeneficiaryById(String id) async {
    final data = await _supabase.from(_table).select().eq('id', id).single();
    return Beneficiary.fromJson(data);
  }

  Future<Beneficiary> createBeneficiary(Beneficiary beneficiary) async {
    final data = await _supabase
        .from(_table)
        .insert(beneficiary.toJson())
        .select()
        .single();
    return Beneficiary.fromJson(data);
  }

  Future<Beneficiary> updateBeneficiary(Beneficiary beneficiary) async {
    final data = await _supabase
        .from(_table)
        .update(beneficiary.toJson())
        .eq('id', beneficiary.id)
        .select()
        .single();
    return Beneficiary.fromJson(data);
  }

  Future<void> deleteBeneficiary(String id) async {
    await _supabase.from(_table).delete().eq('id', id);
  }
}
