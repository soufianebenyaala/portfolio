import 'package:flutter/material.dart';
import 'package:portfolio/util/utils.dart';

class SocialMediaContactsWidget extends StatelessWidget {
  const SocialMediaContactsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            Utils.openWebsite(
                host: "www.github.com", path: "/soufianebenyaala");
          },
          icon: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: SizedBox(
              height: 30,
              width: 30,
              child: Image.asset(
                "assets/images/icons/github.png",
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) => const SizedBox(),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            Utils.openWebsite(
                host: "www.linkedin.com", path: "/in/soufianebenyaala/");
          },
          icon: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: SizedBox(
              height: 30,
              width: 30,
              child: Image.asset(
                "assets/images/icons/linkdin.png",
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) => const SizedBox(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
