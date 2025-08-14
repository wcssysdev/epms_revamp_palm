# epms_tech

lib/
  ├── core/                # Konstanta, utils, theme, dll
  |     ├── theme
  |         ├── app_colors.dart
  ├── data/                # Data source, API, model, repository impl
  ├── domain/              # Entity, abstract repository, use case
  └── presentation/
      ├── blocs/           # State management (BLoC/Cubit)
      │    └── auth/
      │         ├── auth_bloc.dart
      │         ├── auth_event.dart
      │         └── auth_state.dart
      ├── screens/
      |         ├── login_screen.dart
      └── widgets/
                ├── submit_button_section.dart      