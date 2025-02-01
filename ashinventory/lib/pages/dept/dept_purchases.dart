// import 'dart:math';
import 'package:flutter/material.dart';
// import 'package:ashinventory/post.dart';
// import 'package:darq/darq.dart';
import 'package:intl/intl.dart';
// import 'package:paged_datatable/paged_datatable.dart';

class DeptPurchases extends StatefulWidget {
  final TextEditingController searchQuery;
  const DeptPurchases({
    super.key,
    required this.searchQuery,
  });

  @override
  State<DeptPurchases> createState() => _DeptPurchasesState();
}

class _DeptPurchasesState extends State<DeptPurchases> {
  // final tableController = PagedDataTableController<String, Post>();
  // final hScrollController = ScrollController();
  final int _rowsPerPage = 10;
  final List<Map<String, dynamic>> data = [
    {
      "supplier": "Supplier LLC.",
      "itemName": "Oscilloscope",
      "supplierContact": "sup1@gmail.com",
      "purchaseDate": DateTime.now().subtract(const Duration(days: 1)),
      // "date": DateTime.now().subtract(const Duration(days: 1)),
      // "receipient": "Receipient",
      "unitPriceGHS": 100,
      "quantity": 1,
      "totalCostGHS": 100,
      // "totalCostUSD": 1562,
      "invoiceNumber": 5325454545,
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredRequests = data
        .where(
          (element) =>
              element["itemName"]
                  .toLowerCase()
                  .contains(widget.searchQuery.text.toLowerCase()) ||
              element["supplier"]
                  .toLowerCase()
                  .contains(widget.searchQuery.text.toLowerCase()),
        )
        .toList();
        debugPrint(MediaQuery.sizeOf(context).width.toString());
    return Scaffold(
      body: SingleChildScrollView(
        // color: Colors.amber,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            Row(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Total (GHS): ",
                    style: Theme.of(context).textTheme.titleMedium),
                SelectionArea(
                  child: Text(78568.toStringAsFixed(2),
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  width: 8,
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            SelectionArea(
              child: DataTableTheme(
                data: DataTableThemeData(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(16)),
                  // dataRowMaxHeight: double.maxFinite,
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
                  // dataRowMaxHeight: double.maxFinite,
                  showCheckboxColumn: false,
                  rowsPerPage:
                      data.length < _rowsPerPage ? data.length : _rowsPerPage,
                  columnSpacing: 16, showEmptyRows: false,

                  columns: const [
                    DataColumn(
                      label: Text('Supplier name'),
                    ),
                    DataColumn(
                      label: Text('Supplier contact'),
                    ),
                    DataColumn(
                      label: Text('Item name'),
                      // onSort: (columnIndex, _) {
                      //   setState(() {
                      //     fixMeRequests
                      //         .sort((a, b) => a['itemName'].compareTo(b['itemName']));
                      //   });
                      // },
                    ),
                    DataColumn(
                      label: Text('Purchase date'),
                    ),
                    DataColumn(
                      label: Text('Unit price (GHS)'),
                    ),
                    DataColumn(
                      label: Text('Quantity (PCS)'),
                    ),
                    DataColumn(
                      label: Text('Total cost (GHS)'),
                      // onSort: (columnIndex, _) {
                      //   setState(() {
                      //     fixMeRequests.sort((a, b) =>
                      //         a['date'].compareTo(b['date']));
                      //   });
                      // },
                    ),
                    // DataColumn(
                    //   label: Text('Total cost (USD)'),
                    // ),
                    DataColumn(
                      label: Text('invoice number'),
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
        label: const Text("Add purchase"),
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
        DateFormat('dd MMM, y').format(request['purchaseDate']);
    // final unitPriceGHS = request['unitPriceGHS'] as List<String>;

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
              minWidth: 0.1 * MediaQuery.sizeOf(context).width,
            ),
            child: Text(request['supplier'].toString(),
                overflow: TextOverflow.ellipsis),
          ),
        ),
        DataCell(
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 0.1 * MediaQuery.sizeOf(context).width,
            ),
            child: Text(request['supplierContact'].toString(),
                overflow: TextOverflow.ellipsis),
          ),
        ),
        DataCell(
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 0.1 * MediaQuery.sizeOf(context).width,
            ),
            child: Text(request['itemName'].toString(),
                overflow: TextOverflow.ellipsis),
          ),
        ),
        DataCell(
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 0.076 * MediaQuery.sizeOf(context).width,
            ),
            child: Text(formattedDate, overflow: TextOverflow.ellipsis),
          ),
        ),
        DataCell(
          Text(request["unitPriceGHS"].toString()),
        ),

        DataCell(
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 0.1 * MediaQuery.sizeOf(context).width,
            ),
            child: Text(request['quantity'].toString(),
                overflow: TextOverflow.ellipsis),
          ),
        ),
        DataCell(
          ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 0.1 * MediaQuery.sizeOf(context).width,
            ),
            child: Text(request['totalCostGHS'].toString(),
                overflow: TextOverflow.ellipsis),
          ),
        ),
        // DataCell(
        //   SizedBox(
        //     width: 0.1 * MediaQuery.sizeOf(context).width,
        //     child: Text(request['totalCostUSD'].toString(),
        //         overflow: TextOverflow.ellipsis),
        //   ),
        // ),
        DataCell(
          SizedBox(
            // width: 0.3 * MediaQuery.sizeOf(context).width,
            child: Text(request['invoiceNumber'].toString(),
                overflow: TextOverflow.ellipsis),
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
