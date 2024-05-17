// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `hey, `
  String get hello {
    return Intl.message(
      'hey, ',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Dr. `
  String get doctor {
    return Intl.message(
      'Dr. ',
      name: 'doctor',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Chat Bot`
  String get chatBot {
    return Intl.message(
      'Chat Bot',
      name: 'chatBot',
      desc: '',
      args: [],
    );
  }

  /// `Text Only`
  String get textOnly {
    return Intl.message(
      'Text Only',
      name: 'textOnly',
      desc: '',
      args: [],
    );
  }

  /// `Text With Image`
  String get textWithImage {
    return Intl.message(
      'Text With Image',
      name: 'textWithImage',
      desc: '',
      args: [],
    );
  }

  /// `Enter your message here..`
  String get writeMessage {
    return Intl.message(
      'Enter your message here..',
      name: 'writeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Please, Enter your question`
  String get writeMessageSnackBar {
    return Intl.message(
      'Please, Enter your question',
      name: 'writeMessageSnackBar',
      desc: '',
      args: [],
    );
  }

  /// `Please, Select an image first`
  String get selectImage {
    return Intl.message(
      'Please, Select an image first',
      name: 'selectImage',
      desc: '',
      args: [],
    );
  }

  /// `Learn more`
  String get learnMore {
    return Intl.message(
      'Learn more',
      name: 'learnMore',
      desc: '',
      args: [],
    );
  }

  /// `Enrol now!`
  String get enrolNow {
    return Intl.message(
      'Enrol now!',
      name: 'enrolNow',
      desc: '',
      args: [],
    );
  }

  /// `Start now!`
  String get startNow {
    return Intl.message(
      'Start now!',
      name: 'startNow',
      desc: '',
      args: [],
    );
  }

  /// `Lecture`
  String get lecture {
    return Intl.message(
      'Lecture',
      name: 'lecture',
      desc: '',
      args: [],
    );
  }

  /// `Presented by : Dr. `
  String get presenter {
    return Intl.message(
      'Presented by : Dr. ',
      name: 'presenter',
      desc: '',
      args: [],
    );
  }

  /// `Download pdf`
  String get downloadPdf {
    return Intl.message(
      'Download pdf',
      name: 'downloadPdf',
      desc: '',
      args: [],
    );
  }

  /// `Start quiz`
  String get quiz {
    return Intl.message(
      'Start quiz',
      name: 'quiz',
      desc: '',
      args: [],
    );
  }

  /// `Course Playlist`
  String get coursePlaylist {
    return Intl.message(
      'Course Playlist',
      name: 'coursePlaylist',
      desc: '',
      args: [],
    );
  }

  /// `Chat Bot`
  String get g {
    return Intl.message(
      'Chat Bot',
      name: 'g',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
