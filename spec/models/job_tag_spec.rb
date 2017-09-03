require 'rails_helper'

RSpec.describe JobTag, type: :model do
  context "assocations" do
    it { should belong_to(:tag) }
    it { should belong_to(:job) }
  end
end
