module Spree
  class Contact < Base
    after_save :send_email

    EMAIL_REGEX = /\A
        [^\s@]+ # non-at-sign characters, at least one
          @     # at-sign
        [^\s.@] # non-at-sign and non-period character
        [^\s@]* # 0 or more non-at-sign characters, accepts any number of periods
         \.     # period
        [^\s@]* # 0 or more non-at-sign characters, accepts any number of periods
        [^\s.@] # non-at-sign and non-period character
      \z/x.freeze

    validates :email,   presence: true
    validates :email,   format: { with: EMAIL_REGEX }, if: -> { email.present? }
    validates :message, presence: true
    validates :name,    presence: { if: proc { SpreeContactUs.require_name } }
    validates :subject, presence: { if: proc { SpreeContactUs.require_subject } }
    validates :phone,   presence: { if: proc { SpreeContactUs.require_phone } }

    private

    def send_email
      Spree::ContactUs::ContactMailer.contact_email(self).deliver_now
    end
  end
end
