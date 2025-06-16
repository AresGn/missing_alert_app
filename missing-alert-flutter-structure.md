# Missing Alert - Architecture Flutter Complète

## 🏗️ Stack Technologique Recommandée

### Frontend (Flutter)
```yaml
dependencies:
  flutter_sdk: ^3.29.0
  
  # State Management
  flutter_bloc: ^8.1.3        # Architecture BLoC
  get_it: ^7.6.4               # Dependency Injection
  equatable: ^2.0.5            # Value equality
  
  # UI & Navigation
  go_router: ^12.1.3           # Navigation déclarative
  flutter_screenutil: ^5.9.0   # Responsive design
  cached_network_image: ^3.3.0 # Cache images
  flutter_svg: ^2.0.9          # SVG support
  
  # Maps & Geolocation
  google_maps_flutter: ^2.5.0  # Google Maps
  geolocator: ^10.1.0          # Géolocalisation
  geocoding: ^2.1.1            # Reverse geocoding
  
  # Backend & Auth
  firebase_core: ^2.24.2       # Firebase core
  firebase_auth: ^4.15.3       # Authentication
  cloud_firestore: ^4.13.6     # Database
  firebase_messaging: ^14.7.10 # Push notifications
  firebase_storage: ^11.5.6    # File storage
  
  # Media & Files
  image_picker: ^1.0.4         # Photos/Vidéos
  permission_handler: ^11.1.0  # Permissions
  path_provider: ^2.1.1        # File paths
  
  # Networking & Utils
  dio: ^5.3.3                  # HTTP client
  connectivity_plus: ^5.0.2    # Network status
  package_info_plus: ^4.2.0    # App info
  device_info_plus: ^9.1.1     # Device info
  
  # Local Storage
  hive_flutter: ^1.1.0         # NoSQL local DB
  shared_preferences: ^2.2.2   # Key-value storage
  
  # Development
  flutter_launcher_icons: ^0.13.1
  flutter_native_splash: ^2.3.6

dev_dependencies:
  flutter_test:
  build_runner: ^2.4.7
  json_annotation: ^4.8.1
  json_serializable: ^6.7.1
  flutter_lints: ^3.0.1
  mockito: ^5.4.2              # Testing
```

### Backend (Firebase + Cloud Functions)
```yaml
# Firebase Services
- Authentication (Phone + SMS OTP)
- Firestore (Real-time database)
- Cloud Functions (Business logic)
- Firebase Messaging (Push notifications)
- Cloud Storage (Images/Videos)
- Analytics & Crashlytics

# Additional Services
- Google Maps API
- Twilio (SMS backup)
- SendGrid (Email notifications)
```

### Web Dashboard (Flutter Web)
```yaml
# Same Flutter codebase with responsive adaptations
- Admin panel for authorities
- Family dashboard
- Analytics & reporting
- Moderation tools
```

## 📁 Structure de Projet Complète

```
missing_alert/
├── 📱 mobile_app/                    # Flutter Mobile App
│   ├── android/
│   ├── ios/
│   ├── lib/
│   │   ├── 🎯 core/                  # Core business logic
│   │   │   ├── constants/
│   │   │   │   ├── app_constants.dart
│   │   │   │   ├── api_constants.dart
│   │   │   │   ├── route_constants.dart
│   │   │   │   └── asset_constants.dart
│   │   │   ├── config/
│   │   │   │   ├── app_config.dart
│   │   │   │   ├── firebase_config.dart
│   │   │   │   └── environment_config.dart
│   │   │   ├── errors/
│   │   │   │   ├── failures.dart
│   │   │   │   ├── exceptions.dart
│   │   │   │   └── error_handler.dart
│   │   │   ├── network/
│   │   │   │   ├── network_info.dart
│   │   │   │   ├── api_client.dart
│   │   │   │   └── network_interceptor.dart
│   │   │   ├── services/
│   │   │   │   ├── location_service.dart
│   │   │   │   ├── notification_service.dart
│   │   │   │   ├── permission_service.dart
│   │   │   │   ├── storage_service.dart
│   │   │   │   └── analytics_service.dart
│   │   │   ├── utils/
│   │   │   │   ├── validators.dart
│   │   │   │   ├── formatters.dart
│   │   │   │   ├── helpers.dart
│   │   │   │   └── extensions.dart
│   │   │   └── di/
│   │   │       ├── injection_container.dart
│   │   │       └── injection_container.config.dart
│   │   │
│   │   ├── 🗂️ features/              # Feature-based architecture
│   │   │   ├── auth/
│   │   │   │   ├── data/
│   │   │   │   │   ├── models/
│   │   │   │   │   │   ├── user_model.dart
│   │   │   │   │   │   └── auth_response_model.dart
│   │   │   │   │   ├── repositories/
│   │   │   │   │   │   └── auth_repository_impl.dart
│   │   │   │   │   └── datasources/
│   │   │   │   │       ├── auth_remote_datasource.dart
│   │   │   │   │       └── auth_local_datasource.dart
│   │   │   │   ├── domain/
│   │   │   │   │   ├── entities/
│   │   │   │   │   │   └── user.dart
│   │   │   │   │   ├── repositories/
│   │   │   │   │   │   └── auth_repository.dart
│   │   │   │   │   └── usecases/
│   │   │   │   │       ├── login_with_phone.dart
│   │   │   │   │       ├── verify_otp.dart
│   │   │   │   │       ├── logout.dart
│   │   │   │   │       └── get_current_user.dart
│   │   │   │   └── presentation/
│   │   │   │       ├── bloc/
│   │   │   │       │   ├── auth_bloc.dart
│   │   │   │       │   ├── auth_event.dart
│   │   │   │       │   └── auth_state.dart
│   │   │   │       ├── pages/
│   │   │   │       │   ├── login_page.dart
│   │   │   │       │   ├── otp_verification_page.dart
│   │   │   │       │   └── profile_setup_page.dart
│   │   │   │       └── widgets/
│   │   │   │           ├── phone_input_field.dart
│   │   │   │           ├── otp_input_field.dart
│   │   │   │           └── auth_button.dart
│   │   │   │
│   │   │   ├── alerts/
│   │   │   │   ├── data/
│   │   │   │   │   ├── models/
│   │   │   │   │   │   ├── alert_model.dart
│   │   │   │   │   │   ├── missing_person_model.dart
│   │   │   │   │   │   └── alert_status_model.dart
│   │   │   │   │   ├── repositories/
│   │   │   │   │   │   └── alert_repository_impl.dart
│   │   │   │   │   └── datasources/
│   │   │   │   │       ├── alert_remote_datasource.dart
│   │   │   │   │       └── alert_local_datasource.dart
│   │   │   │   ├── domain/
│   │   │   │   │   ├── entities/
│   │   │   │   │   │   ├── alert.dart
│   │   │   │   │   │   ├── missing_person.dart
│   │   │   │   │   │   └── location_point.dart
│   │   │   │   │   ├── repositories/
│   │   │   │   │   │   └── alert_repository.dart
│   │   │   │   │   └── usecases/
│   │   │   │   │       ├── create_alert.dart
│   │   │   │   │       ├── get_nearby_alerts.dart
│   │   │   │   │       ├── update_alert_status.dart
│   │   │   │   │       └── report_sighting.dart
│   │   │   │   └── presentation/
│   │   │   │       ├── bloc/
│   │   │   │       │   ├── alert_creation/
│   │   │   │       │   │   ├── alert_creation_bloc.dart
│   │   │   │       │   │   ├── alert_creation_event.dart
│   │   │   │       │   │   └── alert_creation_state.dart
│   │   │   │       │   ├── alert_list/
│   │   │   │       │   │   ├── alert_list_bloc.dart
│   │   │   │       │   │   ├── alert_list_event.dart
│   │   │   │       │   │   └── alert_list_state.dart
│   │   │   │       │   └── alert_details/
│   │   │   │       │       ├── alert_details_bloc.dart
│   │   │   │       │       ├── alert_details_event.dart
│   │   │   │       │       └── alert_details_state.dart
│   │   │   │       ├── pages/
│   │   │   │       │   ├── alert_creation_page.dart
│   │   │   │       │   ├── alert_list_page.dart
│   │   │   │       │   ├── alert_details_page.dart
│   │   │   │       │   └── alert_map_page.dart
│   │   │   │       └── widgets/
│   │   │   │           ├── alert_card.dart
│   │   │   │           ├── alert_form.dart
│   │   │   │           ├── photo_picker.dart
│   │   │   │           ├── location_picker.dart
│   │   │   │           └── alert_status_indicator.dart
│   │   │   │
│   │   │   ├── volunteers/
│   │   │   │   ├── data/
│   │   │   │   │   ├── models/
│   │   │   │   │   │   ├── volunteer_model.dart
│   │   │   │   │   │   └── sighting_report_model.dart
│   │   │   │   │   ├── repositories/
│   │   │   │   │   │   └── volunteer_repository_impl.dart
│   │   │   │   │   └── datasources/
│   │   │   │   │       └── volunteer_remote_datasource.dart
│   │   │   │   ├── domain/
│   │   │   │   │   ├── entities/
│   │   │   │   │   │   ├── volunteer.dart
│   │   │   │   │   │   └── sighting_report.dart
│   │   │   │   │   ├── repositories/
│   │   │   │   │   │   └── volunteer_repository.dart
│   │   │   │   │   └── usecases/
│   │   │   │   │       ├── register_as_volunteer.dart
│   │   │   │   │       ├── update_location.dart
│   │   │   │   │       └── submit_sighting_report.dart
│   │   │   │   └── presentation/
│   │   │   │       ├── bloc/
│   │   │   │       │   ├── volunteer_bloc.dart
│   │   │   │       │   ├── volunteer_event.dart
│   │   │   │       │   └── volunteer_state.dart
│   │   │   │       ├── pages/
│   │   │   │       │   ├── volunteer_dashboard_page.dart
│   │   │   │       │   ├── sighting_report_page.dart
│   │   │   │       │   └── volunteer_profile_page.dart
│   │   │   │       └── widgets/
│   │   │   │           ├── volunteer_stats.dart
│   │   │   │           ├── sighting_form.dart
│   │   │   │           └── volunteer_badge.dart
│   │   │   │
│   │   │   ├── notifications/
│   │   │   │   ├── data/
│   │   │   │   │   ├── models/
│   │   │   │   │   │   └── notification_model.dart
│   │   │   │   │   ├── repositories/
│   │   │   │   │   │   └── notification_repository_impl.dart
│   │   │   │   │   └── datasources/
│   │   │   │   │       └── notification_datasource.dart
│   │   │   │   ├── domain/
│   │   │   │   │   ├── entities/
│   │   │   │   │   │   └── notification.dart
│   │   │   │   │   ├── repositories/
│   │   │   │   │   │   └── notification_repository.dart
│   │   │   │   │   └── usecases/
│   │   │   │   │       ├── send_alert_notification.dart
│   │   │   │   │       ├── get_notifications.dart
│   │   │   │   │       └── mark_as_read.dart
│   │   │   │   └── presentation/
│   │   │   │       ├── bloc/
│   │   │   │       │   ├── notification_bloc.dart
│   │   │   │       │   ├── notification_event.dart
│   │   │   │       │   └── notification_state.dart
│   │   │   │       ├── pages/
│   │   │   │       │   └── notifications_page.dart
│   │   │   │       └── widgets/
│   │   │   │           ├── notification_tile.dart
│   │   │   │           └── notification_badge.dart
│   │   │   │
│   │   │   └── maps/
│   │   │       ├── data/
│   │   │       │   ├── models/
│   │   │       │   │   └── map_location_model.dart
│   │   │       │   ├── repositories/
│   │   │       │   │   └── map_repository_impl.dart
│   │   │       │   └── datasources/
│   │   │       │       └── map_datasource.dart
│   │   │       ├── domain/
│   │   │       │   ├── entities/
│   │   │       │   │   └── map_location.dart
│   │   │       │   ├── repositories/
│   │   │       │   │   └── map_repository.dart
│   │   │       │   └── usecases/
│   │   │       │       ├── get_current_location.dart
│   │   │       │       ├── calculate_distance.dart
│   │   │       │       └── get_address_from_coordinates.dart
│   │   │       └── presentation/
│   │   │           ├── bloc/
│   │   │           │   ├── map_bloc.dart
│   │   │           │   ├── map_event.dart
│   │   │           │   └── map_state.dart
│   │   │           ├── pages/
│   │   │           │   └── interactive_map_page.dart
│   │   │           └── widgets/
│   │   │               ├── custom_map.dart
│   │   │               ├── location_marker.dart
│   │   │               └── map_controls.dart
│   │   │
│   │   ├── 🎨 shared/                # Shared components
│   │   │   ├── widgets/
│   │   │   │   ├── common/
│   │   │   │   │   ├── app_button.dart
│   │   │   │   │   ├── app_text_field.dart
│   │   │   │   │   ├── app_card.dart
│   │   │   │   │   ├── loading_widget.dart
│   │   │   │   │   ├── error_widget.dart
│   │   │   │   │   └── empty_state_widget.dart
│   │   │   │   ├── media/
│   │   │   │   │   ├── image_viewer.dart
│   │   │   │   │   ├── camera_widget.dart
│   │   │   │   │   └── media_picker.dart
│   │   │   │   └── navigation/
│   │   │   │       ├── app_drawer.dart
│   │   │   │       ├── bottom_nav_bar.dart
│   │   │   │       └── custom_app_bar.dart
│   │   │   ├── themes/
│   │   │   │   ├── app_theme.dart
│   │   │   │   ├── light_theme.dart
│   │   │   │   ├── dark_theme.dart
│   │   │   │   └── theme_colors.dart
│   │   │   └── l10n/
│   │   │       ├── app_localizations.dart
│   │   │       ├── app_en.arb
│   │   │       └── app_fr.arb
│   │   │
│   │   ├── 🚀 app/                   # App-level configuration
│   │   │   ├── router/
│   │   │   │   ├── app_router.dart
│   │   │   │   └── route_generator.dart
│   │   │   ├── bloc_observer.dart
│   │   │   └── app.dart
│   │   │
│   │   └── main.dart                 # Entry point
│   │
│   ├── assets/
│   │   ├── icons/
│   │   ├── images/
│   │   ├── fonts/
│   │   └── lottie/
│   │
│   ├── test/
│   │   ├── unit/
│   │   ├── widget/
│   │   └── integration/
│   │
│   └── pubspec.yaml
│
├── 🌐 web_dashboard/                 # Flutter Web Dashboard
│   ├── lib/
│   │   ├── features/
│   │   │   ├── admin/
│   │   │   │   ├── alert_validation/
│   │   │   │   ├── user_management/
│   │   │   │   └── analytics/
│   │   │   ├── family/
│   │   │   │   ├── dashboard/
│   │   │   │   └── alert_management/
│   │   │   └── reports/
│   │   │       ├── statistics/
│   │   │       └── export/
│   │   ├── shared/
│   │   │   ├── widgets/
│   │   │   │   ├── data_table.dart
│   │   │   │   ├── charts/
│   │   │   │   └── forms/
│   │   │   └── responsive/
│   │   │       ├── responsive_layout.dart
│   │   │       └── breakpoints.dart
│   │   └── main.dart
│   │
│   └── web/
│       ├── index.html
│       └── manifest.json
│
├── 📡 backend/                      # Firebase Cloud Functions
│   ├── functions/
│   │   ├── src/
│   │   │   ├── alerts/
│   │   │   │   ├── alertValidation.ts
│   │   │   │   ├── alertDistribution.ts
│   │   │   │   └── alertGeofencing.ts
│   │   │   ├── notifications/
│   │   │   │   ├── pushNotifications.ts
│   │   │   │   ├── smsNotifications.ts
│   │   │   │   └── emailNotifications.ts
│   │   │   ├── users/
│   │   │   │   ├── userManagement.ts
│   │   │   │   └── volunteerVerification.ts
│   │   │   ├── analytics/
│   │   │   │   ├── alertAnalytics.ts
│   │   │   │   └── userAnalytics.ts
│   │   │   ├── utils/
│   │   │   │   ├── validators.ts
│   │   │   │   ├── geoUtils.ts
│   │   │   │   └── helpers.ts
│   │   │   └── index.ts
│   │   ├── package.json
│   │   └── tsconfig.json
│   │
│   ├── firestore/
│   │   ├── firestore.rules
│   │   └── firestore.indexes.json
│   │
│   ├── storage/
│   │   └── storage.rules
│   │
│   └── firebase.json
│
├── 🗄️ database/                     # Database design
│   ├── firestore_structure.md
│   ├── security_rules.md
│   └── data_migration/
│
├── 📚 docs/                         # Documentation
│   ├── api/
│   │   ├── endpoints.md
│   │   └── authentication.md
│   ├── deployment/
│   │   ├── android_deployment.md
│   │   ├── ios_deployment.md
│   │   └── web_deployment.md
│   ├── architecture/
│   │   ├── clean_architecture.md
│   │   ├── state_management.md
│   │   └── folder_structure.md
│   └── user_guides/
│       ├── family_guide.md
│       ├── volunteer_guide.md
│       └── admin_guide.md
│
├── 🧪 testing/                      # Tests centralisés
│   ├── unit_tests/
│   ├── integration_tests/
│   ├── e2e_tests/
│   └── performance_tests/
│
├── 🚀 deployment/                   # Scripts de déploiement
│   ├── scripts/
│   │   ├── build_android.sh
│   │   ├── build_ios.sh
│   │   ├── deploy_web.sh
│   │   └── deploy_functions.sh
│   ├── docker/
│   │   └── Dockerfile
│   └── ci_cd/
│       ├── github_actions.yml
│       └── gitlab_ci.yml
│
├── 📋 project_management/           # Gestion de projet
│   ├── requirements/
│   │   ├── functional_requirements.md
│   │   └── technical_requirements.md
│   ├── user_stories/
│   ├── wireframes/
│   └── api_specifications/
│
└── README.md
```

## 🏛️ Architecture Pattern Détaillée

### Clean Architecture + BLoC Pattern

```dart
// Example: Alert Creation Flow

// 1. Entity (Domain Layer)
class Alert extends Equatable {
  final String id;
  final MissingPerson person;
  final LocationPoint lastKnownLocation;
  final DateTime createdAt;
  final AlertStatus status;
  
  const Alert({
    required this.id,
    required this.person,
    required this.lastKnownLocation,
    required this.createdAt,
    required this.status,
  });
  
  @override
  List<Object?> get props => [id, person, lastKnownLocation, createdAt, status];
}

// 2. Repository Interface (Domain Layer)
abstract class AlertRepository {
  Future<Either<Failure, Alert>> createAlert(CreateAlertParams params);
  Future<Either<Failure, List<Alert>>> getNearbyAlerts(LocationPoint location, double radius);
  Stream<List<Alert>> watchActiveAlerts();
}

// 3. Use Case (Domain Layer)
class CreateAlert {
  final AlertRepository repository;
  
  CreateAlert(this.repository);
  
  Future<Either<Failure, Alert>> call(CreateAlertParams params) async {
    return await repository.createAlert(params);
  }
}

// 4. BLoC (Presentation Layer)
class AlertCreationBloc extends Bloc<AlertCreationEvent, AlertCreationState> {
  final CreateAlert createAlert;
  
  AlertCreationBloc({required this.createAlert}) : super(AlertCreationInitial()) {
    on<CreateAlertSubmitted>(_onCreateAlertSubmitted);
  }
  
  Future<void> _onCreateAlertSubmitted(
    CreateAlertSubmitted event,
    Emitter<AlertCreationState> emit,
  ) async {
    emit(AlertCreationLoading());
    
    final result = await createAlert(CreateAlertParams(
      person: event.person,
      location: event.location,
    ));
    
    result.fold(
      (failure) => emit(AlertCreationError(failure.message)),
      (alert) => emit(AlertCreationSuccess(alert)),
    );
  }
}
```

## 🔧 Configuration & Setup

### Firebase Configuration
```dart
// core/config/firebase_config.dart
class FirebaseConfig {
  static const String projectId = 'missing-alert-benin';
  static const String storageBucket = 'missing-alert-benin.appspot.com';
  
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError('Platform not supported');
    }
  }
}
```

### Dependency Injection
```dart
// core/di/injection_container.dart
@InjectableInit()
Future<void> configureDependencies() async => getIt.init();

@module
abstract class AppModule {
  @singleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
  
  @singleton
  FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;
  
  @singleton
  Dio get dio => Dio()..interceptors.add(NetworkInterceptor());
}
```

### Environment Configuration
```dart
// core/config/environment_config.dart
enum Environment { development, staging, production }

class EnvironmentConfig {
  static Environment get current {
    const env = String.fromEnvironment('ENV', defaultValue: 'development');
    return Environment.values.firstWhere((e) => e.name == env);
  }
  
  static String get apiBaseUrl {
    switch (current) {
      case Environment.development:
        return 'https://dev-api.missing-alert.com';
      case Environment.staging:
        return 'https://staging-api.missing-alert.com';
      case Environment.production:
        return 'https://api.missing-alert.com';
    }
  }
}
```

## 🚀 Scripts de Build & Déploiement

### Android Build
```bash
#!/bin/bash
# deployment/scripts/build_android.sh

echo "🤖 Building Android APK/AAB..."

# Clean
flutter clean
flutter pub get

# Build APK for testing
flutter build apk --release --dart-define=ENV=production

# Build AAB for Play Store
flutter build appbundle --release --dart-define=ENV=production

echo "✅ Android build completed!"
echo "📦 APK: build/app/outputs/flutter-apk/