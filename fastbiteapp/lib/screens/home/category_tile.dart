import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final Map<String, String> category;
  const CategoryTile(this.category, {super.key});

  @override
  Widget build(BuildContext context) {
    final bool isAsset = category['isAsset'] == 'true';
    final String imageUrl = category['imageUrl'] ?? '';

    final ImageProvider imageProvider = isAsset
        ? AssetImage(imageUrl)
        : NetworkImage(imageUrl);

    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.all(4),
        width: double.infinity,
        color: Colors.black.withValues(alpha: 0.5),
        child: Text(
          category['name'] ?? '',
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
