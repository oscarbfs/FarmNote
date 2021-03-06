import 'package:farm_note/store/farmnote.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ImageInput extends StatelessWidget {
  String initialImage;

  ImageInput(this.initialImage, {Key? key}) : super(key: key);

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
            child: store.showImageCattle(initialImage),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Column(
              children: [
                TextButton.icon(
                  icon: const Icon(Icons.camera),
                  label: const Text('Tirar foto'),
                  style: ElevatedButton.styleFrom(
                    onPrimary: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: () => store.takePicture(ImageSource.camera),
                ),
                TextButton.icon(
                  icon: const Icon(Icons.photo),
                  label: const Text('Galeria'),
                  style: ElevatedButton.styleFrom(
                    onPrimary: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: () => store.takePicture(ImageSource.gallery),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
