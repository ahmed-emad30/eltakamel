import 'package:eltakamel/core/app_routes/routes_strings.dart';
import 'package:eltakamel/features/home/presentation/home_screen/ui/widgets/home_body.dart' show HomeBody;
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/widgets/main_widgets/app_scaffold.dart' show AppScaffold;
int va = 0;
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).appBarTheme.copyWith(
          backgroundColor: Colors.lightBlueAccent,
        ).backgroundColor,
        title:  Text('User Portal', style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white)),
        centerTitle: true,

      ),
        backgroundColor: Colors.blueGrey.shade50,
      body: const HomeBody(),
        drawer: Drawer(
          backgroundColor: Colors.blueGrey,
          child:
              SafeArea(
                child: Column(
                  children: [
                   DrawerItem(item: DrawerEntity(title: 'Account', icon: Icons.person, page:Routes.homeScreen ),) ,
                    ExpansionDrawerItem(
                      items: [
                        const DrawerEntity(title: 'Billing', icon: CupertinoIcons.book_solid, page:Routes.homeScreen ),
                        const DrawerEntity(title: 'Invoices',  page:Routes.homeScreen ),
                        const DrawerEntity(title: 'Payments',  page: Routes.homeScreen),
                        const DrawerEntity(title: 'Journal',  page:Routes.homeScreen ),
                      ],
                    ),
                    DrawerItem(item: DrawerEntity(title: 'Data Usage', icon: Icons.area_chart, page: Routes.homeScreen),) ,
                    DrawerItem(item: DrawerEntity(title: 'Sessions', icon: Icons.menu, page: Routes.homeScreen),) ,
                    DrawerItem(item: DrawerEntity(title: 'Packages', icon:Icons.all_inbox , page: Routes.homeScreen),) ,
                    DrawerItem(item: DrawerEntity(title: 'Support', icon: Icons.support, page:Routes.homeScreen ),) ,
                    DrawerItem(item: DrawerEntity(title: 'Documents', icon: Icons.description, page: Routes.homeScreen),) ,



                  ],
                ),
              ),
        ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({super.key, required this.item});
final DrawerEntity item ;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:  Icon(item.icon, color: Colors.white),
      title: Text(item.title, style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white)),
      onTap: () {

      context.go(item.page);
      },

    );
  }
}
class ExpansionDrawerItem extends StatelessWidget {
  const ExpansionDrawerItem({super.key, required this.items});
final List<DrawerEntity> items ;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const SizedBox.shrink();
    }
    final firstItem = items.first;
    final otherItems = items.skip(1).toList();
    return ExpansionTile( title: Text(firstItem.title, style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white)),
      iconColor: Colors.white,
      collapsedIconColor: Colors.white,
      leading:  Icon(firstItem.icon, color: Colors.white),
      children: otherItems.map(
        (item) => ListTile(
          leading: Icon(item.icon, color: Colors.white),
          title: Text(item.title, style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white)),
          onTap: () {
            context.go(item.page);
          },
        ),
      ).toList(),
    );
  }
}
class DrawerEntity{
  final String title;
  final IconData? icon;
  final String page;

  const DrawerEntity({
    required this.title,
     this.icon,
    required this.page,
  });

}
