import 'package:farm_note/models/cattle.dart';
import 'package:farm_note/store/farmnote.store.dart';
import 'package:farm_note/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CattleGridItem extends StatelessWidget {
  const CattleGridItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cattle = Provider.of<Cattle>(context, listen: false);
    final store = Provider.of<FarmNoteStore>(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.green,
              image: DecorationImage(
                image: store.getCattleImageProvider(cattle.image), // <-- Expecting ImageProvider
              ),
            ),
          ),
          // Image.file(
          //   cattle.image,
          //   fit: BoxFit.cover,
          // ),
          onTap: () {
            Navigator.of(context).pushNamed(
              AppRoutes.CATTLE_DETAIL,
              arguments: cattle,
            );
          },
        ),
        footer: SizedBox(
          height: 60,
          child: GridTileBar(
            backgroundColor: Colors.black87,
            leading: Text(
              "Peso: \n ${cattle.weightKg.toString()}Kg \n ${cattle.weightArroba.toStringAsFixed(2)}@",
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            title: Text(
              cattle.name,
              textAlign: TextAlign.center,
            ),
            trailing: Text(
              "Crescimento: \n ${cattle.growthRate.toStringAsFixed(2)}%",
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          ),
        ),
      ),
    );
  }
}
