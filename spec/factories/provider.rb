FactoryGirl.define do
  factory :twitter, class: 'Provider' do
    name 'twitter'
    url 'https://twitter.com/search?q=QUERY&src=typd'
  end
end