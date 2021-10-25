require 'rails_helper'

RSpec.describe "currencies/new", type: :view do
  before(:each) do
    assign(:currency, Currency.new(
      slug: "MyString",
      symbol: "MyString",
      interest: "9.99"
    ))
  end

  it "renders new currency form" do
    render

    assert_select "form[action=?][method=?]", currencies_path, "post" do

      assert_select "input[name=?]", "currency[slug]"

      assert_select "input[name=?]", "currency[symbol]"

      assert_select "input[name=?]", "currency[interest]"
    end
  end
end
