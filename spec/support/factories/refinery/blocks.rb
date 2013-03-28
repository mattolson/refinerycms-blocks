
FactoryGirl.define do
  factory :block, :class => Refinery::Blocks::Block do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

