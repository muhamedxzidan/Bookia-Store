# Repository Guidelines

## Project Structure & Module Organization

This is a Flutter/Dart bookstore app organized feature-first. App startup lives in
`lib/main.dart`, and `lib/bookia_store.dart` configures localization, routing,
and the initial route. Shared code belongs in `lib/core/`: routing in
`core/routing/`, API setup in `core/service/`, reusable widgets in
`core/share_widgets/`, theme constants in `core/theme/`, and generated helpers in
`core/utils/`. Features live under `lib/features/<feature>/` with `Presentation`,
`cubit`, and `data` layers, for example `lib/features/wishlist/`. Static assets
are under `assets/images/`, `assets/icons/`, `assets/fonts/`, and
`assets/translations/`. Tests live in `test/`.

## Build, Test, and Development Commands

- `flutter pub get`: install dependencies from `pubspec.yaml`.
- `flutter run`: run the app locally on a connected device or emulator.
- `flutter test`: run widget and unit tests.
- `flutter analyze`: run analyzer checks from `analysis_options.yaml`.
- `dart format lib test`: format Dart source and tests.
- `flutter pub run build_runner build --delete-conflicting-outputs`: regenerate
  `flutter_gen` files after asset or font changes.

## Coding Style & Naming Conventions

Use Flutter defaults with the stricter rules configured in
`analysis_options.yaml`. Prefer `const` constructors, final fields, explicit
return types, trailing commas, `super` parameters, and expression-bodied members
where readable. Avoid `print`; use a project-appropriate logging or error state
instead. Name files and folders in `lower_snake_case`, classes in `PascalCase`,
and variables, methods, and Cubit actions in `lowerCamelCase`. Keep feature
classes clearly suffixed, such as `WishlistCubit`, `WishlistState`, and
`WishlistRepo`. Follow the existing feature flow: UI -> Cubit -> Repository ->
API -> State -> UI.

## Testing Guidelines

Use `flutter_test`. Add tests near the same domain name as the code under test,
for example `test/features/wishlist/wishlist_cubit_test.dart` or
`test/widget_test.dart`. Name tests by behavior, not implementation detail. Cover
loading, success, error, and empty states for Cubits and screens that call APIs.
Run `flutter test` before opening a PR.

## Commit & Pull Request Guidelines

Recent history uses short messages, often with a `feat:` prefix. Prefer concise,
imperative messages such as `feat: add cart checkout state` or
`fix: handle empty wishlist`. Avoid vague commits like `done`. PRs should include
a brief description, linked issue if available, test results, and screenshots or
screen recordings for UI changes.

## Security & Configuration Tips

Do not commit secrets, tokens, or local credentials. Auth tokens should stay in
secure storage through `flutter_secure_storage` and `TokenKeySecuer`. Keep API
constants centralized in `lib/core/utils/api_const.dart`, and update both
`assets/translations/en.json` and `assets/translations/ar.json` when adding user
visible strings.
