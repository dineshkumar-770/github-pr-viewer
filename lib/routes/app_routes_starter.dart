import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_pr_viewer/features/auth/views/login_screen.dart';
import 'package:github_pr_viewer/features/pr_viewer/views/home_screen.dart';
import 'package:github_pr_viewer/providers/app_provider.dart';

class AppStartRouter extends ConsumerWidget {
  const AppStartRouter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authNotifierProvider);

    if (auth.isAuthenticated) {
      return const HomeScreen();
    }

    return const LoginScreen();
  }
}
