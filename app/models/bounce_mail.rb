class BounceMail < ApplicationRecord
  def mask_recipient
    user, domain = self.recipient.split('@', 2)
    user.gsub!(/./, '*')
    [user, domain].join(?@)
  end

  def link
    mail_link = Rails.application.config.sisito[:mail_link]

    if mail_link
      mail_link % {digest: self.digest}
    else
      nil
    end
  end
end
