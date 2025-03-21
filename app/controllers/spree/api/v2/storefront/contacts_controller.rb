module Spree
  module Api
    module V2
      module Storefront
        class ContactsController < Spree::Api::V2::ResourceController
          def create
            @contact = Spree::ContactUs::Contact.new(contact_us_params)

            if @contact.save
              render json: { message: "Contact Us submitted successfully!"}, status: :ok
            else
              render json: { errors: @contact.errors.full_messages }, status: :unprocessable_entity
            end
          end

          private

          def contact_us_params
            params.require(:contact_us_contact).permit(:email, :message, :name, :subject, :phone)
          end
        end
      end
    end
  end
end
