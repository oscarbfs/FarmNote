import 'dart:io';
import 'dart:math';

import 'package:farm_note/models/cattle.dart';
import 'package:farm_note/utils/data_base.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;

part 'farmnote.store.g.dart';

class FarmNoteStore = _FarmNoteStore with _$FarmNoteStore;

abstract class _FarmNoteStore with Store {

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
  Future<void> addCattle(String name, File image, String description, double growthRate, double weightArroba, double weightKg) async {
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
  }

  // Form

  @observable
  var weightFocus = FocusNode();
  @observable
  var weightController = TextEditingController();
  @observable
  var descriptionFocus = FocusNode();
  @observable
  var imageUrlFocus = FocusNode();
  @observable
  var imageUrlController = TextEditingController();
  @observable
  var formKey = GlobalKey<FormState>();
  @observable
  var formData = <String, Object>{};

  @observable
  var nameController = TextEditingController();

  @observable
  var weightArroba = 0.0;

  @observable
  File? pickedImage;

  @action
  void submitForm(BuildContext context, String description, double weightKg, double weightArroba, double grothRate) {
    if (!isValidForm()) return;

    addCattle(
      nameController.text,
      pickedImage!,
      description,
      grothRate,
      weightKg,
      weightArroba,
    );
    Navigator.of(context).pop();
  }

  @action
  void selectImage(File image) {
      pickedImage = image;
  }

  @action
  bool isValidForm() {
    return nameController.text.isNotEmpty &&
        pickedImage != null;
  }

  // Image Input

  @observable
  File? storedImage;

  @action
  takePicture() async {
    final ImagePicker _picker = ImagePicker();
    XFile imageFile = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    ) as XFile;

    storedImage = File(imageFile.path);

    final appDir = await syspaths.getApplicationDocumentsDirectory();
    String fileName = path.basename(storedImage!.path);
    final savedImage = await storedImage!.copy('${appDir.path}/$fileName');

    selectImage(savedImage);
  }
}
