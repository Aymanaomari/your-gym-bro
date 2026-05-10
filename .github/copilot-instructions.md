You can update your instruction file with something like this:

---

# Gym Workout Tracker - Flutter Project Instructions

## Architecture

* Use Feature-Based Clean Architecture.

* Project uses a **Monorepo Architecture** managed with Melos.

* Features and shared libraries are separated into independent packages.

* Each feature must contain:

  * `domain`
  * `data`
  * `presentation`

* No direct database usage in presentation layer.

* All database access must go through repositories.

* Repository interfaces defined in domain.

* Implementations in data layer.

* Shared modules must be isolated and reusable.

* No feature may directly depend on another feature’s internal implementation.

---

# Monorepo Structure

The project is organized into multiple packages:

* `your_gym_bro`

  * Main application entry point.

* `packages/modules/user_connection`

  * Handles:

    * onboarding
    * sign in
    * sign up
    * forgot password
    * confirmation flows
    * authentication related user journey

* `packages/design_system`

  * Shared UI library.
  * Contains:

    * themes
    * shared widgets
    * typography
    * colors
    * reusable components

* `packages/core`

  * Shared infrastructure and utilities.
  * Contains:

    * dependency injection
    * common services
    * cache management
    * internationalization
    * shared abstractions

---

# Design System

* UI components must come from the `design_system` package whenever possible.

* Main application theme is defined using:

  * `YGBV0Theme`

* Shared widgets must be reusable and platform-consistent.

* Component development and visualization are handled using Widgetbook.

---

# Dependency Injection

* The project uses a custom dependency injection abstraction built on top of GetIt.

* Direct usage of GetIt outside the abstraction layer is forbidden.

* Dependency resolution is handled through:

  * `CoreDIResolver`

* Each feature/module must expose:

  * a `module.dart`
  * a `factory.dart`

---

# Module Registration Rules

Each feature module is responsible for:

* Registering:

  * datasources
  * repositories
  * use cases
  * view models
  * services

* Example responsibilities:

  * `registerLazySingleton`
  * `registerFactory`

* Dependency registration must remain inside the module layer only.

* Modules are initialized from the application startup layer:

  * `app_dependency_resolver.dart`

---

# Factory Rules

* Each feature must expose a factory layer.

* Factories are the public entry point for:

  * pages
  * screens
  * widgets
  * feature navigation entry points

* Main application must communicate with features through factories only.

* UI components from features must not be instantiated directly from the app layer.

---

# Routing Rules

* Use GoRouter only.
* Til now handled in the `your_gym_bro` package.
* Define all routes in a single `app_router.dart`.
* Route names/paths must be centralized in `route_names.dart`.
* Authentication must be handled using GoRouter redirects.
* No navigation logic inside UI widgets.
* Use typed route parameters when needed.
* Protect authenticated routes using redirect logic.

---

# State Management

* Use Riverpod for `your_gym_bro` package.:

  * state management
  * reactive flows
  * dependency injection where needed

* Avoid unnecessary rebuilds.

* Use selectors/providers optimization when necessary.

* For feature packages, state management is flexible:

  * ValueNotifier & ValueListenableBuilder

---

# Offline Strategy

* App is offline-first.
* Exercises must be seeded from a local JSON file on first launch.
* Videos require internet.
* AI suggestions require internet.

---

# Code Rules

* Follow SOLID principles.
* Use immutable entities.
* Use Freezed for unions and states.
* Avoid business logic inside UI.
* Keep features modular and independently maintainable.

---

# Testing Rules

* The project must use unit tests extensively and Widget Testing. 
* For mocking, use Mockito.

* Every:

  * UseCase
  * Repository implementation
  * Mapper
  * Rule-based AI engine
  * Critical business logic
  * ViewModel
  * Provider
    must have unit tests.

* No business logic should exist without test coverage.

* Mock dependencies using appropriate testing tools.

* Tests must follow feature structure under the `test/` directory.

---

# AI Suggestion v1

* Rule-based engine.

* Based on:

  * User level (`beginner | intermediate`)
  * Goal (`strength | hypertrophy | endurance`)

* Do not implement ML.

* Do not overcomplicate.

---

# Performance Rules

* Avoid unnecessary rebuilds.
* Lazy load heavy lists.
* Do not preload videos.
* Keep package dependencies minimal and isolated.

---

# Authentication

* Online only.
* Required before accessing app content.
* Token stored securely.
* Authentication state must control GoRouter redirects.

---

# Localization

* Must support multi-language.
* All strings must be externalized.
* Hardcoded UI strings are forbidden.

---

# Git & Commit Rules

* Every commit message must follow:

```txt
type: [YGB-XX] - description
```

* `type` must be one of:

  * feat
  * fix
  * chore
  * docs
  * refactor
  * test
  * ci

* Replace `YGB-XX` with the relevant ticket identifier.

* If none exists use:

  * `YGB-000`

* Keep descriptions concise:

  * max 60 characters
  * imperative mood
