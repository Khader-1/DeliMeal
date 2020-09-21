import 'package:flutter/material.dart';

import '../../data/dummy_data.dart';
import '../../widgets/category_item.dart';

class CategoriesTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      padding: const EdgeInsets.all(25),
      children: DUMMY_CATEGORIES.map((e) => CategoryItem(e)).toList(),
    );
  }
}
