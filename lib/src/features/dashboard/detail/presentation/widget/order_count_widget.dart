import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/constants/color/app_colors.dart';

class OrderCountWidget extends StatelessWidget {
  const OrderCountWidget({
    super.key,
    required this.orderCount,
    required this.add,
    required this.remove,
  });

  final int orderCount;
  final VoidCallback add;
  final VoidCallback remove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.normalGrey),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: remove,
            borderRadius: BorderRadius.circular(50),
            child: Icon(Icons.remove, color: Colors.black, size: 15),
          ),
          SizedBox(
            width: 50,
            child: Center(
              child: Text(
                orderCount.toString(),
                style: GoogleFonts.dmSans(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: add,
            borderRadius: BorderRadius.circular(50),
            child: Icon(Icons.add, color: Colors.black, size: 15),
          ),
        ],
      ),
    );
  }
}
