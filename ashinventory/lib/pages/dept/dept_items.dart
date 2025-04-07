// import 'dart:math';
import 'package:ashinventory/components/empty_screen.dart';
import 'package:ashinventory/components/text_field.dart';
import 'package:ashinventory/pages/details/items.dart';
import 'package:ashinventory/services/callback.dart';
import 'package:ashinventory/services/transitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:ashinventory/post.dart';
// import 'package:darq/darq.dart';
import 'package:intl/intl.dart';
// import 'package:paged_datatable/paged_datatable.dart';

class DeptItems extends StatefulWidget {
  final TextEditingController searchQuery;
  const DeptItems({
    super.key,
    required this.searchQuery,
    required this.dept,
  });
  final String dept;

  @override
  State<DeptItems> createState() => _DeptItemsState();
}

class _DeptItemsState extends State<DeptItems> {
  // final tableController = PagedDataTableController<String, Post>();
  // final hScrollController = ScrollController();
  final int _rowsPerPage = 10;
  final List<Map<String, dynamic>> data = [
    {
      "name": "ENVELOPE ENO SERWAH WHITE",
      "lastUpdated": DateTime(2024, 11, 25),
      "link": "Facilities & Logistics",
      "stockNumber": 564,
      "storageLocation": "Main Store",
    },
    {
      "name": "WHITE BOARD MARKERS BLACK",
      "lastUpdated": DateTime(2024, 11, 25),
      "link": "Facilities & Logistics",
      "stockNumber": 461,
      "storageLocation": "Main Store",
    },
    {
      "name": "PEN BLUE",
      "lastUpdated": DateTime(2024, 11, 25),
      "link": "Facilities & Logistics",
      "stockNumber": 284,
      "storageLocation": "Main Store",
    },
    {
      "name": "PEN RED",
      "lastUpdated": DateTime(2024, 11, 25),
      "link": "Facilities & Logistics",
      "stockNumber": 130,
      "storageLocation": "Main Store",
    },
    {
      "name": "FLIP CHART",
      "lastUpdated": DateTime(2024, 11, 25),
      "link": "Facilities & Logistics",
      "stockNumber": 24,
      "storageLocation": "Main Store",
    },
    {
      "name": "EXERCISE BOOK NOTE 1 PP COVER",
      "lastUpdated": DateTime(2024, 11, 25),
      "link": "Facilities & Logistics",
      "stockNumber": 20,
      "storageLocation": "Main Store",
    },
    {
      "name": "WHITE BOARD CLEANER/DUSTER",
      "lastUpdated": DateTime(2024, 11, 25),
      "link": "Facilities & Logistics",
      "stockNumber": 34,
      "storageLocation": "Main Store",
    },
    {
      "name": "PERMANENT MARKER",
      "lastUpdated": DateTime(2024, 11, 25),
      "link": "Facilities & Logistics",
      "stockNumber": 22,
      "storageLocation": "Main Store",
    },
    {
      "name": "STAPLE PINS ZSZYWKI",
      "lastUpdated": DateTime(2024, 11, 25),
      "link": "Facilities & Logistics",
      "stockNumber": 13,
      "storageLocation": "Main Store",
    },
    {
      "name": "MASKING CELLOTAPE ENO SERWAA WHITE",
      "lastUpdated": DateTime(2024, 11, 25),
      "link": "Facilities & Logistics",
      "stockNumber": 7,
      "storageLocation": "Main Store",
    },
    {
      "name": "PENCIL HB DELO (61ACK LEAD)",
      "lastUpdated": DateTime(2024, 11, 25),
      "link": "Facilities & Logistics",
      "stockNumber": 98,
      "storageLocation": "Main Store",
    },
    {
      "name": "STICKY NOTE",
      "lastUpdated": DateTime(2024, 11, 25),
      "link": "Facilities & Logistics",
      "stockNumber": 54,
      "storageLocation": "Main Store",
    },
    {
      "name": "CLEAR BAG",
      "lastUpdated": DateTime(2024, 11, 25),
      "link": "Facilities & Logistics",
      "stockNumber": 38,
      "storageLocation": "Main Store",
    },
    {
      "name": "LONG RULER",
      "lastUpdated": DateTime(2024, 11, 25),
      "link": "Facilities & Logistics",
      "stockNumber": 14,
      "storageLocation": "Main Store",
    },
    {
      "name": "STICK UP",
      "lastUpdated": DateTime(2024, 11, 25),
      "link": "Facilities & Logistics",
      "stockNumber": 3,
      "storageLocation": "Main Store",
    },
    {
      "name": "HP TONER W2410A (216A) BLACK",
      "lastUpdated": DateTime(2024, 12, 9),
      "link": "Facilities & Logistics",
      "stockNumber": 2,
      "storageLocation": "Library",
    },
    {
      "name": "SHORTHAND NOTEBOOK 70 SHEETS",
      "lastUpdated": DateTime(2024, 12, 9),
      "link": "Facilities & Logistics",
      "stockNumber": 84,
      "storageLocation": "Main Store",
    },
    {
      "name": "PAPER CLIPS",
      "lastUpdated": DateTime(2024, 12, 9),
      "link": "Facilities & Logistics",
      "stockNumber": 24,
      "storageLocation": "Main Store",
    },
    {
      "name": "BLU TACK",
      "lastUpdated": DateTime(2024, 12, 9),
      "link": "Facilities & Logistics",
      "stockNumber": 11,
      "storageLocation": "Main Store",
    },
    {
      "name": "HP LASERJET TONER (CF289A)",
      "lastUpdated": DateTime(2024, 11, 21),
      "link": "Facilities & Logistics",
      "stockNumber": 1,
      "storageLocation": "Administration Block",
    },
    {
      "name": "BINDING COVER",
      "lastUpdated": DateTime(2024, 11, 21),
      "link": "Facilities & Logistics",
      "stockNumber": 682,
      "storageLocation": "Main Store",
    },
    {
      "name": "SHEET PROTECTOR",
      "lastUpdated": DateTime(2024, 11, 21),
      "link": "Facilities & Logistics",
      "stockNumber": 584,
      "storageLocation": "Main Store",
    },
    {
      "name": "ENVELOPE ENO SERWAH A5 BROWN",
      "lastUpdated": DateTime(2024, 11, 21),
      "link": "Facilities & Logistics",
      "stockNumber": 208,
      "storageLocation": "Main Store",
    },
    {
      "name": "PEN BLACK",
      "lastUpdated": DateTime(2024, 11, 21),
      "link": "Facilities & Logistics",
      "stockNumber": 100,
      "storageLocation": "Main Store",
    },
    {
      "name": "HP LASERJET TONER (CF244A)",
      "lastUpdated": DateTime(2024, 11, 21),
      "link": "Facilities & Logistics",
      "stockNumber": 1,
      "storageLocation": "Main Store",
    },
    {
      "name": "HP LASERJET TONER (CF280A)",
      "lastUpdated": DateTime(2024, 11, 21),
      "link": "Facilities & Logistics",
      "stockNumber": 1,
      "storageLocation": "Main Store",
    },
    {
      "name": "HP LASERJET TONER (CF287A)",
      "lastUpdated": DateTime(2024, 11, 21),
      "link": "Facilities & Logistics",
      "stockNumber": 1,
      "storageLocation": "Main Store",
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredRequests = data
        .where(
          (element) =>
              element["name"]
                  .toLowerCase()
                  .contains(widget.searchQuery.text.toLowerCase()) ||
              element["storageLocation"]
                  .toLowerCase()
                  .contains(widget.searchQuery.text.toLowerCase()),
        )
        .toList();
    return Scaffold(
      body: filteredRequests.isEmpty
          ? const EmptyScreen(
              title: 'No Results',
            )
          : SingleChildScrollView(
              // color: Colors.amber,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SelectionArea(
                    child: DataTableTheme(
                      data: DataTableThemeData(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16)),
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
                        rowsPerPage: filteredRequests.length < _rowsPerPage
                            ? filteredRequests.length
                            : _rowsPerPage,
                        columnSpacing: 16, showEmptyRows: false,

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
                            label: Text('Quantity'),
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
                        source: FixMeDataSource(
                            filteredRequests.reversed.toList(),
                            context,
                            widget.dept),

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
        onPressed: () {
          TextEditingController itemName = TextEditingController();
          TextEditingController storageLocation = TextEditingController();
          TextEditingController stockNumber = TextEditingController();
          // TextEditingController link = TextEditingController();
          String? selectedDepartment = widget.dept;
          List<String> departments = [
            "Engineering",
            "Hostels",
            "Health Center",
            "I.T.",
            "Business",
            "Library",
          ];

          callDialog(
              context: context,
              content: SizedBox(
                width: 500,
                child: Form(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FormTextField(
                      controller: itemName,
                      // hintText: "Item name",
                      labelText: "Item name",
                      filled: true,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          flex: 2,
                          child: DropdownButtonFormField<String>(
                            value: selectedDepartment,
                            items: departments.map((dept) {
                              return DropdownMenuItem(
                                  value: dept, child: Text(dept));
                            }).toList(),
                            validator: (value) {
                              // debugPrint(value.toString());
                              if (value == null) {
                                return "Department";
                              }
                              return null;
                            },
                            onChanged:
                                null, // decoration: const InputDecoration(),
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              labelText: 'Department',
                              filled: true,
                              enabled: false,
                              counter: const SizedBox(
                                height: 0,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            // style: TextStyle(
                            //   color: Theme.of(context).colorScheme.primary,
                            // ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: FormTextField(
                            controller: stockNumber,
                            labelText: "Quantity",
                            filled: true,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            // filledColor: true,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    FormTextField(
                      controller: storageLocation,
                      // hintText: "Item name",
                      labelText: "Storage location",
                      filled: true,
                    ),
                  ],
                )),
              ),
              title: "Add an item",
              confirmText: "Add item",
              onConfirm: () {
                setState(() {});
                data.add(
                  {
                    "name": itemName.text.trim(),
                    "lastUpdated": DateTime.now(),
                    "link": selectedDepartment,
                    "stockNumber": int.tryParse(stockNumber.text.trim()),
                    "storageLocation": storageLocation.text.trim(),
                  },
                );
                Navigator.pop(context);
              });
        },
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
  final String dept;

  FixMeDataSource(this.requests, this.context, this.dept);

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
            child: Text(request['name'], overflow: TextOverflow.ellipsis),
          ),
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
            child: Text(formattedDate, overflow: TextOverflow.ellipsis),
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
                  onPressed: () {
                    TextEditingController itemName = TextEditingController();
                    TextEditingController itemNumber = TextEditingController();
                    TextEditingController note = TextEditingController();
                    // TextEditingController link = TextEditingController();
                    String? selectedDepartment = dept;
                    List<String> departments = [
                      "Engineering",
                      "Hostels",
                      "Health Center",
                      "I.T.",
                      "Business",
                      "Library",
                    ];

                    callDialog(
                        context: context,
                        content: SizedBox(
                          width: 500,
                          child: Form(
                              child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              FormTextField(
                                // controller: itemName,
                                initialValue: request["name"],
                                // hintText: "Item name",
                                labelText: "Item name",
                                filled: true,
                                enabled: false,
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: DropdownButtonFormField<String>(
                                      value: selectedDepartment,

                                      items: departments.map((country) {
                                        return DropdownMenuItem(
                                            value: country,
                                            child: Text(country));
                                      }).toList(),
                                      validator: (value) {
                                        // debugPrint(value.toString());
                                        if (value == null) {
                                          return "Department";
                                        }
                                        return null;
                                      },
                                      onChanged: null,
                                      // decoration: const InputDecoration(),
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      decoration: InputDecoration(
                                        labelText: 'Department',
                                        filled: true,
                                        enabled: false,
                                        counter: const SizedBox(
                                          height: 0,
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                      // style: TextStyle(
                                      //   color: Theme.of(context).colorScheme.primary,
                                      // ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: FormTextField(
                                      controller: itemNumber,
                                      labelText: "Quantity",
                                      hintText: "No of items",
                                      filled: true,
                                      keyboardType: TextInputType.number,
                                      // filledColor: true,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              FormTextField(
                                controller: note,
                                maxLines: 5,
                                minLines: 3,
                                // hintText: "Item name",
                                labelText: "Note",
                                filled: true,
                              ),
                            ],
                          )),
                        ),
                        title: "Issue an item",
                        confirmText: "Issue item",
                        onConfirm: () {});
                  },
                  child: const Text("Issue"),
                ),
                const SizedBox(width: 8),
                FilledButton(
                  style: ButtonStyle(
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)))),
                  onPressed: () {
                    TextEditingController itemName = TextEditingController();
                    TextEditingController unitPrice = TextEditingController();
                    TextEditingController invoiceNumber =
                        TextEditingController();
                    TextEditingController quantity = TextEditingController();
                    // TextEditingController link = TextEditingController();
                    String? selectedDepartment;
                    List<String> departments = [
                      "Engineering",
                      "Hostels",
                      "Health Center",
                      "I.T.",
                      "Business",
                      "Library",
                    ];

                    callDialog(
                        context: context,
                        content: SizedBox(
                          width: 500,
                          child: Form(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Item details",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              FormTextField(
                                // controller: itemName,
                                initialValue: request["name"],
                                enabled: false,
                                // hintText: "Item name",
                                labelText: "Item name",
                                filled: true,
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: FormTextField(
                                      controller: unitPrice,
                                      // hintText: "Item name",
                                      labelText: "Unit price (GHS)",
                                      filled: true,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: FormTextField(
                                      controller: quantity,
                                      // maxLines: 5,
                                      // minLines: 3,
                                      // hintText: "Item name",
                                      labelText: "Quantity",
                                      filled: true,
                                    ),
                                  ),
                                ],
                              ),
                              // SizedBox(height: 16),
                              const SizedBox(height: 16),
                              FormTextField(
                                controller: invoiceNumber,
                                // maxLines: 5,
                                // minLines: 3,
                                // hintText: "Item name",
                                labelText: "Invoice number",
                                filled: true,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                "Supplier details",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              FormTextField(
                                controller: itemName,
                                // hintText: "Item name",
                                labelText: "Supplier name",
                                filled: true,
                              ),
                              const SizedBox(height: 16),
                              FormTextField(
                                controller: itemName,
                                // hintText: "Item name",
                                labelText: "Supplier contact",
                                filled: true,
                              )
                            ],
                          )),
                        ),
                        title: "Record a purchase",
                        confirmText: "Confirm",
                        onConfirm: () {});
                  },
                  child: const Text("Stock"),
                ),
                const SizedBox(width: 8),
                FilledButton(
                  style: ButtonStyle(
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      slideLeftTransition(
                        ItemDetailsPage(itemDetails: request),
                      ),
                    );
                  },
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
