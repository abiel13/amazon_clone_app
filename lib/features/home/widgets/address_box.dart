import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressBox extends StatelessWidget {
  const AddressBox({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 40,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 231, 154, 66),
        Color.fromARGB(166, 240, 148, 10)
      ])),
      child: Row(
        children: [
          const Icon(Icons.location_on_outlined),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'Delivery To ${user.name} - Ochoma , River State Nigeria ',
                style: const TextStyle(overflow: TextOverflow.ellipsis),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 2,
              left: 4,
            ),
            child: Icon(Icons.arrow_drop_down_circle_outlined),
          )
        ],
      ),
    );
  }
}
