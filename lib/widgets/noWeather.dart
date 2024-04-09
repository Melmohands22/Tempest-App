import 'package:flutter/material.dart';

class noWeaher extends StatelessWidget {
  const noWeaher({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('There is no weather 😔 start', style: TextStyle(fontSize: 30),),
            Text('searching now 🔍', style: TextStyle(fontSize: 30))
          ]
      ),
    );
  }
}
