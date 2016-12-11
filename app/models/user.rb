# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  username               :string(255)
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  birthday               :date
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :books, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :messages

  has_one :user_annimal

  def create_user_animal
  end

  def convert_animal
  end

  def num_plus_day
    num_of_year_and_month + birthday.day
  end

  def num_of_year_and_month
    count = original_count
    (1920..birthday.year).each do |y|
      if leap_year(y) == true && !(birthday.month == 1 || birthday.month == 2)
        count += 6
      elsif leap_year(y-1) == true && (birthday.month == 1 || birthday.month == 2)
        count += 6
      else
        count += 5
      end
        count -= 60 if count >= 60
    end
  end

  def original_count
    january =
    february
    march
    april
    may
    june
    july
    august
    september
    october
    november
    december
  end

  def leap_year(year)
    if year % 400 == 0
      true
    elsif year % 100 == 0
      false
    elsif year % 4 == 0
      true
    end
  end
end
