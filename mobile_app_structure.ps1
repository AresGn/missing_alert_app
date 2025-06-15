# mobile_app_structure.ps1
# Exécutez ce script dans le dossier racine de votre projet Flutter (mobile_app)

# Création des dossiers Core
$coreFolders = @(
    "core\constants",
    "core\config",
    "core\errors",
    "core\network",
    "core\services",
    "core\utils",
    "core\di"
)

foreach ($folder in $coreFolders) {
    New-Item -Path "lib\$folder" -ItemType Directory -Force
}

# Création des Features
$features = @("auth", "alerts", "volunteers", "notifications", "maps")

foreach ($feature in $features) {
    # Data layer
    New-Item -Path "lib\features\$feature\data\models" -ItemType Directory -Force
    New-Item -Path "lib\features\$feature\data\repositories" -ItemType Directory -Force
    New-Item -Path "lib\features\$feature\data\datasources" -ItemType Directory -Force
    
    # Domain layer
    New-Item -Path "lib\features\$feature\domain\entities" -ItemType Directory -Force
    New-Item -Path "lib\features\$feature\domain\repositories" -ItemType Directory -Force
    New-Item -Path "lib\features\$feature\domain\usecases" -ItemType Directory -Force
    
    # Presentation layer
    New-Item -Path "lib\features\$feature\presentation\bloc" -ItemType Directory -Force
    New-Item -Path "lib\features\$feature\presentation\pages" -ItemType Directory -Force
    New-Item -Path "lib\features\$feature\presentation\widgets" -ItemType Directory -Force
}

# Création des dossiers Shared
$sharedFolders = @(
    "shared\widgets\common",
    "shared\widgets\media",
    "shared\widgets\navigation",
    "shared\themes",
    "shared\l10n"
)

foreach ($folder in $sharedFolders) {
    New-Item -Path "lib\$folder" -ItemType Directory -Force
}

# Création des dossiers App
New-Item -Path "lib\app\router" -ItemType Directory -Force

# Création des assets
$assetFolders = @("icons", "images", "fonts", "lottie")
foreach ($folder in $assetFolders) {
    New-Item -Path "assets\$folder" -ItemType Directory -Force
}

# Création des tests
$testFolders = @("unit", "widget", "integration")
foreach ($folder in $testFolders) {
    New-Item -Path "test\$folder" -ItemType Directory -Force
}

# Création des fichiers principaux
$mainFiles = @(
    "lib\main.dart",
    "lib\app\bloc_observer.dart",
    "lib\app\app.dart",
    "lib\app\router\app_router.dart",
    "lib\core\di\injection_container.dart",
    "lib\core\constants\app_constants.dart",
    "lib\core\constants\api_constants.dart",
    "lib\core\constants\route_constants.dart",
    "lib\core\constants\asset_constants.dart",
    "lib\core\config\app_config.dart",
    "lib\core\config\firebase_config.dart",
    "lib\core\config\environment_config.dart",
    "lib\core\errors\failures.dart",
    "lib\core\errors\exceptions.dart",
    "lib\core\errors\error_handler.dart",
    "lib\core\network\network_info.dart",
    "lib\core\network\api_client.dart",
    "lib\core\network\network_interceptor.dart",
    "lib\core\services\location_service.dart",
    "lib\core\services\notification_service.dart",
    "lib\core\services\permission_service.dart",
    "lib\core\services\storage_service.dart",
    "lib\core\services\analytics_service.dart",
    "lib\core\utils\validators.dart",
    "lib\core\utils\formatters.dart",
    "lib\core\utils\helpers.dart",
    "lib\core\utils\extensions.dart",
    "lib\shared\themes\app_theme.dart",
    "lib\shared\themes\light_theme.dart",
    "lib\shared\themes\dark_theme.dart",
    "lib\shared\themes\theme_colors.dart",
    "lib\shared\l10n\app_localizations.dart",
    "lib\shared\l10n\app_en.arb",
    "lib\shared\l10n\app_fr.arb"
)

foreach ($file in $mainFiles) {
    if (-not (Test-Path $file)) {
        New-Item -Path $file -ItemType File -Force
    }
}

# Message de confirmation
Write-Host "`nStructure de l'application créée avec succès !" -ForegroundColor Green
Write-Host "Dossiers créés :" -ForegroundColor Cyan
Get-ChildItem -Path lib, assets, test -Recurse -Directory | Select-Object FullName

Write-Host "`nFichiers principaux créés :" -ForegroundColor Cyan
Get-ChildItem -Path $mainFiles -ErrorAction SilentlyContinue | Select-Object FullName

Write-Host "`nProchaine étape : Configurer les dépendances dans pubspec.yaml et exécuter 'flutter pub get'" -ForegroundColor Yellow