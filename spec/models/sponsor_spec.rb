require 'rails_helper'

RSpec.describe Sponsor, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:website) }
  it { should validate_presence_of(:tier) }
  it { is_expected.to validate_attachment_of(:logo) }
end
