import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class HeroImages {
  static const List<String> titles = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
  ];

  // List of Free Icon Images from https://www.flaticon.com/
  static const List<String> ulrs = [
    'https://images.pexels.com/photos/20787/pexels-photo.jpg?auto=compress&cs=tinysrgb&h=350',
    'https://images.pexels.com/photos/20786/pexels-photo.jpg?auto=compress&cs=tinysrgb&h=350',
    'https://images.pexels.com/photos/20785/pexels-photo.jpg?auto=compress&cs=tinysrgb&h=350',
    'https://images.pexels.com/photos/20784/pexels-photo.jpg?auto=compress&cs=tinysrgb&h=350',
    'https://images.pexels.com/photos/20783/pexels-photo.jpg?auto=compress&cs=tinysrgb&h=350',
    'https://images.pexels.com/photos/20782/pexels-photo.jpg?auto=compress&cs=tinysrgb&h=350',
    'https://images.pexels.com/photos/20781/pexels-photo.jpg?auto=compress&cs=tinysrgb&h=350',
  ];
}

class ImageItem extends StatelessWidget {
  const ImageItem({required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        imageUrl: url,
        placeholder: (context, url) => Container(
            color: Colors.grey,
            child: Center(
              child: CircularProgressIndicator(),
            )));
  }
}

class HeroFromPage extends StatelessWidget {
  const HeroFromPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero From Page'),
      ),
      body: GridView.count(crossAxisCount: 2, childAspectRatio: 1.5, children: [
        for (var index = 0; index < HeroImages.titles.length; index++)
          Hero(
              tag: HeroImages.titles[index],
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HeroToPage(index: index)));
                },
                child: ImageItem(url: HeroImages.ulrs[index]),
              ))
      ]),
    );
  }
}

class HeroToPage extends StatelessWidget {
  const HeroToPage({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
            appBar: AppBar(
              title: Text(HeroImages.titles[index]),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Hero(
                  tag: HeroImages.titles[index],
                  child: Center(child: ImageItem(url: HeroImages.ulrs[index]))),
            )));
  }
}
