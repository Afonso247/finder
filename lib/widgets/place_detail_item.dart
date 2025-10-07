import 'package:flutter/material.dart';

import 'package:favorite_places/models/place.dart';

class PlaceDetailItem extends StatelessWidget {
  const PlaceDetailItem({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.file(
          place.image,
          fit: BoxFit.cover,
          width: double.infinity,
          height: 250,
        ),
        Positioned(
          bottom: 5,
          left: 0,
          right: 0,
          child: Column(
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: FileImage(place.image),
              ),
              const SizedBox(height: 4),
              Text(
                place.title,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
