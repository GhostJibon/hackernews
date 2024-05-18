import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hacker_news/providers/topnews_provider.dart';
import 'package:hacker_news/screens/latestnews/latestnews_screen.dart';
import 'package:hacker_news/screens/topnews/topnews_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => ChangeNotifierProvider(
        create: (context) => NewsProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Hacker News',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const NewsType(),
        ),
      ),
    );
  }
}

class NewsType extends StatelessWidget {
  const NewsType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Center(
            child: Text(
          'Hacker News',
          style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        )),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 10.w, right: 10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TopNewsScreen(),
                  ),
                );
              },
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                height: 60.h,
                width: double.maxFinite,
                child: Center(
                  child: Text(
                    'Top News',
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LatestNewsScreen(),
                  ),
                );
              },
              child: Container(
                height: 60.h,
                decoration: const BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                width: double.maxFinite,
                child: Center(
                  child: Text(
                    'Latest News',
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
