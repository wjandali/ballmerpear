class QuotesController < ApplicationController
  respond_to :json
  def index
    render json: [] unless Quote.any?

    @trump_quotes = Quote.where("NAME LIKE ?", 'trump').limit(10)
    @non_trump_quotes = Quote.where("NAME NOT LIKE ?", 'trump').limit(10)

    json = [
      {
        name: 'trump',
        img: @trump_quotes.first.img,
        quotes: @trump_quotes.map(&:quote)
      },
      {
        name: 'not trump',
        img: @non_trump_quotes.first.img,
        quotes: @non_trump_quotes.map(&:quote)
      }
    ]

    render json: json
  end
end
