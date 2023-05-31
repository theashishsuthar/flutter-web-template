import 'package:admin/app/AppConfiguration/AppNavigation.dart';
import 'package:admin/app/app.export.dart';

import 'package:admin/app/localization/app_locales.dart';

import 'package:admin/app/utils/CommonTextfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomWidget {
  List<String> listOfMonth = [
    '',
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'June',
    'July',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  TextEditingController editingController = TextEditingController();

  List<String> dummyData = ['a', "b", 'c', 'd'];

  Map<String, Color> statusAndColor = {
    'PENDING': appTheme!.appliedStatusColor,
    'CONFIRM': appTheme!.appliedStatusColor,
    'CONFIRM_BY_COMPANY': appTheme!.appliedStatusColor,
    'SCHEDULE_INTERVIEW': appTheme!.scheduledStatusColor,
    'SELECTED': appTheme!.scheduledStatusColor,
    'OFFERED': appTheme!.scheduledStatusColor,
    'WITHDRAWN': appTheme!.scheduledStatusColor,
    'REJECT': appTheme!.hiredStatusColor,
    'JOINED': appTheme!.hiredStatusColor,
    'DINNER': appTheme!.notSelectedStatusColor,
    'UN_REJECT': appTheme!.hiredStatusColor,
    'FEEDBACK': appTheme!.notSelectedStatusColor,
    'OFFER_REJECTED': appTheme!.notSelectedStatusColor,
    'LEFT': appTheme!.hiredStatusColor,
    'INTERVIEW_CANCELED': appTheme!.notSelectedStatusColor,
  };

  Widget getButton(Function onPressed, String title,
      {double? verticalMargin, double? horizontalMargin}) {
    return Container(
        margin: EdgeInsets.symmetric(
            vertical: getSize(verticalMargin ?? 15),
            horizontal: getSize(horizontalMargin ?? 0)),
        child: AppButton.flat(
          onTap: () {
            onPressed();
          },
          borderRadius: getSize(10),
          fitWidth: true,
          backgroundColor: appTheme!.colorPrimary,
          text: title,
        ));
  }

  Widget getOutLinedButton(Function onPressed, String title, {double? margin}) {
    return Container(
        height: getSize(50),
        margin: EdgeInsets.symmetric(vertical: getSize(margin ?? 15)),
        child: OutlinedButton(
          onPressed: onPressed as void Function()?,
          child: Text(
            title,
            style: appTheme!.buttonTitle18TextStyle,
          ),
          style: OutlinedButton.styleFrom(
              primary: appTheme!.colorPrimary,
              side: BorderSide(color: appTheme!.colorPrimary)),
        ));
  }

  Widget getApp(String title, Function onBackPressed, IconData leadingIcon,
      {List<Widget>? actionButton,
      Widget? navigationWidget,
      double? elevation}) {
    return AppBar(
      backgroundColor: appTheme!.whiteColor,
      centerTitle: true,
      elevation: elevation,
      title: Text(
        title,
        style: appTheme!.textColor16Normal,
      ),
      leading: InkWell(
        onTap: onBackPressed as void Function()?,
        child: Icon(
          leadingIcon,
          size: getSize(18),
          color: appTheme!.blackColor,
        ),
      ),
      actions: actionButton,
    );
  }

  Widget getTextField(
    FocusNode _focus,
    TextEditingController _controller,
    String hintText,
    TextInputType inputtype,
    String currentText,
    String label, {
    Widget? postFixWid,
    BoxDecoration? boxDecoration,
    Function? onTap,
    Color? fillColor,
    bool? readOnly,
    bool? isValidated,
    bool? isObsecure,
    List<TextInputFormatter>? textinputFormater,
    String? obsecureText,
    Function? textCallback,
    FocusNode? requestedFocusNode,
    bool? autoFocus,
    Function? callBack,
    Function(String)? validators,
  }) {
    return Container(
      child: CommonTextfield(
        focusNode: _focus,
        autoFocus: autoFocus ?? false,
        tapCallback: onTap as void Function()?,
        label: label,
        isValidated: isValidated,
        readOnly: readOnly,
        callback: callBack,
        validation: validators,
        isObsecure: isObsecure ?? false,
        textOption: TextFieldOption(
          formatter: textinputFormater,
          obSecureText: '•',
          hintText: hintText,
          labelText: label,
          hintStyleText: appTheme!.hintColor14Normal,
          maxLine: 1,
          fillColor: fillColor ?? appTheme!.whiteColor,
          keyboardType: inputtype,
          inputController: _controller,
          isSecureTextField: isObsecure ?? false,
          postfixWid: postFixWid,
        ),
        inputAction: TextInputAction.next,
        textCallback: (text) {
          // print(validators.toString() + 'dsds00');
          TextSelection previousSelection = _controller.selection;
          _controller.text = text;
          _controller.selection = previousSelection;
          if (textCallback != null) textCallback();
          /*setState(() {
                isButtonEnabled = enableDisableSignInButton();
              });*/
        },
      ),
    );
  }

  expandLessWidget() => Container(
        child: Icon(
          Icons.expand_more,
          color: appTheme!.grey,
        ),
      );

  Widget textErrorWiget({String? errorText}) {
    return Text(
      errorText ?? R.string()!.authStrings.fieldCannotBeEmpty,
      style: appTheme!.text12RedMedium,
    );
  }

  Widget circularProgressIndicator() {
    return Center(
      child: CircularProgressIndicator(
        color: appTheme!.colorPrimary,
      ),
    );
  }

  Widget appBarWithOnlyDrawer() => AppBar(
        backgroundColor: appTheme!.splashBgColor,
        elevation: 0,
        leading: RotatedBox(
          quarterTurns: 75,
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.filter_list,
                color: appTheme!.colorPrimary,
              )),
        ),
      );

  Widget appBarWithNotificationAndDrawer() => PreferredSize(
        preferredSize: Size(getPercentageWidth(100), getSize(80)),
        child: AppBar(
          backgroundColor: appTheme!.splashBgColor,
          elevation: 0,
          leading: RotatedBox(
            quarterTurns: 75,
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.filter_list,
                  color: appTheme!.colorPrimary,
                )),
          ),
          actions: [
            Container(
              height: getSize(50),
              width: getSize(50),
              padding: EdgeInsets.all(getSize(5)),
              margin: EdgeInsets.only(
                  right: getSize(31), top: getSize(5), bottom: getSize(8)),
              decoration: BoxDecoration(
                color: appTheme!.splashBgColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(5, 8),
                  ),
                ],
              ),
              child: Icon(
                Icons.notifications_active_outlined,
                color: appTheme!.colorPrimary,
              ),
            ),
          ],
        ),
      );

  Widget appBarWithChatDrawerNotification() => PreferredSize(
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: getSize(38), horizontal: getSize(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RotatedBox(
              quarterTurns: 75,
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.filter_list,
                    color: appTheme!.colorPrimary,
                  )),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(horizontal: getSize(15)),
                    decoration: BoxDecoration(
                        // color: appTheme.colorPrimary,
                        boxShadow: [
                          BoxShadow(
                              color: appTheme!.colorPrimary,
                              blurRadius: 0,
                              spreadRadius: 0),
                        ], borderRadius: BorderRadius.circular(10)),
                    height: getSize(40),
                    width: getSize(40),
                    child: Image.asset(
                      chat,
                      height: getSize(18),
                      width: getSize(18),
                    ),
                  ),
                ),
                Container(
                  height: getSize(40),
                  width: getSize(40),
                  padding: EdgeInsets.all(getSize(5)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: fromHex("#ECF0F2"),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(5, 8),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.notifications_active_outlined,
                    color: appTheme!.colorPrimary,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      preferredSize: Size(double.infinity, getSize(150)));

  Widget appBarWithDrawerEditPenBell(
          {VoidCallback? editCallback, VoidCallback? bellCallback}) =>
      PreferredSize(
          child: Container(
            margin: EdgeInsets.symmetric(
                vertical: getSize(38), horizontal: getSize(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RotatedBox(
                  quarterTurns: 75,
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.filter_list,
                        color: appTheme!.colorPrimary,
                        size: getSize(25),
                      )),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: editCallback ?? () {},
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: getSize(5)),
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: appTheme!.colorPrimary,
                              blurRadius: 0,
                              spreadRadius: 0),
                        ], borderRadius: BorderRadius.circular(10)),
                        height: getSize(40),
                        width: getSize(40),
                        child: Icon(
                          Icons.edit_outlined,
                          color: appTheme!.whiteColor,
                        ),
                      ),
                    ),
                    Container(
                      height: getSize(50),
                      width: getSize(50),
                      padding: EdgeInsets.all(getSize(5)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: fromHex("#ECF0F2"),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: Offset(5, 8),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.notifications_active_outlined,
                        color: appTheme!.colorPrimary,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          preferredSize: Size(double.infinity, getSize(150)));
}

class TicketClipper extends CustomClipper<Path> {
  final double additionFactor;

  TicketClipper({this.additionFactor = 0});
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addOval(Rect.fromCircle(
        center: Offset(0.0, size.height / 4 + additionFactor), radius: 15.0));
    path.addOval(Rect.fromCircle(
        center: Offset(size.width, size.height / 4 + additionFactor),
        radius: 15.0));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
