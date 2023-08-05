import 'package:flutter/material.dart';
import 'package:portfolio/components/social_media_contact_widget.dart';

import '../util/utils.dart';
import 'rounded_button_widget.dart';

class GeneralInfoSectionWidget extends StatelessWidget {
  const GeneralInfoSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
        //decoration: const BoxDecoration(
        //  color: kPrimaryColor,
        //borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.width / 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  "assets/images/Profile_img.jpeg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Hello,",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              "I'm Soufiane Ben Yaala",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              "Computer science engineering",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            const SocialMediaContactsWidget(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundedButton(
                    text: "Hire Me",
                    press: (context) {
                      Utils.emailSender();
                    }),
                RoundedButton(
                    text: "Download CV",
                    press: (context) {
                      //  Utils.downloadPdf();
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
