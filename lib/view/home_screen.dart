import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/search_model.dart';
import '../model/HomeModel.dart';
import '../view_model/Controller.dart';
import '../view_model/screens_view_model.dart';
import '../widgets/constants.dart';
import '../widgets/custom_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => controller.loading.value
          ? const Center(child: CircularProgressIndicator())
          : Scaffold(
              appBar: AppBar(
                  backgroundColor: primaryColor,
                  title: const Text("Home "),
                  centerTitle: true),
              body: ListView(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.only(top: 30, left: 20, right: 20),
                    child: Column(
                      children: [
                        const CustomText(
                          text: "Categories:",
                          color: primaryColor,
                          fontSize: 18,
                          alignment: Alignment.topLeft,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        _listViewCategory(),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: const [
                            CustomText(
                              text: "Statistics: ",
                              fontSize: 18,
                              color: primaryColor,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        _listViewStatistics(),
                      ],
                    ),
                  ),
                ],
              ),
              // bottomNavigationBar: bottomNavigationBar(),
            ),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => SizedBox(
        height: 130,
        child: GetBuilder<SearchModel>(
            init: SearchModel(),
            builder: (controller1) => GetBuilder<ScreenViewModel>(
                  init: ScreenViewModel(),
                  builder: (controller2) => ListView.separated(
                    itemCount: controller.categoryModel.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          controller2.changeSelectedValue(0);
                          Get.lazyPut(() => const ControlView());
                          controller1.category =
                              controller.categoryModel[index].name.toString();
                        },
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.grey.shade100,
                              ),
                              height: 60,
                              width: 60,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                    controller.categoryModel[index].image),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomText(
                              text: controller.categoryModel[index].name,
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 20,
                    ),
                  ),
                )),
      ),
    );
  }

  Widget _listViewStatistics() {
    return GetBuilder<HomeViewModel>(
      init: HomeViewModel(),
      builder: (controller) => SizedBox(
        height: 350,
        child: ListView.separated(
          itemCount: controller.statisticsModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return SizedBox(
                width: MediaQuery.of(context).size.width * .4,
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey.shade200,
                          ),
                          child: SizedBox(
                            height: 250,
                            width: MediaQuery.of(context).size.width * .4,
                            child: Image.network(
                              controller.statisticsModel[index].image,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomText(
                          text:
                              controller.statisticsModel[index].name.toString(),
                          color: primaryColor,
                          alignment: Alignment.bottomCenter,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          text: controller.amount[controller
                                  .statisticsModel[index].name
                                  .toString()]
                              .toString(),
                          color: primaryColor,
                          alignment: Alignment.bottomCenter,
                        ),
                      ],
                    )
                  ],
                ));
          },
          separatorBuilder: (context, index) => const SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }
}
