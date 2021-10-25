require 'rails_helper'

RSpec.describe "currencies/show", type: :view do
  before(:each) do
    @currency = assign(:currency, Currency.create!(
      slug: "Slug",
      symbol: "Symbol",
      interest: "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Slug/)
    expect(rendered).to match(/Symbol/)
    expect(rendered).to match(/9.99/)
  end
end
