import 'package:supabase_flutter/supabase_flutter.dart';

class ProfileBackend {
  final supabase = Supabase.instance.client;

  /// Create user profile
  Future<void> createProfile({
    required String fullName,
    required String phone,
    String? avatarUrl,
  }) async {
    final user = supabase.auth.currentUser;

    if (user == null) {
      throw Exception('No user is logged in.');
    }

    await supabase.from('profiles').insert({
      'id': user.id,
      'full_name': fullName,
      'phone': phone,
      'avatar_url': avatarUrl,
    });
  }

  /// Get current user's profile
  Future<Map<String, dynamic>?> getProfile() async {
    final user = supabase.auth.currentUser;

    if (user == null) return null;

    final profile = await supabase
        .from('profiles')
        .select()
        .eq('id', user.id)
        .maybeSingle();

    return profile;
  }

  /// Check if profile exists
  Future<bool> profileExists() async {
    final profile = await getProfile();
    return profile != null;
  }

  /// Update profile
  Future<void> updateProfile({
    required String fullName,
    required String phone,
    String? avatarUrl,
  }) async {
    final user = supabase.auth.currentUser;

    if (user == null) {
      throw Exception('No user is logged in.');
    }

    await supabase
        .from('profiles')
        .update({
          'full_name': fullName,
          'phone': phone,
          'avatar_url': avatarUrl,
          'updated_at': DateTime.now().toIso8601String(),
        })
        .eq('id', user.id);
  }

  /// Delete profile
  Future<void> deleteProfile() async {
    final user = supabase.auth.currentUser;

    if (user == null) {
      throw Exception('No user is logged in.');
    }

    await supabase.from('profiles').delete().eq('id', user.id);
  }
}
