import 'package:farm_note/components/image_input.dart';
import 'package:farm_note/store/farmnote.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CattleFormPage extends StatelessWidget {
  const CattleFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<FarmNoteStore>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Lugar'),
      ),
      body: Observer(
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
                        controller: store.nameController,
                        initialValue: store.formData['name']?.toString(),
                        decoration: const InputDecoration(labelText: 'Nome'),
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(store.weightFocus);
                        },
                        onSaved: (name) => store.formData['name'] = name ?? '',
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
                              textInputAction: TextInputAction.next,
                              focusNode: store.weightFocus,
                              controller: store.weightController,
                              onFieldSubmitted: (_) {
                                FocusScope.of(context)
                                    .requestFocus(store.descriptionFocus);
                              },
                              keyboardType: const TextInputType.numberWithOptions(
                                decimal: true,
                              ),
                              onSaved: (weight) {
                                store.formData['weightKg'] =
                                    double.parse(weight ?? '0');
                                store.formData['weightArroba'] =
                                    double.parse(weight ?? '0') / 30;
                                store.formData['growthRate'] = 0.0;
                              },
                              onChanged: (weight) {
                                store.formData['weightArroba'] = double.parse(weight) / 30;
                                print(store.formData['weightArroba']);
                              },
                            ),
                          ),
                          Expanded(
                            child: Container(
                                child: store.weightController != null
                                    ? Text(
                                        'Peso(@): ${store.formData['weightArroba']}')
                                    : const Text('Peso(@): 0.0')
                              ),
                          ),
                        ],
                      ),
                      TextFormField(
                        initialValue: store.formData['description']?.toString(),
                        decoration: const InputDecoration(labelText: 'Descrição'),
                        focusNode: store.descriptionFocus,
                        keyboardType: TextInputType.multiline,
                        maxLines: 3,
                        onSaved: (description) =>
                            store.formData['description'] = description ?? '',
                      ),
                      const SizedBox(height: 10),
                      ImageInput(store.selectImage),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text('Adicionar'),
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
      ),
    );
  }
}
