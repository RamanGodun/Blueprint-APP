## Для перекладу

- **Спочатку згенеруй codegen_loader.g.dart файл** flutter pub run easy_localization:generate -S "assets/translations/" -O "lib/src/localization/gen by easy_localization/"

- **Далі згенеруй файл з ключами** flutter pub run easy_localization:generate -f keys -o locale_keys.g.dart -S "assets/translations/" -O "lib/src/localization/gen by easy_localization/"
