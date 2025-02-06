# 📱 Alborada App

🚀 **Status: In Development**

Alborada is a mobile application developed with **Flutter** and **Supabase** that allows users to manage their profile, update their information, and securely upload profile images.

## 📌 Implemented Features
✅ User registration and authentication with **Supabase Auth**  
✅ Profile editing (name, last name, biography)  
✅ Profile image upload from **camera or gallery**  
✅ Image storage in **Supabase Storage**  
✅ Use of **Cubit (Flutter Bloc)** for state management  

## 🔧 Technologies Used
- **Flutter** 🖥️ (Main framework)
- **Dart** (Programming language)
- **Supabase** (Backend as a Service - BaaS)
- **Flutter Bloc / Cubit** (State management)
- **Freezed & Injectable** (Dependency injection and code generation)
- **Image Picker** (Selecting images from the camera or gallery)

## 📂 Project Structure
```
lib/
│── app/
│   ├── data/               # Repositories and data sources
│   ├── domain/             # Entities and use cases
│   ├── presentation/       # UI and presentation logic
│   ├── core/               # Global configuration and utils
│── main.dart               # App entry point
```

## 🚀 Installation and Setup
### **1️⃣ Prerequisites**
- Install **Flutter** and **Dart**
- Set up an account on **Supabase**
- Create a storage bucket in Supabase named **user_avatars**
- Define **environment variables** in a `.env` file

### **2️⃣ Clone the Project**
```bash
git clone https://github.com/your-repository/alborada-app.git
cd alborada-app
```

### **3️⃣ Install Dependencies**
```bash
flutter pub get
```

### **4️⃣ Configure Environment Variables**
Create a `.env` file at the root of the project and add:
```env
SUPABASE_URL=https://your-supabase-url.supabase.co
SUPABASE_ANON_KEY=your-anon-key
```

### **5️⃣ Run the Application**
```bash
flutter run
```

## 📌 Features in Development
🚧 **Implementation of event listing**  
🚧 **User session persistence**  
🚧 **Performance and security optimization**  

## 📆 Next Steps
🔹 Improve navigation with **GoRouter**  
🔹 Implement **unit testing**  
🔹 Add **dark mode**  

## 📩 Contact
If you have any questions or suggestions, feel free to contact me at **hllsebastian@gmail.com** 📬.

---

📌 **Note:** This README will be updated as development progresses. ✨

