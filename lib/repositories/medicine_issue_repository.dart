import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/medicine_issue_log_model.dart';
import '../providers/auth_provider.dart';

final medicineIssueRepositoryProvider = Provider<MedicineIssueRepository>((
  ref,
) {
  final supabase = ref.watch(supabaseClientProvider);
  return MedicineIssueRepository(supabase);
});

class MedicineIssueRepository {
  final SupabaseClient _supabase;
  static const String _table = 'medicine_issue_log';

  MedicineIssueRepository(this._supabase);

  Future<List<MedicineIssueLog>> getRecentIssues({int limit = 50}) async {
    final data = await _supabase
        .from(_table)
        .select()
        .order('issued_at', ascending: false)
        .limit(limit);
    return data.map((e) => MedicineIssueLog.fromJson(e)).toList();
  }

  Future<List<MedicineIssueLog>> getIssuesForBeneficiary(
    String beneficiaryId,
  ) async {
    final data = await _supabase
        .from(_table)
        .select()
        .eq('beneficiary_id', beneficiaryId)
        .order('issued_at', ascending: false);
    return data.map((e) => MedicineIssueLog.fromJson(e)).toList();
  }

  Future<MedicineIssueLog> logMedicineIssue(MedicineIssueLog log) async {
    final data = await _supabase
        .from(_table)
        .insert(log.toJson())
        .select()
        .single();
    return MedicineIssueLog.fromJson(data);
  }
}
