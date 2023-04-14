// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Feed _$$_FeedFromJson(Map<String, dynamic> json) => _$_Feed(
      url: json['url'] as String? ?? '',
      language:
          $enumDecodeNullable(_$TranslateLanguageEnumMap, json['language']) ??
              TranslateLanguage.english,
    );

Map<String, dynamic> _$$_FeedToJson(_$_Feed instance) => <String, dynamic>{
      'url': instance.url,
      'language': _$TranslateLanguageEnumMap[instance.language]!,
    };

const _$TranslateLanguageEnumMap = {
  TranslateLanguage.afrikaans: 'afrikaans',
  TranslateLanguage.albanian: 'albanian',
  TranslateLanguage.arabic: 'arabic',
  TranslateLanguage.belarusian: 'belarusian',
  TranslateLanguage.bengali: 'bengali',
  TranslateLanguage.bulgarian: 'bulgarian',
  TranslateLanguage.catalan: 'catalan',
  TranslateLanguage.chinese: 'chinese',
  TranslateLanguage.croatian: 'croatian',
  TranslateLanguage.czech: 'czech',
  TranslateLanguage.danish: 'danish',
  TranslateLanguage.dutch: 'dutch',
  TranslateLanguage.english: 'english',
  TranslateLanguage.esperanto: 'esperanto',
  TranslateLanguage.estonian: 'estonian',
  TranslateLanguage.finnish: 'finnish',
  TranslateLanguage.french: 'french',
  TranslateLanguage.galician: 'galician',
  TranslateLanguage.georgian: 'georgian',
  TranslateLanguage.german: 'german',
  TranslateLanguage.greek: 'greek',
  TranslateLanguage.gujarati: 'gujarati',
  TranslateLanguage.haitian: 'haitian',
  TranslateLanguage.hebrew: 'hebrew',
  TranslateLanguage.hindi: 'hindi',
  TranslateLanguage.hungarian: 'hungarian',
  TranslateLanguage.icelandic: 'icelandic',
  TranslateLanguage.indonesian: 'indonesian',
  TranslateLanguage.irish: 'irish',
  TranslateLanguage.italian: 'italian',
  TranslateLanguage.japanese: 'japanese',
  TranslateLanguage.kannada: 'kannada',
  TranslateLanguage.korean: 'korean',
  TranslateLanguage.latvian: 'latvian',
  TranslateLanguage.lithuanian: 'lithuanian',
  TranslateLanguage.macedonian: 'macedonian',
  TranslateLanguage.malay: 'malay',
  TranslateLanguage.maltese: 'maltese',
  TranslateLanguage.marathi: 'marathi',
  TranslateLanguage.norwegian: 'norwegian',
  TranslateLanguage.persian: 'persian',
  TranslateLanguage.polish: 'polish',
  TranslateLanguage.portuguese: 'portuguese',
  TranslateLanguage.romanian: 'romanian',
  TranslateLanguage.russian: 'russian',
  TranslateLanguage.slovak: 'slovak',
  TranslateLanguage.slovenian: 'slovenian',
  TranslateLanguage.spanish: 'spanish',
  TranslateLanguage.swahili: 'swahili',
  TranslateLanguage.swedish: 'swedish',
  TranslateLanguage.tagalog: 'tagalog',
  TranslateLanguage.tamil: 'tamil',
  TranslateLanguage.telugu: 'telugu',
  TranslateLanguage.thai: 'thai',
  TranslateLanguage.turkish: 'turkish',
  TranslateLanguage.ukrainian: 'ukrainian',
  TranslateLanguage.urdu: 'urdu',
  TranslateLanguage.vietnamese: 'vietnamese',
  TranslateLanguage.welsh: 'welsh',
};
