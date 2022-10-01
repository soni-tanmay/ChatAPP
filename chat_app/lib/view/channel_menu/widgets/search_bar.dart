import 'package:flutter/material.dart';

import '../../../utilities/theme.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(25),
      hoverColor: AppTheme.grey.withOpacity(0.3),
      focusColor: AppTheme.grey.withOpacity(0.1),
      autofocus: true,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: AppTheme.lightTheme.colorScheme.secondary,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              'Search',
              style: TextStyle(
                color: AppTheme.lightTheme.colorScheme.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
