class CompetitionWinConditionSerializer < ActiveModel::Serializer
  attributes :id, :name, :description

  #embed :ids, include: true

end
