.DEFAULT_GOAL := help

.PHONY: help setup run test coverage build build-ios build-release gen gen-watch format fix clean lint doctor devices

# Detect OS and set FVM command
UNAME_S := $(shell uname -s 2>/dev/null || echo Windows)
ifneq (,$(findstring MINGW,$(UNAME_S)))
	FVM := fvm.bat
else ifneq (,$(findstring MSYS,$(UNAME_S)))
	FVM := fvm.bat
else ifneq (,$(findstring CYGWIN,$(UNAME_S)))
	FVM := fvm.bat
else ifeq ($(UNAME_S),Windows)
	FVM := fvm.bat
else
	FVM := fvm
endif

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
	$(FVM) install
	$(FVM) flutter pub get

doctor:
	$(FVM) flutter doctor -v

devices:
	$(FVM) flutter devices

run:
	$(FVM) flutter run

gen:
	$(FVM) dart run build_runner build --delete-conflicting-outputs

gen-watch:
	$(FVM) dart run build_runner watch --delete-conflicting-outputs

format:
	$(FVM) dart format .

fix:
	$(FVM) dart fix --apply

lint:
	$(FVM) flutter analyze

test:
	$(FVM) flutter test

coverage:
	$(FVM) flutter test --coverage

build:
	$(FVM) flutter build apk --debug

build-release:
	$(FVM) flutter build apk --release

build-ios:
	$(FVM) flutter build ios --debug --no-codesign

clean:
	$(FVM) flutter clean
