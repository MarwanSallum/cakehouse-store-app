import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:store_app/core/config/dependencies.dart';
import 'package:get/get.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Dependencies().injection();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(const StoreApp()));
}


class StoreApp extends StatelessWidget {
  const StoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Test(),
      themeMode: Dependencies.appStorage.getThemeMode(),
      theme: Dependencies.lightModeV1.buildTheme(context),
      darkTheme: Dependencies.darkModeV1.buildTheme(context),
      locale: Dependencies.appStorage.getLanguage(),
      translations: Dependencies.appLanguages,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}


class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(height: 100, width: 400, color: context.theme.primaryColor,),
          Container(height: 100, width: 400, color: context.theme.primaryColor,),
          Container(height: 100, width: 400, color: context.theme.primaryColor,),
          Text('login'.tr, style: context.textTheme.headlineSmall,),
          ElevatedButton(onPressed: (){
            Dependencies.appStorage.changeThemeMode();
          }, child: Text('test theme'),
          ),
          ElevatedButton(onPressed: (){
            Dependencies.appStorage.changeLanguage();
          }, child: Text('test language'),
          ),
        ],
      ),
    );
  }
}




