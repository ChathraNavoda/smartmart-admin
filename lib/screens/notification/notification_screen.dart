import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../utility/constants.dart';
import 'components/notification_header.dart';
import 'components/notification_list_section.dart';
import 'components/send_notification_form.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const NotificationHeader(),
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
                              "My Notification",
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
                              sendNotificationFormForm(context);
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Color.fromARGB(255, 66, 188, 205),
                            ),
                            label: const Text(
                              "Send New",
                              style: TextStyle(
                                color: Color.fromARGB(255, 66, 188, 205),
                              ),
                            ),
                          ),
                          const Gap(20),
                          IconButton(
                            onPressed: () {
                              //TODO: should complete call getAllNotifications
                            },
                            icon: const Icon(
                              Icons.refresh,
                              color: Color.fromARGB(255, 66, 188, 205),
                            ),
                          ),
                        ],
                      ),
                      const Gap(defaultPadding),
                      const NotificationListSection(),
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
