import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/components/social_media_contact_widget.dart';
import 'package:portfolio/generated/locale_keys.g.dart';

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
              LocaleKeys.hello.tr(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              LocaleKeys.myName.tr(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              LocaleKeys.field.tr(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            const SocialMediaContactsWidget(),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundedButton(
                    text: LocaleKeys.hireMe.tr(),
                    press: (context) {
                      Utils.emailSender();
                    }),
                RoundedButton(
                    text: LocaleKeys.downloadCv.tr(),
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
