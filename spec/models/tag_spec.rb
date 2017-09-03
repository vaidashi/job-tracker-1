require 'rails_helper'

RSpec.describe Tag, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:title) }
  end

  context "assocations" do
    it { should have_many(:job_tags) }
    it {should have_many(:jobs).through(:job_tags)}
  end
end
