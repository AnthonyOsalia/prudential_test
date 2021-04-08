import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:prudential_test/commons/models/comment.dart';
import 'package:prudential_test/commons/models/post.dart';
import 'package:prudential_test/utils/TextStyles.dart';
import 'package:prudential_test/utils/colors.dart';

class CommentItem extends StatelessWidget {
  Comment comment;

  CommentItem({@required this.comment});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
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
                        RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                            text: '${comment.name}',
                            style: Ts.robotoSmall.copyWith(
                                color: Cc.black,
                                fontSize: 14,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' ${comment.email}',
                                recognizer: new TapGestureRecognizer()
                                  ..onTap = () {
                                    // Get.offAllNamed(Routes.register);
                                  },
                                style: Ts.robotoSmall.copyWith(
                                    color: Cc.gray_prudential,
                                    fontSize: 14,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "${comment.body}",
                          style: Ts.robotoMedium.copyWith(
                            color: Cc.black,
                            fontSize: 13,
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
                        text: 'Commented: ',
                        style: Ts.robotoSmall.copyWith(
                          color: Cc.black,
                          fontSize: 8,
                          fontStyle: FontStyle.italic,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: '3 minutes ago',
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
    );
  }
}
