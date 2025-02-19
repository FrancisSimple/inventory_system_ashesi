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
    debugPrint(MediaQuery.sizeOf(context).width.toString());
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 56),
        // Title and contact
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (MediaQuery.sizeOf(context).width > 760) ...[
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title,
                        style: Theme.of(context).textTheme.headlineMedium),
                    Text("${widget.title} supplies",
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Color(0xff433939),
                                )),
                  ],
                ),
                const Spacer(),
              ] else ...[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
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
                ),
              ],
              if (MediaQuery.sizeOf(context).width < 886 &&(MediaQuery.sizeOf(context).width >= 760 ||
                      MediaQuery.sizeOf(context).width <= 462))
                Expanded(
                  flex: 4,
                  child: SearchBar(
                    leading: const Icon(Icons.search),
                    controller: searchController,
                    hintText: "Search",
                    onChanged: (value) {
                      setState(() {});
                    },
                    constraints: BoxConstraints(minWidth: 100, maxWidth: 200,minHeight: 40),
                    
                  ),
                ),
              if (MediaQuery.sizeOf(context).width < 760)
                SizedBox(
                  width: 16,
                ),
              if (MediaQuery.sizeOf(context).width > 760) ...[
                const Spacer(),
                FilledButton(
                  onPressed: () {},
                  child: const Text("Summary"),
                ),
              ],
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            // runAlignment: WrapAlignment.spaceBetween,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (MediaQuery.sizeOf(context).width > 760)
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
              if (MediaQuery.sizeOf(context).width > 760) const Spacer(),
              // Search
              if (MediaQuery.sizeOf(context).width > 886 ||
                  (MediaQuery.sizeOf(context).width < 760 &&
                      MediaQuery.sizeOf(context).width > 462))
                Expanded(
                  flex: 5,
                  child: SearchBar(
                    leading: const Icon(Icons.search),
                    controller: searchController,
                    hintText: "Search",
                    onChanged: (value) {
                      setState(() {});
                    },
                    constraints: BoxConstraints(minWidth: 100, maxWidth: 200, minHeight: 40),
                    
                  ),
                ),
              const Spacer(),
              // Month Selector
              SizedBox(
                width: 260,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MonthSelector(
                      onDateChanged: (date) => setState(() {
                        debugPrint(date.toString());
                      }),
                    ),
                  ],
                ),
              ),
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
        ))
      ],
    ));
  }
}
