# 📝 Daily Tasks App

A comprehensive task management solution built with Flutter, designed to help users organize their daily activities efficiently. The application leverages Cubit for state management, sqflite for persistent local storage, and local notifications for scheduled task reminders, ensuring a smooth and responsive user experience.

## 📱 Demo
(https://drive.google.com/file/d/165hAr_NPr6cAO6oixh0FB3v9UIaqMdLR/view?usp=drive_link)

## 🚀 Features
- ✔️ Add, edit, and delete tasks
- 🌓 Light/Dark theme support
- ⏰ Task Reminders: Notification 5 minutes before task time
- 🧩 Cubit state management
- 🛣️ Clean routing architecture
- 📱 Responsive UI

## 📂 Project Structure 
```bash
lib/
├── core/
│   ├── cubits/             # Core Cubits for state management
│   ├── di/                 # Dependency Injection setup
│   ├── functions/          # Reusable helper functions
│   ├── helpers/            # Shared helper classes and utilities
│   ├── local_database/     # Local database management
│   ├── routes/             # Application route management
│   ├── services/           # Notification services
│   ├── themes/             # App themes and styling
│   ├── utils/              # Constants and utilities
│   └── widgets/            # Shared widgets used across the app
│
├── features/
│   ├── tasks/
│   │   ├── data/           # Data models and business logic
│   │   └── presentation/
│   │       ├── controllers/  # Cubits for task state management
│   │       ├── screens/      # Main UI screens
│   │       └── widgets/      # Task-related UI components
│   │
│   └── todo_layout/
│       ├── data/           # Layout data management
│       └── presentation/   # Main layout presentation
│
├── custom_bloc_observer.dart  # Custom Bloc observer
└── main.dart                  # Application entry point
