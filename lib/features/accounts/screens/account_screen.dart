import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/accounts/widget/below_appbar.dart';
import 'package:amazon_clone/features/accounts/widget/orders.dart';
import 'package:amazon_clone/features/accounts/widget/top_buttons.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            flexibleSpace: Container(
              decoration:
                  const BoxDecoration(gradient: GlobalVariables.appBarGradient),
            ),
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      'assets/images/amazon_in.png',
                      width: 120,
                      height: 45,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Icon(Icons.notifications_outlined),
                        ),
                        Icon(Icons.search),
                      ],
                    ),
                  )
                ]),
          )),
      body: const Column(
        children: [
          BelowAppBar(),
          SizedBox(
            height: 30,
          ),
          TopButton(),
          SizedBox(
            height: 20,
          ),
          Orders()
        ],
      ),
    );
  }
}
