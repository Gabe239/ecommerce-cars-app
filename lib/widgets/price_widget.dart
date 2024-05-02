import 'package:flutter/material.dart';
import 'package:ecommerce/widgets/text_widget.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget({
    Key? key,
    required this.price,
    required this.textPrice,
  }) : super(key: key);
  final double price;
  final String textPrice;
 
  @override
  Widget build(BuildContext context) {
    return FittedBox(
        child: Row(
      children: [
        TextWidget(
          text: '\$${(price * int.parse(textPrice)).toStringAsFixed(2)}',
          color: Colors.white,
          textSize: 22,
        ),
       
      ],
    ));
  }
}
