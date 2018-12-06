require_relative 'Contacts'
class AddressBook

  def menu_navigation
    puts "\n Choose an action \n"
    puts "1. Add Contact"
    puts "2. Edit Existing Contact"
    puts "3. Remove Existing Contact"
    puts "4. Search Contact"
    puts "5. Preview the whole address book"
    puts "0. Exit\n"
  end

  def adding_contact(address_book)
    puts "Enter firstname:"
    first_name = gets.chomp
    puts "Enter lastname"
    last_name = gets.chomp
    puts "Enter email"
    email = gets.chomp
    address_book.add_contact(first_name,last_name,email)
  end

  def editing_contact(address_book)
    if address_book.empty?
      puts "The address book is currently empty"
    else
      address_book.print_contacts
      puts "Choose the number of the contact that you'd like to modify:"
      contact_choice_number = gets.chomp
      if address_book.validate_contact(contact_choice_number.to_i - 1)
        puts "Choose the attribute to be modified 1-First Name; 2-Last Name; 3-Email;"
        param_to_be_modified = gets.chomp
        if (1..3).include?(param_to_be_modified.to_i)
          puts "Enter new value: "
          new_value = gets.chomp
          address_book.edit_contact(contact_choice_number.to_i - 1, param_to_be_modified.to_i, new_value)
        else
          puts "Invalid value"
        end
      else
        puts "Contact doesn't exist"
      end
    end
  end

  def deleting_contact(address_book)
    if address_book.empty?
      puts "The address book is currently empty"
    else
      address_book.print_contacts
      puts "Choose the number of the contact that you'd like to delete: "
      contact_choice_number = gets.chomp
      if address_book.validate_contact(contact_choice_number.to_i - 1)
        address_book.remove_contact(contact_choice_number.to_i - 1)
      else
        puts "Invalid value"
      end
    end
  end

  def searching_contact(address_book)
    if address_book.empty?
      puts "The address book is currently empty"
    else
      puts "Enter the search keyword: "
      search_query=gets.chomp
      address_book.search_contact(search_query)
    end
  end

  def execute
    address_book = Contacts.new
    flag = true
    loop do
      menu_navigation
      input = gets.chomp
      case input
      when "1"
        adding_contact(address_book)
      when "2"
        editing_contact(address_book)
      when "3"
        deleting_contact(address_book)
      when "4"
        searching_contact(address_book)
      when "5"
        address_book.print_contacts
      when "0"
        flag = false
    else
      puts "Invalid input, please retry"
      end
      break if flag == false
    end
  end

  private :adding_contact, :searching_contact, :deleting_contact, :editing_contact
end

