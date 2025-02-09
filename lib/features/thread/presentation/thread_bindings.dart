import 'package:core/core.dart';
import 'package:core/presentation/utils/responsive_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tmail_ui_user/features/email/data/datasource/email_datasource.dart';
import 'package:tmail_ui_user/features/email/data/datasource_impl/email_datasource_impl.dart';
import 'package:tmail_ui_user/features/email/data/network/email_api.dart';
import 'package:tmail_ui_user/features/email/data/repository/email_repository_impl.dart';
import 'package:tmail_ui_user/features/email/domain/repository/email_repository.dart';
import 'package:tmail_ui_user/features/email/domain/usecases/mark_as_email_read_interactor.dart';
import 'package:tmail_ui_user/features/thread/data/datasource/thread_datasource.dart';
import 'package:tmail_ui_user/features/thread/data/datasource_impl/thread_datasource_impl.dart';
import 'package:tmail_ui_user/features/thread/data/network/thread_api.dart';
import 'package:tmail_ui_user/features/thread/data/repository/thread_repository_impl.dart';
import 'package:tmail_ui_user/features/thread/domain/repository/thread_repository.dart';
import 'package:tmail_ui_user/features/thread/domain/usecases/get_emails_in_mailbox_interactor.dart';
import 'package:tmail_ui_user/features/thread/domain/usecases/mark_as_multiple_email_read_interactor.dart';
import 'package:tmail_ui_user/features/thread/presentation/thread_controller.dart';

class ThreadBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ThreadDataSourceImpl(Get.find<ThreadAPI>()));
    Get.lazyPut<ThreadDataSource>(() => Get.find<ThreadDataSourceImpl>());
    Get.lazyPut(() => ThreadRepositoryImpl(Get.find<ThreadDataSource>()));
    Get.lazyPut<ThreadRepository>(() => Get.find<ThreadRepositoryImpl>());
    Get.lazyPut(() => GetEmailsInMailboxInteractor(Get.find<ThreadRepository>()));
    Get.lazyPut(() => ScrollController());
    Get.lazyPut(() => EmailDataSourceImpl(Get.find<EmailAPI>()));
    Get.lazyPut<EmailDataSource>(() => Get.find<EmailDataSourceImpl>());
    Get.lazyPut(() => EmailRepositoryImpl(Get.find<EmailDataSource>()));
    Get.lazyPut<EmailRepository>(() => Get.find<EmailRepositoryImpl>());
    Get.lazyPut(() => MarkAsEmailReadInteractor(Get.find<EmailRepository>()));
    Get.lazyPut(() => MarkAsMultipleEmailReadInteractor(Get.find<MarkAsEmailReadInteractor>()));
    Get.put(ThreadController(
      Get.find<ResponsiveUtils>(),
      Get.find<GetEmailsInMailboxInteractor>(),
      Get.find<ScrollController>(),
      Get.find<MarkAsMultipleEmailReadInteractor>(),
      Get.find<AppToast>(),
    ));
  }
}