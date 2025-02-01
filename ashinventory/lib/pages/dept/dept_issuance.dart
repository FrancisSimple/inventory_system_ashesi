// import 'dart:math';
import 'package:flutter/material.dart';
// import 'package:ashinventory/post.dart';
// import 'package:darq/darq.dart';
import 'package:intl/intl.dart';
// import 'package:paged_datatable/paged_datatable.dart';

class DeptIssuances extends StatefulWidget {
  final TextEditingController searchQuery;
  const DeptIssuances({
    super.key,
    required this.searchQuery,
  });

  @override
  State<DeptIssuances> createState() => _DeptIssuancesState();
}

class _DeptIssuancesState extends State<DeptIssuances> {
  // final tableController = PagedDataTableController<String, Post>();
  // final hScrollController = ScrollController();
  final int _rowsPerPage = 10;
  final List<Map<String, dynamic>> data = [
    {
      // "department": "Engineering",
      "date": DateTime.now().subtract(const Duration(days: 1)),
      "receipient": "Receipient",
      "itemNumber": 10,
      "Note": "To be returned",
    },
    {
      // "department": "Engineering",
      "date": DateTime.now().subtract(const Duration(days: 1)),
      "receipient": "Receipient",
      "itemNumber": 10,
      "Note": "To be returned",
    },
    {
      // "department": "Engineering",
      "date": DateTime.now().subtract(const Duration(days: 1)),
      "receipient": "Receipient",
      "itemNumber": 10,
      "Note": "To be returned",
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredRequests = data
        .where(
          (element) => element["receipient"].toLowerCase().contains(widget.searchQuery.text.toLowerCase()) ,
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
                      label: Text('Date'),
                      // onSort: (columnIndex, _) {
                      //   setState(() {
                      //     fixMeRequests
                      //         .sort((a, b) => a['department'].compareTo(b['department']));
                      //   });
                      // },
                    ),
                    // DataColumn(
                    //   label: Text('Department'),
                    // ),
                    DataColumn(
                      label: Text('Receipient'),
                    ),
                    DataColumn(
                      label: Text('Item number'),
                      // onSort: (columnIndex, _) {
                      //   setState(() {
                      //     fixMeRequests.sort((a, b) =>
                      //         a['date'].compareTo(b['date']));
                      //   });
                      // },
                    ),
                    DataColumn(
                      label: Text('Note'),
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
        label: const Text("Add issuance"),
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
    final formattedDate = DateFormat('dd MMM, y').format(request['date']);
    // final itemNumber = request['itemNumber'] as List<String>;

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
              minWidth: 0.08 * MediaQuery.sizeOf(context).width,
            ),
            child: Text(formattedDate, overflow: TextOverflow.ellipsis),
          ),
        ),
        // DataCell(
        //   SizedBox(
        //     width: 0.125 * MediaQuery.sizeOf(context).width,
        //     child: Text(request['department'], overflow: TextOverflow.ellipsis),
        //   ),
        // ),
        DataCell(
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 0.2 * MediaQuery.sizeOf(context).width,
            ),
            child:Text(request['receipient'], overflow: TextOverflow.ellipsis),
          ),
        ),
        DataCell(
          Text(request["itemNumber"].toString()),
        ),
        DataCell(
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 0.25 * MediaQuery.sizeOf(context).width,
            ),
            child:Text(request['Note'], overflow: TextOverflow.ellipsis),
          ),
        ),
        DataCell(
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 0.165 * MediaQuery.sizeOf(context).width,
            ),
            child: Row(
              children: [
                FilledButton(
                  style: ButtonStyle(
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)))),
                  onPressed: () {},
                  child: const Text("View"),
                ),
                // SizedBox(width: 8),
                // FilledButton(
                //   style: ButtonStyle(
                //       shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(4)))),
                //   onPressed: () {},
                //   child: const Text("Stock"),
                // ),
                // SizedBox(width: 8),
                // FilledButton(
                //   style: ButtonStyle(
                //       shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(4)))),
                //   onPressed: () {},
                //   child: const Text("View"),
                // ),
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
