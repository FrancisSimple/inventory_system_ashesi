import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemDetailsPage extends StatelessWidget {
  final Map<String, dynamic> itemDetails;

  const ItemDetailsPage({super.key, required this.itemDetails});

  @override
  Widget build(BuildContext context) {
    final formattedDate =
        DateFormat('dd MMM, y').format(itemDetails['lastUpdated']);
    return Scaffold(
      appBar: AppBar(
        title: Text(itemDetails['name'] ?? 'Item Details'),
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${itemDetails['name'] ?? 'N/A'}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Department: ${itemDetails['link'] ?? 'N/A'}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Available stock: ${itemDetails['stockNumber'] ?? 'N/A'}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Storage Location: ${itemDetails['storageLocation'] ?? 'N/A'}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'Last Updated: ${formattedDate}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            Text(
              'Additional Notes:',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              itemDetails['notes'] ?? 'No additional notes.',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
