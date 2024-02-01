require_relative '../views/books_view'

class BooksController
  def initialize
    @view = BooksView.new
  end

  def list
    books = Book.all
    # p books
    @view.display(books)
  end

  def add

    title = @view.ask_user_for("title")
    price = @view.ask_user_for("price")
    author = @view.ask_user_for("author")
    category = @view.ask_user_for("category")

    book = Book.new(title: title, price: price, author: author, category: category)
    book.save
  end

  def edit

    books = Book.all
    @view.display(books)


    id = @view.ask_user_for("ID").to_i

    book = Book.find(id)

    title = @view.ask_user_for("title")
    price = @view.ask_user_for("price")
    author = @view.ask_user_for("author")
    category = @view.ask_user_for("category")

    book.title = title
    book.price = price
    book.author = author
    book.category = category

    book.save

  end

  def delete

    books = Book.all
    @view.display(books)

    id = @view.ask_user_for("ID").to_i
    book = Book.find(id)

    book.destroy
  end

  def mark_as_rent

    books = Book.all
    @view.display(books)
    id = @view.ask_user_for("ID").to_i
    book = Book.find(id)
    # Mark as rent
    if book.rent
      book.rent = false
    else
      book.rent = true
    end
    book.save
  end
end
