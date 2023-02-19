import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_faq/flutter_faq.dart';
import 'package:hayah/shared/components/faq.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: ExpandableTheme(
          data: const ExpandableThemeData(
            iconColor: Colors.blue,
            useInkWell: true,
          ),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              FaqCard("Why should people donate blood?",
                  "Safe blood saves lives. Blood is needed by women who suffer complications during pregnancy and childbearing, children with severe anemia, often caused by malaria or malnutrition, accident victims, patients undergoing surgeries, and cancer patients. There is a constant need for a regular supply of blood because it can only be stored for a limited time. before using it. A sufficient number of healthy individuals need to donate blood regularly to ensure that blood remains available where and when it is needed. Blood is the most precious gift anyone can give to another person - it is the gift of life. The decision to donate your blood can save the life of one individual, or even the lives of many individuals, if its components - red blood cells, platelets, and plasma - are separated from your blood, which can be used separately for patients with special diseases."),
              FaqCard("What happens to me when I donate blood?",
                  "Whether it is your first time to donate blood or you are a regular blood donor, the blood transfusion service must make sure that you do not suffer any harm from donating blood. This includes checking your blood to ensure there is no risk to the person who receives it. Before you donate blood, you will be asked questions about your medical history, including any medications you take, your current health and lifestyle, and may also be asked about your recent travels; If you live in a country free of malaria, for example, you might be asked if you have visited a tropical country recently. Only ask these questions out of concern for your health and the health of the person who will receive your blood. If you are eligible to donate blood, you will be informed of this, and if you are not, you will be informed if you will be able to donate blood in the future. All personal information you provide will be kept confidential and will not be used for any other purpose. It is very important to be honest and state any reasons why your blood may not be suitable for donation. Although blood is always tested for any infections that may be transmitted through transfusion, such as HIV and hepatitis B and C, donating blood is a very simple process. He'll make sure you're as comfortable as possible, usually on a purpose-built chair or on a bed. A site inside one of your elbows will be cleaned with an antibacterial solution before a trained health worker inserts a sterile needle attached to a bag to collect blood from your vein. It usually takes about 10 minutes to donate blood. After a 10 or 15 minute break and some refreshments, you will be able to resume your usual activities, but you should avoid any strenuous activity for the remainder of the day. You should drink enough fluids for the next 24 hours."),
              FaqCard(
                  "How much blood will be taken? Will I still have enough blood?",
                  "In most countries, the amount of blood taken is 450ml, which is less than 10% of the total blood volume (an adult's blood volume ranges between 4.5 and 5 liters). In some countries, a smaller size is taken. Your body will replace the lost fluid within 36 hours."),
              FaqCard("Is giving blood safe?",
                  "Yes. Remember that you will only be accepted as a blood donor if you are healthy and healthy. Your health and well-being are very important to the blood transfusion service. The needle and blood bag used to collect blood come in a sterile, single-use package. Hence the process is as safe as possible."),
              FaqCard("Is the operation painful?",
                  "Just press hard on the inside of your elbow, and you'll get a quick idea of how it feels to be pricked with the needle. All you'll feel is a slight pressure and a temporary, like sensation. pin prick Donating blood is very safe and it is very rare to feel uncomfortable or problem during or after the donation."),
              FaqCard("Who can give blood and how often can it be given?",
                  "The criteria for selecting donors differ from country to country, but blood donation is available to all recovered individuals who do not suffer from any infection that can be transmissible through the blood. The age to donate blood varies, but it usually ranges from 17 to 65 years. Some countries accept blood donations from people aged 16 and over 65. Healthy adults can give blood regularly, at least twice a year. Your local blood transfusion service can tell you how often you can give blood."),
              FaqCard("Who advises not to donate blood?",
                  "The blood transfusion service takes care of the health of the blood donor and recipient. Usually, blood donors are asked not to donate blood for a certain period, in order to ensure their safety or the safety of the blood stock. \nYou should not donate blood if your health may suffer as a result. The overriding concern of the blood transfusion service is to ensure that the blood donor does not suffer any harm due to the donation. You should not donate blood:\n\nIf you are anemic\nIf you are pregnant, have been pregnant in the previous year or are breast-feeding. \nIf you suffer from certain diseases that do not qualify you to be a donor.\n. \nYou may be able to donate blood at a later time. In some cases, you will not be able to donate blood, to protect your health. You should not donate blood if your blood could harm the patient receiving the blood. And blood can transmit life-threatening injuries to those to whom it is transfused. You should not donate blood: \nAnd syphilis, it can be transfused to a patient who receives your blood. \nIf your lifestyle exposes you to an injury that can be transmitted through your blood. For example, if you have more than one sex partner or have sexual relations with sex workers\nIf you have injected non-medical recreational drugs\nIf you have tattoos or have skin scars or decorative piercings\nRequired to wait before giving blood\nIf you have You have had sexual relations with any of the above-mentioned groups."),
              FaqCard("How will I feel after giving blood?",
                  "You will feel great because you have influenced others and found them with the gift of blood."),
              FaqCard(
                  "Can I donate blood after being vaccinated with the SARS-CoV-2 vaccine?",
                  "Current evidence suggests that you can donate blood if you have received a SARS-CoV-2 vaccine that does not contain any live virus and you are healthy. Because vaccines against SARS-CoV-2 are so recent, the National Blood Transfusion Service may decide to defer blood donation for up to seven days to minimize the possibility of vaccination-related symptoms after blood donation. Those who receive live virus vaccines (such as vector-based vaccines or live attenuated virus vaccines) should delay donating for four weeks. If you feel unwell after receiving a SARS-CoV-2 vaccine, donating blood should be delayed for seven days. After complete recovery from symptoms.\n")
            ],
          ),
        ),
      ),
    );
  }
}
