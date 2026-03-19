#!/usr/bin/env bash
# AgenteCine - Make script for Linux/Mac/Git Bash
# Usage: ./make.sh [command]

set -e  # Exit on error

COMMAND="${1:-help}"

function show_help() {
    echo ""
    echo "AgenteCine - comandos disponibles"
    echo "----------------------------------"
    echo "  Entorno"
    echo "    ./make.sh setup          Instala Flutter 3.41.4 via FVM y descarga dependencias"
    echo "    ./make.sh doctor         Comprueba que el entorno esta correctamente configurado"
    echo "    ./make.sh devices        Lista los dispositivos y emuladores disponibles"
    echo ""
    echo "  Desarrollo"
    echo "    ./make.sh run            Ejecuta la app en el dispositivo conectado"
    echo "    ./make.sh gen            Regenera codigo (freezed, injectable, drift)"
    echo "    ./make.sh gen-watch      Regenera codigo automaticamente al guardar cambios"
    echo "    ./make.sh format         Formatea todo el codigo Dart"
    echo "    ./make.sh fix            Aplica correcciones de lint automaticamente"
    echo "    ./make.sh lint           Analiza el codigo estaticamente"
    echo ""
    echo "  Testing"
    echo "    ./make.sh test           Pasa todos los tests"
    echo "    ./make.sh coverage       Tests con reporte de cobertura"
    echo ""
    echo "  Build"
    echo "    ./make.sh build          Compila APK debug para Android"
    echo "    ./make.sh build-release  Compila APK release para Android"
    echo "    ./make.sh build-ios      Compila para iOS sin firma de codigo"
    echo "    ./make.sh clean          Limpia artefactos de build"
    echo ""
}

# Detect if we're on Windows (Git Bash) and use fvm.bat, otherwise use fvm
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    FVM="fvm.bat"
else
    FVM="fvm"
fi

case "$COMMAND" in
    help)
        show_help
        ;;
    setup)
        $FVM install
        $FVM flutter pub get
        ;;
    doctor)
        $FVM flutter doctor -v
        ;;
    devices)
        $FVM flutter devices
        ;;
    run)
        $FVM flutter run
        ;;
    gen)
        $FVM dart run build_runner build --delete-conflicting-outputs
        ;;
    gen-watch)
        $FVM dart run build_runner watch --delete-conflicting-outputs
        ;;
    format)
        $FVM dart format .
        ;;
    fix)
        $FVM dart fix --apply
        ;;
    lint)
        $FVM flutter analyze
        ;;
    test)
        $FVM flutter test
        ;;
    coverage)
        $FVM flutter test --coverage
        ;;
    build)
        $FVM flutter build apk --debug
        ;;
    build-release)
        $FVM flutter build apk --release
        ;;
    build-ios)
        $FVM flutter build ios --debug --no-codesign
        ;;
    clean)
        $FVM flutter clean
        ;;
    *)
        echo "Comando desconocido: $COMMAND"
        show_help
        exit 1
        ;;
esac
