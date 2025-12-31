# Copilot instructions for ai_trip_planner

This file gives targeted guidance to AI coding agents working on this Flutter repo.

1. Project overview
- This is a Flutter app with Firebase backend. Key directories: `lib/` (app code), `android/`, `ios/`.
- State management uses `flutter_riverpod` (see `lib/main.dart` where `ProviderScope` wraps the app).
- Navigation uses `go_router` (search `core/routing` and `app.dart` for route setup).

2. Critical patterns & examples
- Firebase init: `lib/main.dart` calls `Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)` — keep platform-safe initialization intact.
- Firebase credentials are generated into `lib/firebase_options.dart` (FlutterFire CLI). If you need to reconfigure, run the FlutterFire CLI and update this file.
- Device Preview: `DevicePreview` is enabled when `!kReleaseMode` — do not enable it in release builds.
- Codegen: Freezed + json_serializable are used. Run code generation with:

  flutter pub get
  flutter pub run build_runner build --delete-conflicting-outputs

- Assets: onboarding images are declared in `pubspec.yaml` under `assets/images/` — when adding assets, update `pubspec.yaml` accordingly.

3. Build & run workflows
- Install deps: `flutter pub get`.
- Run codegen (above) after changing models/annotations.
- Run app (mobile): `flutter run -d <device>` (e.g., `-d emulator-5554`), or desktop: `flutter run -d windows`.
- Run tests: `flutter test`.
- If Firebase errors reference missing platforms, re-run FlutterFire CLI to regenerate `lib/firebase_options.dart`.

4. Project-specific conventions
- Use Riverpod providers (not global singletons). Providers are declared under `lib/core/providers`.
- Feature folders under `lib/features/<feature_name>` contain UI, providers, and services for that feature. Follow existing structure when adding new features.
- Keep routing in `lib/core/routing` and expose routes via `app.dart`.
- Data models use `freezed` in `lib/shared` or `lib/core/models` — follow existing naming and toJson/fromJson patterns.

5. Integrations & external points
- Firebase: Auth, Firestore, Storage are used (see `pubspec.yaml` entries and `lib/firebase_options.dart`). Changes to security rules or project id require updating Firebase console and possibly rerunning FlutterFire CLI.
- Third-party libs of note: `go_router`, `flutter_riverpod`, `device_preview`.

6. When changing generated code
- Do NOT hand-edit `lib/firebase_options.dart` unless you know what you're doing — regenerate with FlutterFire CLI.
- Always run build_runner after changing annotations (Freezed/json_serializable) and include `--delete-conflicting-outputs` in CI steps.

7. Helpful file pointers
- App entry: `lib/main.dart` ([lib/main.dart](lib/main.dart#L1-L40)).
- Firebase config: `lib/firebase_options.dart` ([lib/firebase_options.dart](lib/firebase_options.dart#L1-L200)).
- Dependencies: `pubspec.yaml` ([pubspec.yaml](pubspec.yaml#L1-L60)).
- Project README: [README.md](README.md#L1-L40).

8. Quick PR checklist for AI changes
- Update or run codegen if you modify annotated models.
- Ensure Firebase initialization and DevicePreview flags remain unchanged.
- Add/declare assets in `pubspec.yaml` if adding images.
- Run `flutter test` locally for any logic changes.

If any section is unclear or you want more examples (e.g., a routing sample or provider example), tell me which area to expand.
