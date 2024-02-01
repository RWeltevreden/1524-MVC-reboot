class BooksView


  def ask_user_for(stuff)
    puts "What is the #{stuff}?"
    return gets.chomp
  end

  def display(books)
    books.each do |book|
      status = book.rent ? "Unavailable" : "Available"
      puts "ID: #{book.id} - TITLE: #{book.title}"
      puts "Status: #{status}"
    end
  end

end
