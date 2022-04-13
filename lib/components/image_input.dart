import 'package:farm_note/store/farmnote.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ImageInput extends StatelessWidget {

  final Function onSelectImage;

  ImageInput(this.onSelectImage);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<FarmNoteStore>(context);
    return Observer(
      builder: (_) => Row(
        children: [
          Container(
            width: 180,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.grey),
            ),
            alignment: Alignment.center,
            child: store.storedImage != null
                ? Image.file(
                    store.storedImage!,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                : const Text('Nenhuma imagem!'),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: TextButton.icon(
              icon: const Icon(Icons.camera),
              label: const Text('Tirar foto'),
              style: ElevatedButton.styleFrom(
                onPrimary: Theme.of(context).primaryColor,
              ),
              onPressed: () => store.takePicture(onSelectImage),
            ),
          )
        ],
      ),
    );
  }
}