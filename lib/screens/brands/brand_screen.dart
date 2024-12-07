import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../utility/constants.dart';
import 'components/add_brand_form.dart';
import 'components/brand_header.dart';
import 'components/brand_list_section.dart';

class BrandScreen extends StatelessWidget {
  const BrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const BrandHeader(),
            const Gap(defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              "My Categories",
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
                              showBrandForm(context, null);
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
                              //TODO: should complete call getAllBrands
                            },
                            icon: const Icon(
                              Icons.refresh,
                              color: Color.fromARGB(255, 66, 188, 205),
                            ),
                          ),
                        ],
                      ),
                      const Gap(defaultPadding),
                      const BrandListSection(),
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
