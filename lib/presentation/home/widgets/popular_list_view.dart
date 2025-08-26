import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/movie_detail/movie_detail_page.dart';
import 'package:flutter_movie_app/presentation/widgets/movie_image.dart';

class PopularListView extends StatelessWidget {
  const PopularListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.separated(
        padding: const EdgeInsets.only(left: 20),
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          // Hero 위젯의 tag 속성은 같은 페이지 내에서 중복되면 안됨!
          final heroTag = "popular-$index";
          return SizedBox(
            width: 150,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => MovieDetailPage(heroTag: heroTag),
                        ),
                      );
                    },
                    child: MovieImage(
                      imgUrl: 'https://picsum.photos/200/300',
                      heroTag: heroTag,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    '${index + 1}',
                    style: const TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                      height: 1,
                      // 두자리수 글자 붙이려고
                      letterSpacing: -20,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
