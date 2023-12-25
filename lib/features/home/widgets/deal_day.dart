import 'package:flutter/material.dart';

class DealOfD extends StatefulWidget {
  const DealOfD({super.key});

  @override
  State<DealOfD> createState() => _DealOfDState();
}

class _DealOfDState extends State<DealOfD> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 10),
          alignment: Alignment.topLeft,
          child: const Text(
            'Deal Of The Day',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 23),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          child: Image.network(
            'https://images.unsplash.com/photo-1606229365485-93a3b8ee0385?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fG1hY2Jvb2t8ZW58MHx8MHx8fDA%3D',
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
            errorBuilder: (context, error, stackTrace) =>
                const Center(child: Text('Couldnt Load Image')),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          alignment: Alignment.topLeft,
          child: const Column(children: [
            Text(
              'MacBook M3',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'price: \$100',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ]),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                'https://images.unsplash.com/photo-1606229365485-93a3b8ee0385?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fG1hY2Jvb2t8ZW58MHx8MHx8fDA%3D',
                'https://images.unsplash.com/photo-1606229365485-93a3b8ee0385?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fG1hY2Jvb2t8ZW58MHx8MHx8fDA%3D',
                'https://images.unsplash.com/photo-1606229365485-93a3b8ee0385?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fG1hY2Jvb2t8ZW58MHx8MHx8fDA%3D',
                'https://images.unsplash.com/photo-1606229365485-93a3b8ee0385?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fG1hY2Jvb2t8ZW58MHx8MHx8fDA%3D'
              ]
                  .map(
                    (e) => Builder(
                      builder: (BuildContext context) {
                        return Container(
                          margin:const EdgeInsets.symmetric(horizontal: 4),
                          child: Image.network(
                            e,
                            fit: BoxFit.cover,
                            height: 100,
                            width: 100,
                          ),
                        );
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
  const SizedBox(height: 30,)
      ],
    );
  }
}
