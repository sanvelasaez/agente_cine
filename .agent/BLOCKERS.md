# BLOCKERS.md — Impedimentos que requieren intervención

## BLOCKER-001 — FVM requerido para Dart 3.11.0
- **Fecha:** 2026-03-19
- **Agente que lo detecta:** orchestrator
- **Descripción:**
  - El proyecto requiere Dart SDK >=3.11.0 (según pubspec.yaml)
  - Flutter global disponible tiene Dart 3.10.8 (incompatible)
  - FVM no está disponible en el PATH del sistema
  - La dependencia `animate_do: 4.2.0` ya fue añadida a pubspec.yaml pero no se pueden descargar las dependencias
- **Información necesaria del usuario:**
  Por favor instala y configura FVM ejecutando estos comandos:
  ```cmd
  dart pub global activate fvm
  fvm install
  fvm flutter pub get
  ```

  O añade FVM al PATH de Windows si ya está instalado.

  Una vez hecho, responde "listo" para que continúe con la Fase 2.
- **Estado:** RESUELTO (2026-03-19)
- **Resolución:** FVM configurado correctamente y funcionando con Flutter 3.41.4 / Dart 3.11.1. Comandos make (Makefile, make.sh, make.bat) validados.
