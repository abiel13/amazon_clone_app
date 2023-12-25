import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/accounts/widget/single_product.dart';
import 'package:flutter/material.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List list = [
    'https://cdnssl.productinformation.net/images/productshots/605861D.jpg?v=6b998f53-8ce1-4330-9019-6fd3b198fe86',
    'https://th.bing.com/th/id/OIP.YX1wuu12m9RYt4-kU3V7cwHaEW?rs=1&pid=ImgDetMain',
    'https://images.unsplash.com/photo-1420406676079-b8491f2d07c8?q=80&w=1471&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1606229365485-93a3b8ee0385?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fG1hY2Jvb2t8ZW58MHx8MHx8fDA%3D',
    'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bWFjYm9va3xlbnwwfHwwfHx8MA%3D%3D'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Your Orders',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 23),
              ),
              Text(
                'See all',
                style: TextStyle(
                    color: GlobalVariables.selectedNavBarColor,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          height: 170,
          padding: const EdgeInsets.only(left: 10, right: 0, top: 20),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, index) {
                return SingleProduct(src: list[index]);
              }),
        )
      ],
    );
  }
}
