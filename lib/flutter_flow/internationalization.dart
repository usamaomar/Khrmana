import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? arText = '',
  }) =>
      [enText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'yxsux14d': {
      'en': 'Precious stones',
      'ar': 'العلامات التجارية',
    },
    'ceaxhxft': {
      'en': 'Search',
      'ar': '',
    },
    'l7xxw5mw': {
      'en': 'Amber',
      'ar': 'العنبر',
    },
    'gn2n0jql': {
      'en': 'Pearls',
      'ar': 'اللؤلؤ',
    },
    '2fscso4k': {
      'en': 'Amber',
      'ar': '',
    },
    'krc8srsz': {
      'en': 'Nike air rapor',
      'ar': '',
    },
    'al5u89a3': {
      'en': '\$ 345',
      'ar': '',
    },
    '7zpqzval': {
      'en': 'Live Now!',
      'ar': 'يذاع الآن!',
    },
    '5cgozh0v': {
      'en': 'StartNow',
      'ar': 'ابدأ الآن',
    },
    'mk70w3ur': {
      'en': 'Last Offer',
      'ar': 'العرض الأخير',
    },
    'vc25m00x': {
      'en': '\$ 345',
      'ar': '',
    },
    'zy9tuwb7': {
      'en': 'Most Popular',
      'ar': '',
    },
    '9kqhuf36': {
      'en': 'Hello World',
      'ar': '',
    },
    'xcarg4ai': {
      'en': '\$ 340',
      'ar': '',
    },
    '58er36mg': {
      'en': 'Andrea Davis',
      'ar': '',
    },
    's6kaa6x3': {
      'en': 'Home',
      'ar': '',
    },
  },
  // ITEM_INFO
  {
    'mhvpsvyx': {
      'en': 'Size',
      'ar': '',
    },
    'k78wdszf': {
      'en': '16',
      'ar': '',
    },
    '8hcog6ry': {
      'en': '17',
      'ar': '',
    },
    'vlw87885': {
      'en': '18',
      'ar': '',
    },
    'vajnv2zn': {
      'en': '19',
      'ar': '',
    },
    'a78ai1wf': {
      'en': '20',
      'ar': '',
    },
    'b7zzl8h1': {
      'en': '21',
      'ar': '',
    },
    '7d4n3jys': {
      'en': '22',
      'ar': '',
    },
    '8dvkkb0j': {
      'en': 'Color',
      'ar': '',
    },
    'u7on7t7k': {
      'en': 'Add to cart',
      'ar': '',
    },
    '9d9tgyif': {
      'en': 'Home',
      'ar': '',
    },
  },
  // CARD
  {
    'nyaoklhd': {
      'en': 'Hello World',
      'ar': '',
    },
    '0oltddla': {
      'en': 'Hello World',
      'ar': '',
    },
    'jf27gz7o': {
      'en': 'CheckOut',
      'ar': '',
    },
    'piie7vwp': {
      'en': 'Cart',
      'ar': '',
    },
  },
  // PAYMANT
  {
    'cszbkyjk': {
      'en': 'Card number',
      'ar': '',
    },
    '1izevssg': {
      'en': 'MM/YY',
      'ar': '',
    },
    'vz63v2l2': {
      'en': 'CVC',
      'ar': '',
    },
    '2im28t5l': {
      'en': 'Pay',
      'ar': '',
    },
    'w0c8qswv': {
      'en': 'Home',
      'ar': '',
    },
  },
  // FAVORITE
  {
    'p21f6pt8': {
      'en': 'Favorite',
      'ar': '',
    },
    '4c13och8': {
      'en': 'Favorite',
      'ar': '',
    },
  },
  // PROFILE
  {
    'zwukzn00': {
      'en': 'Andrea Davis',
      'ar': '',
    },
    'pk40391s': {
      'en': 'andrea@domainname.com',
      'ar': '',
    },
    'h8ndghdm': {
      'en': 'Switch to Dark Mode',
      'ar': '',
    },
    'ukmj5ceb': {
      'en': 'Switch to Light Mode',
      'ar': '',
    },
    'xtcj9ftg': {
      'en': 'Edit Profile',
      'ar': '',
    },
    'szu7mj8e': {
      'en': 'My Orders',
      'ar': '',
    },
    'm7dn4yi3': {
      'en': 'Log Out',
      'ar': '',
    },
    '3shbeeqc': {
      'en': 'Profile',
      'ar': '',
    },
  },
  // StreamPage
  {
    'n6lsucw3': {
      'en': 'Home',
      'ar': '',
    },
  },
  // StreamPageAudiance
  {
    'w6whk6kn': {
      'en': 'Home',
      'ar': '',
    },
  },
  // payok
  {
    '796vblv2': {
      'en': 'Thank You',
      'ar': '',
    },
    '9k2ytir5': {
      'en': 'Ok',
      'ar': '',
    },
  },
  // Miscellaneous
  {
    'kzwqw9ia': {
      'en': '',
      'ar': '',
    },
    'c8szb78u': {
      'en': '',
      'ar': '',
    },
    'aanf2vsx': {
      'en': '',
      'ar': '',
    },
    'ldlrkye8': {
      'en': '',
      'ar': '',
    },
    'vff0484n': {
      'en': '',
      'ar': '',
    },
    'xsg0comi': {
      'en': '',
      'ar': '',
    },
    'zojeymr7': {
      'en': '',
      'ar': '',
    },
    'h7ho6hgg': {
      'en': '',
      'ar': '',
    },
    'eg60yuog': {
      'en': '',
      'ar': '',
    },
    '6v150x4i': {
      'en': '',
      'ar': '',
    },
    'yt38nxi8': {
      'en': '',
      'ar': '',
    },
    'vmmmt9te': {
      'en': '',
      'ar': '',
    },
    '8fyti3jd': {
      'en': '',
      'ar': '',
    },
    'fyentbv1': {
      'en': '',
      'ar': '',
    },
    '1cl8d7yn': {
      'en': '',
      'ar': '',
    },
    'huus4nll': {
      'en': '',
      'ar': '',
    },
    'zbo4w2hx': {
      'en': '',
      'ar': '',
    },
    'xt9qhoyp': {
      'en': '',
      'ar': '',
    },
    'pu3cfpqb': {
      'en': '',
      'ar': '',
    },
    '60prmjfi': {
      'en': '',
      'ar': '',
    },
    'jnfmn6zt': {
      'en': '',
      'ar': '',
    },
    'so6nf5c3': {
      'en': '',
      'ar': '',
    },
    '7y6qxbju': {
      'en': '',
      'ar': '',
    },
  },
].reduce((a, b) => a..addAll(b));
