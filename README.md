# Dev Mode

Minimal setup for realtime Flutter testing.

## Run in debug

```bash
flutter pub get
flutter run
```

If you have multiple devices/emulators:

```bash
flutter devices
flutter run -d <device_id>
```

## Hot reload

While `flutter run` is active:

- press `r` for hot reload
- press `R` for hot restart
- press `q` to quit

## Point to the Apps Script dev API

Edit `lib/config/api_config.dart` and set:

```dart
static const String baseUrl = 'https://script.google.com/macros/s/YOUR_SCRIPT_ID/exec';
static const bool enableRemoteSync = true;
```

Use your dev deployment URL, not production.

## Optional: debug APK later

```bash
./build_debug_apk.sh
```

That script is a convenience wrapper for `flutter build apk --debug`.

## Notes

- Keep `flutter run` open for realtime testing.
- Re-run `flutter pub get` after dependency changes.
