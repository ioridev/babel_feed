import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_mlkit_translation/google_mlkit_translation.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:webfeed/webfeed.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key, required this.title});

  final String title;

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final _atom = <AtomItem>[];
  final _rss = <RssItem>[];
  final _translatedTitles = <String>[];

  Future<void> fetchFeed() async {
    final response =
        await http.get(Uri.parse('https://news.ycombinator.com/rss'));

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch atom.xml');
    }
    final rssFeed = RssFeed.parse(utf8.decode(response.bodyBytes));

    // タイトルを最大100件に制限
    final limitedItems = rssFeed.items!.take(100).toList();

    // 翻訳されたタイトルを格納するリスト
    final translatedTitles = <String>[];

    const sourceLanguage = TranslateLanguage.english;
    const targetLanguage = TranslateLanguage.japanese;

    final onDeviceTranslator = OnDeviceTranslator(
      sourceLanguage: sourceLanguage,
      targetLanguage: targetLanguage,
    );

    final modelManager = OnDeviceTranslatorModelManager();

    if (!await modelManager
        .isModelDownloaded(TranslateLanguage.english.bcpCode)) {
      await modelManager.downloadModel(TranslateLanguage.english.bcpCode);
    }

    // 翻訳モデルをダウンロードした後、各タイトルを翻訳
    for (final item in limitedItems) {
      final translatedTitle =
          await onDeviceTranslator.translateText(item.title!);
      translatedTitles.add(translatedTitle);
    }

    // 翻訳されたタイトルを更新
    setState(() {
      _rss.addAll(limitedItems);
      _translatedTitles.addAll(translatedTitles);
    });

    await onDeviceTranslator.close();
  }

  Future<void> _launchUrl(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  void initState() {
    fetchFeed();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hacker News'),
      ),
      body: ListView.builder(
        itemCount: _rss.length,
        itemBuilder: (context, index) {
          final title = _rss[index].title.toString();
          final translatedTitle = _translatedTitles[index];

          return ListTile(
            title: Text(translatedTitle),
            onTap: () => {_launchUrl(_rss[index].link.toString())},
          );
        },
      ),
    );
  }
}
