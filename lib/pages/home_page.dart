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
        title: const Text('Menus Lugares'),
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
                builder: (ctx, store, child) =>
                    store.itemsCount == 0
                        ? child!
                        : Observer(
                          builder: (_) => ListView.builder(
                              itemCount: store.itemsCount,
                              itemBuilder: (ctx, i) => ListTile(
                                leading: CircleAvatar(
                                  backgroundImage:
                                      FileImage(store.ItemByIndex(i).image),
                                ),
                                title: Text(store.ItemByIndex(i).name),
                                subtitle: Text(
                                    store.ItemByIndex(i).weightKg.toString()),
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    AppRoutes.CATTLE_DETAIL,
                                    arguments: store.ItemByIndex(i),
                                  );
                                },
                              ),
                            ),
                        ),
              ),
      ),
    );
  }
}
