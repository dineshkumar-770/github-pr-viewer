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
```

## Token Handeling
The application follows a secure and state-driven approach for handling
authentication tokens.

- Authentication tokens are stored using `flutter_secure_storage` .
- On Android, the storage is backed by **Android Keystore** with encrypted
  shared preferences.
- Tokens are **never hardcoded** inside the application, but for demo purpose I take a hardcoded string to assume it as a token.
- Token read/write operations are abstracted behind a secure storage service
  and injected using Riverpod dependency injection.

### Token Lifecycle follows as
- When user first gets authenticated and received the token.
- This token will be stored securely using `flutter_secure_storage`.
- And when user restarts or cold start the app, that token will be readed from the secure storage and then
  authenticates the user.
- If token exist then user moves to the home screen else to the login screen. The state is persisted.

### Security Notes

- Obfuscation is used only to make reverse engineering harder and
  does not guarantee security
- Client-side applications are considered untrusted environments
- In a production-grade setup, sensitive secrets should always be
  handled on a backend server and not stored in the client app

## Bonus Features
- Dark Mode.
- Animations and Shimmer Loading.
- Pull to refresh.
- Retry on failure.
- Adaptive layout (as Responsiveness is for web part and adaptive is for mobile platforms).
These are essential features that an app must have, So I have added these.

## 🐞 Known Issues / Limitations

- GitHub API rate limiting applies when requests are unauthenticated.
- Finite scrolling pagination is not implemented, if a repo has 100+ PRs then it required.
- The application is optimized for mobile devices only and not considring the web application.
- No offline data caching is implemented for pull request data.
- Accessibility support (TalkBack / VoiceOver) has not been implemented.
  The primary focus of this assignment was on application architecture,
  state management, and secure data handling, although 
  accessibility feature can be added with semantic labels.

## Surprise Features
- Markdown widget for better views and understanding of body of a pull request.
- Handle both portrait and landscape orientation.
- State persistence.

## Demo Video

<p align="left">
  <a href="https://drive.google.com/file/d/1ZjiJGiAzMGeynV575hx9oYYShyLfVanA/view?usp=sharing" target="_blank">
    ▶️ <strong>Watch Demo Video</strong>
  </a>
</p>


