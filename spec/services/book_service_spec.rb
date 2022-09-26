require 'rails_helper'

RSpec.describe WeatherService do

  it 'returns book search informaiton', :vcr do
    location = 'Denver'
    limit = 5
    service = BookService.get_books(location, limit)

    expect(service).to be_a Hash
    expect(service).to have_key(:numFound)
    expect(service).to have_key(:docs)
    expect(service[:docs][0]).to have_key(:title)
    expect(service[:docs][0]).to have_key(:isbn)
    expect(service[:docs][0]).to have_key(:publisher)
  end

end
