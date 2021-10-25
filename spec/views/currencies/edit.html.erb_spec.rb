require 'rails_helper'

RSpec.describe "currencies/edit", type: :view do
  before(:each) do
    @currency = assign(:currency, Currency.create!(
      slug: "MyString",
      symbol: "MyString",
      interest: "9.99"
    ))
  end

  it "renders the edit currency form" do
    render

    assert_select "form[action=?][method=?]", currency_path(@currency), "post" do

      assert_select "input[name=?]", "currency[slug]"

      assert_select "input[name=?]", "currency[symbol]"

      assert_select "input[name=?]", "currency[interest]"
    end
  end
end
