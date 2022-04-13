import 'package:farm_note/pages/cattle_detail_page.dart';
import 'package:farm_note/pages/cattle_form_page.dart';
import 'package:farm_note/pages/home_page.dart';
import 'package:farm_note/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'store/farmnote.store.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FarmNoteStore>(
          create: (_) => FarmNoteStore(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FarmNote',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const HomePage(),
        routes: {
          AppRoutes.CATTLE_FORM: (ctx) => const CattleFormPage(),
          AppRoutes.CATTLE_DETAIL: (ctx) => const CattleDetailPage(),
        },
      ),
    );
  }
}
