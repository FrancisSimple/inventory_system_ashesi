import 'package:ashinventory/components/button.dart';
import 'package:flutter/material.dart';

class SideNav extends StatefulWidget {
  int? selectedTab;
  final List<Map<String, dynamic>> sideNavItems;
  SideNav({super.key, required this.selectedTab, required this.sideNavItems});

  @override
  State<SideNav> createState() => _SideNavState();
}

class _SideNavState extends State<SideNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: MediaQuery.sizeOf(context).height,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainer,
      ),
      child: Column(
        children: [
          DrawerHeader(
            child: Center(
                child: Text(
              "AshInventory",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            )),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SideNavButton(
                    text: "Dashboard",
                    isActive: widget.selectedTab == null,
                    onPressed: () {
                      setState(() {
                        widget.selectedTab = null;
                        // debugPrint("working");
                      });
                    },
                  ),
                  SideNavButton(
                    text: "Departments",
                    // sub: false,
                    hasIcon: true,

                    onPressed: null,
                    onIconPressed: () {},
                  ),
                  const Divider(
                    height: 1,
                  ),
                  const SizedBox(height: 8),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: widget.sideNavItems.length,
                    itemBuilder: (context, index) => SideNavButton(
                      text: widget.sideNavItems[index]["name"],
                      sub: true,
                      isActive: widget.selectedTab == index,
                      onPressed: () {
                        setState(() {
                          widget.selectedTab = index;
                        });
                      },
                      onIconPressed: () {},
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
