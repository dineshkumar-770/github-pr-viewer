import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_pr_viewer/core/shared_prefs.dart';
import 'package:github_pr_viewer/providers/app_provider.dart';
import 'package:github_pr_viewer/routes/app_routes_starter.dart';
import 'package:github_pr_viewer/utils/adaptive_ui/adeptive_ui.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Prefs.init();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    SizeConfig.init(context);

    return SafeArea(
      bottom: true,
      left: false,
      maintainBottomViewPadding: true,
      right: false,
      top: false,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: themeMode,
        theme: ThemeData(brightness: Brightness.light, useMaterial3: true, colorSchemeSeed: Colors.red),
        darkTheme: ThemeData(brightness: Brightness.dark, useMaterial3: true, colorSchemeSeed: Colors.red),
        // home: Prefs.getString(ConstantStrings.tokenKey).isNotEmpty ? const HomeScreen() : const LoginScreen(),
        home: AppStartRouter(),
      ),
    );
  }
}
