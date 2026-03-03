# 🏋️ Your Gym Bro

Your Gym Bro is a Flutter mobile application that helps gym trainers and athletes organize, optimize, and improve their workouts.

The app suggests exercises based on the machines available in the gym, tracks completed workouts, and recommends alternative exercises to avoid repeating the same routine.

---

## ✨ Features

- 💪 Discover exercises based on available gym machines
- 📊 Track previous workouts
- 🏋️ Log exercises by equipment
- 🔄 Smart exercise suggestions
- 📈 Workout history tracking

---

## 🚀 Future Improvements

- 🥗 Food tracking
- 🔥 Calorie tracking
- 📊 Progress analytics
- 🤖 Smarter recommendation system

---

## 🏗️ Architecture

This project follows a **Feature-Based Clean Architecture** approach:

Each feature contains:
- `domain`
- `data`
- `presentation`

### Tech Stack

- Flutter
- Dart
- Riverpod (State Management & Dependency Injection)
- GoRouter (Navigation)
- Unit Testing for all features

---

## 📱 Vision

Your Gym Bro aims to become a smart workout companion that adapts to the user's gym environment and workout history to provide better training decisions.

---

## 📌 Status

🚧 In active development.

---

## 🪝 Git Hooks (Husky)

This repository uses Husky to run checks before each commit.

- Install Node dependencies after cloning: npm install
- On each commit, Husky runs:
	- flutter analyze
	- flutter test
- Commit message must match:
	- (feat|chore|performace|performance|bugfix|fix|sec): [YGB-x] - Description
- On each push, Husky runs:
	- flutter test
