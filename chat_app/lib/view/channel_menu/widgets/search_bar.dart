import 'package:flutter/material.dart';

import '../../../utilities/theme.dart';
import 'my_channels.dart';

class SearchBar extends StatelessWidget {
  SearchBar({super.key});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            builder: ((context) => Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width / 2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: AppTheme.lightTheme.colorScheme.primary,
                    ),
                    child: Material(
                      child: Column(
                        children: [
                          TextField(
                            controller: _controller,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor:
                                  AppTheme.lightTheme.colorScheme.primary,
                              hintText: 'Search',
                              suffixIcon: IconButton(
                                icon: const Icon(
                                  Icons.search,
                                  color: AppTheme.grey,
                                ),
                                onPressed: () {},
                              ),
                              suffixIconColor: AppTheme.grey,
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                                itemCount: 10 + 1,
                                itemBuilder: ((context, index) {
                                  return ListTile(
                                    title: const Text(
                                      'channel',
                                      style: TextStyle(color: AppTheme.black),
                                    ),
                                    leading: const Text(
                                      '#',
                                      style: TextStyle(color: AppTheme.black),
                                    ),
                                    dense: true,
                                    minLeadingWidth: 0,
                                    onTap: () {},
                                    hoverColor: AppTheme.extraLightPurple,
                                    visualDensity: const VisualDensity(
                                        horizontal: -4, vertical: -4),
                                  );
                                })),
                          )
                        ],
                      ),
                    ),
                  ),
                )));
      },
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
