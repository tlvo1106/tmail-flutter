
import 'package:core/core.dart';
import 'package:jmap_dart_client/jmap/mail/email/email_address.dart';
import 'package:tmail_ui_user/features/composer/data/datasource/autocomplete_datasource.dart';
import 'package:tmail_ui_user/features/composer/domain/model/auto_complete_pattern.dart';
import 'package:tmail_ui_user/features/composer/domain/repository/auto_complete_repository.dart';

class AutoCompleteRepositoryImpl extends AutoCompleteRepository {

  final Map<DataSourceType, AutoCompleteDataSource> autoCompleteDataSources;

  AutoCompleteRepositoryImpl(this.autoCompleteDataSources);

  @override
  Future<List<EmailAddress>> getAutoComplete(AutoCompletePattern autoCompletePattern) {
    return autoCompleteDataSources[DataSourceType.local]!.getAutoComplete(autoCompletePattern);
  }
}