FactoryBot.define do

  factory :chat do
    message  {"チャットいいですね！"}
    association :member
    association :room
  end

end