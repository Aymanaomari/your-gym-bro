# Gym Workout Tracker - Flutter Project Instructions

## Architecture

- Use Feature-Based Clean Architecture.
- Each feature must contain:
  - domain
  - data
  - presentation

- No direct database usage in presentation layer.
- All database access must go through repositories.
- Repository interfaces defined in domain.
- Implementations in data layer.

- Use Riverpod for:
  - State management
  - Dependency injection

- Use GoRouter for routing.
- Routing configuration must be centralized in `core/routing`.
- Do NOT use Navigator directly.
- Do NOT use get_it.
- Do NOT access Isar directly from UI.

---

## Routing Rules

- Use GoRouter only.
- Define all routes in a single `app_router.dart`.
- Route names/paths must be centralized in `route_names.dart`.
- Authentication must be handled using GoRouter redirects.
- No navigation logic inside UI widgets.
- Use typed route parameters when needed.
- Protect authenticated routes using redirect logic.

---

## Local Database

- Use Isar.
- All collections defined in data layer.
- Domain entities must not depend on Isar annotations.
- Use mappers between Isar models and domain entities.

---

## Offline Strategy

- App is offline-first.
- Exercises must be seeded from a local JSON file on first launch.
- Videos require internet.
- AI suggestions require internet.

---

## Code Rules

- Follow SOLID principles.
- No feature may depend on another feature’s data layer.
- Use immutable entities.
- Use Freezed for unions and states.
- Avoid business logic inside UI.

---

## Testing Rules

- The project must use unit tests extensively.
- Every:
  - UseCase
  - Repository implementation
  - Mapper
  - Rule-based AI engine
  - Critical business logic
  must have unit tests.
- No business logic should exist without test coverage.
- Mock dependencies using appropriate testing tools.
- Presentation layer logic (controllers/notifiers) must also be unit tested.
- Tests must be placed under the `test/` directory following feature structure.

---

## AI Suggestion v1

- Rule-based engine.
- Based on:
  - User level (beginner | intermediate)
  - Goal (strength | hypertrophy | endurance)

- Do not implement ML.
- Do not overcomplicate.

---

## Performance Rules

- Avoid unnecessary rebuilds.
- Use Riverpod selectors when needed.
- Lazy load heavy lists.
- Do not preload videos.

---

## Naming Conventions

- Use case names must end with "UseCase".
- Repository interfaces end with "Repository".
- Data implementations end with "RepositoryImpl".
- Providers must be defined in a separate `providers.dart` per feature.

---

## Authentication

- Online only.
- Required before accessing app content.
- Token stored securely.
- Authentication state must control GoRouter redirects.

---

## Localization

- Must support multi-language.
- All strings must be externalized.