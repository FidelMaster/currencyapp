 require 'rails_helper'

#UNIT TEST FILE

RSpec.describe "/currencies", type: :request do
  
  
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Currency.create! valid_attributes
      get currencies_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      currency = Currency.create! valid_attributes
      get currency_url(currency)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_currency_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      currency = Currency.create! valid_attributes
      get edit_currency_url(currency)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Currency" do
        expect {
          post currencies_url, params: { currency: valid_attributes }
        }.to change(Currency, :count).by(1)
      end

      it "redirects to the created currency" do
        post currencies_url, params: { currency: valid_attributes }
        expect(response).to redirect_to(currency_url(Currency.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Currency" do
        expect {
          post currencies_url, params: { currency: invalid_attributes }
        }.to change(Currency, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post currencies_url, params: { currency: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested currency" do
        currency = Currency.create! valid_attributes
        patch currency_url(currency), params: { currency: new_attributes }
        currency.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the currency" do
        currency = Currency.create! valid_attributes
        patch currency_url(currency), params: { currency: new_attributes }
        currency.reload
        expect(response).to redirect_to(currency_url(currency))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        currency = Currency.create! valid_attributes
        patch currency_url(currency), params: { currency: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested currency" do
      currency = Currency.create! valid_attributes
      expect {
        delete currency_url(currency)
      }.to change(Currency, :count).by(-1)
    end

    it "redirects to the currencies list" do
      currency = Currency.create! valid_attributes
      delete currency_url(currency)
      expect(response).to redirect_to(currencies_url)
    end
  end
end
