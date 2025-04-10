module Spree
  module Api
    module V2
      module Storefront
        class ContactsController < Spree::Api::V2::ResourceController
          def create
            @contact = Spree::Contact.new(contact_params)

            if @contact.save
              render json: { message: Spree.t('spree_contact_us.message_sent')}, status: :ok
            else
              render json: { errors: @contact.errors.full_messages }, status: :unprocessable_entity
            end
          end

          private

          def contact_params
            params.require(:contact).permit(:email, :message, :name, :subject, :phone)
          end
        end
      end
    end
  end
end
