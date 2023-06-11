// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:interct_2/data/constants/sized_boxes.dart';
import 'package:interct_2/data/models/comment_model_inter.dart';
import 'package:interct_2/data/models/single_avto_adv_model.dart';
import 'package:interct_2/screens/single_adv_body.dart/post_comment_bloc/post_comment_bloc.dart';

import '../../../data/models/avto/comment_body_tile.dart';
import '../../data/constants/colors.dart';
import '../../data/constants/textStyles.dart';

// TextStyle ts = const TextStyle(
//   fontSize: 16,
//   fontWeight: FontWeight.w600,
//   letterSpacing: 0.64,
//   fontFamily: 'Gilroy',
//   color: black11,
// );

TextEditingController _textFieldController = TextEditingController();
bool showOtvet = false;
// Color color_black = const Color(0xff333333);
// Color color_green = const Color(0xFF2DC36A);
// Color grey87 = const Color(0xFF878787);

class CommentsBody extends StatefulWidget {
  const CommentsBody({
    Key? key,
    required this.comments,
    required this.saam,
  }) : super(key: key);
  final List<CommentBodyTile> comments;
  final SingleAvtoAdvModel saam;

  @override
  State<CommentsBody> createState() => _CommentsBodyState();
}

class _CommentsBodyState extends State<CommentsBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textFieldController = TextEditingController();
    context.read<PostCommentBloc>().add(EmitInit());
  }

  @override
  Widget build(BuildContext context) {
    return commentsBody();
  }

  SizedBox commentsBody() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(widget.comments.length, (index) {
              return commentTile(false);
            }),
          ),
          sb_h10(),
          InkWell(
            onTap: () {
              // show_modal_bottom_sheet();
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) {
                  return BlocBuilder<PostCommentBloc, PostCommentState>(
                    builder: (context, state) {
                      return AlertDialog(
                        title: Text('Напишите комментарий'),
                        content: state is PostCommentInitial
                            ? TextField(
                                controller: _textFieldController,
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                    hintText:
                                        "Поездка была классная! Идеальный водитель!"),
                              )
                            : state is PostCommentLoading
                                ? Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CircularProgressIndicator(
                                          color: color_green),
                                    ],
                                  )
                                : state is PostCommentSuccess
                                    ? Icon(
                                        Icons.check_circle_outline,
                                        color: color_green,
                                      )
                                    : state is PostCommentFailure
                                        ? Icon(
                                            Icons.error_outline,
                                            color: redff0,
                                          )
                                        : SizedBox(),
                        actions: <Widget>[
                          ElevatedButton(
                            child: Text('Назад'),
                            onPressed: () {
                              _textFieldController.clear();
                              context.read<PostCommentBloc>().add(EmitInit());
                              Navigator.of(context).pop();
                            },
                          ),
                          ElevatedButton(
                            child: Text('Отправить'),
                            onPressed: () {
                              print('Text: ${_textFieldController.text}');
                              // Navigator.of(context).pop();
                              _textFieldController.text.isNotEmpty
                                  ? context.read<PostCommentBloc>().add(
                                        PostCommentEvent(
                                          CommentModelInter(
                                            text: _textFieldController.text,
                                            busId: widget.saam.busId,
                                          ),
                                        ),
                                      )
                                  : null;
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width - 24,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: color_green,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Написать комментарий',
                style: tsf4_16_600_0,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> show_modal_bottom_sheet() {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Напишите комментария', style: ts11_16_500_1),
              SizedBox(height: 10.0),
              TextField(
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  hintText: 'Поездка была классная! Идеальный водитель!',
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                child: Text('Отправить'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget commentTile(bool isOtvet) {
    return Container(
      margin: isOtvet ? const EdgeInsets.only(left: 46) : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          commentInfo(isOtvet),
          isOtvet
              ? const SizedBox()
              : InkWell(
                  onTap: () {
                    setState(() {
                      showOtvet = !showOtvet;
                    });
                  },
                  child: Text(
                    showOtvet ? 'Скрыть' : 'Посмотреть ответы',
                    style: const TextStyle(
                      shadows: [
                        Shadow(color: color_green, offset: Offset(0, -5))
                      ],
                      color: Colors.transparent,
                      decoration: TextDecoration.underline,
                      decorationColor: color_green,
                      decorationThickness: 1,
                    ),
                  ),
                ),
          showOtvet
              ? Container(
                  margin: const EdgeInsets.only(left: 46),
                  child: Column(
                      children: List.generate(
                    5,
                    (index) => commentInfo(true),
                  )),
                )
              : const SizedBox()
        ],
      ),
    );
  }

  Container commentInfo(bool isOtvet) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  isOtvet
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              CupertinoIcons.arrow_uturn_left,
                              size: 12,
                              color: grey87,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'Ответ Димашу',
                              // style: TextStyle(
                              //   fontSize: 12,
                              //   fontWeight: FontWeight.w500,
                              //   color: grey87,
                              //   letterSpacing: 0.8,
                              //   fontFamily: 'Gilroy',
                              // ),
                              style: ts87_12_500_0,
                            )
                          ],
                        )
                      : const SizedBox(),
                  SizedBox(height: isOtvet ? 12 : 0),
                  Text(
                    'Диана',
                    // style: TextStyle(
                    //   fontSize: 14,
                    //   fontWeight: FontWeight.w600,
                    //   color: black11,
                    //   letterSpacing: 0.8,
                    //   fontFamily: 'Gilroy',
                    // ),
                    style: ts11_14_600_0,
                  )
                ],
              ),
              const Icon(
                Icons.favorite_border,
                size: 24,
                color: color_green,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            margin: const EdgeInsets.only(right: 30),
            child: Text(
              'Очень нравиться машина. Я бы хотел взять эту машину. Цена=Качество ',
              // style: TextStyle(
              //   fontSize: 14,
              //   height: 1.5,
              //   fontWeight: FontWeight.w400,
              //   color: grey87,
              // ),
              style: ts87_14_400_1_h15,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Expanded(
                child: SizedBox(height: 24),
              ),
              Text(
                'Ответить',
                style: TextStyle(
                  shadows: [Shadow(color: color_green, offset: Offset(0, -5))],
                  color: Colors.transparent,
                  decoration: TextDecoration.underline,
                  decorationColor: color_green,
                  decorationThickness: 1,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
