FactoryGirl.define do

  factory :twitter_stream, class: 'Stream' do
    association :provider, :factory => :twitter
    broadcast_time 5.hours.ago
    content "Thredup is very cool"
  end
end