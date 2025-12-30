import 'package:flutter_riverpod/legacy.dart';
import 'package:github_pr_viewer/core/shared_prefs.dart';
import 'package:github_pr_viewer/features/pr_viewer/controller/pullrequest_states.dart';
import 'package:github_pr_viewer/repository/api_call.dart';
import 'package:github_pr_viewer/utils/constants/constant_strings.dart';

class PullrequestNotifier extends StateNotifier<PullrequestStates> {
  PullrequestNotifier() : super(PullrequestStates.initilaizeState()) {
    fetchPRs();
    checkForUserToken();
  }

  final ApiCall _apiCall = ApiCall();

  Future<void> fetchPRs() async {
    state = state.copyWith(prLoading: true, prRequestError: "");
    final response = await _apiCall.fetchURLPullRequests();

    response.fold(
      (data) {
        final prData = data;
        state = state.copyWith(prLoading: false, prRequestError: "", pullRequestsList: prData);
      },
      (r) {
        state = state.copyWith(prLoading: false, prRequestError: r);
      },
    );
  }

  String checkForUserToken(){
    final isTokenAvailable = Prefs.getString(ConstantStrings.tokenKey);
    return isTokenAvailable;
  }
}
