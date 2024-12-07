import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../utility/constants.dart';
import '../../widgets/custom_dropdown.dart';
import 'components/order_header.dart';
import 'components/order_list_section.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const OrderHeader(),
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
                              "My Orders",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          const Gap(20),
                          SizedBox(
                            width: 280,
                            child: CustomDropdown(
                              hintText: 'Filter Order By status',
                              initialValue: 'All order',
                              items: const [
                                'All order',
                                'pending',
                                'processing',
                                'shipped',
                                'delivered',
                                'cancelled'
                              ],
                              displayItem: (val) => val,
                              onChanged: (newValue) {
                                if (newValue?.toLowerCase() == 'all order') {
                                  //TODO: should complete call filterOrders
                                } else {
                                  //TODO: should complete call filterOrders
                                }
                              },
                              validator: (value) {
                                if (value == null) {
                                  return 'Please select status';
                                }
                                return null;
                              },
                            ),
                          ),
                          const Gap(40),
                          IconButton(
                              onPressed: () {
                                //TODO: should complete call getAllOrders
                              },
                              icon: const Icon(
                                Icons.refresh,
                                color: Color.fromARGB(255, 66, 188, 205),
                              )),
                        ],
                      ),
                      const Gap(defaultPadding),
                      const OrderListSection(),
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
