import 'package:admin/app/utils/ShimmerWidget.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../app.export.dart';

class BaseList extends StatefulWidget {
  BaseListState state;

  @override
  BaseListState createState() => state;

  BaseList(this.state);
}

class BaseListState extends State<BaseList> {
  BaseListState(
      {this.noDataDesc,
      this.refreshBtn,
      this.redirectDesc,
      this.textColor,
      this.onRedirect,
      this.onPullToRefress,
      this.onLoadMore,
      this.onRefress,
      this.listCount = 0,
      this.totalCount = 0,
      this.isApiCalling = true,
      this.enablePullDown = false,
      this.enablePullUp = false});

  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  Widget? listItems;

  int listCount, totalCount;
  String? noDataDesc, refreshBtn, redirectDesc;
  bool enablePullDown;
  bool enablePullUp;
  bool isApiCalling;
  VoidCallback? onRedirect;
  VoidCallback? onPullToRefress;
  VoidCallback? onLoadMore;
  VoidCallback? onRefress;
  Color? textColor;

  void hideProgress() {
    if (refreshController != null) {
      refreshController.refreshCompleted();
      refreshController.loadComplete();
    }
  }

  void setApiCalling(bool isApiCall) {
    if (!isApiCall) {
      hideProgress();
    }
    new Future.delayed(
        const Duration(microseconds: 100),
        () => setState(() {
              isApiCalling = isApiCall;
            }));
  }

  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      header: MaterialClassicHeader(
          backgroundColor: appTheme!.colorPrimary, color: appTheme!.whiteColor),
      enablePullDown: enablePullDown,
      enablePullUp: enablePullUp && listCount > 0 && listCount < totalCount,
      controller: refreshController,
      onRefresh: onPullToRefress,
      onLoading: onLoadMore,
      child: isApiCalling && (listCount == null || listCount == 0)
          ? Container(
              width: MathUtilities.screenWidth(context),

              // child: Container(
              //   alignment: Alignment.center,
              //   width: 100,
              //   height: 100,
              //   child: CircularProgressIndicator(
              //       backgroundColor: appTheme.colorPrimary,
              //       valueColor:
              //           AlwaysStoppedAnimation<Color>(appTheme.whiteColor)),
              // ),

              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      width: 100,
                      height: 100,
                      child: CircularProgressIndicator(
                          backgroundColor: Theme.of(context).primaryColor,
                          valueColor: AlwaysStoppedAnimation<Color>(
                              appTheme!.whiteColor)),
                    ),
                  ]))
          : (listCount != null && listCount > 0
              ? listItems
              : noDataWidget(
                  context,
                  noDataDesc: noDataDesc,
                  redirectDesc: redirectDesc,
                  imagePath: imagePath,
                  refreshBtn: refreshBtn,
                  textColor:
                      textColor != null ? textColor : appTheme!.whiteColor,
                  onRefress: onRefress,
                )),
    );
  }
}

noDataWidget(
  context, {
  String? noDataDesc,
  String? imagePath,
  String? refreshBtn,
  String? redirectDesc,
  Color? textColor,
  VoidCallback? onRefress,
}) {
  return Stack(
    alignment: Alignment.bottomCenter,
    children: <Widget>[
      Container(
        width: MathUtilities.screenWidth(context),
        //height: MathUtilities.screenHeight(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
//              if (noDataDesc != null)
//                Expanded(
//                  child: Container(),
//                ),
//              if (imagePath != null)
//                Image.asset(
//                  imagePath,
//                  fit: BoxFit.fill,
//                  width: getSize(200),
//                  height: getSize(200),
//                ),
//              if (imagePath != null)
//                SizedBox(
//                  height: getSize(16),
//                ),
            // if (noDataMsg != null)
            //   Text(noDataMsg,
            //       style: Theme.of(context).textTheme.title.copyWith(
            //           fontWeight: FontWeight.bold, color: textColor),
            //       textAlign: TextAlign.center),
            // if (noDataMsg != null)
            //   SizedBox(
            //     height: getSize(16),
            //   ),
            if (noDataDesc != null)
              Text(noDataDesc,
                  style: appTheme!.text12RedMedium,
                  textAlign: TextAlign.center),

            if (noDataDesc != null)
              SizedBox(
                height: getSize(16),
              ),
            // if (refreshBtn != null)
            //   Center(
            //     child: RawMaterialButton(
            //       elevation: 1.0,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: new BorderRadius.circular(getSize(4)),
            //       ),
            //       fillColor: appTheme.colorPrimary,
            //       child: Padding(
            //         padding: EdgeInsets.all(2.0),
            //         child: Row(
            //           mainAxisSize: MainAxisSize.min,
            //           children: <Widget>[
            //             Padding(
            //               padding: EdgeInsets.only(
            //                   left: getSize(12),
            //                   right: getSize(12),
            //                   top: getSize(0),
            //                   bottom: getSize(0)),
            //               child: Text(
            //                 refreshBtn,
            //                 maxLines: 1,
            //                 style: TextStyle(color: textColor),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //       onPressed: () {
            //         if (onRefress != null) {
            //           onRefress();
            //         }
            //       },
            //     ),
            //   ),
//              SizedBox(
//                height: getSize(80),
//              ),
//              if (noDataDesc != null)
//                Expanded(
//                  child: Container(),
//                ),
//              if (redirectDesc != null)
//                Padding(
//                  padding:
//                      EdgeInsets.only(top: getSize(10), bottom: getSize(30)),
//                  child: InkWell(
//                    onTap: onRedirect,
//                    child: Text(
//                      redirectDesc,
//                      style: AppTheme.of(context)
//                          .theme
//                          .textTheme
//                          .display1
//                          .copyWith(
//                              color: AppTheme.of(context).theme.accentColor,
//                              decoration: TextDecoration.underline),
//                    ),
//                  ),
//                )
          ],
        ),
      ),
    ],
  );
}

buildJobLisitingShimmer() {
  return Expanded(
    child: ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int i) {
          return Container(
            margin: EdgeInsets.symmetric(
                horizontal: getSize(20), vertical: getSize(10)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: appTheme!.borderColor,
                )),
            padding: EdgeInsets.symmetric(
                horizontal: getSize(20), vertical: getSize(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerWIdget.rectangular(
                  width: getSize(300),
                  height: getSize(20),
                ),
                SizedBox(
                  height: getSize(10),
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerWIdget.rectangular(
                      width: getSize(100),
                      height: getSize(20),
                    ),
                    SizedBox(
                      width: getSize(5),
                    ),
                    ShimmerWIdget.rectangular(
                      height: getSize(20),
                      width: getSize(50),
                    )
                  ],
                ),
                SizedBox(
                  height: getSize(10),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerWIdget.rectangular(
                      width: getSize(80),
                      height: getSize(20),
                    ),
                  ],
                )
              ],
            ),
          );
        }),
  );
}
