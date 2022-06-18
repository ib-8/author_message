import 'package:authors_app/widgets/styled_text.dart';
import 'package:flutter/material.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({
    Key? key,
    required this.onDelete,
    this.size = 12,
  }) : super(key: key);

  final VoidCallback onDelete;
  final double size;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Colors.red, width: 2),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 12),
          child: StyledText(
            'Delete',
            size: size,
            color: Colors.red,
            weight: FontWeight.w600,
            // size: 16,
          ),
        ),
      ),
      onTap: onDelete,
    );
  }
}
