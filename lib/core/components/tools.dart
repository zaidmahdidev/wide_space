// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:cached_network_image/cached_network_image.dart';
//
// import '../constant/theme.dart';
//
//
// class BaseShimmer extends StatelessWidget {
//   const BaseShimmer({super.key,required this.child});
//   final Widget child;
//   @override
//   Widget build(BuildContext context) {
//     return Opacity(
//       opacity: 0.8,
//       child: Shimmer.fromColors(
//         baseColor: CupertinoColors.inactiveGray,
//         highlightColor: Color.fromARGB(211, 255, 255, 255),
//         child: child,
//       ),
//     );
//   }
// }
//
// Future<void> BaseBottomSheet({
//   required BuildContext context,
//   required Widget child,
// }) async {
//   showModalBottomSheet(
//     context: context,
//     isDismissible: true,
//     isScrollControlled: true,
//     useSafeArea: true,
//     shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(20),
//             topRight: Radius.circular(20)
//         )
//     ),
//     builder: (context) {
//       return child;
//     },
//   );
// }
//
//
//
//
//
// class CustomGoverLoading extends StatelessWidget {
//   const CustomGoverLoading({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return BaseShimmer(child: Column(
//       children: [
//         Row(
//           children: [
//             Expanded(child: Container( margin: const EdgeInsets.all(3), height: 50, width: double.infinity, decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)) ,color: Colors.cyan),),),
//             Expanded(child: Container( margin: const EdgeInsets.all(3), height: 50, width: double.infinity, decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)) ,color: Colors.cyan),),),
//           ],
//         ),
//         Container( margin: const EdgeInsets.symmetric(horizontal: 3 , vertical: 5), height: 50, width: double.infinity, decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)) ,color: Colors.cyan),),
//         Container( margin: const EdgeInsets.symmetric(horizontal: 3 , vertical: 5), height: 50, width: double.infinity, decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)) ,color: Colors.cyan),),
//         Container( margin: const EdgeInsets.symmetric(horizontal: 3 , vertical: 5), height: 50, width: double.infinity, decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)) ,color: Colors.cyan),),
//         Container( margin: const EdgeInsets.symmetric(horizontal: 3 , vertical: 5), height: 50, width: double.infinity, decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)) ,color: Colors.cyan),),
//         Container( margin: const EdgeInsets.symmetric(horizontal: 3 , vertical: 5), height: 50, width: double.infinity, decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)) ,color: Colors.cyan),),
//
//       ],
//     ));
//   }
// }
//
//
// AwesomeDialog showPhoto(BuildContext context, String photo) {
//   return AwesomeDialog(
//     context: context,
//     dialogType: DialogType.noHeader,
//     body: SizedBox(
//       height: MediaQuery.of(context).size.height / 2,
//       child: CachedNetworkImage(
//         imageUrl: photo,
//         placeholder: (context, url) => CustomLoading(),
//         errorWidget: (context, url, error) => Icon(Icons.error),
//       ),
//     ),
//   );
// }
//
//
//
// class BaseAnimationListView extends StatelessWidget {
//   BaseAnimationListView({
//     super.key,
//     required this.index,
//     required this.child,
//     this.duration,
//   });
//   final int index;
//   final Widget child;
//   int? duration;
//   @override
//   Widget build(BuildContext context) {
//     return AnimationConfiguration.staggeredList(
//       position: index,
//       duration: Duration(milliseconds: duration ?? 400),
//       child: SlideAnimation(
//         // horizontalOffset: 200,
//         horizontalOffset: 200,
//
//         child: FadeInAnimation(
//           child: child,
//         ),
//       ),
//     );
//   }
// }
//
//
//
// class CustomCard extends StatelessWidget {
//   final int id;
//   final String manualSupplyNumber;
//   final String? quantity;
//   final Function show;
//   final Function edit;
//   final bool ?visible ;
//
//   const CustomCard({
//     required this.id,
//     required this.manualSupplyNumber,
//     this.quantity,
//     required this.show,
//     required this.edit,
//      this.visible = true
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return BaseAnimationListView(
//       index: 0,
//       child: Card(
//         elevation: 5,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Container(
//           margin: const EdgeInsets.all(3),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//               color: Colors.black12,
//               gradient:  LinearGradient(
//                 colors: [
//                    Theme.of(context).secondaryHeaderColor,
//                    Theme.of(context).secondaryHeaderColor,
//                 ],
//               )
//           ),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.center ,
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(25),
//                 decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                     bottomRight: Radius.circular(15),
//                     topRight: Radius.circular(15),
//                   ),
//                 ),
//                 child: Text(
//                   '$id',
//                   style:  TextStyle(
//                     fontSize: 20,
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 16),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 12),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         manualSupplyNumber,
//                         style:  TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//
//                         ),
//                       ),
//                       if (quantity != null) ...[
//                         const SizedBox(height: 4),
//                         Text(
//                           '$quantity',
//                           style: const TextStyle(
//                             fontSize: 16,
//                           ),
//                         ),
//                       ],
//                     ],
//                   ),
//                 ),
//               ),
//               Row(
//                 children: [
//                  Visibility(
//                    visible: visible!,
//                    child:  IconButton(
//                     onPressed: () {
//                       show();
//                     },
//                     icon: Icon(Icons.remove_red_eye),
//                   ),),
//                   IconButton(
//                     onPressed: () {
//                       edit();
//                     },
//                     icon: Icon(Icons.edit),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
// class CustomLoading extends StatelessWidget {
//   const CustomLoading({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(body: Center(
//       child: SpinKitCubeGrid(
//         color: Theme.of(context).secondaryHeaderColor,
//         size: 50.0,
//       ),
//     ),);
//   }
// }
//
//
// class CustomTextFormAuth extends StatelessWidget {
//   final String hinttext;
//   final String labeltext;
//   final IconData? iconData;
//   final TextEditingController? mycontroller;
//   final bool isNumber;
//   final bool? obscureText;
//   final void Function()? onTapIcon;
//   final IconData ?prefixIcon;
//   final String? Function(String?) valid;
//   final IconData? suffixIcon;
//   final Function? suffixPressed;
//   final double borderRadius;
//
//
//    const CustomTextFormAuth(
//       {Key? key,
//         this.obscureText,
//         this.onTapIcon,
//         required this.hinttext,
//         required this.labeltext,
//         this.iconData,
//         required this.mycontroller,
//         required this.isNumber,
//         this.prefixIcon,
//         required this.valid ,
//         this.suffixIcon,
//         this.suffixPressed,
//         required this.borderRadius,
//
//       })
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 20),
//       child: TextFormField(
//
//         keyboardType: isNumber
//             ? const TextInputType.numberWithOptions(decimal: true) : TextInputType.text,
//         controller: mycontroller,
//         obscureText: obscureText == null || obscureText == false ? false : true,
//         validator: valid,
//         decoration: InputDecoration(
//             hintText: hinttext,
//             hintStyle: const TextStyle(fontSize: 14),
//             // floatingLabelBehavior: FloatingLabelBehavior.always,
//             contentPadding:
//             // const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
//             const EdgeInsets.symmetric(vertical: 5),
//             labelText: labeltext,
//             prefixIcon: Icon(prefixIcon),
//             suffixIcon:  InkWell(child: Icon(iconData), onTap: onTapIcon),
//             border:
//             OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadius),
//             ),),
//       ),
//     );
//   }
// }
//
//
// class SecondCustomTextField extends StatelessWidget {
//   final String hint;
//   final TextInputType type;
//   final TextEditingController myController;
//   final String suffix;
//   final String? Function(String?) valid;
//   final String ?labelText;
//   final List<TextInputFormatter>? inputFormatters;
//   Function onChange;
//
//   SecondCustomTextField({
//     super.key,
//     required this.hint,
//     required this.type,
//     required this.myController,
//     required this.suffix,
//     required this.onChange,
//      required this.valid,
//     this.labelText,
//     this.inputFormatters
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: myController,
//       onChanged: (value) => onChange,
//       validator: valid,
//       keyboardType: type,
//       inputFormatters: inputFormatters,
//       decoration: InputDecoration(
//         contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
//         labelText: labelText,
//         hintText: hint,
//         hintStyle: TextStyle(fontSize: 13),
//         suffixText: suffix,
//         border: OutlineInputBorder(),
//       ),
//     );
//   }
// }
//
//
//
//
// class SnackbarManager {
//   static bool isShowingSnackbar = false;
//
//   static void showSnackbar(BuildContext context, String message, SnackbarStates state) {
//     if (!isShowingSnackbar) {
//       isShowingSnackbar = true;
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           backgroundColor: chooseSnackbarColor(state),
//           elevation: 0,
//           content: Text(
//             message,
//             style: TextStyle(color: Colors.white ,fontSize: 15),
//           ),
//           behavior: SnackBarBehavior.floating,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8.0),
//           ),
//         ),
//       ).closed.then((_) {
//         isShowingSnackbar = false;
//       });
//     }
//   }
// }
//
//
//
// enum SnackbarStates { SUCCESS, ERROR, WARNING }
//
// Color chooseSnackbarColor(SnackbarStates state) {
//   Color color;
//
//   switch (state) {
//     case SnackbarStates.SUCCESS:
//       color = Colors.green;
//       break;
//     case SnackbarStates.ERROR:
//       color = Colors.red;
//       break;
//     case SnackbarStates.WARNING:
//       color = Colors.amber;
//       break;
//   }
//
//   return color;
// }
//
// ///////////////
//
// class ToastManager {
//   static bool isShowingToast = false;
//
//   static void showToast(String message , ToastStates state ) {
//     if (!isShowingToast) {
//       isShowingToast = true;
//       Fluttertoast.showToast(
//         msg: message,
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         timeInSecForIosWeb: 3,
//         backgroundColor: chooseToastColor(state),
//         textColor: Colors.white,
//       ).then((value) {
//         isShowingToast = false;
//       });
//     }
//   }
// }
//
// // enum
// enum ToastStates { SUCCESS, ERROR, WARNING }
//
// Color chooseToastColor(ToastStates state) {
//   Color color;
//
//   switch (state) {
//     case ToastStates.SUCCESS:
//       color = Colors.green;
//       break;
//     case ToastStates.ERROR:
//       color = Colors.red;
//       break;
//     case ToastStates.WARNING:
//       color = Colors.amber;
//       break;
//   }
//
//   return color;
// }
//
//
//
//
// // class DefaultButton extends StatelessWidget {
// //   final double width;
// //   final Color background;
// //   final bool isUpperCase;
// //   final double radius;
// //   final Function fun;
// //   final String text;
// //
// //   const DefaultButton({
// //     Key? key,
// //     this.width = double.infinity,
// //     this.background = Colors.blue,
// //     this.isUpperCase = true,
// //     this.radius = 3.0,
// //     required this.fun,
// //     required this.text,
// //   }) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       width: width,
// //       height: 50.0,
// //       child: MaterialButton(
// //         onPressed: () {
// //           fun();
// //         },
// //         child: Text(
// //           isUpperCase ? text.toUpperCase() : text,
// //           style: TextStyle(
// //             fontSize: 18,
// //             fontWeight: FontWeight.bold,
// //             color: Colors.white,
// //           ),
// //         ),
// //       ),
// //       decoration: BoxDecoration(
// //         borderRadius: BorderRadius.circular(radius),
// //         color: background,
// //       ),
// //     );
// //   }
// // }
//
//
// Widget defaultButton({
//   double width = double.infinity,
//   Color background = MyTheme.primaryColor,
//   bool isUpperCase = true,
//   double radius = 3.0,
//   required Function fun,
//   required String text,
// }) =>
//     Container(
//       width: width,
//       height: 50.0,
//       child: MaterialButton(
//         onPressed: () {
//           fun();
//         },
//         child: Text(
//           isUpperCase ? text.toUpperCase() : text,
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//           ),
//         ),
//       ),
//       decoration: BoxDecoration(
//
//         borderRadius: BorderRadius.circular(
//           radius,
//         ),
//         color: background,
//       ),
//     );
//
//
//
//
// Widget defaultFormField({
//   required TextEditingController controller,
//   required TextInputType type,
//   Function()? onSubmit,
//   Function()? onChange,
//   Function()? onTap,
//   bool isPassword = false,
//   required Function validate,
//   required String label,
//   required IconData prefix,
//   IconData? suffix,
//   Function()? suffixPressed,
//   bool isClickable = true,
//   String? suffixtext,
//   int? maxlenght,
// }) =>
//     TextFormField(
//       controller: controller,
//       keyboardType: type,
//       obscureText: isPassword,
//       enabled: isClickable,
//       // onFieldSubmitted: onSubmit,
//       // onChanged: onChange,
//       onTap: onTap,
//       maxLength: maxlenght,
//       validator: (value) {
//         validate(value);
//       },
//       decoration: InputDecoration(
//         labelText: label,
//         suffixText: suffixtext,
//         prefixIcon: Icon(
//           prefix,
//         ),
//         suffixIcon: suffix != null
//             ? IconButton(
//                 onPressed: suffixPressed,
//                 icon: Icon(
//                   suffix,
//                 ),
//               )
//             : null,
//         border: OutlineInputBorder(),
//       ),
//     );
//
// // Widget defaultFormField({
// //   required TextEditingController controller,
// //   required TextInputType type,
// //   required Function onSubmit,
// //   Function? onChange,
// //   Function? onTap,
// //   bool isPassword = false,
// //   required Function validate,
// //   required String label,
// //   required IconData prefix,
// //   IconData? suffix,
// //   Function? suffixPressed,
// //   bool isClickable = true,
// // }) =>
// //     TextFormField(
// //       keyboardType: type,
// //       obscureText: isPassword,
// //       enabled: isClickable,
// //       onFieldSubmitted: onSubmit(),
// //       onChanged: onChange!(),
// //       onTap: onTap!(),
// //       validator: validate(),
// //       decoration: InputDecoration(
// //         labelText: label,
// //         prefixIcon: Icon(
// //           prefix,
// //         ),
// //         suffixIcon: suffix != null
// //             ? IconButton(
// //           onPressed: suffixPressed!(),
// //           icon: Icon(
// //             suffix,
// //           ),
// //         )
// //             : null,
// //         border: OutlineInputBorder(),
// //       ),
// //     );
//
// Widget ff({
//   TextInputType? type,
//   String? hint,
//   IconData? pref,
//   Function? onch,
// }) =>
//     TextFormField(
//       validator: (value) {
//         if (value!.isEmpty) {
//           return ' kdjfkjljf ';
//         }
//         return null;
//       },
//       decoration: InputDecoration(
//         border: OutlineInputBorder(),
//         isDense: true,
//         suffixText: "+967",
//         prefixIcon: Icon(pref),
//         label: Text('kj'),
//         hintText: hint,
//       ),
//       maxLength: 9,
//       keyboardType: type,
//       onChanged: onch!(),
//     );
//
// //////////////////////////// //
//
// Widget appbar({
//   required String title,
//   required String image,
//   Function()? add,
// }) =>
//     Padding(
//       padding: const EdgeInsets.fromLTRB(10, 10, 15, 3),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           CircleAvatar(
//             child: Image.asset(
//               image,
//               width: 85,
//             ),
//             backgroundColor: Colors.transparent,
//           ),
//           Text(
//             title,
//             style: TextStyle(fontWeight: FontWeight.bold),
//           ),
//           Row(
//             children: [
//               CircleAvatar(
//                 backgroundColor: Colors.grey.withOpacity(0.1),
//                 child: FittedBox(
//                   child: IconButton(
//                     onPressed: () {},
//                     icon: const Icon(
//                       Icons.add,
//                       color: Colors.black,
//                       size: 26,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 8),
//               CircleAvatar(
//                 backgroundColor: Colors.grey.withOpacity(0.1),
//                 child: FittedBox(
//                   child: IconButton(
//                     onPressed: add!(),
//                     icon: const Icon(
//                       Icons.brightness_4,
//                       color: Colors.black,
//                       size: 26,
//                     ),
//                   ),
//                 ),
//               ),
//               Badge(
//                 child: IconButton (
//                   onPressed: (){},
//                    icon: Icon( Icons.shopping_cart_outlined)),
//                 label: Text('7'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//
//
//
//
// Widget section(
// {
//   Function()? fun,
//    String? title
// }
//     )=>   Padding(
//   padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5),
//   child: Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Row(
//         children:  [
//           CircleAvatar(
//             // backgroundColor: LightColors.yellow,
//             radius: 13,
//             child: FittedBox(
//               child: Icon(
//                 CupertinoIcons.collections,
//                 color: Colors.white,
//                 size: 15,
//               ),
//             ),
//           ),
//           SizedBox(width: 3),
//           Text( title??"",
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//       // TextButton.icon(
//       //   onPressed:fun,
//       //   label: const Icon(
//       //     Icons.arrow_back_ios_new_rounded,
//       //     size: 18,
//       //     color: MyColors.primaryColor,
//       //   ),
//       //   icon: const Text(
//       //     style: TextStyle(color: MyColors.primaryColor),
//       //     "عرض الكل",
//       //   ),
//       // ),
//     ],
//   ),
// );