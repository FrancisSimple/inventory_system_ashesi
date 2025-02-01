// import 'dart:math';
import 'package:flutter/material.dart';
// import 'package:ashinventory/post.dart';
// import 'package:darq/darq.dart';
import 'package:intl/intl.dart';
// import 'package:paged_datatable/paged_datatable.dart';

class DeptItems extends StatefulWidget {
  final TextEditingController searchQuery;
  const DeptItems({
    super.key,
    required this.searchQuery,
  });

  @override
  State<DeptItems> createState() => _DeptItemsState();
}

class _DeptItemsState extends State<DeptItems> {
  // final tableController = PagedDataTableController<String, Post>();
  // final hScrollController = ScrollController();
  final int _rowsPerPage = 10;
  final List<Map<String, dynamic>> data = [
    {
      "name": "A4 Sheets",
      "lastUpdated": DateTime.now().subtract(const Duration(days: 1)),
      // "link": "Engineering",
      "stockNumber": 10,
      "storageLocation": "Engineering Building",
    },
    {
      "name": "A4 Sheets",
      "lastUpdated": DateTime.now().subtract(const Duration(days: 1)),
      // "link": "Engineering",
      "stockNumber": 10,
      "storageLocation": "Engineering Building",
    },
    {
      "name": "A4 Sheets",
      "lastUpdated": DateTime.now().subtract(const Duration(days: 1)),
      // "link": "Engineering",
      "stockNumber": 10,
      "storageLocation": "Engineering Building",
    },
    {
      "name": "A4 Sheets",
      "lastUpdated": DateTime.now().subtract(const Duration(days: 1)),
      // "link": "Engineering",
      "stockNumber": 10,
      "storageLocation": "Engineering Building",
    },
    {
      "name": "A4 Sheets",
      "lastUpdated": DateTime.now().subtract(const Duration(days: 1)),
      // "link": "Engineering",
      "stockNumber": 10,
      "storageLocation": "Engineering Building",
    },
    {
      "name": "A4 Sheets",
      "lastUpdated": DateTime.now().subtract(const Duration(days: 1)),
      // "link": "Engineering",
      "stockNumber": 10,
      "storageLocation": "Engineering Building",
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredRequests = data
        .where(
          (element) => element["name"].toLowerCase().contains(widget.searchQuery.text.toLowerCase()) ,
        )
        .toList();
    return Scaffold(
      body: SingleChildScrollView(
        // color: Colors.amber,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SelectionArea(
              child: DataTableTheme(
                data: DataTableThemeData(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(16)),
                  dataRowMaxHeight: double.infinity,
                  horizontalMargin: 120,
                  headingRowColor: WidgetStateProperty.all(
                      Theme.of(context).colorScheme.secondaryContainer),
                  dataRowColor: WidgetStateProperty.all(
                      Theme.of(context).colorScheme.surfaceContainerLow),
                  headingTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary),
                ),
                child: PaginatedDataTable(
                  // primary: true,
                  // controller: hScrollController,
                  dataRowMaxHeight: double.infinity,
                  showCheckboxColumn: false,
                  rowsPerPage: _rowsPerPage,
                  columnSpacing: 16,

                  columns: const [
                    DataColumn(
                      label: Text('Name'),
                      // onSort: (columnIndex, _) {
                      //   setState(() {
                      //     fixMeRequests
                      //         .sort((a, b) => a['name'].compareTo(b['name']));
                      //   });
                      // },
                    ),
                    DataColumn(
                      label: Text('Stock number'),
                    ),
                    // DataColumn(
                    //   label: Text('Link'),
                    // ),
                    DataColumn(
                      label: Text('Last updated'),
                      // onSort: (columnIndex, _) {
                      //   setState(() {
                      //     fixMeRequests.sort((a, b) =>
                      //         a['lastUpdated'].compareTo(b['lastUpdated']));
                      //   });
                      // },
                    ),
                    DataColumn(
                      label: Text('Storage location'),
                    ),
                    DataColumn(
                      label: Text('Actions'),
                    ),
                  ],
                  source: FixMeDataSource(filteredRequests, context),

                  // header: const Text(
                  //   'Your Requests',
                  //   style: TextStyle(fontWeight: FontWeight.bold),
                  // ),
                  // availableRowsPerPage: const [5, 6, 7, 8, 9, 10],
                  // onRowsPerPageChanged: (value) {
                  //   setState(() {
                  //     _rowsPerPage = value ?? 5;
                  //   });
                  // },
                ),
              ),
            ),
            const SizedBox(height: 72)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text("Add item"),
        icon: const Icon(Icons.add),
      ),
    );
  }
}

// Custom DataSource for the table
class FixMeDataSource extends DataTableSource {
  final List<Map<String, dynamic>> requests;
  final BuildContext context;

  FixMeDataSource(this.requests, this.context);

  @override
  DataRow getRow(int index) {
    final request = requests[index];
    final formattedDate =
        DateFormat('dd MMM, y').format(request['lastUpdated']);
    // final stockNumber = request['stockNumber'] as List<String>;

    return DataRow(
      // onSelectChanged: (_) {
      //   // Navigator.push(
      //   //   context,
      //   //   MaterialPageRoute(
      //   //     builder: (context) => FixMeDetails(details: request['details']),
      //   //   ),
      //   // );
      // },
      cells: [
        DataCell(
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 0.15 * MediaQuery.sizeOf(context).width,
            ),
            child:Text(request['name'], overflow: TextOverflow.ellipsis),),
        ),
        DataCell(
          Text(request["stockNumber"].toString()),
        ),
        // DataCell(
        //   SizedBox(
        //     width: 0.12 * MediaQuery.sizeOf(context).width,
        //     child: Text(request['link'], overflow: TextOverflow.ellipsis),
        //   ),
        // ),
        DataCell(
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 0.12 * MediaQuery.sizeOf(context).width,
            ),
            child:Text(formattedDate, overflow: TextOverflow.ellipsis),
          ),
        ),
        DataCell(
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 0.25 * MediaQuery.sizeOf(context).width,
            ),
            child: Text(request['storageLocation'],
                overflow: TextOverflow.ellipsis),
          ),
        ),
        DataCell(
          SizedBox(
            // width: 0.35 * MediaQuery.sizeOf(context).width,
            child: Row(
              children: [
                FilledButton(
                  style: ButtonStyle(
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)))),
                  onPressed: () {},
                  child: const Text("Issue"),
                ),
                SizedBox(width: 8),
                FilledButton(
                  style: ButtonStyle(
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)))),
                  onPressed: () {},
                  child: const Text("Stock"),
                ),
                SizedBox(width: 8),
                FilledButton(
                  style: ButtonStyle(
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)))),
                  onPressed: () {},
                  child: const Text("View"),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => requests.length;

  @override
  int get selectedRowCount => 0;
}
