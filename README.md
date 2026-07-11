# Service App

## Project Overview
This project is a Flutter application designed for clinic, health, or NGO service management. The system aims to streamline daily operations by handling staff and beneficiary records, tracking attendance, and comprehensively managing medicine inventory and dispensation.

## Tech Stack
- **Framework**: [Flutter](https://flutter.dev/) (Dart)
- **Backend & Database**: [Supabase](https://supabase.com/) (`supabase_flutter`) for authentication and database services.
- **State Management**: [Riverpod](https://riverpod.dev/) (`flutter_riverpod`)
- **Routing**: [GoRouter](https://pub.dev/packages/go_router) (`go_router`)
- **Environment Config**: `flutter_dotenv`

## Scope
The intended scope of the application encompasses the following modules:
- **Staff Management**: Handling staff profiles and related data.
- **Attendance Tracking**: Monitoring and logging attendance.
- **Beneficiary Management**: Maintaining records of beneficiaries (patients or aid recipients).
- **Medicine Inventory**: Tracking the stock levels of medicines and managing inventory updates.
- **Medicine Dispensation**: Logging and tracking the issuance of medicines to beneficiaries.

## Current State
The project is currently in the **early development (prototype) stage**.

- **Implemented**: 
  - Foundational project architecture.
  - Integration with Supabase and environment variable configuration.
  - Data models and repositories are fully defined for the core domains (`attendance`, `beneficiary`, `inventory`, `medicine`, `medicine_issue`, `staff`).
  - Authentication flow (Login screen) and routing setup.
  - A basic Dashboard screen displaying the currently logged-in user.

- **Pending**: 
  - UI screens and forms for the core modules (Staff, Beneficiaries, Inventory, etc.).
  - State management (Riverpod providers) to connect the UI to the existing repositories.
  - Full CRUD operations implementation on the frontend.
