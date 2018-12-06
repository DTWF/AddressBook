require_relative 'Contact'
class Contacts
  attr_reader :contacts
  def initialize
    @contacts = []
  end

  def add_contact(first_name, last_name, email)
    @contacts.push(Contact.new(first_name, last_name, email))
  end

  def edit_contact(contact_choice_number, param_to_be_modified, new_value)
    case param_to_be_modified
    when 1
      contacts[contact_choice_number].first_name = new_value
      puts "First name successfully changed to #{new_value}"
    when 2
      contacts[contact_choice_number].last_name = new_value
      puts "Last name successfully changed to #{new_value}"
    when 3
      contacts[contact_choice_number].email = new_value
      puts "Email successfully changed to #{new_value}"
    end
  end

  def remove_contact(contact_choice_number)
    contacts.delete_at(contact_choice_number)
    puts "Contact deleted successfully"
  end

  def search_contact(search_query)
    contacts.each do |contact|
      if contact.first_name =~ /#{search_query}/ || contact.last_name =~ /#{search_query}/ || contact.email =~/#{search_query}/
        puts contact
      else
        puts "Contact not found!"
      end
    end
  end

  def validate_contact(contact_choice_number)
    if (contact_choice_number >= 0) & (contact_choice_number < @contacts.size)
      true
    else
      false
    end
  end

  def empty?
    if @contacts.size.zero?
      true
    else
      false
    end
  end

  def print_contacts
    if contacts.empty?
      puts "The address book is currently empty!"
    else
      contacts.each_with_index { |contact, i| puts "#{i + 1}. #{contact.to_s}" }
    end
  end
end