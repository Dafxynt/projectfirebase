import 'package:flutter/material.dart';

class AbsenCard extends StatelessWidget {
  final String shiftName;
  final String jamMasuk;
  final VoidCallback onDelete;

  const AbsenCard({
    Key? key,
    required this.shiftName,
    required this.jamMasuk,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(shiftName),
        subtitle: Text('Jam Masuk: $jamMasuk'),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: onDelete,
        ),
      ),
    );
  }
}