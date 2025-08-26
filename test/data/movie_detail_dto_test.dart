import 'dart:convert';

import 'package:flutter_movie_app/data/dto/movie_detail_dto/movie_detail_dto.dart';
import 'package:flutter_test/flutter_test.dart';

import 'samples/sample_test_helper.dart';

void main() {
  SampleTestHelper? helper;

  setUp(
    () async {
      helper = SampleTestHelper();
      await helper!.loadFixture();
    },
  );

  test('Movie DTO : fromJson test', () {
    final movieDetailDto =
        MovieDetailDto.fromJson(jsonDecode(helper!.detailsSample));
    expect(movieDetailDto.title, "Arena Wars");
    expect(movieDetailDto.genres.length, 5);
    expect(movieDetailDto.genres.first.name, "액션");
    expect(movieDetailDto.belongsToCollection, isNull);
    expect(movieDetailDto.originCountry.length, 1);
    expect(movieDetailDto.originCountry.first, "US");
    expect(movieDetailDto.productionCompanies.length, 1);
    expect(movieDetailDto.productionCompanies.first.name, "Mahal Empire");
    expect(movieDetailDto.productionCountries.length, 1);
    expect(movieDetailDto.productionCountries.first.name,
        "United States of America");
    expect(movieDetailDto.spokenLanguages.length, 1);
    expect(movieDetailDto.spokenLanguages.first.name, "English");
  });
}
