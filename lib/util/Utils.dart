import 'package:flutter/cupertino.dart';

String getSmallImageUrl({@required String imagePath}) =>
    'https://image.tmdb.org/t/p/w185/$imagePath';

String getLargeImageUrl({@required String imagePath}) =>
    'https://image.tmdb.org/t/p/w500/$imagePath';
