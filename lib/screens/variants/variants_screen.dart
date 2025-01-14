import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smartmartadmin/utility/extensions.dart';

import '../../utility/constants.dart';
import 'components/add_variant_form.dart';
import 'components/variant_header.dart';
import 'components/variants_list_section.dart';

class VariantsScreen extends StatelessWidget {
  const VariantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const VariantsHeader(),
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
                              "My Variants",
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
                              showAddVariantForm(context, null);
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
                                  .getAllVariant(showSnack: true);
                            },
                            icon: const Icon(
                              Icons.refresh,
                              color: Color.fromARGB(255, 66, 188, 205),
                            ),
                          ),
                        ],
                      ),
                      const Gap(defaultPadding),
                      const VariantsListSection(),
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
