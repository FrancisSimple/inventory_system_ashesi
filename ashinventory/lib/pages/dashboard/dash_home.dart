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
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize:(MediaQuery.sizeOf(context).width > 760)
          ? const Size.fromHeight(212):Size.fromHeight(156),
          child: Container(
            // color: const Color(0xFFFFF1F1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 56),
                // Title and contact
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Dashboard",
                          style: Theme.of(context).textTheme.headlineMedium),
                      FilledButton(
                        onPressed: () {},
                        child: const Text("Summary"),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    // runAlignment: WrapAlignment.spaceBetween,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 4,
                        child: SearchBar(
                          controller: searchController,
                          onChanged: (value) => setState(() {}),
                          hintText: "Search",
                          constraints: const BoxConstraints(
                              minWidth: 100, maxWidth: 200),
                          trailing: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.search))
                          ],
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      // Month Selector
                      MonthSelector(),
                    ],
                  ),
                ),
                // Tabs
                TabBar(controller: tabController, tabs: const [
                  Tab(text: "Items"),
                  Tab(text: "Issuances"),
                  Tab(text: "Opening Stock"),
                  Tab(text: "Purchases"),
                ])
              ],
            ),
            // const SizedBox(height: 10),
            // Tabs and Date Selector
            // ),
          ),
        ),
        body: TabBarView(
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
            //     ),
          ],
        ));
  }
}
