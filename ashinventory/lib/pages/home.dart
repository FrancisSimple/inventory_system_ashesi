import 'package:ashinventory/components/button.dart';
import 'package:ashinventory/components/text_field.dart';
import 'package:ashinventory/pages/dashboard/dash_home.dart';
import 'package:ashinventory/pages/dept/dept_home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? selectedTab;
  List<Map<String, dynamic>> sideNavItems = [
    {
      "name": "Engineering",
      "page": DeptsPage(
        title: "Engineering",
      ),
    },
    {
      "name": "Hostels",
      "page": DeptsPage(
        title: "Hostels",
      ),
    },
    {
      "name": "Health Center",
      "page": DeptsPage(
        title: "Health Center",
      ),
    },
    {
      "name": "I.T.",
      "page": DeptsPage(
        title: "I.T.",
      ),
    },
    {
      "name": "Business",
      "page": DeptsPage(
        title: "Business",
      ),
    },
    {
      "name": "Library",
      "page": DeptsPage(
        title: "Library",
      ),
    },
  ];
  bool addDept = false;
  TextEditingController addDeptController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // extendBody: true,
      appBar: (MediaQuery.sizeOf(context).width < 760)
          ? AppBar(
              backgroundColor: Colors.transparent,
            )
          : null,
      drawer: (MediaQuery.sizeOf(context).width < 760)
          // Drawer for Smaller Window size
          ? Drawer(
              backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
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
                            isActive: selectedTab == null,
                            onPressed: () {
                              Navigator.pop(context);
                              setState(() {
                                selectedTab = null;
                                // debugPrint("working");
                              });
                            },
                          ),
                          SideNavButton(
                            text: "Departments",
                            // sub: false,
                            hasIcon: true,

                            onPressed: null,
                            onIconPressed: () {
                              setState(() {
                                addDept = !addDept;
                              });
                            },
                          ),
                          Divider(
                            height: 1,
                          ),
                          SizedBox(height: 8),
                          Column(
                            children: [
                              // ConstrainedBox(
                              //   child: Row(
                              //     children: [
                              //       FormTextField(
                              //           controller: addDeptController,
                              //           hintText: "Add a department"),
                              //       MaterialButton(
                              //         textColor:
                              //             Theme.of(context).colorScheme.onPrimary,
                              //         shape: RoundedRectangleBorder(
                              //             borderRadius: BorderRadius.circular(4)),
                              //         color:
                              //             Theme.of(context).colorScheme.primary,
                                
                              //         // color: Theme.of(context).colorScheme.onPrimary,
                              //         onPressed: () {},
                              //         child: Icon(
                              //           Icons.check,
                              //           size: 16,
                              //         ),
                              //       )
                              //     ],
                              //   ),
                              // ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: sideNavItems.length,
                                itemBuilder: (context, index) => SideNavButton(
                                  text: sideNavItems[index]["name"],
                                  sub: true,
                                  isActive: selectedTab == index,
                                  onPressed: () {
                                    Navigator.pop(context);
                                    setState(() {
                                      selectedTab = index;
                                    });
                                  },
                                  onIconPressed: () {},
                                ),
                              ),
                            ],
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
            )
          : null,
      body: Row(
        children: [
          // Side Nav
          if (MediaQuery.sizeOf(context).width > 760)
            Container(
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
                            isActive: selectedTab == null,
                            onPressed: () {
                              setState(() {
                                selectedTab = null;
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
                          Divider(
                            height: 1,
                          ),
                          SizedBox(height: 8),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: sideNavItems.length,
                            itemBuilder: (context, index) => SideNavButton(
                              text: sideNavItems[index]["name"],
                              sub: true,
                              isActive: selectedTab == index,
                              onPressed: () {
                                setState(() {
                                  selectedTab = index;
                                });
                              },
                              onIconPressed: () {},
                            ),
                          ),
                          SizedBox(
                            height: 100,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

          // Main Body
          Expanded(
            child: selectedTab == null
                ? DashboardPage()
                : sideNavItems[selectedTab!]["page"],
          ),
        ],
      ),
    );
  }
}
