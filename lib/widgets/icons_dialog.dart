import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../src/helpers/custom_icons_list.dart';

class CustomIconsDialog extends StatelessWidget {
  const CustomIconsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CupertinoPopupSurface(
            isSurfacePainted: true,
            child: Material(
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.7,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.9),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: const Offset(0, 2.3),
                        ),
                      ],
                    ),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Custom Icons',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      Divider(
                        height: 0.7,
                        color: Colors.grey[600]?.withOpacity(0.6),
                      ),
                      Expanded(
                        child: GridView.builder(
                          padding: const EdgeInsets.all(16.0),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                            crossAxisSpacing: 4,
                            mainAxisSpacing: 4,
                          ),
                          itemCount:
                              ThisAppCustomIcons().myCustomIconsList.length,
                          itemBuilder: (BuildContext context, int index) {
                            final IconData icon =
                                ThisAppCustomIcons().myCustomIconsList[index];
                            return Icon(icon,
                                size: 22,
                                color: Theme.of(context).colorScheme.onSurface);
                          },
                        ),
                      ),
                      const Divider(height: 1),
                      Padding(
                        padding: const EdgeInsets.only(top: 12, bottom: 12),
                        child: SizedBox(
                          height: 35,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: CupertinoDialogAction(
                                  child: const Text(
                                    'Cancel',
                                    style: TextStyle(
                                        color: CupertinoColors.destructiveRed),
                                  ),
                                  onPressed: () => Navigator.of(context).pop(),
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 40,
                                color: Colors.grey[600]?.withOpacity(0.9),
                              ),
                              Expanded(
                                child: CupertinoDialogAction(
                                  child: Text(
                                    'OK',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ])))));
  }
}
