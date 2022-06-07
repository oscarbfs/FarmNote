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

  final _$weightArrobaAtom = Atom(name: '_FarmNoteStore.weightArroba');

  @override
  double get weightArroba {
    _$weightArrobaAtom.reportRead();
    return super.weightArroba;
  }

  @override
  set weightArroba(double value) {
    _$weightArrobaAtom.reportWrite(value, super.weightArroba, () {
      super.weightArroba = value;
    });
  }

  final _$growthRateAtom = Atom(name: '_FarmNoteStore.growthRate');

  @override
  double get growthRate {
    _$growthRateAtom.reportRead();
    return super.growthRate;
  }

  @override
  set growthRate(double value) {
    _$growthRateAtom.reportWrite(value, super.growthRate, () {
      super.growthRate = value;
    });
  }

  final _$storedImageAtom = Atom(name: '_FarmNoteStore.storedImage');

  @override
  File get storedImage {
    _$storedImageAtom.reportRead();
    return super.storedImage;
  }

  @override
  set storedImage(File value) {
    _$storedImageAtom.reportWrite(value, super.storedImage, () {
      super.storedImage = value;
    });
  }

  final _$selectedScreenIndexAtom =
      Atom(name: '_FarmNoteStore.selectedScreenIndex');

  @override
  int get selectedScreenIndex {
    _$selectedScreenIndexAtom.reportRead();
    return super.selectedScreenIndex;
  }

  @override
  set selectedScreenIndex(int value) {
    _$selectedScreenIndexAtom.reportWrite(value, super.selectedScreenIndex, () {
      super.selectedScreenIndex = value;
    });
  }

  final _$titlesAtom = Atom(name: '_FarmNoteStore.titles');

  @override
  List<String> get titles {
    _$titlesAtom.reportRead();
    return super.titles;
  }

  @override
  set titles(List<String> value) {
    _$titlesAtom.reportWrite(value, super.titles, () {
      super.titles = value;
    });
  }

  final _$screensAtom = Atom(name: '_FarmNoteStore.screens');

  @override
  List<Widget> get screens {
    _$screensAtom.reportRead();
    return super.screens;
  }

  @override
  set screens(List<Widget> value) {
    _$screensAtom.reportWrite(value, super.screens, () {
      super.screens = value;
    });
  }

  final _$cattleAtom = Atom(name: '_FarmNoteStore.cattle');

  @override
  Cattle? get cattle {
    _$cattleAtom.reportRead();
    return super.cattle;
  }

  @override
  set cattle(Cattle? value) {
    _$cattleAtom.reportWrite(value, super.cattle, () {
      super.cattle = value;
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

  final _$updateCattleAsyncAction = AsyncAction('_FarmNoteStore.updateCattle');

  @override
  Future<void> updateCattle(
      String id,
      String name,
      File image,
      String description,
      double growthRate,
      double weightArroba,
      double weightKg) {
    return _$updateCattleAsyncAction.run(() => super.updateCattle(
        id, name, image, description, growthRate, weightArroba, weightKg));
  }

  final _$takePictureAsyncAction = AsyncAction('_FarmNoteStore.takePicture');

  @override
  Future takePicture(ImageSource origin) {
    return _$takePictureAsyncAction.run(() => super.takePicture(origin));
  }

  final _$deleteCattleAsyncAction = AsyncAction('_FarmNoteStore.deleteCattle');

  @override
  Future<void> deleteCattle(Cattle cattle) {
    return _$deleteCattleAsyncAction.run(() => super.deleteCattle(cattle));
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
  void submitForm(BuildContext context, String id) {
    final _$actionInfo = _$_FarmNoteStoreActionController.startAction(
        name: '_FarmNoteStore.submitForm');
    try {
      return super.submitForm(context, id);
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
  dynamic selectScreen(int index) {
    final _$actionInfo = _$_FarmNoteStoreActionController.startAction(
        name: '_FarmNoteStore.selectScreen');
    try {
      return super.selectScreen(index);
    } finally {
      _$_FarmNoteStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
formKey: ${formKey},
weightFocus: ${weightFocus},
descriptionFocus: ${descriptionFocus},
imageUrlFocus: ${imageUrlFocus},
formData: ${formData},
weightArroba: ${weightArroba},
growthRate: ${growthRate},
storedImage: ${storedImage},
selectedScreenIndex: ${selectedScreenIndex},
titles: ${titles},
screens: ${screens},
cattle: ${cattle}
    ''';
  }
}
