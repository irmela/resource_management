FactoryGirl.define do
  factory :job do
    project
    resource
    start_date "2016-08-14"
    end_date "2016-10-14"
    description "Test Description"
  end
end
