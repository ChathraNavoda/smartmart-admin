import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smartmartadmin/utility/extensions.dart';

import '../../utility/constants.dart';
import 'components/add_poster_form.dart';
import 'components/poster_header.dart';
import 'components/poster_list_section.dart';

class PosterScreen extends StatelessWidget {
  const PosterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const PosterHeader(),
            const SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Text(
                              "My Posters",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          ElevatedButton.icon(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: defaultPadding * 1.5,
                                vertical: defaultPadding,
                              ),
                            ),
                            onPressed: () {
                              showAddPosterForm(context, null);
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Color.fromARGB(255, 66, 188, 205),
                            ),
                            label: const Text(
                              "Add New",
                              style: TextStyle(
                                color: Color.fromARGB(255, 66, 188, 205),
                              ),
                            ),
                          ),
                          const Gap(20),
                          IconButton(
                            onPressed: () {
                              context.dataProvider
                                  .getAllPosters(showSnack: true);
                            },
                            icon: const Icon(
                              Icons.refresh,
                              color: Color.fromARGB(255, 66, 188, 205),
                            ),
                          ),
                        ],
                      ),
                      const Gap(defaultPadding),
                      const PosterListSection(),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
