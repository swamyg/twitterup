FactoryGirl.define do

  factory :twitter do
    association :provider, :factory => :provider, :name => 'twitter'
    broadcast_time 5.hours.ago
    content "Thredup is very cool"
  end
end