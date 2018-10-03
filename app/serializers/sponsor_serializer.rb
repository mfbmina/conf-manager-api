class SponsorSerializer < ActiveModel::Serializer
  attributes :id, :name, :website, :tier, :logo

  def logo
    url_for(object.logo) if object.logo.attached?
  end
end
