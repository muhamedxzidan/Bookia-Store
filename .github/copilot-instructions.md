# Copilot Instructions

## Instruction priority (highest to lowest)
1) Explicit user request in current chat.
2) This file.
3) Workspace defaults and tool defaults.

If rules conflict, follow the highest-priority rule and mention the assumption briefly.

## Core behavior
- Apply minimal, focused changes only.
- Fix root cause, avoid superficial patches.
- Do not modify unrelated files.
- Keep naming/style consistent with existing Flutter/Dart codebase.
- Prefer small, reusable widgets and const where valid.
- Do not add comments unless requested or needed for critical clarity.

## Scope guardrails
- Implement exactly what was asked, no extra screens/components/flows.
- Do not refactor unrelated code.
- Do not change public APIs unless required by the task.
- If requirements are ambiguous, ask concise essential questions or choose the simplest valid interpretation.

## Flutter/Dart rules
- Follow existing architecture, folders, and state-management patterns.
- Keep null-safety and readability first.
- Respect analysis_options.yaml and keep analyzer clean for changed files.
- Avoid new dependencies unless necessary.
- If adding a dependency, explain why and keep it minimal.
- Prefer existing shared widgets/theme utilities over new primitives.

## Planning and execution
- For non-trivial tasks, provide a short TODO plan first.
- Execute end-to-end: implement, validate, then summarize.
- Run targeted checks first (specific file/test), then broader checks only if needed.
- Never stop at analysis if implementation is feasible.
- If blocked, state blocker clearly and give the best viable next action.

## Validation gate before handoff
- Changed files compile/analyze cleanly when feasible.
- No unrelated formatting churn.
- No unintended dependency/version changes.
- Summary includes what changed, where, and how to verify.

## Communication style
- Be concise, direct, and practical.
- State assumptions clearly when requirements are ambiguous.
- Ask only essential clarification questions.
- Prefer actionable steps over long explanations.

## README generation instruction
When asked to generate a project README, follow this exact directive:

Act as a senior software engineer and professional technical writer.

Analyze this repository and generate a professional, production-ready README.md file.

The README should include:
- Project title with a clear and professional short description
- Project overview (what the project does and its purpose)
- Complete list of features, clearly structured
- Screenshots / Demo section (use placeholder paths if needed)
- Tech stack and tools used
- Architecture or system design overview (if applicable)
- Installation and setup instructions
- How to run the project locally
- Usage guide
- Folder structure overview (if relevant)
- Contribution guidelines (optional)
- Contact or author section

Requirements:
- Use clean, modern Markdown formatting
- Use emojis moderately for better readability
- Make the README suitable for GitHub and recruiters
- Write in clear, professional English
- Adapt the content based on the type of project (mobile app, web app, backend, data, AI, etc.)
- Do not assume a specific technology unless detected from the repository

Output only the final README.md content.
