require 'rails_helper'

RSpec.describe Book do
  it "exists and has attributes", :vcr do

    book_facade = BookFacade.get_books('Denver, CO', 5)
    book = book_facade.first.first

    expect(book).to be_a Book
    expect(book.isbn).to be_an Array
    expect(book.isbn.first).to eq "9780607620054"
    expect(book.title).to be_a String
    expect(book.title).to eq "Denver west, CO and Bailey, CO: Denver, CO"
    expect(book.publisher).to be_an Array
    expect(book.publisher.first).to eq "USGS Branch of Distribution"
  end

end
