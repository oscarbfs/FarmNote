import 'package:farm_note/models/cattle.dart';
import 'package:farm_note/store/farmnote.store.dart';
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
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Excluir Boi'),
                    content: const Text('Tem certeza?'),
                    actions: [
                      TextButton(
                        child: const Text(
                          'Não',
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: () => Navigator.of(ctx).pop(),
                      ),
                      TextButton(
                          child: const Text('Sim'),
                          onPressed: () {
                            Navigator.of(ctx).pop();
                            Navigator.of(ctx).pop();
                            store.deleteCattle(cattle);
                          }),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
        body: store.screens[store.selectedScreenIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: store.selectScreen,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          currentIndex: store.selectedScreenIndex,
          type: BottomNavigationBarType.shifting,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).colorScheme.primary,
              icon: const Icon(Icons.details),
              label: store.titles[store.selectedScreenIndex],
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).colorScheme.primary,
              icon: const Icon(Icons.update),
              label: store.titles[store.selectedScreenIndex],
            ),
            BottomNavigationBarItem(
              backgroundColor: Theme.of(context).colorScheme.primary,
              icon: const Icon(Icons.edit),
              label: store.titles[store.selectedScreenIndex],
            ),
          ],
        ),
      );
    });
  }
}
