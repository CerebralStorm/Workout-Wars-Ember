class CompetitionWinConditionSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :multi_exercise

  #embed :ids, include: true

end
