import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_pr_viewer/features/pr_viewer/views/settings_screen.dart';
import 'package:github_pr_viewer/features/pr_viewer/widgets/pullrequires_card_tile.dart';
import 'package:github_pr_viewer/providers/app_provider.dart';
import 'package:github_pr_viewer/utils/adaptive_ui/adeptive_ui.dart';
import 'package:github_pr_viewer/utils/common/shimmer_loading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Github PR Viewer", style: TextStyle(fontWeight: FontWeight.bold)),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: Column(
        children: [
          Consumer(
            builder: (context, ref, child) {
              final prState = ref.watch(pullRequestNotifierProvider);
              if (prState.prLoading) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return PullRequestShimmer();
                    },
                  ),
                );
              } else if (prState.prRequestError.isNotEmpty) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(prState.prRequestError, style: TextStyle(fontSize: 16.0.adptSP)),
                      ElevatedButton(
                        onPressed: () {
                          ref.read(pullRequestNotifierProvider.notifier).fetchPRs();
                        },
                        child: const Text("Retry"),
                      ),
                    ],
                  ),
                );
              } else {
                if (prState.pullRequestsList.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("No pull requests available!", style: TextStyle(fontSize: 16.0.adptSP)),
                        ElevatedButton(
                          onPressed: () {
                            ref.read(pullRequestNotifierProvider.notifier).fetchPRs();
                          },
                          child: const Text("Retry"),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        ref.read(pullRequestNotifierProvider.notifier).fetchPRs();
                      },
                      child: ListView.builder(
                        itemCount: prState.pullRequestsList.length,
                        itemBuilder: (context, index) {
                          return PullRequestCard(pullRequest: prState.pullRequestsList[index]);
                        },
                      ),
                    ),
                  );
                }
              }
            },
          ),
          Consumer(
            builder: (context, ref02, child) {
              final token = ref02.read(pullRequestNotifierProvider.notifier).checkForUserToken();
              final themeMode = ref02.watch(themeProvider);
              final isDark = themeMode == ThemeMode.dark;
              if (token.isNotEmpty) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.adptW, vertical: 8.0.adptH),
                  child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: isDark ? Colors.white : Colors.black),
                      borderRadius: BorderRadius.circular(4.0.adptSP),
                    ),
                    child: Center(child: Text(token)),
                  ),
                );
              } else {
                return SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
