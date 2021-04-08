import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:prudential_test/commons/models/post.dart';
import 'package:prudential_test/commons/widgets/button.dart';
import 'package:prudential_test/commons/widgets/text_input.dart';
import 'package:prudential_test/screens/posts-details/controller.dart';
import 'package:prudential_test/screens/posts-details/post_item.dart';
import 'package:prudential_test/utils/TextStyles.dart';
import 'package:prudential_test/utils/colors.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'comment-item.dart';

class PostDetailsScreen extends GetWidget<PostDetailsController> {
  Post post;

  PostDetailsScreen({@required this.post}) : super() {
    Get.lazyPut(() => PostDetailsController(post: post),
        tag: post.id.toString());
  }

  @override
  // TODO: implement controller
  get controller => Get.find<PostDetailsController>(tag: post.id.toString());
  @override
  Widget build(BuildContext context) {
    controller.context = context;
    // controller.post=post;
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
                    horizontal: 5,
                    vertical: 5,
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
                        PostItem(post: post),
                        SizedBox(
                          height: 10,
                        ),
                        buildAddCommentWidget(),
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
                                color: Colors.white,
                                height: MediaQuery.of(context).size.height * 4,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    backgroundColor: Cc.red_prudential,
                                  ),
                                ),
                              )
                            : SizedBox()),
                        Obx(
                          () => ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: controller.comments.length,
                            separatorBuilder:
                                (BuildContext context, int index) => SizedBox(),
                            itemBuilder: (BuildContext context, int index) {
                              return CommentItem(
                                  comment:
                                      controller.comments.elementAt(index));
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

  Widget buildAddCommentWidget() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          child: Column(
            children: [
              FormBuilderTextField(
                  autocorrect: true,
                  autofocus: false,
                  minLines: 4,
                  maxLines: 5,
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    hintText: "",
                    labelText: "",
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Cc.red_prudential,
                        width: 3,
                      ),
                    ),
                  )),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.topRight,
                child: RaisedButton(
                  onPressed: () {},
                  padding: EdgeInsets.all(16),
                  color: Cc.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.send,
                        size: 25,
                        color: Cc.red_prudential,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Comment",
                        style: TextStyle(
                          color: Cc.red_prudential,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
