import 'package:flutter/material.dart';

import '../models/artical-model.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({Key? key, required this.articalModel}) : super(key: key);
  final ArticalModel articalModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: articalModel.image != null
              ? Image.network(
                  articalModel.image!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.fill,
                )
              : const Center(child: Text("No Image Available")),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          articalModel.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          articalModel.subtitle != null
              ? articalModel.subtitle!
              : "No Subtitle Available",
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          style: const TextStyle(
            fontSize: 17,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
