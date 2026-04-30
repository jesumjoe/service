import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/attendance_model.dart';
import '../providers/auth_provider.dart';

final attendanceRepositoryProvider = Provider<AttendanceRepository>((ref) {
  final supabase = ref.watch(supabaseClientProvider);
  return AttendanceRepository(supabase);
});

class AttendanceRepository {
  final SupabaseClient _supabase;
  static const String _table = 'attendance';

  AttendanceRepository(this._supabase);

  Future<List<Attendance>> getRecentAttendance({int limit = 50}) async {
    final data = await _supabase
        .from(_table)
        .select()
        .order('created_at', ascending: false)
        .limit(limit);
    return data.map((e) => Attendance.fromJson(e)).toList();
  }

  Future<List<Attendance>> getAttendanceForBeneficiary(
    String beneficiaryId,
  ) async {
    final data = await _supabase
        .from(_table)
        .select()
        .eq('beneficiary_id', beneficiaryId)
        .order('created_at', ascending: false);
    return data.map((e) => Attendance.fromJson(e)).toList();
  }

  Future<Attendance> logAttendance(Attendance attendance) async {
    final data = await _supabase
        .from(_table)
        .insert(attendance.toJson())
        .select()
        .single();
    return Attendance.fromJson(data);
  }
}
