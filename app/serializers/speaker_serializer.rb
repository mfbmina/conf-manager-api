class SpeakerSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :company, :avatar

  def avatar
    rails_blob_path(object.avatar, only_path: true) if object.avatar.attached?
  end
end
