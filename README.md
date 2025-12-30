 # Flutter GitHub Pull Request Viewer
A simple Flutter application that fetches and displays pull requests from the
`flutter/flutter` GitHub repository.  
The app demonstrates clean folder structure with MVC pattren, state management with Riverpod,
secure token handling, theming, and basic animations.


## Project Structure and Setup Steps
### Folder Structure

```text
.
├── core
│   ├── secure_storage
│   │   ├── secure_storage_service.dart
│   │   └── ss_service_implementation.dart
│   ├── shared_prefs.dart
│   └── singletons
│       └── network_handler.dart
├── features
│   ├── auth
│   │   ├── controller
│   │   │   ├── auth_notifier.dart
│   │   │   └── auth_states.dart
│   │   └── views
│   │       └── login_screen.dart
│   └── pr_viewer
│       ├── controller
│       │   ├── pullrequest_notifier.dart
│       │   └── pullrequest_states.dart
│       ├── models
│       │   └── pullrequest_data_model.dart
│       ├── views
│       │   ├── home_screen.dart
│       │   └── settings_screen.dart
│       └── widgets
│           └── pullrequires_card_tile.dart
├── folder_structure.txt
├── main.dart
├── providers
│   └── app_provider.dart
├── repository
│   ├── api_call.dart
│   └── network_urls.dart
├── routes
│   └── app_routes_starter.dart
├── themes
│   └── theme_notifier.dart
└── utils
    ├── adaptive_ui
    │   └── adeptive_ui.dart
    ├── common
    │   └── shimmer_loading.dart
    └── constants
        └── constant_strings.dart
