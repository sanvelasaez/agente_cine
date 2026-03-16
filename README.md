# AgenteCine

Aplicación móvil Flutter para descubrimiento y gestión de películas, desarrollada con Clean Architecture, BLoC, Riverpod y la API de The Movie Database (TMDB).

---

## ¿Qué es AgenteCine?

AgenteCine es una app para aficionados al cine que quieren explorar el catálogo cinematográfico desde el móvil. Permite descubrir películas por tendencias, popularidad o género, buscar cualquier película, ver su ficha completa con reparto y tráiler, y guardar favoritos que persisten offline.

### Funcionalidades (v1.0.0)

- **Inicio** — listas horizontales de tendencias, populares, mejor valoradas, próximos estrenos y en cines ahora
- **Búsqueda global** — buscador con resultados en tiempo real y debounce
- **Detalle de película** — sinopsis, reparto, géneros, valoración y tráiler
- **Favoritos** — lista personal persistida localmente con SQLite (funciona sin conexión)
- **Categorías** — listado de películas filtradas por género

### Plataformas soportadas

| Plataforma | Soporte |
|---|---|
| Android | ✅ |
| iOS | ✅ |
| Web | ❌ (Drift/SQLite usa FFI, incompatible con web) |

---

## Stack tecnológico

| Capa | Tecnología |
|---|---|
| Framework | Flutter 3.41.4 / Dart 3.11.1 |
| Arquitectura | Clean Architecture (domain / infrastructure / presentation) |
| Estado complejo | flutter_bloc + BLoC pattern |
| Estado simple / caché | Riverpod |
| Inyección de dependencias | get_it + injectable |
| Navegación | go_router |
| Red | dio |
| Base de datos local | drift (SQLite) |
| Modelos inmutables | freezed + json_serializable |
| Testing | flutter_test + mocktail + bloc_test |

---

## Requisitos previos

Antes de clonar el proyecto asegúrate de tener instalado:

- [Git](https://git-scm.com/)
- [FVM](https://fvm.app/) — gestor de versiones de Flutter (ver sección siguiente)
- [Android Studio](https://developer.android.com/studio) con Android SDK ≥ 35 y Java 17
- Para iOS: Xcode ≥ 15 con CocoaPods

## Instalación de FVM

El proyecto fija la versión de Flutter en `.fvmrc` (actualmente **3.41.4**). FVM descarga y gestiona esa versión automáticamente sin afectar a tu Flutter global.

### Instalar FVM (una sola vez)

```bash
dart pub global activate fvm
```

Después añade el directorio de binarios globales de Dart a tu `PATH`:

| SO | Ruta a añadir |
|---|---|
| Windows | `C:\Users\<tu-usuario>\AppData\Local\Pub\Cache\bin` |
| macOS / Linux | `$HOME/.pub-cache/bin` |

Verifica la instalación:

```bash
fvm --version
```

---

## Comandos del proyecto

El repositorio incluye scripts que evitan tener que escribir `fvm flutter` en cada comando. Elige el que corresponda a tu sistema:

| Sistema | Script |
|---|---|
| macOS / Linux / Git Bash | `make <comando>` |
| Windows CMD | `make.bat <comando>` |
| Windows PowerShell | `.\make.ps1 <comando>` |

### Referencia de comandos

**Entorno**

| Comando | Descripción |
|---|---|
| `setup` | Descarga Flutter 3.41.4 via FVM e instala dependencias |
| `doctor` | Comprueba que el entorno está correctamente configurado |
| `devices` | Lista los dispositivos y emuladores disponibles |

**Desarrollo**

| Comando | Descripción |
|---|---|
| `run` | Ejecuta la app en el dispositivo conectado |
| `gen` | Regenera código generado (freezed, injectable, drift) |
| `gen-watch` | Regenera código automáticamente al guardar cambios |
| `format` | Formatea todo el código Dart |
| `fix` | Aplica correcciones de lint automáticamente |
| `lint` | Analiza el código estáticamente |

**Testing**

| Comando | Descripción |
|---|---|
| `test` | Pasa todos los tests |
| `coverage` | Tests con reporte de cobertura |

**Build**

| Comando | Descripción |
|---|---|
| `build` | Compila APK debug para Android |
| `build-release` | Compila APK release para Android |
| `build-ios` | Compila para iOS sin firma de código |
| `clean` | Limpia artefactos de build |


> En todos los casos puedes ejecutar el comando sin argumentos (`make`, `make.bat` o `.\make.ps1`) para ver la lista completa de comandos disponibles.

---

## ¿Qué pasa si tengo una versión de Flutter distinta?

El `pubspec.yaml` tiene el constraint `sdk: '>=3.11.0 <3.12.0'`. Si intentas compilar con una versión de Flutter que use Dart fuera de ese rango verás:

```
Because agente_cine requires SDK version >=3.11.0 <3.12.0, version solving failed.
```

La solución es ejecutar `make setup` (o equivalente en tu SO): FVM descargará automáticamente Flutter 3.41.4.

---

## Generación de código

Los archivos generados (`.freezed.dart`, `.g.dart`, `injection.config.dart`) están commiteados en el repositorio, por lo que **no es necesario regenerar para compilar**.

Si modificas modelos, entidades o configuración de DI, regenera con:

```bash
make gen
```

---

## Tests

```bash
make test      # todos los tests
make coverage  # tests + reporte de cobertura
```

El proyecto cuenta con **84 tests** (100% pasando) y cobertura > 80% en las capas de domain e infrastructure.

---

## Estructura del proyecto

```
lib/
├── main.dart                  # Inicialización: DI, zona de errores, runApp
├── app.dart                   # MaterialApp.router con GoRouter y providers
├── config/                    # Configuración global (router, theme, DI, database)
├── domain/                    # Lógica de negocio pura (entidades, usecases, repositorios)
├── infrastructure/            # Implementaciones concretas (datasources, modelos, mappers)
├── presentation/              # UI, estado y navegación
└── core/                      # Utilidades transversales (logger, network, extensions)
```

---

## API

El proyecto usa la API pública de [The Movie Database (TMDB) v3](https://developer.themoviedb.org/reference/getting-started). La API key está incluida en el código para facilitar el desarrollo local.

> Si la app no carga películas, la clave podría haber superado el límite de peticiones. Regístrate gratis en [TMDB](https://www.themoviedb.org/) y reemplaza la key en `lib/config/constants/api_constants.dart`.

---

## Versiones fijadas

| Herramienta | Versión |
|---|---|
| Flutter | 3.41.4 |
| Dart | 3.11.1 |
| Android SDK | ≥ 35 |
| Java | 17 |

Las versiones exactas de todos los paquetes están fijadas en `pubspec.lock`.
