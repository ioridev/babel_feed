import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';

part 'feed.freezed.dart';
part 'feed.g.dart';

@freezed
class Feed with _$Feed {
  const factory Feed({
    @Default('') String url,
    @Default(TranslateLanguage.english) TranslateLanguage language,
  }) = _Feed;
  factory Feed.fromJson(Map<String, dynamic> json) => _$FeedFromJson(json);
}
