import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hacker_news/providers/topnews_provider.dart';
import 'package:hacker_news/screens/topnews/topnews_slot.dart';
import 'package:provider/provider.dart';

class TopNewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Top News',
          style: TextStyle(
              fontSize: 20.sp,
              color: Colors.white,
              fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.pink,
      ),
      body: FutureBuilder(
        future:
            Provider.of<NewsProvider>(context, listen: false).fetchTopNews(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Consumer<NewsProvider>(
              builder: (ctx, storyProvider, _) {
                return ListView.builder(
                  itemCount: storyProvider.topNews.length,
                  itemBuilder: (ctx, index) {
                    final topnews = storyProvider.topNews[index];
                    return TopNewsSlot(
                      by: topnews.by ?? "Not Available",
                      descendants: topnews.descendants ?? 0,
                      id: topnews.id ?? 0,
                      kids: topnews.kids ?? List.empty(),
                      score: topnews.score ?? 0,
                      time: topnews.time ?? 00,
                      title: topnews.title ?? "Not Available",
                      type: topnews.type ?? "Not Available",
                      url: topnews.url ?? "Not Available",
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
