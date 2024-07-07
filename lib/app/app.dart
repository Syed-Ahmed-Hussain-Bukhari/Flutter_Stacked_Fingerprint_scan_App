import 'package:my_biometric_authentication/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:my_biometric_authentication/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:my_biometric_authentication/ui/views/home/home_view.dart';

import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: MyHomeApp,initial: true),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
