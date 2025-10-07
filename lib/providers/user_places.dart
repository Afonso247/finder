import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:favorite_places/models/place.dart';

class UserPlacesNotifier extends Notifier<List<Place>> {
  UserPlacesNotifier() : super();

  @override
  List<Place> build() => [];

  void addPlace(String title, File image) {
    final place = Place(title: title, image: image);
    state = [place, ...state];
  }
}

final userPlacesProvider = NotifierProvider<UserPlacesNotifier, List<Place>>(
  () => UserPlacesNotifier(),
);
