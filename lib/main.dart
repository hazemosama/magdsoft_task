import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:magdsoft_task/business_logic/auth_cubit/auth_cubit.dart';
import 'package:magdsoft_task/business_logic/bloc_observer.dart';
import 'package:magdsoft_task/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_task/business_logic/global_cubit/global_states.dart';
import 'package:magdsoft_task/data/remote/dio_helper.dart';
import 'package:magdsoft_task/localization/applocale.dart';

import 'package:magdsoft_task/data/local/cache_helper.dart';
import 'package:magdsoft_task/presentation/screens/authentication/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();

  bool? isEnglish = CacheHelper.getData(key: 'isEnglish');

  BlocOverrides.runZoned(
        () {
      runApp(
        MyApp(isEnglish),
      );
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final bool? isEnglish;

  MyApp(this.isEnglish);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthCubit()),
          BlocProvider(
              create: (context) => GlobalCubit()
                ..changeAppLang(
                  fromShared: isEnglish,
                )),
        ],
        child: BlocConsumer<GlobalCubit, GlobalStates>(
            builder: (context, state) {
              return MaterialApp(
                localizationsDelegates: const [
                  AppLocale.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('en'), // English, no country code
                  Locale('ar'), // Arabic, no country code
                ],
                locale: GlobalCubit.get(context).isEnglish! ? const Locale('ar') : const Locale('en'),
                localeResolutionCallback: (currentLang, supportLang) {
                  if (currentLang != null) {
                    for (Locale locale in supportLang) {
                      if (locale.languageCode == currentLang.languageCode) {
                        CacheHelper.saveData(
                            key: "lang", value: currentLang.languageCode);
                        return currentLang;
                      }
                    }
                  }
                  return supportLang.first;
                },
                theme: ThemeData(
                  primarySwatch: Colors.grey,
                ),
                debugShowCheckedModeBanner: false,
                home: LoginScreen(),
              );
            },
            listener: (context, state) {}));
  }
}
