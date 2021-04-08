import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:prudential_test/screens/posts/controller.dart';
import 'package:prudential_test/screens/posts/post_item.dart';
import 'package:prudential_test/utils/TextStyles.dart';
import 'package:prudential_test/utils/colors.dart';

class PostsScreen extends GetWidget<PostsController> {
  @override
  Widget build(BuildContext context) {
    controller.context = context;
    // TODO: implement build

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Cc.light_sky_blue,
        body: SafeArea(
            child: Container(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        FloatingSearchAppBar(
                          body: SizedBox(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                              () => Flexible(
                                child: Text(
                                  "${controller.greeting}, ${controller.firstName}",
                                  style: Ts.robotoLarge.copyWith(
                                    color: Cc.red_prudential,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  softWrap: true,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                /*pushNewScreen(context,
                                        screen: PostWorkScreen());*/
                              },
                              child: CircleAvatar(
                                radius: 30,
                                backgroundColor: Cc.white,
                                child: Icon(
                                  Icons.edit,
                                  color: Cc.red_prudential,
                                  size: 25,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    child: Column(
                      children: [
                        Obx(() => controller.isLoading.value
                            ? Container(
                                color: Cc.white,
                                height: MediaQuery.of(context).size.height * 1,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    backgroundColor: Colors.red,
                                  ),
                                ),
                              )
                            : SizedBox()),
                        Obx(
                          () => ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.posts.length,
                            separatorBuilder:
                                (BuildContext context, int index) => SizedBox(),
                            itemBuilder: (BuildContext context, int index) {
                              return PostItem(
                                  post: controller.posts.elementAt(index));
                            },
                          ),
                        ),
                        SizedBox(
                          height: 70,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )));
  }
}
