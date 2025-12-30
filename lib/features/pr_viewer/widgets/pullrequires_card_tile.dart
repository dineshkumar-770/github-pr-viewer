import 'package:flutter/material.dart';
import 'package:github_pr_viewer/features/pr_viewer/models/pullrequest_data_model.dart';
import 'package:github_pr_viewer/utils/adaptive_ui/adeptive_ui.dart';
import 'package:markdown_widget/widget/markdown.dart';

class PullRequestCard extends StatefulWidget {
  final PullRequest pullRequest;

  const PullRequestCard({super.key, required this.pullRequest});

  @override
  State<PullRequestCard> createState() => _PullRequestCardState();
}

class _PullRequestCardState extends State<PullRequestCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final pr = widget.pullRequest;
    final theme = Theme.of(context);

    return Card(
      elevation: 1,
      margin: EdgeInsets.symmetric(horizontal: 12.0.adptH, vertical: 8.0.adptH),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0.adptSP)),
      child: Padding(
        padding: EdgeInsets.all(14.0.adptSP),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 8.0.adptW,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.published_with_changes_outlined),
                Expanded(
                  child: Text(pr.title, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
                ),
              ],
            ),

            SizedBox(height: 10.0.adptH),
            if (pr.body.isNotEmpty) ...[
              AnimatedCrossFade(
                firstChild: Text(pr.body, maxLines: 3, overflow: TextOverflow.ellipsis, style: theme.textTheme.bodyMedium),
                secondChild: MarkdownWidget(data: pr.body, shrinkWrap: true),
                crossFadeState: _expanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 200),
              ),
              SizedBox(height: 6.0.adptH),
              GestureDetector(
                onTap: () {
                  setState(() => _expanded = !_expanded);
                },
                child: Text(_expanded ? "Show less" : "Read more", style: theme.textTheme.labelLarge?.copyWith(color: theme.colorScheme.primary)),
              ),
            ],
            SizedBox(height: 12.0.adptH),
            Row(
              children: [
                Icon(Icons.person_outline, size: 16.0.adptSP, color: theme.colorScheme.primary),
                SizedBox(width: 4.0.adptW),
                Text(pr.author, style: theme.textTheme.labelMedium),
                const Spacer(),
                Text(_formatDate(pr.createdAt), style: theme.textTheme.labelSmall),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final d = date.toLocal();
    return "${d.day.toString().padLeft(2, '0')}-"
        "${d.month.toString().padLeft(2, '0')}-"
        "${d.year}";
  }
}
