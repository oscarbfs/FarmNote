import 'package:farm_note/models/cattle.dart';
import 'package:farm_note/store/farmnote.store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<FarmNoteStore>(context);
    final Cattle cattle = ModalRoute.of(context)!.settings.arguments as Cattle;
    store.storedImage = cattle.image;
    return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 230,
                width: 450,
                child: cattle.image == null 
                ? Image.asset(
                  "assets/images/SemBoi.jpg",
                  fit: BoxFit.cover,
                ) 
                :Image.file(
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
        );
  }
}