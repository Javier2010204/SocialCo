# == Schema Information
#
# Table name: posts
#
#  id                      :integer          not null, primary key
#  body                    :text
#  user_id                 :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  image_post_file_name    :string
#  image_post_content_type :string
#  image_post_file_size    :integer
#  image_post_updated_at   :datetime
#

FactoryGirl.define do
  factory :post do
    body ""
    user nil
  end
end
