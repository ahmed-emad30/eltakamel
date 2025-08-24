import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app_routes/routes_strings.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blueGrey,
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),
            // Header
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue.shade100,
                    radius: 30,
                    child: const Icon(
                      Icons.person,
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                                                 Text(
                           'User Name',
                           style: Theme.of(context)
                               .textTheme
                               .titleLarge!
                               .copyWith(color: Colors.white),
                         ),
                         Text(
                           'user@example.com',
                           style: Theme.of(context)
                               .textTheme
                               .bodyMedium!
                               .copyWith(color: Colors.white70),
                         ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.white54),
            // Menu Items
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                                    DrawerMenuItem(
                     title: 'Account',
                     icon: Icons.person,
                     page: Routes.homeScreen,
                   ),
                   ExpansionTile(
                     title: Text(
                       'Billing',
                       style: Theme.of(context)
                           .textTheme
                           .titleLarge!
                           .copyWith(color: Colors.white),
                     ),
                     iconColor: Colors.white,
                     collapsedIconColor: Colors.white,
                     leading: const Icon(CupertinoIcons.book_solid, color: Colors.white),
                     children: [
                       DrawerMenuItem(
                         title: 'Invoices',
                         icon: CupertinoIcons.doc_text,
                         page: Routes.homeScreen,
                         isSubItem: true,
                       ),
                       DrawerMenuItem(
                         title: 'Payments',
                         icon: CupertinoIcons.money_dollar,
                         page: Routes.homeScreen,
                         isSubItem: true,
                       ),
                       DrawerMenuItem(
                         title: 'Journal',
                         icon: CupertinoIcons.list_bullet,
                         page: Routes.homeScreen,
                         isSubItem: true,
                       ),
                     ],
                   ),
                   DrawerMenuItem(
                     title: 'Data Usage',
                     icon: Icons.area_chart,
                     page: Routes.dataUsageScreen,
                   ),
                   DrawerMenuItem(
                     title: 'Sessions',
                     icon: Icons.menu,
                     page: Routes.homeScreen,
                   ),
                   DrawerMenuItem(
                     title: 'Packages',
                     icon: Icons.all_inbox,
                     page: Routes.packagesScreen,
                   ),
                   DrawerMenuItem(
                     title: 'Support',
                     icon: Icons.support,
                     page: Routes.supportScreen,
                   ),
                ],
              ),
            ),
            const Divider(color: Colors.white54),
            // Logout
            DrawerMenuItem(
              title: 'Logout',
              icon: Icons.logout,
              page: Routes.loginScreen,
              textColor: Colors.red.shade300,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class DrawerMenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String page;
  final bool isSubItem;
  final Color? textColor;

  const DrawerMenuItem({
    super.key,
    required this.title,
    required this.icon,
    required this.page,
    this.isSubItem = false,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: isSubItem ? 0 : 4,
        bottom: isSubItem ? 0 : 4,
      ),
      leading: Icon(
        icon,
        color: textColor ?? Colors.white,
        size: isSubItem ? 20 : 24,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: textColor ?? Colors.white,
              fontSize: isSubItem ? 14 : 16,
            ),
      ),
             onTap: () {
         // Close drawer first
         Navigator.of(context).pop();
         // Then navigate to the page
         context.go(page);
       },
    );
  }
} 