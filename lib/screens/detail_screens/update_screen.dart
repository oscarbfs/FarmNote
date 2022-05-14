import 'package:farm_note/components/image_input.dart';
import 'package:farm_note/models/cattle.dart';
import 'package:farm_note/store/farmnote.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<FarmNoteStore>(context);
    store.cattleArguments(context);
    store.weightArroba = store.cattle!.weightArroba;
    store.nameForm = store.cattle!.name;
    store.pickedImage = store.cattle!.image;
    return Observer(
        builder: (_) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        initialValue: store.nameForm,
                        decoration: const InputDecoration(labelText: 'Nome'),
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(store.weightFocus);
                        },
                        onSaved: (name) => store.formData['name'] = name ?? '',
                        onChanged: (name) { 
                          store.formData['name'] = name;
                          store.nameForm = name;
                        },
                        validator: (_name) {
                          final name = _name ?? '';

                          if (name.trim().isEmpty) {
                            return 'Nome é obrigatório.';
                          }

                          if (name.trim().length < 3) {
                            return 'Nome precisa de no mínimo 3 letras.';
                          }
                          return null;
                        },
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration:
                                  const InputDecoration(labelText: 'Peso(Kg)'),
                              initialValue: store.cattle!.weightKg.toString(),
                              textInputAction: TextInputAction.next,
                              focusNode: store.weightFocus,
                              // controller: store.weightController,
                              onFieldSubmitted: (_) {
                                FocusScope.of(context)
                                    .requestFocus(store.descriptionFocus);
                              },
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                decimal: true,
                              ),
                              onChanged: (weight) {
                                store.weightArroba = weight == "" ? 0 / 30 : double.parse(weight) / 30;
                                store.formData['weightKg'] =
                                    double.parse(weight);
                                store.formData['weightArroba'] =
                                    double.parse(weight) / 30;
                                store.formData['growthRate'] = 0.0;
                              },
                            ),
                          ),
                          Expanded(
                            child: Container(
                              child: Text('Peso(@): ${store.weightArroba}')
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        initialValue: store.cattle!.description,
                        decoration:
                            const InputDecoration(labelText: 'Descrição'),
                        focusNode: store.descriptionFocus,
                        keyboardType: TextInputType.multiline,
                        maxLines: 3,
                        onChanged: (description) =>
                            store.formData['description'] = description,
                      ),
                      const SizedBox(height: 10),
                      ImageInput(),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton.icon(
                icon: const Icon(Icons.update),
                label: const Text('Atualizar'),
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: Theme.of(context).colorScheme.primary,
                  elevation: 0,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: store.isValidForm()
                    ? () => store.submitForm(
                          context,
                          store.formData['description'].toString(),
                          double.tryParse(
                                  store.formData['weightKg'].toString()) ??
                              0.0,
                          double.tryParse(
                                  store.formData['weightArroba'].toString()) ??
                              0.0,
                          double.tryParse(
                                  store.formData['growthRate'].toString()) ??
                              0.0,
                        )
                    : null),
          ],
        ),
      );
  }
}