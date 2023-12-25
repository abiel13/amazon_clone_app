import 'package:amazon_clone/features/accounts/widget/account_button.dart';
import 'package:flutter/material.dart';

class TopButton extends StatefulWidget {
  const TopButton({super.key});

  @override
  State<TopButton> createState() => _TopButtonState();
}

class _TopButtonState extends State<TopButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(text: 'Logout', onTap: () {}),
            AccountButton(text: 'Your Orders', onTap: () {}),
          ],
        ),
        const SizedBox(height: 10,),
        Row(
          children: [
            AccountButton(text: 'Become a Seller', onTap: () {}),
            AccountButton(text: 'Your Wishlist', onTap: () {}),
          ],
        ),
      ],
    );
  }
}
