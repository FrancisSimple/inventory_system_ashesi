import 'package:ashinventory/components/button.dart';
import 'package:ashinventory/components/empty_screen.dart';
import 'package:ashinventory/components/text_field.dart';
import 'package:ashinventory/pages/dashboard/dash_home.dart';
import 'package:ashinventory/pages/dept/dept_home.dart';
import 'package:ashinventory/post.dart';
import 'package:ashinventory/services/callback.dart';
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
  final _formKey = GlobalKey<FormState>();
  final _formKeyDrawer = GlobalKey<FormState>();
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   addDeptController.dispose();
  //   super.dispose();
  // }

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
                            icon: addDept
                                ? Icon(
                                    Icons.close,
                                    size: 16,
                                    color:
                                        Theme.of(context).colorScheme.onError,
                                  )
                                : null,
                            onPressed: null,
                            buttonColor: addDept
                                ? Theme.of(context).colorScheme.error
                                : null,

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
                              if (addDept)
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(24, 2, 16, 8),
                                  height: addDept ? null : 0,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Form(
                                          key: _formKey,
                                          child: FormTextField(
                                            isDense: true,
                                            controller: addDeptController,
                                            labelText: "Department name",
                                            validator: (value) {
                                              // debugPrint(value.toString());
                                              if (value == null ||
                                                  value == "") {
                                                return "*Required";
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Container(
                                        width: 32,
                                        height: 24,
                                        child: MaterialButton(
                                          textColor: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,

                                          // color: Theme.of(context).colorScheme.onPrimary,
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              debugPrint(
                                                  addDeptController.text);
                                              setState(() {
                                                addDept = !addDept;
                                                sideNavItems.add(
                                                  {
                                                    "name":
                                                        addDeptController.text,
                                                    "page": DeptsPage(
                                                      title: addDeptController
                                                          .text,
                                                    ),
                                                  },
                                                );
                                                addDeptController.clear();
                                              });
                                            }
                                          },
                                          child: Icon(
                                            Icons.check,
                                            size: 16,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              sideNavItems.isEmpty? const MiniEmptyScreen(
                              title: "No departments available",  
                              subtitle: "Click the '+' button to add a new department",
                            )  : ListView.builder(
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
                                  onIconPressed: () {
                                    callDialog(
                                      context: context,
                                      content: Container(
                                        width: 0.5 *
                                            MediaQuery.sizeOf(context).width,
                                        child: Text(
                                            "Removing this department will remove all data associated with it."),
                                      ),
                                      title:
                                          "Remove ${sideNavItems[index]["name"]}?",
                                      onConfirm: () {
                                        setState(() {
                                          sideNavItems.removeAt(index);
                                          selectedTab = null;
                                        });
                                        Navigator.pop(context);
                                      },
                                    );
                                  },
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
                              // Navigator.pop(context);
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
                            icon: addDept
                                ? Icon(
                                    Icons.close,
                                    size: 16,
                                    color:
                                        Theme.of(context).colorScheme.onError,
                                  )
                                : null,
                            onPressed: null,
                            buttonColor: addDept
                                ? Theme.of(context).colorScheme.error
                                : null,

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
                              if (addDept)
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(24, 2, 16, 8),
                                  height: addDept ? null : 0,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Form(
                                          key: _formKey,
                                          child: FormTextField(
                                            isDense: true,
                                            controller: addDeptController,
                                            labelText: "Department name",
                                            validator: (value) {
                                              // debugPrint(value.toString());
                                              if (value == null ||
                                                  value == "") {
                                                return "*Required";
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Container(
                                        width: 32,
                                        height: 24,
                                        child: MaterialButton(
                                          textColor: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,

                                          // color: Theme.of(context).colorScheme.onPrimary,
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              debugPrint(
                                                  addDeptController.text);
                                              setState(() {
                                                addDept = !addDept;
                                                sideNavItems.add(
                                                  {
                                                    "name":
                                                        addDeptController.text,
                                                    "page": DeptsPage(
                                                      title: addDeptController
                                                          .text,
                                                    ),
                                                  },
                                                );
                                                addDeptController.clear();
                                              });
                                            }
                                          },
                                          child: Icon(
                                            Icons.check,
                                            size: 16,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                            sideNavItems.isEmpty?MiniEmptyScreen(
                              title: "No departments available",  
                              subtitle: "Click the '+' button to add a new department",
                            )  :ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: sideNavItems.length,
                                itemBuilder: (context, index) => SideNavButton(
                                  text: sideNavItems[index]["name"],
                                  sub: true,
                                  isActive: selectedTab == index,
                                  onPressed: () {
                                    // Navigator.pop(context);
                                    setState(() {
                                      selectedTab = index;
                                    });
                                  },
                                  onIconPressed: () {
                                    callDialog(
                                      context: context,
                                      content: Text(
                                          "Removing this department will remove all data associated with it."),
                                      title:
                                          "Delete ${sideNavItems[index]["name"]} department?",
                                      onConfirm: () {
                                        setState(() {
                                          sideNavItems.removeAt(index);
                                          selectedTab = null;
                                        });
                                        Navigator.pop(context);
                                      },
                                    );
                                  },
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
