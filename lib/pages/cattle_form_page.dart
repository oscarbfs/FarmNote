import 'dart:io';

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
    store.storedImage = File(Uri.parse('assets/images/SemBoi.png').toString());
    store.weightArroba = 0.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Boi'),
      ),
      body: Observer(
        builder: (_) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Form(
                    key: store.formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Nome'),
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(store.weightFocus);
                          },
                          onSaved: (name) =>
                              store.formData['name'] = name ?? '',
                          validator: (_name) {
                            final name = _name ?? '';

                            if (name.trim().isEmpty) {
                              return 'Nome é obrigatório.';
                            }
                            if (name.trim().length < 3) {
                              return 'Nome precisa de no mínimo 3 caracteres.';
                            }

                            return null;
                          },
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: const InputDecoration(
                                    labelText: 'Peso(Kg)'),
                                textInputAction: TextInputAction.next,
                                focusNode: store.weightFocus,
                                onFieldSubmitted: (_) {
                                  FocusScope.of(context)
                                      .requestFocus(store.descriptionFocus);
                                },
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                  decimal: true,
                                ),
                                onSaved: (_weight) {
                                  final weight = double.parse(_weight!);
                                  store.formData['weightKg'] = weight;
                                  store.formData['weightArroba'] = weight / 30;
                                  store.formData['growthRate'] = 0.0;
                                },
                                validator: (_weight) {
                                  final weight = _weight ?? "0";
                                  try {
                                    double.tryParse(weight);
                                  } catch (e) {
                                    return "Isso não é um numero valido!";
                                  }
                                  if (weight.trim().isEmpty) {
                                    return 'Peso é obrigatório.';
                                  }
                                  if(weight.trim().contains(',')) {
                                    return "Em vez de vigula, utilize ponto.";
                                  }
                                  
                                  return null;
                                },
                                onChanged: (weight) {
                                  store.weightArroba = weight.isEmpty
                                      ? 0 / 30
                                      : double.parse(weight) / 30;
                                },
                              ),
                            ),
                            Expanded(
                              child: Text(
                                  'Peso(@): ${store.weightArroba.toStringAsFixed(2)}'),
                            ),
                          ],
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Descrição'),
                          focusNode: store.descriptionFocus,
                          keyboardType: TextInputType.multiline,
                          maxLines: 3,
                          onSaved: (description) => store
                              .formData['description'] = description.toString(),
                        ),
                        const SizedBox(height: 10),
                        ImageInput(store.storedImage.path),
                      ],
                    ),
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
              onPressed: () => store.submitForm(context, ""),
            ),
          ],
        ),
      ),
    );
  }
}
