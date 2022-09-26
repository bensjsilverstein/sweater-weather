require 'rails_helper'

RSpec.describe BookFacade do

  it 'returns a Book poro and the total number of books matching the search term', :vcr do
    books = BookFacade.get_books('denver,co', 4)

    expect(books[0]).to be_all Book
    expect(books[1]).to be_an Integer
    expect(books[0].count).to eq(books[1])
  end

end
