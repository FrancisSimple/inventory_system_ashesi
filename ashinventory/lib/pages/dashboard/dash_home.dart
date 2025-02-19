import 'package:ashinventory/components/month_selector.dart';
import 'package:ashinventory/pages/dashboard/dash_issuance.dart';
import 'package:ashinventory/pages/dashboard/dash_items.dart';
import 'package:ashinventory/pages/dashboard/dash_op_stock.dart';
import 'package:ashinventory/pages/dashboard/dash_purchases.dart';

import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashHomePageState();
}

class _DashHomePageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  final TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(MediaQuery.sizeOf(context).width.toString());
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 56),
          // Title and contact
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                (MediaQuery.sizeOf(context).width < 760)
                    ? Expanded(
                        flex: 4,
                        child: SearchBar(
                          leading: const Icon(Icons.search),
                          controller: searchController,
                          onChanged: (value) => setState(() {}),
                          hintText: "Search",
                          constraints: const BoxConstraints(
                              minWidth: 100, maxWidth: 200, minHeight: 40),
                        ),
                      )
                    : Text("Dashboard",
                        style: Theme.of(context).textTheme.headlineMedium),
                if (MediaQuery.sizeOf(context).width > 760) ...[
                  SizedBox(
                    width: 16,
                  ),
                  FilledButton(
                    style: const ButtonStyle(
                      padding: WidgetStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 12),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text("Summary"),
                  ),
                  if (MediaQuery.sizeOf(context).width < 427.2)
                    SizedBox(
                        width: 260,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            MonthSelector(
                              onDateChanged: (date) => setState(
                                () {
                                  debugPrint(date.toString());
                                },
                              ),
                            ),
                          ],
                        )),
                ],
                if (MediaQuery.sizeOf(context).width > 423 &&
                    MediaQuery.sizeOf(context).width < 760)
                  SizedBox(
                      width: 260,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MonthSelector(
                            onDateChanged: (date) => setState(
                              () {
                                debugPrint(date.toString());
                              },
                            ),
                          ),
                        ],
                      )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              // runAlignment: WrapAlignment.spaceBetween,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (MediaQuery.sizeOf(context).width > 760) ...[
                if (MediaQuery.sizeOf(context).width > 1185)  const Spacer(),
                  Expanded(
                    flex: 4,
                    child: SearchBar(
                      leading: const Icon(Icons.search),
                      controller: searchController,
                      onChanged: (value) => setState(() {}),
                      hintText: "Search",
                      constraints: const BoxConstraints(
                          minWidth: 100, maxWidth: 200, minHeight: 40),
                    ),
                  ),
                ],

                const Spacer(),
                // Month Selector
                if (MediaQuery.sizeOf(context).width < 423 ||
                    MediaQuery.sizeOf(context).width > 760)
                  SizedBox(
                      width: 260,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MonthSelector(
                            onDateChanged: (date) => setState(
                              () {
                                debugPrint(date.toString());
                              },
                            ),
                          ),
                        ],
                      )),
              ],
            ),
          ),
          // Tabs
          TabBar(
            controller: tabController,
            tabs: const [
              Tab(text: "Items"),
              Tab(text: "Issuances"),
              Tab(text: "Opening Stock"),
              Tab(text: "Purchases"),
            ],
            onTap: (value) {
              searchController.clear();
            },
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                DashItems(
                  searchQuery: searchController,
                ),
                DashIssuances(
                  searchQuery: searchController,
                ),
                DashOpStock(
                  searchQuery: searchController,
                ),
                DashPurchases(
                  searchQuery: searchController,
                ),
                // ,
                //     ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
