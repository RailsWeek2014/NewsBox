class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def send_rss entry, email
  	mail(to: email,
  		subject: entry.title,
  		content_type: "text/html",
  		body: entry.summary)
  	
  end

end
