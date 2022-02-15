require_relative '../lib/dark_trader'

# a = [
#   { "BTC" => 5245.12 },
#   { "ETH" => 217.34 }, 
#   etc
# ]

describe "return crypto name" do
  it "return the right crypto ?" do
    expect(get_name).not_to be_nil 
  end
end