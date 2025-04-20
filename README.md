# 📝 Daily Tasks App

A comprehensive task management solution built with Flutter, designed to help users organize their daily activities efficiently. The application leverages Cubit for state management and sqflite for persistent local storage, ensuring a smooth and responsive user experience.

## 📱 Demo
(https://drive.google.com/file/d/165hAr_NPr6cAO6oixh0FB3v9UIaqMdLR/view?usp=drive_link)

## 🚀 Features
- ✔️ Add, edit, and delete tasks
- 🌓 Light/Dark theme support
- 🧩 Cubit state management
- 🛣️ Clean routing architecture
- 📱 Responsive UI

## 📂 Project Structure 
 
├── core/
│   ├── cubits/
│   ├── di/
│   ├── functions/
│   ├── helpers/
│   ├── local_database/
│   ├── routes/
│   ├── themes/
│   ├── utils/
│   └── widgets/
├── features/
│   ├── tasks/
│   │   ├── data/
│   │   ├── presentation/
│   │   │   ├── controllers/
│   │   │   ├── screens/
│   │   │   └── widgets/
│   └── todo_layout/
│       ├── data/
│       └── presentation/
├── custom_bloc_observer.dart
└── main.dart
