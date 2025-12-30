import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:github_pr_viewer/core/secure_storage/secure_storage_service.dart';
import 'package:github_pr_viewer/core/secure_storage/ss_service_implementation.dart';
import 'package:github_pr_viewer/features/auth/controller/auth_notifier.dart';
import 'package:github_pr_viewer/features/auth/controller/auth_states.dart';
import 'package:github_pr_viewer/features/pr_viewer/controller/pullrequest_notifier.dart';
import 'package:github_pr_viewer/features/pr_viewer/controller/pullrequest_states.dart';
import 'package:github_pr_viewer/themes/theme_notifier.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) => ThemeNotifier());
final pullRequestNotifierProvider = StateNotifierProvider.autoDispose<PullrequestNotifier, PullrequestStates>((ref) {
  return PullrequestNotifier();
});

final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true, storageCipherAlgorithm: StorageCipherAlgorithm.AES_CBC_PKCS7Padding),
  );
});

final secureStorageServiceProvider = Provider<SecureStorageService>((ref) {
  final storage = ref.read(secureStorageProvider);
  return SecureStorageServiceImpl(storage);
});

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthStates>((ref) {
  final storage = ref.read(secureStorageServiceProvider);
  return AuthNotifier(storage);
});
