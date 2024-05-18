import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hacker_news/screens/latestnews/latestnews_details.dart';

class LatestNewsSlot extends StatefulWidget {
  const LatestNewsSlot({
    super.key,
    required this.by,
    required this.descendants,
    required this.id,
    required this.score,
    required this.time,
    required this.title,
    required this.type,
    required this.url,
  });

  final String by;
  final int descendants;
  final int id;
  final int score;
  final int time;
  final String title;
  final String type;
  final String url;

  @override
  State<LatestNewsSlot> createState() => _LatestNewsSlotState();
}

class _LatestNewsSlotState extends State<LatestNewsSlot> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LatestnewsDetails(
                    by: widget.by,
                    descendants: widget.descendants,
                    id: widget.id,
                    score: widget.score,
                    time: widget.time,
                    title: widget.title,
                    type: widget.type,
                    url: widget.url)),
          );
        },
        child: Container(
          height: 80.h,
          color: Colors.purple.withOpacity(0.5),
          child: Padding(
            padding: EdgeInsets.all(5.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: 17.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Author: " + widget.by,
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      widget.time.toString(),
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
