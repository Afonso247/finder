import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

import 'package:favorite_places/models/place.dart';

Future<Database> _getDatabase() async {
  final dbPath = await sql.getDatabasesPath();
  final db = await sql.openDatabase(
    path.join(dbPath, 'places.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT, lat REAL, lng REAL, address TEXT)',
      );
    },
    version: 1,
  );
  return db;
}

class UserPlacesNotifier extends Notifier<List<Place>> {
  UserPlacesNotifier() : super();

  @override
  List<Place> build() => [];

  Future<void> loadPlaces() async {
    final db = await _getDatabase();

    final data = await db.query('user_places');
    final places = data.map((place) {
      return Place(
        id: place['id'] as String,
        title: place['title'] as String,
        image: File(place['image'] as String),
        location: PlaceLocation(
          latitude: place['lat'] as double,
          longitude: place['lng'] as double,
          address: place['address'] as String,
        ),
      );
    }).toList();

    state = places;
  }

  void addPlace(String title, File image, PlaceLocation location) async {
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(image.path);
    final copiedImage = await image.copy('${appDir.path}/$fileName');

    final place = Place(title: title, image: copiedImage, location: location);

    final db = await _getDatabase();

    db.insert(
      'user_places',
      {
        'id': place.id,
        'title': place.title,
        'image': place.image.path,
        'lat': place.location.latitude,
        'lng': place.location.longitude,
        'address': place.location.address,
      },
    );

    state = [place, ...state];
  }
}

final userPlacesProvider = NotifierProvider<UserPlacesNotifier, List<Place>>(
  () => UserPlacesNotifier(),
);
