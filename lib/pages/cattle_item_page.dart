import 'package:farm_note/models/cattle.dart';
import 'package:farm_note/store/farmnote.store.dart';
import 'package:farm_note/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CattleDetailPage extends StatelessWidget {
  const CattleDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Cattle cattle = ModalRoute.of(context)!.settings.arguments as Cattle;
    final store = Provider.of<FarmNoteStore>(context);
    return Observer(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(cattle.name),
          actions: [
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                store.deleteCattle(
                  cattle.id,
                  cattle.name,
                  cattle.image,
                  cattle.description,
                  cattle.growthRate,
                  cattle.weightArroba,
                  cattle.weightKg,
                );
              },
            ),
          ],
        ),
        body: store.screens[store.selectedScreenIndex],
        // SingleChildScrollView(
        //   child: Column(
        //     children: [
        //       Container(
        //         height: 230,
        //         width: 450,
        //         child: Image.file(
        //           cattle.image,
        //           fit: BoxFit.cover,
        //         ),
        //       ),
        //       const SizedBox(height: 10),
        //       Text(
        //         'Peso: ${cattle.weightKg}Kg / ${cattle.weightArroba.toStringAsFixed(2)}@',
        //         style: TextStyle(
        //           color: Theme.of(context).colorScheme.primary,
        //           fontSize: 20,
        //         ),
        //       ),
        //       const SizedBox(height: 10),
        //       Container(
        //         padding: const EdgeInsets.symmetric(horizontal: 10),
        //         width: double.infinity,
        //         child: Text(
        //           cattle.description,
        //           textAlign: TextAlign.center,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: store.selectScreen,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          currentIndex: store.selectedScreenIndex,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).colorScheme.primary,
              icon: Icon(Icons.details),
              label: store.titles[store.selectedScreenIndex],
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).colorScheme.primary,
              icon: Icon(Icons.update),
              label: store.titles[store.selectedScreenIndex],
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).colorScheme.primary,
              icon: Icon(Icons.edit),
              label: store.titles[store.selectedScreenIndex],
            ),
          ],
        ),
      );
    });
  }
}
