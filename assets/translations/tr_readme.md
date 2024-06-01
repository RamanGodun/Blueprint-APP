## Для перекладу

- **Спочатку згенеруй codegen_loader.g.dart файл** flutter pub run easy_localization:generate -S "assets/translations/" -O "lib/State_management/Src/Generated_code/by easy_localization/"

- **Далі згенеруй файл з ключами** flutter pub run easy_localization:generate -f keys -o locale_keys.g.dart -S "assets/translations/" -O "lib/State_management/Src/Generated_code/by easy_localization/"

in info.plist next must be added:
<key>CFBundleLocalizations</key>
<array>
<string>en</string>
<string>uk</string>
</array>
