import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/constants/strings.dart';
import 'package:test_app/features/screen/components/custom_progress_loader.dart';
import 'core/app/app.dart';
import 'core/app/app_dependency.dart';
import 'core/app/app_flavor.dart';
import 'core/app/app_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await EasyLocalization.ensureInitialized();
  configureInjection();
  configLoading();
  AppFlavor.appFlavor = FlavorStatus.development;
  Bloc.observer = AppBlocObserver();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('bn'),
      ],
      fallbackLocale: const Locale(kLanguage),
      startLocale: const Locale(kLanguage),
      saveLocale: true,
      path: kTranslatorDir,
      child: const InitApp(),
    ),
  );
}
