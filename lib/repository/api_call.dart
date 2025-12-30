import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:github_pr_viewer/core/singletons/network_handler.dart';
import 'package:github_pr_viewer/features/pr_viewer/models/pullrequest_data_model.dart';
import 'package:github_pr_viewer/repository/network_urls.dart';

class ApiCall {
  Future<Either<List<PullRequest>, String>> fetchURLPullRequests() async {
    try {
      String endpoint = NetworkUrls.githubRepoUrl;
      Map<String, String> headers = {'Accept': 'application/vnd.github+json', 'Connection': 'keep-alive'};
      final apiResponse = await HttpHelper.requestGET(url: endpoint, headers: headers);
      if (apiResponse.statusCode == 200) {
        final decodedJSON = jsonDecode(apiResponse.body); 
        List<PullRequest> prList = [];
        for (var pr in decodedJSON) {
          prList.add(PullRequest.fromJson(pr));
        }
        return left(prList);
      } else {
        return right("Some error occured. Please try again in sometime. Errorcode: ${apiResponse.statusCode}");
      }
    } on Exception catch (e) {
      return right(e.toString());
    }
  }
}
