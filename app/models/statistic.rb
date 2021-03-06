class Statistic < ActiveRecord::Base
  belongs_to :source
  belongs_to :status
  belongs_to :specializations
  belongs_to :levels
  belongs_to :user

  def self.update_statistics (object)
    information = Statistic.where(user_id: object.user_id,
                                  status_id: object.status_id,
                                  source_id: object.source_id,
                                  specialization_id: object.specialization_id,
                                  level_id: object.level_id,
                                  for_type: object.type,
                                  week: object.updated_at.to_date.at_beginning_of_week).first
    if information == nil
      information = Statistic.new(user_id: object.user_id,
                                  status_id: object.status_id,
                                  source_id: object.source_id,
                                  for_type: object.type,
                                  specialization_id: object.specialization_id,
                                  level_id: object.level_id,
                                  week: object.updated_at.to_date.at_beginning_of_week)
      information.save
    else
      information.count += 1
      information.save
    end
  end

  def self.destroy(object)
    Statistic.change_count(object, object.status_id)
    Statistic.change_count(object, Status.default_status(object.for_type.upcase)) if object.status_id != Status.default_status(object.for_type.upcase)
  end

  def self.change_count(object, status_id)
    information = Statistic.where(user_id: object.user_id,
                                  status_id: status_id,
                                  source_id: object.source_id,
                                  specialization_id: object.specialization_id,
                                  level_id: object.level_id,
                                  for_type: object.type,
                                  week: object.updated_at.to_date.at_beginning_of_week).first
    information.count -= 1
    information.save
  end
end
