import 'package:flutter/material.dart';
import 'package:provider_study/manager/storage_manager.dart';

class LocalePro extends ChangeNotifier {
  // sharedPreferences 的 語言 Key 值
  static const kLocaleIndex = 'kLocaleIndex';

  int _localeIndex;

  int get localeIndex => _localeIndex;

  // 取得現在的 locale 語言。
  Locale get locale {
    switch (_localeIndex) {
      case 0:
        return Locale("en", "en");
      case 1:
        // 使用 Locale.fromSubtags 他的 _countryCode 會有預設。
        return Locale.fromSubtags(languageCode: 'zh');
    }
  }

  // Provider 初始化
  LocalePro() {
    _localeIndex = StorageManager.sharedPreferences.getInt(kLocaleIndex) ?? 0;
  }

  /// function 轉換 localKey 值。
  /// 傳入 UI 的 Menu
  switchLocale(int index) {
    _localeIndex = index;
    notifyListeners();
    StorageManager.sharedPreferences.setInt(kLocaleIndex, index);
  }

  /// 在 UI 介面去顯示畫面文字的
  /// Text(LocaleModel.localeName(index, context))
  static String localeName(index, context) {
    switch (index) {
      case 0:
        return 'English';
      case 1:
        return '中文';
      default:
        return '';
    }
  }
}
