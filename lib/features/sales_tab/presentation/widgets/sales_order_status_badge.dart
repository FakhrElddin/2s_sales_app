import 'package:flutter/material.dart';

class SalesOrderStatusBadge extends StatelessWidget {
  const SalesOrderStatusBadge({
    super.key,
    required this.status,
  });

  final String status;

  @override
  Widget build(BuildContext context) {
    final isQuotation = status.toLowerCase() == 'quotation';

    final backgroundColor = isQuotation
        ? const Color(0xFFFFFBEB)
        : const Color(0xFFECFDF5);

    final borderColor = isQuotation
        ? const Color(0x99FDE68A)
        : const Color(0x99A7F3D0);

    final dotColor = isQuotation
        ? const Color(0xFFF59E0B)
        : const Color(0xFF059669);

    final textColor = isQuotation
        ? const Color(0xFF92400E)
        : const Color(0xFF065F46);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 3),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(9999),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: dotColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          Text(
            status,
            style: TextStyle(
              color: textColor,
              fontSize: 11,
              fontWeight: FontWeight.w600,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
