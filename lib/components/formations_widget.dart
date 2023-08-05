import 'package:flutter/material.dart';

import '../model/formations_model.dart';

class ListFormations extends StatelessWidget {
  final List<FormationsModel> formations;
  const ListFormations({super.key, required this.formations});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Formations", style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(
          height: 10,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: formations.length,
          itemBuilder: (context, index) => Column(
            children: [
              Formation(formationsModel: formations[index]),
              if (index != formations.length - 1) const Divider()
            ],
          ),
        ),
      ],
    );
  }
}

class Formation extends StatelessWidget {
  final FormationsModel formationsModel;
  const Formation({
    super.key,
    required this.formationsModel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 80,
            width: 80,
            child: Image.asset(
              fit: BoxFit.fill,
              formationsModel.image,
              errorBuilder: (context, error, stackTrace) =>
                  Image.asset("assets/images/empty.jpg"),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  formationsModel.title,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                if (formationsModel.date != null)
                  Text(
                    formationsModel.date!,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                formationsModel.link != null
                    ? InputChip(
                        onPressed: () {},
                        onDeleted: () {},
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        deleteIcon: const Icon(Icons.link),
                        label: Text(
                          "Show credentail",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
