// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class AuthStates extends Equatable {
  final bool isLoading;
  final bool isAuthenticated;
  final String? authToken;

  const AuthStates({required this.isLoading, required this.isAuthenticated, required this.authToken});

  @override
  List<Object?> get props => [isLoading, isAuthenticated, authToken];

  factory AuthStates.initial() {
    return const AuthStates(
      isLoading: false,
      isAuthenticated: false,
      authToken: "github_auth_or_server_auth_token_or_url_example",
    );
  }

  AuthStates copyWith({bool? isLoading, bool? isAuthenticated, String? authToken}) {
    return AuthStates(
      isLoading: isLoading ?? this.isLoading,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      authToken: authToken ?? this.authToken,
    );
  }
}
