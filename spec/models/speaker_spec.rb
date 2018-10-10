require 'rails_helper'

RSpec.describe Speaker, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:company) }
  it { is_expected.to validate_attachment_of(:avatar) }
end
