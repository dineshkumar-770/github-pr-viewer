import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_pr_viewer/features/pr_viewer/views/home_screen.dart';
import 'package:github_pr_viewer/providers/app_provider.dart';
import 'package:github_pr_viewer/utils/adaptive_ui/adeptive_ui.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.0.adptSP),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(Icons.lock_outline, size: 128.0.adptSP, color: theme.colorScheme.primary),
                SizedBox(height: 16.0.adptH),

                Text(
                  "Welcome Back",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0.adptH),

                Text(
                  "Login to continue",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                ),

                SizedBox(height: 32.0.adptH),

                Consumer(
                  builder: (context, ref, _) {
                    final authState = ref.watch(authNotifierProvider);
                    return OutlinedButton.icon(
                      onPressed: () async { 
                        await ref.read(authNotifierProvider.notifier).saveToken(authState.authToken ?? "");

                        if (authState.isAuthenticated) {
                          if (context.mounted) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                          }
                        }
                      },
                      icon: authState.isLoading ? null : const Icon(Icons.code),
                      label: authState.isLoading
                          ? Center(child: CupertinoActivityIndicator(radius: 10.0.adptSP))
                          : const Text("Continue with GitHub"),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 14.0.adptH),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0.adptSP)),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
