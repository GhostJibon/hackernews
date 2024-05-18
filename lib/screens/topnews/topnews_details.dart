import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class TopnewsDetails extends StatefulWidget {
  const TopnewsDetails({
    super.key,
    required this.by,
    required this.descendants,
    required this.id,
    required this.kids,
    required this.score,
    required this.time,
    required this.title,
    required this.type,
    required this.url,
  });

  final String by;
  final int descendants;
  final int id;
  final List<dynamic> kids;
  final int score;
  final int time;
  final String title;
  final String type;
  final String url;
  @override
  State<TopnewsDetails> createState() => _TopnewsDetailsState();
}

class _TopnewsDetailsState extends State<TopnewsDetails> {
  @override
  Widget build(BuildContext context) {
    final Uri _url = Uri.parse(widget.url);

    Future<void> _launchUrl() async {
      if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          'News Details',
          style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.pink.withOpacity(0.1),
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.pink.withOpacity(0.8)),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'News By: ' + widget.by,
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'News Id: ' + widget.id.toString(),
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Descendants: ' + widget.descendants.toString(),
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'News Score: ' + widget.score.toString(),
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Time: ' + widget.time.toString(),
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'News Type: ' + widget.type,
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 10.h,
                ),
                GestureDetector(
                  onTap: () {
                    _launchUrl();
                  },
                  child: Text(
                    'Click here to read the full news',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        decoration: TextDecoration.underline,
                        color: Colors.blue),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Kids: ",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                ),
                Text(widget.kids.toString(),
                    style: TextStyle(
                        fontSize: 16.sp, fontWeight: FontWeight.w400)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
