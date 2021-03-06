class Observation < ApplicationRecord
  belongs_to :observation_session

  def self.latest
    order(created_at: :desc).first
  end

  comma do
    id 'id'
    observation_session_id 'observation_session_id'
    observation_session user_id: 'user_id'
    observation_session('user_email') { |os| os.user&.email }
    details('subject') { |d| d['subject'] }
    details('modifier') { |d| d['modifier'] }
    details('behavior') { |d| d['behavior'] }
    details('target') { |d| d['target'] }
    details('timestamp') { |d| d['timestamp'] }
  end
end
