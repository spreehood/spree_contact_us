module Spree
  module Admin
    class ContactsController < ResourceController
      def index
        @contacts = Spree::Contact.all
      end
    end
  end
end
