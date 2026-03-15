param(
    [string]$Command = "help"
)

function Show-Help {
    Write-Host ""
    Write-Host "AgenteCine - comandos disponibles"
    Write-Host "----------------------------------"
    Write-Host "  Entorno"
    Write-Host "    .\make.ps1 setup          Instala Flutter 3.41.4 via FVM y descarga dependencias"
    Write-Host "    .\make.ps1 doctor         Comprueba que el entorno esta correctamente configurado"
    Write-Host "    .\make.ps1 devices        Lista los dispositivos y emuladores disponibles"
    Write-Host ""
    Write-Host "  Desarrollo"
    Write-Host "    .\make.ps1 run            Ejecuta la app en el dispositivo conectado"
    Write-Host "    .\make.ps1 gen            Regenera codigo (freezed, injectable, drift)"
    Write-Host "    .\make.ps1 gen-watch      Regenera codigo automaticamente al guardar cambios"
    Write-Host "    .\make.ps1 format         Formatea todo el codigo Dart"
    Write-Host "    .\make.ps1 fix            Aplica correcciones de lint automaticamente"
    Write-Host "    .\make.ps1 lint           Analiza el codigo estaticamente"
    Write-Host ""
    Write-Host "  Testing"
    Write-Host "    .\make.ps1 test           Pasa todos los tests"
    Write-Host "    .\make.ps1 coverage       Tests con reporte de cobertura"
    Write-Host ""
    Write-Host "  Build"
    Write-Host "    .\make.ps1 build          Compila APK debug para Android"
    Write-Host "    .\make.ps1 build-release  Compila APK release para Android"
    Write-Host "    .\make.ps1 build-ios      Compila para iOS sin firma de codigo"
    Write-Host "    .\make.ps1 clean          Limpia artefactos de build"
    Write-Host ""
}

switch ($Command) {
    "help"          { Show-Help }
    "setup"         { fvm install; fvm flutter pub get }
    "doctor"        { fvm flutter doctor -v }
    "devices"       { fvm flutter devices }
    "run"           { fvm flutter run }
    "gen"           { fvm dart run build_runner build --delete-conflicting-outputs }
    "gen-watch"     { fvm dart run build_runner watch --delete-conflicting-outputs }
    "format"        { fvm dart format . }
    "fix"           { fvm dart fix --apply }
    "lint"          { fvm flutter analyze }
    "test"          { fvm flutter test }
    "coverage"      { fvm flutter test --coverage }
    "build"         { fvm flutter build apk --debug }
    "build-release" { fvm flutter build apk --release }
    "build-ios"     { fvm flutter build ios --debug --no-codesign }
    "clean"         { fvm flutter clean }
    default         { Write-Host "Comando desconocido: $Command"; Show-Help }
}
