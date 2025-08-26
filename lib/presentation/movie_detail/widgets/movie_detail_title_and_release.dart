import 'package:flutter/material.dart';

class MovieDetailBasicInfo extends StatelessWidget {
  /// 기본정보
  const MovieDetailBasicInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // 가로 좌측 정렬
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Moana 2',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('2024-11-27', style: const TextStyle(fontSize: 12)),
          ],
        ),
        const SizedBox(height: 2),
        Text('tagline'),
        Text('100분'), // runtime
      ],
    );
  }
}
