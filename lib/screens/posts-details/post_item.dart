import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:prudential_test/commons/models/post.dart';
import 'package:prudential_test/screens/posts-details/post-details.dart';
import 'package:prudential_test/utils/TextStyles.dart';
import 'package:prudential_test/utils/colors.dart';

class PostItem extends StatelessWidget {
  Post post;

  PostItem({@required this.post});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {
        // pushNewScreen(context, screen: PostDetailsScreen());
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        // pushNewScreen(context, screen: ProfileOtherViewScreen());
                      },
                      child: CircleAvatar(
                        radius: 22,
                        backgroundImage: AssetImage(
                          "images/profile.png",
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${post.title}",
                            style: Ts.robotoMedium.copyWith(
                              color: Cc.black,
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            "${post.body}",
                            style: Ts.robotoMedium.copyWith(
                              color: Cc.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                      ),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'Posted: ',
                          style: Ts.robotoSmall.copyWith(
                            color: Cc.black,
                            fontSize: 8,
                            fontStyle: FontStyle.italic,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '1 Hr ago',
                              recognizer: new TapGestureRecognizer()
                                ..onTap = () {
                                  // Get.offAllNamed(Routes.register);
                                },
                              style: Ts.robotoSmall.copyWith(
                                color: Cc.gray_prudential,
                                fontSize: 8,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
