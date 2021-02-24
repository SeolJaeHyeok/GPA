import "package:flutter/material.dart";

import 'package:provider/provider.dart';
import 'package:great_place_app/provider/great_places.dart';
import 'package:great_place_app/screens/add_place_screen.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            }, // Navigating
          ),
        ],
      ),
      body: Consumer<GreatePlaces>(
        child: Center(
          child: Text("Got no Places, start adding some!"),
        ),
        builder: (ctx, greatPlaces, ch) => greatPlaces.items.length <= 0
            ? ch
            : ListView.builder(
                itemCount: greatPlaces.items.length,
                itemBuilder: (ctx, i) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(greatPlaces.items[i].image),
                  ),
                  title: Text(greatPlaces.items[i].title),
                  onTap: () {
                    // go to Detail Page
                  },
                ),
              ),
      ),
    );
  }
}
