import 'package:courses/widgets/constants.dart';
import 'package:courses/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {Map<dynamic, dynamic> model;

  DetailsScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text(model['name']),
        ),
        body: SingleChildScrollView(
            child: Container(
                child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Container(
                decoration: BoxDecoration(
                    border: Border.all( color: Colors.black)),
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: Image.network(
                  model['image'],
                  fit: BoxFit.contain,
                )),
            const SizedBox(
              height: 30,
            ),
            Container(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Center(
                      child: CustomText(
                        text: model['name'],
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.type_specimen),
                        const CustomText(
                          text: " type: ",
                          fontSize: 18,
                        ),
                        CustomText(
                          text: " ${model['type']}",
                          fontSize: 18,
                          color: primaryColor,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.public_sharp),
                        const CustomText(
                          text: " publisher name: ",
                          fontSize: 18,
                        ),
                        CustomText(
                          text: "  ${model['publisher_name']}",
                          fontSize: 18,
                          color: primaryColor,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                    ),

                    Row(
                      children: [
                        const Icon(Icons.description_outlined),
                        const CustomText(
                          text: " publisher number: ",
                          fontSize: 18,
                        ),
                        CustomText(
                          text: "  ${model['publisher_num']}",
                          fontSize: 18,
                          color: primaryColor,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Row(
                      children: [
                        const CustomText(
                          text: " Category: ",
                          fontSize: 18,
                        ),
                        CustomText(
                          text: "  ${model['category']}",
                          fontSize: 18,
                          color: primaryColor,
                        ),
                      ],
                    ),
                    const SizedBox(height: 35),
                    const CustomText(
                      text: " Description:",
                      fontSize: 18,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(height: 200,
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          border: Border.all( color: primaryColor)),
                      child: CustomText(
                        text: model['description'],
                      ),
                    )
                  ],
                ))
          ],
        ))));
  }
}
