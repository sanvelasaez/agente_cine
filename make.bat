@echo off
setlocal

set COMMAND=%1

if "%COMMAND%"==""              goto help
if "%COMMAND%"=="help"          goto help
if "%COMMAND%"=="setup"         goto setup
if "%COMMAND%"=="doctor"        goto doctor
if "%COMMAND%"=="devices"       goto devices
if "%COMMAND%"=="run"           goto run
if "%COMMAND%"=="gen"           goto gen
if "%COMMAND%"=="gen-watch"     goto gen-watch
if "%COMMAND%"=="format"        goto format
if "%COMMAND%"=="fix"           goto fix
if "%COMMAND%"=="lint"          goto lint
if "%COMMAND%"=="test"          goto test
if "%COMMAND%"=="coverage"      goto coverage
if "%COMMAND%"=="build"         goto build
if "%COMMAND%"=="build-release" goto build-release
if "%COMMAND%"=="build-ios"     goto build-ios
if "%COMMAND%"=="clean"         goto clean

echo Comando desconocido: %COMMAND%
goto help

:help
echo.
echo AgenteCine - comandos disponibles
echo ----------------------------------
echo   Entorno
echo     make.bat setup          Instala Flutter 3.41.4 via FVM y descarga dependencias
echo     make.bat doctor         Comprueba que el entorno esta correctamente configurado
echo     make.bat devices        Lista los dispositivos y emuladores disponibles
echo.
echo   Desarrollo
echo     make.bat run            Ejecuta la app en el dispositivo conectado
echo     make.bat gen            Regenera codigo (freezed, injectable, drift)
echo     make.bat gen-watch      Regenera codigo automaticamente al guardar cambios
echo     make.bat format         Formatea todo el codigo Dart
echo     make.bat fix            Aplica correcciones de lint automaticamente
echo     make.bat lint           Analiza el codigo estaticamente
echo.
echo   Testing
echo     make.bat test           Pasa todos los tests
echo     make.bat coverage       Tests con reporte de cobertura
echo.
echo   Build
echo     make.bat build          Compila APK debug para Android
echo     make.bat build-release  Compila APK release para Android
echo     make.bat build-ios      Compila para iOS sin firma de codigo
echo     make.bat clean          Limpia artefactos de build
echo.
goto end

:setup
fvm install
fvm flutter pub get
goto end

:doctor
fvm flutter doctor -v
goto end

:devices
fvm flutter devices
goto end

:run
fvm flutter run
goto end

:gen
fvm dart run build_runner build --delete-conflicting-outputs
goto end

:gen-watch
fvm dart run build_runner watch --delete-conflicting-outputs
goto end

:format
fvm dart format .
goto end

:fix
fvm dart fix --apply
goto end

:lint
fvm flutter analyze
goto end

:test
fvm flutter test
goto end

:coverage
fvm flutter test --coverage
goto end

:build
fvm flutter build apk --debug
goto end

:build-release
fvm flutter build apk --release
goto end

:build-ios
fvm flutter build ios --debug --no-codesign
goto end

:clean
fvm flutter clean
goto end

:end
endlocal
