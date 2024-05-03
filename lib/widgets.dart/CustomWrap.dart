 import 'package:flutter/material.dart';

import '../views/about_view.dart';

Wrap customWrap(BuildContext context) {
    return Wrap(
              children: [
                const Text(
                    'If you wonder about how each of the criteria affects, you can..'),
                TextButton(
                  child: const Text('Click here!'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AboutCriteriaView(),
                      ),
                    );
                  },
                )
              ],
            );
  }
