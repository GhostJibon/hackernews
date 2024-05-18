import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hacker_news/providers/topnews_provider.dart';
import 'package:hacker_news/screens/latestnews/latestnews_slot.dart';
import 'package:provider/provider.dart';

class LatestNewsScreen extends StatefulWidget {
  const LatestNewsScreen({super.key});

  @override
  State<LatestNewsScreen> createState() => _LatestNewsScreenState();
}

class _LatestNewsScreenState extends State<LatestNewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Latest News',
          style: TextStyle(
              fontSize: 20.sp,
              color: Colors.black,
              fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.purple,
      ),
      body: FutureBuilder(
        future:
            Provider.of<NewsProvider>(context, listen: false).fetchLatestNews(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Consumer<NewsProvider>(
              builder: (ctx, storyProvider, _) {
                return ListView.builder(
                  itemCount: storyProvider.latestNews.length,
                  itemBuilder: (ctx, index) {
                    final latestNews = storyProvider.latestNews[index];
                    return LatestNewsSlot(
                      by: latestNews.by ?? "Not Available",
                      descendants: latestNews.descendants ?? 0,
                      id: latestNews.id ?? 0,
                      score: latestNews.score ?? 0,
                      time: latestNews.time ?? 00,
                      title: latestNews.title ?? "Not Available",
                      type: latestNews.type ?? "Not Available",
                      url: latestNews.url ?? "Not Available",
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
