# Engineering Rules & AI Guidelines

(Aligned With Current Project Structure)

---

I. Architecture & Structure

1. Two-Layer Architecture

Use a simplified architecture with two layers:

Data Layer
Presentation Layer

Responsibilities:

Data → Models, Repositories
Presentation → Cubit, Screens, Widgets

---

2. Feature-Based Structure

Code must be organized by feature.

lib/
├─ core/
└─ features/
└─ feature_name/

Each feature must be self-contained.

---

3. Feature Folder Structure

Each feature must follow this structure:

feature_name
├─ data
│   ├─ models
│   └─ repositories
│
└─ presentation
├─ cubit
├─ screens
└─ widgets

---

4. Core Layer Discipline

The core/ folder contains shared infrastructure:

core
├─ constants
├─ theme
├─ network
├─ errors
├─ extensions
└─ shared_widgets

No feature-specific code is allowed inside core.

---

5. Strict Data Flow

Application flow must always follow:

UI
↓
Cubit
↓
Repository
↓
API / Firebase / Local Storage

Widgets must never access repositories directly.

---

II. Code Quality & Standards

6. Readable Code First

Code must prioritize clarity and maintainability.

---

7. Single Responsibility Rule

Files must remain small and focused.

Guidelines:

File > 200 lines → split
Widget > 100 lines → split

---

8. Minimal Comments

Comments explain WHY, not WHAT.

---

9. YAGNI Principle

Implement only what is required now.
Avoid speculative abstractions.

---

10. Pattern Consistency

Follow existing project structure and coding patterns.
Do not introduce new patterns without strong justification.

---

III. Flutter & Dart Best Practices

11. Performance First

Use const constructors whenever possible.

---

12. Stateless by Default

Use StatelessWidget unless local mutable state is required.

---

13. Modern Dart Features

Use modern Dart features when they improve clarity:

sealed classes
pattern matching
records

Primarily for Cubit states.

---

14. Dependency Discipline

Avoid unnecessary packages.
Use only stable and well-maintained dependencies.

---

15. Official Naming Conventions

snake_case → files and folders
PascalCase → classes
camelCase → variables and methods

Examples:

login_cubit.dart
auth_repository.dart
user_model.dart

---

IV. Logic & Error Handling

16. Root Cause Resolution

Always fix the root cause of bugs.
Avoid temporary patches.

---

17. Minimal Surface Changes

Modify the smallest possible number of files when fixing issues.

---

18. Explicit Error Handling

API calls must never fail silently.

Use structured error handling:

try
catch
Result / Failure pattern

---

19. Meaningful Error Messages

Avoid generic errors.

Bad:
Something went wrong

Good:
Invalid email or password
Network connection failed
Authentication token expired

---

20. Security Discipline

Never hardcode:

API keys
tokens
credentials

Use environment variables or secure storage.

---

V. Data Layer Rules

21. Model Responsibility

Models represent API or database structures.

Models may contain:

JSON serialization
mapping logic

Examples:

UserModel
AuthResponseModel
ProductModel

---

22. Repository Responsibility

Repositories manage data access.

Responsibilities:

call APIs
handle responses
convert to models
return results to Cubit

Repositories isolate Cubits from networking logic.

---

VI. Presentation Layer Rules

23. Cubit Responsibility

Cubits manage:

state
feature logic
interaction with repositories

Cubits must not contain UI code.

---

24. Widget Responsibility

Widgets must:

render UI
listen to Cubit state
trigger Cubit actions

Widgets must never contain business logic.

---

VII. AI Interaction & Workflow

25. Senior Engineer Behavior

AI responses must reflect senior engineering practices.
Architecture violations must be challenged.

---

26. Zero Assumptions

If requirements are unclear, clarification is required.

---

27. Context Awareness

Before implementing changes always inspect:

existing files
pubspec.yaml
project structure
rules.md

---

28. Plan Before Execution

Complex tasks must begin with a step-by-step implementation plan.

---

29. Task Completion Checklist

Every completed task must include:

Summary of changes
Suggested branch name
Conventional commit message
Next steps if needed
