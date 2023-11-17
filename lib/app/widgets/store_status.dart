import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreStatus extends StatelessWidget {
  final bool isOnline;

  const StoreStatus({super.key, required this.isOnline});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: isOnline ? Colors.green : Colors.black45,
        border: Border.all(color: Colors.black12, width: 2),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        isOnline ? 'Aberto' : 'Fechado',
        style: Get.textTheme.bodyMedium?.copyWith(
          color: Colors.white,
        ),
      ),
    );
  }
}
