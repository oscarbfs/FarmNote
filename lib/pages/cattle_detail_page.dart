import 'package:farm_note/models/cattle.dart';
import 'package:flutter/material.dart';

class CattleDetailPage extends StatelessWidget {
  const CattleDetailPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Cattle cattle = ModalRoute.of(context)!.settings.arguments as Cattle;
    return Scaffold(
      appBar: AppBar(
        title: Text(cattle.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 230,
              width: 450,
              child: Image.file(
                cattle.image,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Peso: ${cattle.weightKg}Kg / ${cattle.weightArroba.toStringAsFixed(2)}@',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              child: Text(
                cattle.description,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}