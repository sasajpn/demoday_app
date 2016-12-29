class Evaluation < ActiveRecord::Base
  belongs_to :user

  enum level: { very_good: 3, good: 2, bad: 1, very_bad: 0 }
end
