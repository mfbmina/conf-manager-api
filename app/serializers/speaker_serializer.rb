class SpeakerSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :company, :avatar

  def avatar
    url_for(object.avatar) if object.avatar.attached?
  end
end
