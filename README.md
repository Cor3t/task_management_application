# Task App

A simple task management application built with Flutter. This app allows users to add, edit, delete, and schedule tasks with local notifications.

## Features

- Add, edit, and delete tasks
- Schedule notifications for tasks
- Local storage for task persistence
- User-friendly interface

## Prerequisites

Before running the app, ensure you have the following installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart](https://dart.dev/get-dart)
- Android Studio or VS Code (Recommended IDEs)
- An emulator or physical device for testing

## Installation

1. **Clone the repository:**

   ```sh
   git clone https://github.com/yourusername/task-app.git
   cd task-app
   ```

2. **Install dependencies:**

   ```sh
   flutter pub get
   ```

3. **Run the application:**

   ```sh
   flutter run
   ```

## Key Implementation Choices

1. **State Management:**
   - The app uses **Provider** for managing state efficiently.
2. **Local Notifications:**
   - Implemented using **flutter_local_notifications** to allow scheduled alerts for tasks.
3. **Persistent Storage:**
   - Uses **Hive** for lightweight, fast local storage of tasks.
4. **UI/UX Design:**
   - Follows Material Design principles for a clean and intuitive interface.

## Built With

- **Flutter** - UI framework
- **Dart** - Programming language
- **Flutter Local Notifications** - Notification scheduling
- **Provider** - State management
- **Sqflite** - Local storage
