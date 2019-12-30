# mixer-redux

A basic Flutter app to organize cocktail recipies. This has been a "learn as you go" project to
teach myself both the Dart language and the Flutter app development framework.

## Installation
Installing Mixer currently requires Flutter. Follow the directions [here](https://flutter.dev/docs/get-started/install)
to install Flutter, including installing Android Studio. Turn on "USB debugging" on your Android phone
by following the directions [here](https://www.verizonwireless.com/support/knowledge-base-215055/).
Connect your phone to your computer and confirm flutter recognizes it by running `flutter devices`.

Then

```
git clone https://github.com/nicjohnson145/mixer-redux
cd mixer-redux/mixer
flutter pub get
flutter build apk
flutter install
```

And subsequent installations should first require doing a "Bulk Export" from inside the app and saving
the output, then pulling the new build and re-running `flutter build apk` and `flutter install` followed
by doing a "Bulk Import" to avoid data loss. Any run of `flutter install` will uninstall previous
versions of the app and result in potential data loss.
