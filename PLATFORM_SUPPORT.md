# Plataformas Soportadas - AgenteCine

## ✅ Plataformas Soportadas

- **Android** (API 21+)
- **iOS** (iOS 12+)
- **Windows Desktop** (requiere Visual Studio Build Tools)
- **macOS Desktop**
- **Linux Desktop**

## ❌ Plataformas NO Soportadas

### Web
**Razón:** La aplicación utiliza Drift (sqlite3) para persistencia local de favoritos. El paquete `sqlite3` usa FFI (Foreign Function Interface) que **NO es compatible con la plataforma web**.

**Alternativas evaluadas:**
- `drift_web`: Requiere refactoring significativo para usar IndexedDB
- SharedPreferences: Limitaciones de almacenamiento estructurado

**Decisión:** Por simplicidad en Fase 1, web no es soportado. Se evaluará en fases futuras si hay demanda.

## 🔧 Requisitos por Plataforma

### Android
```bash
flutter doctor
# Requiere Android SDK instalado
flutter run -d android
```

### iOS
```bash
# Requiere macOS + Xcode
flutter run -d ios
```

### Windows
```bash
# Requiere Visual Studio 2022 con "Desktop development with C++"
flutter run -d windows
```

### macOS/Linux
```bash
flutter run -d macos  # o linux
```
