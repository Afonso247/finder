import 'package:flutter/material.dart';

import 'package:favorite_places/models/place.dart';

class PlaceDetailItem extends StatelessWidget {
  const PlaceDetailItem({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        place.title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Colors.black,
        ),
      ),
    );
  }
}
