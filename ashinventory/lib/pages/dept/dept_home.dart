// import 'package:ashinventory/pages/dashboard/dash_items.dart';
import 'package:ashinventory/components/month_selector.dart';
import 'package:ashinventory/pages/dept/dept_issuance.dart';
import 'package:ashinventory/pages/dept/dept_items.dart';
import 'package:ashinventory/pages/dept/dept_op_stock.dart';
import 'package:ashinventory/pages/dept/dept_purchases.dart';

import 'package:flutter/material.dart';

class DeptsPage extends StatefulWidget {
  final String title;
  // final TextEditingController searchController;
  const DeptsPage({
    super.key,
    required this.title,
    // required this.searchController,
  });

  @override
  State<DeptsPage> createState() => _DashHomePageState();
}

class _DashHomePageState extends State<DeptsPage>
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
          preferredSize: (MediaQuery.sizeOf(context).width > 760)
              ? const Size.fromHeight(236)
              : const Size.fromHeight(180),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 56,
                // child:  (MediaQuery.sizeOf(context).width < 760)?Padding(
                //   padding:
                //       const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                //   child: DrawerButton(),
                // ):null,
              ),
              // Title and contact
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.title,
                            style: Theme.of(context).textTheme.headlineMedium),
                        Text("${widget.title} supplies",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: Color(0xff433939),
                                )),
                      ],
                    ),
                    Expanded(child: SizedBox()),
                    if (MediaQuery.sizeOf(context).width < 840)
                      Expanded(
                        flex: 4,
                        child: SearchBar(
                          controller: searchController,
                          hintText: "Search",
                          onChanged: (value) {
                            setState(() {});
                          },
                          constraints:
                              BoxConstraints(minWidth: 100, maxWidth: 200),
                          trailing: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.search))
                          ],
                        ),
                      ),
                    Expanded(child: SizedBox()),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Custodian
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Custodian: ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.bold)),
                            Text("Ewurabena",
                                style: Theme.of(context).textTheme.bodyMedium),
                          ],
                        ),
                        // Contact
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Contact: ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.bold)),
                            Text("0245157898",
                                style: Theme.of(context).textTheme.bodyMedium),
                          ],
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    // Search
                    if (MediaQuery.sizeOf(context).width > 840)
                      Expanded(
                        flex: 4,
                        child: SearchBar(
                          controller: searchController,
                          hintText: "Search",
                          onChanged: (value) {
                            setState(() {});
                          },
                          constraints:
                              BoxConstraints(minWidth: 100, maxWidth: 200),
                          trailing: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.search))
                          ],
                        ),
                      ),
                    Expanded(child: SizedBox()),
                    // Month Selector
                    SizedBox(
                      width: 280,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MonthSelector(),
                        ],
                      ),
                    ),
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
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            DeptItems(
              searchQuery: searchController,
            ),
            DeptIssuances(
              searchQuery: searchController,
            ),
            DeptOpStock(
              searchQuery: searchController,
            ),
            DeptPurchases(
              searchQuery: searchController,
            ),
          ],
        ));
  }
}
