# crash_ios10_mail
This will crash iOS 10.0.2 Mail.app; since iOS 10.0.1 (at least), Mail.app cannot display rfc822 message attachments, as used with software such as Mailman for mailing list digests.

== Usage ==

ruby send_crashmail.rb <SMTP relay> <sender email> <recipient email>
