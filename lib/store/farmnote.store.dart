import 'dart:io';
import 'dart:math';

import 'package:farm_note/models/cattle.dart';
import 'package:farm_note/screens/detail_screens/detail_screen.dart';
import 'package:farm_note/screens/detail_screens/edit_screen.dart';
import 'package:farm_note/screens/detail_screens/update_screen.dart';
import 'package:farm_note/utils/data_base.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;

part 'farmnote.store.g.dart';

class FarmNoteStore = _FarmNoteStore with _$FarmNoteStore;

abstract class _FarmNoteStore with Store, ChangeNotifier {
  // Home Page

  @observable
  List<Cattle> _items = [];

  @action
  Future<void> loadCattle() async {
    final dataList = await DbUtil.getData('cattle');
    _items = dataList
        .map(
          (item) => Cattle(
            id: item['id'],
            name: item['name'],
            image: File(item['image']),
            description: item['description'],
            growthRate: item['growthRate'],
            weightKg: item['weightKg'],
            weightArroba: item['weightArroba'],
          ),
        )
        .toList();
  }

  List<Cattle> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  @action
  Cattle ItemByIndex(int index) {
    return _items[index];
  }

  @action
  Future<void> addCattle(String name, File image, String description,
      double growthRate, double weightArroba, double weightKg) async {
    final newCattle = Cattle(
      id: Random().nextDouble().toString(),
      name: name,
      image: image,
      description: description,
      growthRate: growthRate,
      weightArroba: weightArroba,
      weightKg: weightKg,
    );

    _items.add(newCattle);
    DbUtil.insert(
      'cattle',
      {
        'id': newCattle.id,
        'name': newCattle.name,
        'image': newCattle.image.path,
        'description': description,
        'growthRate': growthRate,
        'weightArroba': weightArroba,
        'weightKg': weightKg,
      },
    );
    notifyListeners();
  }

  @action
  Future<void> editCattle(String name, File image, String description,
      double growthRate, double weightArroba, double weightKg) async {
    final newCattle = Cattle(
      id: Random().nextDouble().toString(),
      name: name,
      image: image,
      description: description,
      growthRate: growthRate,
      weightArroba: weightArroba,
      weightKg: weightKg,
    );

    _items.add(newCattle);
    DbUtil.insert(
      'cattle',
      {
        'id': newCattle.id,
        'name': newCattle.name,
        'image': newCattle.image.path,
        'description': description,
        'growthRate': growthRate,
        'weightArroba': weightArroba,
        'weightKg': weightKg,
      },
    );
    notifyListeners();
  }

  @action
  Future<void> updateCattle(
      String id,
      String name,
      File image,
      String description,
      double growthRate,
      double weightArroba,
      double weightKg) async {
    _items[_items.indexWhere((element) {
      return element.id == id;
    })] = Cattle(
      id: id,
      name: name,
      description: description,
      weightKg: weightKg,
      weightArroba: weightArroba,
      image: image,
      growthRate: growthRate,
    );

    DbUtil.update(
      'cattle',
      {
        'id': id,
        'name': name,
        'image': image.path,
        'description': description,
        'growthRate': growthRate,
        'weightArroba': weightArroba,
        'weightKg': weightKg,
      },
    );
    notifyListeners();
  }

  // Form

  // @observable
  // var nameController = TextEditingController();
  // @observable
  // var weightController = TextEditingController();

  @observable
  var formKey = GlobalKey<FormState>();

  @observable
  var weightFocus = FocusNode();
  @observable
  var descriptionFocus = FocusNode();
  @observable
  var imageUrlFocus = FocusNode();

  @observable
  var formData = <String, Object>{};

  @observable
  var nameForm;
  @observable
  var description;
  @observable
  var weightArroba = 0.0;
  @observable
  var growthRate = 0.0;

  // @observable
  // File? pickedImage;

  @action
  bool isValidForm() {
    return nameForm != null && nameForm != "" && storedImage != null;
  }

  @action
  void submitForm(BuildContext context, String id, String description,
      double weightKg, double weightArroba, double growthRate) {

    final isValid = formKey.currentState?.validate() ?? false;

    if (!isValid) return;

    formKey.currentState?.save();

    try {
      if (id == "") {
        addCattle(
          nameForm,
          storedImage,
          description,
          growthRate,
          weightArroba,
          weightKg,
        );
      } else {
        updateCattle(
          id,
          nameForm,
          storedImage,
          description,
          growthRate,
          weightArroba,
          weightKg,
        );
      }
    } catch (e) {
      showDialog<void>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Ocorreu um erro!'),
          content: const Text('Ocorreu um erro para salvar o Boi.'),
          actions: [
            TextButton(
              child: const Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    }

    Navigator.of(context).pop();
  }

  // Image Input

  @observable
  File storedImage = File("assets/images/SemBoi.jpg");

  @action
  void selectImage(File image) {
    storedImage = image;
  }

  @action
  takePicture(ImageSource origin) async {
    final ImagePicker _picker = ImagePicker();
    XFile imageFile = await _picker.pickImage(
      source: origin,
      maxWidth: 600,
    ) as XFile;

    storedImage = File(imageFile.path);

    final appDir = await syspaths.getApplicationDocumentsDirectory();
    String fileName = path.basename(storedImage.path);
    final savedImage = await storedImage.copy('${appDir.path}/$fileName');

    selectImage(savedImage);
  }

  // Detail Page

  @observable
  int selectedScreenIndex = 0;

  @observable
  List<String> titles = [
    'Detalhes',
    'Atualizar',
    'Editar',
  ];

  @observable
  List<Widget> screens = [
    DetailScreen(),
    UpdateScreen(),
    EditScreen(),
  ];

  @action
  selectScreen(int index) {
    selectedScreenIndex = index;
  }

  @action
  Future<void> deleteCattle(Cattle cattle) async {
    _items.remove(cattle);
    DbUtil.delete(
      'cattle',
      {
        'id': cattle.id,
        'name': cattle.name,
        'image': cattle.image,
        'description': cattle.description,
        'growthRate': cattle.growthRate,
        'weightArroba': cattle.weightArroba,
        'weightKg': cattle.weightKg,
      },
    );
    notifyListeners();
  }

  @observable
  Cattle? cattle;

  cattleArguments(BuildContext context) {
    cattle = ModalRoute.of(context)!.settings.arguments as Cattle;
  }
}
