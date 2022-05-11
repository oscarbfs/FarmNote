import 'package:farm_note/components/cattle_grid_item.dart';
import 'package:farm_note/store/farmnote.store.dart';
import 'package:flutter/material.dart';
import 'package:farm_note/utils/app_routes.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<FarmNoteStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Gado'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.CATTLE_FORM);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: store.loadCattle(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? const Center(child: CircularProgressIndicator())
            : Consumer<FarmNoteStore>(
                child: const Center(
                  child: Text('Nenhum gado cadastrado'),
                ),
                builder: (ctx, store, child) => store.itemsCount == 0
                    ? child!
                    : GridView.builder(
                        padding: const EdgeInsets.all(10),
                        itemCount: store.itemsCount,
                        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                          value: store.items[i],
                          child: const CattleGridItem(),
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 3 / 2,
                          mainAxisSpacing: 10,
                        ),
                      ),
              ),
      ),
    );
  }
}
