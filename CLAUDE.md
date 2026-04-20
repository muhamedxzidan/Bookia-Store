# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Install dependencies
flutter pub get

# Run the app
flutter run

# Static analysis (uses analysis_options.yaml — strict-inference and strict-raw-types are on)
flutter analyze

# Tests
flutter test                          # all tests
flutter test test/widget_test.dart    # single file

# Regenerate flutter_gen outputs after changing assets/ or fonts in pubspec.yaml
flutter pub run build_runner build --delete-conflicting-outputs
```

`flutter_gen` writes generated files to `lib/core/utils/` (`assets.gen.dart`, `fonts.gen.dart`) — never edit these manually.

## Architecture

**Feature-first + Clean Architecture**, two layers per feature:

- **Data layer:** `data/models/` (API response models), `data/repo/` (repository classes that call `DioHelper`)
- **Presentation layer:** `cubit/` (state logic), `Presentation/` (screens and widgets)

Strict data flow: **UI → Cubit → Repository → DioHelper → API**. Widgets must never call repositories directly. See `.github/copilot-instructions.md` for the full project engineering rules — that file is authoritative on naming, file-size limits, and layering, and you should follow it.

### Core Infrastructure

- **`core/service/dio_helper.dart`** — singleton `Dio` (lazy-initialized via `DioHelper.dio`). Two interceptors: `_AuthInterceptor` reads the bearer token from `FlutterSecureStorage` and attaches it to every request; `_LoggingInterceptor` logs request/response/error in `kDebugMode` only.
- **`core/utils/api_const.dart`** — every endpoint string lives here. Base URL: `https://codingarabic.online/api`. Add new endpoints here, not inline.
- **`core/utils/token_key_secuer.dart`** — single source of truth for the secure-storage key used for the auth token. Use this constant; do not hard-code the key.
- **`core/routing/`** — named routing via `AppRoutes.generateRoute`. Route strings in `routes.dart`, switch in `app_routes.dart`. `BookiaStore.start()` picks `Routes.login` when no token exists, else `Routes.bottomNavBar`.

### State Management (BLoC/Cubit + sealed states)

States are sealed-class hierarchies (e.g. `HomeInitial | HomeLoading | HomeLoaded | HomeError`). Use `final class` subclasses and `@immutable`, matching `home_state.dart`.

Cubit-provider scoping in this codebase is **mixed** — match the existing pattern when adding features:

- **Global** (`main.dart` `MultiBlocProvider`): `HomeCubit`, `WishlistCubit`, `CartCubit` — used across many screens and the bottom-nav tabs. `HomeCubit` is eagerly seeded with `getSliders()` and `getBestSellers()` on creation.
- **Route-scoped** (`BlocProvider` inside `app_routes.dart`): `AuthCubit` — re-created per login/register route entry.

### UI Conventions

- **flutter_screenutil** — design size **375×812** (set in `BookiaStore`). Use `.w` / `.h` / `.sp` suffixes; do not hard-code pixel sizes. (Note: `main.dart` has an outer `ScreenUtilInit` with 360×690, but the inner one in `BookiaStore` is what actually drives sizing.)
- **easy_localization** — translations in `assets/translations/{en,ar}.json`. Reference keys via the project's `AppStrings` constants rather than raw string literals.
- **flutter_gen** — use the generated `Assets` / fonts classes, not raw asset paths.

### Adding a New Feature

1. Create `lib/features/<feature>/{data/models,data/repo,cubit,Presentation}/`.
2. Add endpoints to `core/utils/api_const.dart`.
3. Add a route constant in `core/routing/routes.dart` and a `case` in `core/routing/app_routes.dart`.
4. Decide cubit scope: global in `main.dart` if it's shared across tabs; otherwise wrap the route in a `BlocProvider` inside `app_routes.dart`.

## Lint Rules That Affect How You Write Code

`analysis_options.yaml` enables some non-default rules that change idiomatic style — write new code to satisfy them so `flutter analyze` stays clean:

- `sort_constructors_first` — constructors before fields/methods.
- `require_trailing_commas` — trailing commas on multi-line argument/parameter lists.
- `prefer_expression_function_bodies` — use `=>` for single-expression bodies.
- `always_declare_return_types`, `prefer_final_fields`, `use_super_parameters`, `unnecessary_this`.
- Strict mode: `strict-inference: true`, `strict-raw-types: true` — no implicit `dynamic`, no raw generics.

## Key Dependencies

| Package | Purpose |
|---|---|
| `flutter_bloc` / `bloc` | State management (Cubit) |
| `dio` | HTTP client (wrapped by `DioHelper`) |
| `flutter_secure_storage` | Auth token storage |
| `shared_preferences` | Non-sensitive local prefs |
| `flutter_screenutil` | Responsive sizing |
| `easy_localization` | EN/AR localization |
| `flutter_svg` | SVG rendering |
| `skeletonizer` | Loading-skeleton UI |
| `pinput` | OTP input |
| `carousel_slider` + `smooth_page_indicator` | Home sliders |
| `rive` | Rive animations |
| `flutter_gen` (+ runner) | Type-safe asset/font codegen |
| `flutter_native_splash` | Splash-screen generation |