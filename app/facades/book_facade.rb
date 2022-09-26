class BookFacade

  def self.get_books(location, quantity)
    parsed = BookService.get_books(location, quantity)
    num_found = parsed[:numFound]
    books = parsed[:docs].map do |book|
      Book.new(book)
    end
    books_info = [books, num_found]
  end

end
