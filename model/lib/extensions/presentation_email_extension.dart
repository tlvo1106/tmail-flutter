import 'package:core/core.dart';
import 'package:jmap_dart_client/jmap/mail/email/keyword_identifier.dart';
import 'package:model/model.dart';

extension PresentationEmailExtension on PresentationEmail {

  int numberOfAllEmailAddress() => to.numberEmailAddress() + cc.numberEmailAddress() + bcc.numberEmailAddress();

  String getEmailDateTime(String newLocale, {String? pattern}) {
    final emailTime = sentAt ?? receivedAt;
    if (emailTime != null) {
      return emailTime.formatDate(pattern: pattern ?? emailTime.value.toPattern(), locale: newLocale);
    }
    return '';
  }

  PresentationEmail markAsReadPresentationEmail(ReadActions readActions) {
    var newKeyWord = keywords;

    if (readActions == ReadActions.markAsUnread) {
      newKeyWord?.removeWhere((key, value) => key == KeyWordIdentifier.emailSeen);
    } else {
      if (newKeyWord == null) {
        newKeyWord = {
          KeyWordIdentifier.emailSeen: true
        };
      } else {
        newKeyWord[KeyWordIdentifier.emailSeen] = true;
      }
    }

    return PresentationEmail(
        id,
        keywords: newKeyWord,
        size: size,
        receivedAt: receivedAt,
        hasAttachment: hasAttachment,
        preview: preview,
        subject: subject,
        sentAt: sentAt,
        from: from,
        to: to,
        cc: cc,
        bcc: bcc,
        replyTo: replyTo,
        selectMode:  selectMode
    );
  }

  PresentationEmail toggleSelect() {
    return PresentationEmail(
        id,
        keywords: keywords,
        size: size,
        receivedAt: receivedAt,
        hasAttachment: hasAttachment,
        preview: preview,
        subject: subject,
        sentAt: sentAt,
        from: from,
        to: to,
        cc: cc,
        bcc: bcc,
        replyTo: replyTo,
        selectMode: selectMode == SelectMode.INACTIVE ? SelectMode.ACTIVE : SelectMode.INACTIVE
    );
  }

  PresentationEmail toSelectedEmail({required SelectMode selectMode}) {
    return PresentationEmail(
      id,
      keywords: keywords,
      size: size,
      receivedAt: receivedAt,
      hasAttachment: hasAttachment,
      preview: preview,
      subject: subject,
      sentAt: sentAt,
      from: from,
      to: to,
      cc: cc,
      bcc: bcc,
      replyTo: replyTo,
      selectMode: selectMode
    );
  }
}