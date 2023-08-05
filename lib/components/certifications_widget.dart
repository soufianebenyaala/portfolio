import 'package:flutter/material.dart';

import '../model/certifications_model.dart';

class ListCertifications extends StatelessWidget {
  final List<CertificationsModel> certifications;
  const ListCertifications({super.key, required this.certifications});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Certifications", style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(
          height: 10,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: certifications.length,
          itemBuilder: (context, index) => Column(
            children: [
              Certification(certificationsModel: certifications[index]),
              if (index != certifications.length - 1) const Divider()
            ],
          ),
        ),
      ],
    );
  }
}

class Certification extends StatelessWidget {
  final CertificationsModel certificationsModel;
  const Certification({
    super.key,
    required this.certificationsModel,
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
              certificationsModel.image,
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
                  certificationsModel.title,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                if (certificationsModel.date != null)
                  Text(
                    certificationsModel.date!,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                certificationsModel.link != null
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
