require "spec_helper"

describe Rails::Subpartial::VERSION do
  it "should be a string" do
    expect(Rails::Subpartial::VERSION).to be_kind_of(String)
  end
end
