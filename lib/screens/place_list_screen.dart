import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:great_places/provider/great_places.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:great_places/screens/add_places_screen.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My a Places"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AddPlaceScreen.routeName);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Consumer<GreatPlaces>(
        builder: (context, greatplace, ch) => greatplace.items.isEmpty
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                    child: Text(
                      "No Data ",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                    ),
                  ),
                  FlatButton.icon(
                      color: Theme.of(context).accentColor,
                      onPressed: () {
                        Navigator.pushNamed(context, AddPlaceScreen.routeName);
                      },
                      icon: const Icon(Icons.add),
                      label: const Text("Tap To Add Place"))
                ],
              )
            : ListView.builder(
                itemCount: greatplace.items.length,
                itemBuilder: (BuildContext context, int i) => Padding(
                  padding: const EdgeInsets.only(left: 4, right: 4),
                  child: Card(
                    elevation: 5,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: FileImage(
                          greatplace.items[i].image,
                        ),
                      ),
                      title: Text(greatplace.items[i].title.toString()),
                      onTap: () {},
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
