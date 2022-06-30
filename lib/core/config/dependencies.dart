import 'package:get/get.dart';
import 'package:store_app/core/languages/app_languages.dart';
import 'package:store_app/core/network/network_info.dart';
import 'package:store_app/core/storage/app_storage.dart';
import 'package:store_app/core/theme/mode/dark_v1.dart';
import 'package:store_app/core/theme/mode/light_v1.dart';
import 'package:store_app/core/theme/theme.dart';

class Dependencies{

  static AppStorage get appStorage => Get.find<AppStorage>();
  static LightModeVersion1 get lightModeV1 => Get.find<CoreTheme>(tag: 'light_v1') as LightModeVersion1;
  static DarkModeVersion1 get darkModeV1 => Get.find<CoreTheme>(tag: 'dark_v1') as DarkModeVersion1;
  static AppLanguages get appLanguages => Get.find<AppLanguages>();

   injection() async{
    await Get.putAsync<NetworkInfoImpl>(() => NetworkInfoImpl().init());
    await Get.putAsync<AppStorage>(() => AppStorage().init(), permanent: true);
    await Get.putAsync<CoreTheme>(() => LightModeVersion1().init(), tag: 'light_v1');
    await Get.putAsync<CoreTheme>(() => DarkModeVersion1().init(), tag: 'dark_v1');
    await Get.putAsync<AppLanguages>(() => AppLanguages().init());

  }

}