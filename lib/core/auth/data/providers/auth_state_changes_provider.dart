import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repository/firebase_auth_repo.dart';

part 'auth_state_changes_provider.g.dart';

@Riverpod(keepAlive: true)
Stream<User?> authStateChanges(AuthStateChangesRef ref) {
  return FirebaseAuthRepo.instance.authStateChanges();
}
