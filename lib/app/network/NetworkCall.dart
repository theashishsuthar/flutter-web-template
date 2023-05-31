import 'dart:async';

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import '../app.export.dart';

class NetworkCall<T extends BaseApiResp> {
  static final Logger _log = Logger("Network Call");

  Future<T?> makeCall(ApiCall<T> apiCall, BuildContext context,
      {bool isNetworkError = true, bool isProgress = true}) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      if (isProgress && context != null) {
        app.resolve<CustomDialogs>().showProgressDialog(context, "");
      }
      try {
        BaseApiResp resp = await apiCall();

        // print(resp.statusCode.toString() + "Status code in network");
        // print(resp.toString() + "Status code in network");
        if (resp != null) {
          hideDialog(isProgress);

          if (resp.message == 'Unauthenticated') {
            app
                .resolve<PrefUtils>()
                .saveBoolean(app.resolve<PrefUtils>().keyIsUserLogin, false);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                    builder: (BuildContext context) => Container()),
                (route) => false);
          } else {
            return resp as FutureOr<T>;
          }

          // if (resp.code == CODE_OK)
          //   return resp;
          // else if (resp.code == CODE_UNAUTHORIZED) {
          //   // if (app.resolve<PrefUtils>().isUserLogin()) {
          //   //   showToast(resp.message);
          //   //   RxBus.post(true, tag: eventBusLogout);
          //   // } else {
          //   //   return Future.error(ErrorResp(resp.message, resp.code, false));
          //   // }
          // }
          //  else if (resp.code == MISMATCHED_TIME_ZONE) {
          //   if (context != null) {
          //     app.resolve<CustomDialogs>().confirmDialog(context,
          //         title: R.string().screenTitle.manualTime,
          //         desc: R.string().screenTitle.manualTimeDesc,
          //         positiveBtnTitle: R.string().commonString.openAppSetting,
          //         dismissPopup: false, onClickCallback: (BtnType) async {
          //       if (BtnType == ButtonType.PositveButtonClick) {
          //         Navigator.pop(context);
          //         await AppSettings.openDateSettings();
          //       }
          //     });
          //   }
          //   return Future.error("");
          // }
          // else {
          //   return Future.error(ErrorResp(resp.message, resp.code, false));
          // }
        } else {
          hideDialog(isProgress);
          return Future.error(
              ErrorResp(SOMETHING_WENT_WRONG, CODE_ERROR, false));
        }
      } catch (e) {
        hideDialog(isProgress);
        _log.warning(e);
        print('e ${e}');
        return Future.error(ErrorResp(PARSING_WRONG, CODE_ERROR, false));
      }
    } else {
      // if (isNetworkError && context != null) {
      //   View.showMessage(context, NO_CONNECTION);
      // }
      return Future.error(ErrorResp(INTERNET_UNAWAILABLE, NO_CONNECTION, true));
    }
  }

  void hideDialog(bool isProgress) {
    if (isProgress) {
      app.resolve<CustomDialogs>().hideProgressDialog();
    }
  }
}
