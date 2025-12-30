// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:github_pr_viewer/features/pr_viewer/models/pullrequest_data_model.dart';

class PullrequestStates extends Equatable {
  final bool prLoading;
  final List<PullRequest> pullRequestsList;
  final String prRequestError;

  const PullrequestStates({required this.prLoading, required this.pullRequestsList, required this.prRequestError});

  factory PullrequestStates.initilaizeState() {
    return PullrequestStates(prLoading: false, pullRequestsList: [], prRequestError: "");
  }

  @override
  List<Object> get props => [prLoading, pullRequestsList, prRequestError];

  PullrequestStates copyWith({bool? prLoading, List<PullRequest>? pullRequestsList, String? prRequestError}) {
    return PullrequestStates(
      prLoading: prLoading ?? this.prLoading,
      pullRequestsList: pullRequestsList ?? this.pullRequestsList,
      prRequestError: prRequestError ?? this.prRequestError,
    );
  }
}
