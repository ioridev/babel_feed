import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:translator/translator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webfeed/webfeed.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _atom = <AtomItem>[];
  final _rss = <RssItem>[];
  void fetchFeed() async {
    final response =
        await http.get(Uri.parse('https://news.ycombinator.com/rss'));

    if (response.statusCode != 200) {
      throw Exception('Failed to fetch atom.xml');
    }
    final rssFeed = RssFeed.parse(utf8.decode(response.bodyBytes));
    //  final atomFeed = AtomFeed.parse(utf8.decode(response.bodyBytes));
    setState(() {
      //  atomFeed.items!.forEach((item) => {_atom.add(item)});
      rssFeed.items!.forEach((item) => {_rss.add(item)});
    });
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
          final translateTitle = GoogleTranslator()
              .translate(
                title,
                from: 'en',
                to: 'ja',
              )
              .then((value) => print(value.text));

          return ListTile(
            title: Text(_rss[index].title.toString()),
            onTap: () => {_launchUrl(_rss[index].link.toString())},
          );
        },
      ),
    );
  }
}
