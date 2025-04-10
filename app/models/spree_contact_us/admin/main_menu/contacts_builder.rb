module SpreeContactUs
  module Admin
    module MainMenu
      class ContactsBuilder
        include ::Spree::Core::Engine.routes.url_helpers

        def build
          ::Spree::Admin::MainMenu::ItemBuilder.new('Contacts', admin_contacts_path)
            .with_availability_check(->(ability, _store) { ability.can?(:manage, Spree::Contact) })
            .with_label_translation_key('spree_contact_us.contacts')
            .with_icon_key('phone.svg')
            .with_match_path('/contact_us')
            .build
        end
      end
    end
  end
end
