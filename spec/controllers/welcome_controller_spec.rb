require 'spec_helper'

describe WelcomeController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'scores'" do
    it "returns http success" do
      get 'scores'
      response.should be_success
    end
  end

end
