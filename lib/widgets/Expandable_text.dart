// import '../../data/constants/colors.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';

// import '../data/constants/textStyles.dart';

// // TextStyle ts_opisanie = const TextStyle(
// //   fontSize: 14,
// //   fontWeight: FontWeight.w400,
// //   color: grey87,
// //   letterSpacing: 0.8,
// // );

// // TextStyle ts_ewe = const TextStyle(
// //   fontSize: 14,
// //   fontWeight: FontWeight.w500,
// //   color: color_green,
// // );

// class ExpandableText extends StatefulWidget {
//   const ExpandableText(
//     this.text, {
//     Key? key,
//     this.trimLines = 2,
//   })  : assert(text != null),
//         super(key: key);

//   final String text;
//   final int trimLines;

//   @override
//   ExpandableTextState createState() => ExpandableTextState();
// }

// class ExpandableTextState extends State<ExpandableText> {
//   bool _readMore = true;
//   void _onTapLink() {
//     setState(() => _readMore = !_readMore);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final DefaultTextStyle defaultTextStyle = DefaultTextStyle.of(context);
//     final colorClickableText = Colors.blue;
//     final widgetColor = black11;
//     TextSpan link = TextSpan(
//         text: _readMore ? "Ещё..." : "Скрыть",
//         style: tsgr_14_500_0,
//         recognizer: TapGestureRecognizer()..onTap = _onTapLink);
//     Widget result = LayoutBuilder(
//       builder: (BuildContext context, BoxConstraints constraints) {
//         assert(constraints.hasBoundedWidth);
//         final double maxWidth = constraints.maxWidth;
//         // Create a TextSpan with data
//         final text = TextSpan(
//           text: widget.text,
//         );
//         // Layout and measure link
//         TextPainter textPainter = TextPainter(
//           text: link,
//           textDirection: TextDirection
//               .rtl, //better to pass this from master widget if ltr and rtl both supported
//           maxLines: widget.trimLines,
//           ellipsis: '\n...',
//         );
//         textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
//         final linkSize = textPainter.size;
//         // Layout and measure text
//         textPainter.text = text;
//         textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
//         final textSize = textPainter.size;
//         // Get the endIndex of data
//         int? endIndex;
//         final pos = textPainter.getPositionForOffset(Offset(
//           textSize.width - linkSize.width,
//           textSize.height,
//         ));
//         endIndex = textPainter.getOffsetBefore(pos.offset);
//         var textSpan;
//         if (textPainter.didExceedMaxLines) {
//           textSpan = TextSpan(
//             text: _readMore ? widget.text.substring(0, endIndex) : widget.text,
//             style: ts87_14_400_1,
//             children: <TextSpan>[const TextSpan(text: '\n'), link],
//           );
//         } else {
//           textSpan = TextSpan(
//             text: widget.text,
//           );
//         }
//         return RichText(
//           softWrap: true,
//           overflow: TextOverflow.clip,
//           text: textSpan,
//         );
//       },
//     );
//     return result;
//   }
// }
