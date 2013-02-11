# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :movie do
    title "The Ghost Writer"
    year "2010"
    director "Roman Polanski"
    sequence(:imdb_id) {|n| "tt#{"%6d" % n}" }
  end
end
