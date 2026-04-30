import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/staff_model.dart';
import '../providers/auth_provider.dart';

final staffRepositoryProvider = Provider<StaffRepository>((ref) {
  final supabase = ref.watch(supabaseClientProvider);
  return StaffRepository(supabase);
});

class StaffRepository {
  final SupabaseClient _supabase;
  static const String _table = 'staff';

  StaffRepository(this._supabase);

  // Gets the staff profile matching the currently logged-in auth user
  Future<Staff?> getCurrentStaffProfile() async {
    final user = _supabase.auth.currentUser;
    if (user == null) return null;

    try {
      final data = await _supabase
          .from(_table)
          .select()
          .eq('auth_id', user.id)
          .single();
      return Staff.fromJson(data);
    } catch (_) {
      // Handles case where staff profile might not exist for the auth user yet
      return null;
    }
  }

  Future<List<Staff>> getAllStaff() async {
    final data = await _supabase.from(_table).select().order('name');
    return data.map((e) => Staff.fromJson(e)).toList();
  }
}
