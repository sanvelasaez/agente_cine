.DEFAULT_GOAL := help

.PHONY: help setup run test coverage build build-ios build-release gen gen-watch format fix clean lint doctor devices

help:
	@echo ""
	@echo "AgenteCine — comandos disponibles"
	@echo "----------------------------------"
	@echo "  Entorno"
	@echo "    make setup          Instala Flutter 3.41.4 via FVM y descarga dependencias"
	@echo "    make doctor         Comprueba que el entorno esta correctamente configurado"
	@echo "    make devices        Lista los dispositivos y emuladores disponibles"
	@echo ""
	@echo "  Desarrollo"
	@echo "    make run            Ejecuta la app en el dispositivo conectado"
	@echo "    make gen            Regenera codigo (freezed, injectable, drift)"
	@echo "    make gen-watch      Regenera codigo automaticamente al guardar cambios"
	@echo "    make format         Formatea todo el codigo Dart"
	@echo "    make fix            Aplica correcciones de lint automaticamente"
	@echo "    make lint           Analiza el codigo estaticamente"
	@echo ""
	@echo "  Testing"
	@echo "    make test           Pasa todos los tests"
	@echo "    make coverage       Tests con reporte de cobertura"
	@echo ""
	@echo "  Build"
	@echo "    make build          Compila APK debug para Android"
	@echo "    make build-release  Compila APK release para Android"
	@echo "    make build-ios      Compila para iOS sin firma de codigo"
	@echo "    make clean          Limpia artefactos de build"
	@echo ""

setup:
	fvm install
	fvm flutter pub get

doctor:
	fvm flutter doctor -v

devices:
	fvm flutter devices

run:
	fvm flutter run

gen:
	fvm dart run build_runner build --delete-conflicting-outputs

gen-watch:
	fvm dart run build_runner watch --delete-conflicting-outputs

format:
	fvm dart format .

fix:
	fvm dart fix --apply

lint:
	fvm flutter analyze

test:
	fvm flutter test

coverage:
	fvm flutter test --coverage

build:
	fvm flutter build apk --debug

build-release:
	fvm flutter build apk --release

build-ios:
	fvm flutter build ios --debug --no-codesign

clean:
	fvm flutter clean
