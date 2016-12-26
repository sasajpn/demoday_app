# == Schema Information
#
# Table name: areas
#
#  id            :integer          not null, primary key
#  postal_code   :string(255)
#  prefecture_id :integer
#  municipality  :string(255)
#  street        :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Area < ActiveRecord::Base
  belongs_to :prefecture

  def self.search_area(search_code)
    areas = self.where("postal_code = ?", search_code)
    if areas.empty?
      data = nil
    else
      area_info = areas.first
      areas.drop(1).each do |next_area|
        area_info.prefecture_id = 0 if area_info.prefecture_id != next_area.prefecture_id
        area_info.municipality = self.samestr(area_info.municipality, next_area.municipality)
        area_info.street = self.samestr(area_info.street, next_area.street)
      end
      data = area_info.attributes
      data.delete("id")
      data.delete("postal_code")
    end
    data
  end

  private

  def self.samestr(str1, str2)
    return "" if str1.nil? || str2.nil?
    samechars = ""
    str1, str2 = str2, str1 if str1.length > str2.length
    0.upto(str1.length-1) do |index|
      str1[index] == str2[index] ? samechars += str1[index] : blank
    end
    samechars
  end
end
