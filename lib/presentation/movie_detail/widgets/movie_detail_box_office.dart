import 'package:flutter/material.dart';

class MovieDetailBoxOffice extends StatelessWidget {
  /// 흥행정보
  const MovieDetailBoxOffice({super.key});

  @override
  Widget build(BuildContext context) {
    // voteAverage, voteCount, revenue, popularity, budget
    final labels = ["평점", "평점투표수", "인기점수", "예산", "수익"];
    final values = [06.949, 331, 5432, 15000000, 42358000];
    return SizedBox(
      height: 70,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: labels.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${values[index]}'), //
                Text(labels[index]),
              ],
            ),
          );
        },
      ),
    );
  }
}
