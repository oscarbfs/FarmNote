import 'dart:io';

import 'package:farm_note/components/image_input.dart';
import 'package:farm_note/store/farmnote.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<FarmNoteStore>(context);
    store.cattleArguments(context);
    store.weightArroba = store.cattle!.weightArroba;
    store.growthRate = store.cattle!.growthRate;
    store.storedImage = File(Uri.parse(store.cattle!.image).toString());
    return Observer(
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
                      Container(
                        child: const Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            "Essa pagina é destinada a adicionar uma nova ''versão'' desse boi, para ser adicionada no historico de evolução do boi.",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      TextFormField(
                        initialValue: store.cattle!.name,
                        decoration: const InputDecoration(labelText: 'Nome'),
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context)
                              .requestFocus(store.weightFocus);
                        },
                        onSaved: (name) => store.formData['name'] = name ?? '',
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
                              initialValue: store.cattle!.weightKg.toString(),
                              decoration:
                                  const InputDecoration(labelText: 'Peso(Kg)'),
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
                                store.formData['growthRate'] = store.growthRate;
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
                                store.growthRate = weight.isEmpty
                                    ? 0
                                    : ((double.parse(weight) -
                                                store.cattle!.weightKg) /
                                            store.cattle!.weightKg) *
                                        100;
                                store.weightArroba = weight.trim().isEmpty
                                    ? 0
                                    : double.parse(weight) / 30;
                              },
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'Peso(@): ${store.weightArroba.toStringAsFixed(2)}',
                                ),
                                Text(
                                  'Taxa de Crescimento:\n ${store.growthRate.toStringAsFixed(2)}%',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: store.growthRate < 0
                                          ? Colors.red
                                          : Colors.green),
                                ),
                              ],
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
              icon: const Icon(Icons.update),
              label: const Text('Atualizar'),
              style: ElevatedButton.styleFrom(
                onPrimary: Colors.white,
                primary: Theme.of(context).colorScheme.primary,
                elevation: 0,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Atualizar Gado'),
                    content: const Text('Tem certeza?'),
                    actions: [
                      TextButton(
                        child: const Text(
                          'Não',
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: () => Navigator.of(ctx).pop(),
                      ),
                      TextButton(
                        child: const Text('Sim'),
                        onPressed: () {
                          Navigator.of(ctx).pop();
                          store.submitForm(context, store.cattle!.id);
                        },
                      ),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
