# 👕 HomeShop

[![Flutter](https://img.shields.io/badge/Flutter-3.24-blue?logo=flutter)](https://flutter.dev)
[![Firebase](https://img.shields.io/badge/Firebase-Firestore-orange?logo=firebase)](https://firebase.google.com/)
[![Razorpay](https://img.shields.io/badge/Payments-Razorpay-blueviolet?logo=razorpay)](https://razorpay.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

A simple Flutter shopping app where users can buy 3 T-shirt designs, pay securely using **Razorpay (test mode)**, and have their transactions stored in **Firebase Firestore**.

---

## 🚀 Features
- 🛒 Choose from 3 T-shirt options
- 💳 Razorpay Payment Gateway (Test Mode)
- ☁️ Store transactions securely in Firebase Firestore
- 📱 Built with Flutter for Android (and iOS-ready)

---

## 📂 Project Structure
lib/
- main.dart # App entry point
- home.dart # Home screen with T-shirt options
- body.dart # Product listing
- placeorder.dart # Checkout & Razorpay integration


---

## ⚙️ Setup & Installation
1. Clone the repo:
   ```bash
   git clone https://github.com/PiyUsH-JOsHI001/homeshop
   cd homeshop

2. Install dependencies:
```
flutter pub get
```


3. Setup Firebase:

 - Create a Firebase project in Firebase Console

 - Enable Firestore Database.

 - Add your google-services.json (Android) or GoogleService-Info.plist (iOS).

4. Setup Razorpay (Test Mode):

 - Sign up at Razorpay Dashboard.

 - Copy your Test Key ID and add it in placeorder.dart.

5. Run the app:
```
flutter run
```
