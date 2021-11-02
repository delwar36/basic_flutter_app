import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:basic_app/configs/config.dart';
import 'package:basic_app/utils/utils.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(AppLanguage.defaultLanguage);

  ///On Change Language
  void onUpdate(Locale locale) {
    emit(locale);

    ///Preference save
    UtilPreferences.setString(
      Preferences.language,
      locale.languageCode,
    );
  }
}
