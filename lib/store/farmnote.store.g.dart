// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'farmnote.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FarmNoteStore on _FarmNoteStore, Store {
  final _$_itemsAtom = Atom(name: '_FarmNoteStore._items');

  @override
  List<Cattle> get _items {
    _$_itemsAtom.reportRead();
    return super._items;
  }

  @override
  set _items(List<Cattle> value) {
    _$_itemsAtom.reportWrite(value, super._items, () {
      super._items = value;
    });
  }

  final _$weightFocusAtom = Atom(name: '_FarmNoteStore.weightFocus');

  @override
  FocusNode get weightFocus {
    _$weightFocusAtom.reportRead();
    return super.weightFocus;
  }

  @override
  set weightFocus(FocusNode value) {
    _$weightFocusAtom.reportWrite(value, super.weightFocus, () {
      super.weightFocus = value;
    });
  }

  final _$weightControllerAtom = Atom(name: '_FarmNoteStore.weightController');

  @override
  TextEditingController get weightController {
    _$weightControllerAtom.reportRead();
    return super.weightController;
  }

  @override
  set weightController(TextEditingController value) {
    _$weightControllerAtom.reportWrite(value, super.weightController, () {
      super.weightController = value;
    });
  }

  final _$descriptionFocusAtom = Atom(name: '_FarmNoteStore.descriptionFocus');

  @override
  FocusNode get descriptionFocus {
    _$descriptionFocusAtom.reportRead();
    return super.descriptionFocus;
  }

  @override
  set descriptionFocus(FocusNode value) {
    _$descriptionFocusAtom.reportWrite(value, super.descriptionFocus, () {
      super.descriptionFocus = value;
    });
  }

  final _$imageUrlFocusAtom = Atom(name: '_FarmNoteStore.imageUrlFocus');

  @override
  FocusNode get imageUrlFocus {
    _$imageUrlFocusAtom.reportRead();
    return super.imageUrlFocus;
  }

  @override
  set imageUrlFocus(FocusNode value) {
    _$imageUrlFocusAtom.reportWrite(value, super.imageUrlFocus, () {
      super.imageUrlFocus = value;
    });
  }

  final _$imageUrlControllerAtom =
      Atom(name: '_FarmNoteStore.imageUrlController');

  @override
  TextEditingController get imageUrlController {
    _$imageUrlControllerAtom.reportRead();
    return super.imageUrlController;
  }

  @override
  set imageUrlController(TextEditingController value) {
    _$imageUrlControllerAtom.reportWrite(value, super.imageUrlController, () {
      super.imageUrlController = value;
    });
  }

  final _$formKeyAtom = Atom(name: '_FarmNoteStore.formKey');

  @override
  GlobalKey<FormState> get formKey {
    _$formKeyAtom.reportRead();
    return super.formKey;
  }

  @override
  set formKey(GlobalKey<FormState> value) {
    _$formKeyAtom.reportWrite(value, super.formKey, () {
      super.formKey = value;
    });
  }

  final _$formDataAtom = Atom(name: '_FarmNoteStore.formData');

  @override
  Map<String, Object> get formData {
    _$formDataAtom.reportRead();
    return super.formData;
  }

  @override
  set formData(Map<String, Object> value) {
    _$formDataAtom.reportWrite(value, super.formData, () {
      super.formData = value;
    });
  }

  final _$nameControllerAtom = Atom(name: '_FarmNoteStore.nameController');

  @override
  TextEditingController get nameController {
    _$nameControllerAtom.reportRead();
    return super.nameController;
  }

  @override
  set nameController(TextEditingController value) {
    _$nameControllerAtom.reportWrite(value, super.nameController, () {
      super.nameController = value;
    });
  }

  final _$pickedImageAtom = Atom(name: '_FarmNoteStore.pickedImage');

  @override
  File? get pickedImage {
    _$pickedImageAtom.reportRead();
    return super.pickedImage;
  }

  @override
  set pickedImage(File? value) {
    _$pickedImageAtom.reportWrite(value, super.pickedImage, () {
      super.pickedImage = value;
    });
  }

  final _$storedImageAtom = Atom(name: '_FarmNoteStore.storedImage');

  @override
  File? get storedImage {
    _$storedImageAtom.reportRead();
    return super.storedImage;
  }

  @override
  set storedImage(File? value) {
    _$storedImageAtom.reportWrite(value, super.storedImage, () {
      super.storedImage = value;
    });
  }

  final _$loadCattleAsyncAction = AsyncAction('_FarmNoteStore.loadCattle');

  @override
  Future<void> loadCattle() {
    return _$loadCattleAsyncAction.run(() => super.loadCattle());
  }

  final _$addCattleAsyncAction = AsyncAction('_FarmNoteStore.addCattle');

  @override
  Future<void> addCattle(String name, File image, String description,
      double growthRate, double weightArroba, double weightKg) {
    return _$addCattleAsyncAction.run(() => super.addCattle(
        name, image, description, growthRate, weightArroba, weightKg));
  }

  final _$takePictureAsyncAction = AsyncAction('_FarmNoteStore.takePicture');

  @override
  Future takePicture(Function onSelectImage) {
    return _$takePictureAsyncAction.run(() => super.takePicture(onSelectImage));
  }

  final _$_FarmNoteStoreActionController =
      ActionController(name: '_FarmNoteStore');

  @override
  Cattle ItemByIndex(int index) {
    final _$actionInfo = _$_FarmNoteStoreActionController.startAction(
        name: '_FarmNoteStore.ItemByIndex');
    try {
      return super.ItemByIndex(index);
    } finally {
      _$_FarmNoteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void submitForm(BuildContext context, String description, double weightKg,
      double weightArroba, double grothRate) {
    final _$actionInfo = _$_FarmNoteStoreActionController.startAction(
        name: '_FarmNoteStore.submitForm');
    try {
      return super
          .submitForm(context, description, weightKg, weightArroba, grothRate);
    } finally {
      _$_FarmNoteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectImage(File image) {
    final _$actionInfo = _$_FarmNoteStoreActionController.startAction(
        name: '_FarmNoteStore.selectImage');
    try {
      return super.selectImage(image);
    } finally {
      _$_FarmNoteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool isValidForm() {
    final _$actionInfo = _$_FarmNoteStoreActionController.startAction(
        name: '_FarmNoteStore.isValidForm');
    try {
      return super.isValidForm();
    } finally {
      _$_FarmNoteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
weightFocus: ${weightFocus},
weightController: ${weightController},
descriptionFocus: ${descriptionFocus},
imageUrlFocus: ${imageUrlFocus},
imageUrlController: ${imageUrlController},
formKey: ${formKey},
formData: ${formData},
nameController: ${nameController},
pickedImage: ${pickedImage},
storedImage: ${storedImage}
    ''';
  }
}
