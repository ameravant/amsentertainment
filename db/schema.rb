# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100520000825) do

  create_table "article_categories", :force => true do |t|
    t.string  "name"
    t.string  "permalink"
    t.boolean "active",    :default => true
  end

  create_table "article_categories_articles", :id => false, :force => true do |t|
    t.integer "article_id"
    t.integer "article_category_id"
  end

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.string   "permalink"
    t.string   "description"
    t.text     "blurb"
    t.text     "body"
    t.integer  "person_id"
    t.integer  "comments_count",            :default => 0
    t.integer  "images_count",              :default => 0
    t.integer  "features_count",            :default => 0
    t.datetime "published_at"
    t.boolean  "notify_author_of_comments", :default => true
    t.boolean  "published",                 :default => true
    t.boolean  "social_share",              :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "assets_count",              :default => 0
  end

  create_table "artist_types", :force => true do |t|
    t.string "title"
  end

  create_table "artist_types_artists", :id => false, :force => true do |t|
    t.integer "artist_id"
    t.integer "artist_type_id"
  end

  create_table "artists", :force => true do |t|
    t.string   "title"
    t.string   "permalink"
    t.integer  "price"
    t.integer  "images_count",       :default => 0
    t.integer  "assets_count",       :default => 0
    t.text     "body"
    t.text     "blurb"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "meta_description"
    t.integer  "features_count",     :default => 0
    t.integer  "testimonials_count", :default => 0
  end

  create_table "artists_genres", :id => false, :force => true do |t|
    t.integer "artist_id"
    t.integer "genre_id"
  end

  create_table "assets", :force => true do |t|
    t.string   "name",              :null => false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "comment"
    t.integer  "article_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "emails", :force => true do |t|
    t.string   "from"
    t.string   "to"
    t.integer  "last_send_attempt", :default => 0
    t.text     "mail"
    t.datetime "created_on"
  end

  create_table "entertainment_types", :force => true do |t|
    t.string "title"
  end

  create_table "entertainment_types_entertainments", :id => false, :force => true do |t|
    t.integer "entertainment_id"
    t.integer "entertainment_type_id"
  end

  create_table "entertainments", :force => true do |t|
    t.string   "title"
    t.string   "permalink"
    t.integer  "images_count",       :default => 0
    t.integer  "assets_count",       :default => 0
    t.text     "body"
    t.text     "blurb"
    t.string   "meta_description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "features_count",     :default => 0
    t.integer  "testimonials_count", :default => 0
    t.integer  "price",              :default => 0
  end

  create_table "features", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "user_id"
    t.integer  "featurable_id"
    t.string   "featurable_type"
    t.integer  "position",        :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "genres", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", :force => true do |t|
    t.string   "title"
    t.string   "caption"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "viewable_id"
    t.string   "viewable_type"
    t.integer  "features_count",              :default => 0
    t.integer  "position",                    :default => 1
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "featured_image_file_name"
    t.string   "featured_image_content_type"
    t.integer  "featured_image_file_size"
    t.datetime "featured_image_updated_at"
    t.string   "thumb_image_file_name"
    t.string   "thumb_image_content_type"
    t.integer  "thumb_image_file_size"
    t.datetime "thumb_image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inquiries", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.text     "inquiry"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "person_id"
  end

  create_table "link_categories", :force => true do |t|
    t.string   "title",                     :null => false
    t.string   "permalink"
    t.integer  "position",   :default => 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "links", :force => true do |t|
    t.string   "title",                              :null => false
    t.string   "permalink",                          :null => false
    t.string   "url"
    t.string   "link_back"
    t.string   "image"
    t.string   "blurb"
    t.text     "body"
    t.integer  "position",         :default => 1
    t.boolean  "featured",         :default => true
    t.boolean  "public",           :default => true
    t.integer  "features_count",   :default => 0
    t.integer  "images_count",     :default => 0
    t.integer  "link_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "permalink"
    t.string   "meta_title"
    t.string   "meta_keywords"
    t.string   "meta_description"
    t.string   "status",                                :default => "visible"
    t.text     "body"
    t.integer  "parent_id"
    t.integer  "images_count",                          :default => 0
    t.integer  "features_count",                        :default => 0
    t.integer  "testimonials_count",                    :default => 0
    t.integer  "position",                              :default => 1
    t.boolean  "show_articles",                         :default => true
    t.boolean  "show_events",                           :default => true
    t.boolean  "automatically_embed_videos_and_images", :default => true
    t.boolean  "can_delete",                            :default => true
    t.boolean  "can_edit_content",                      :default => true
    t.boolean  "show_in_menu",                          :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "show_in_footer",                        :default => true
    t.integer  "footer_pos"
    t.integer  "author_id"
    t.integer  "article_category_id"
    t.boolean  "show_article_cats"
    t.boolean  "show_testimonials"
    t.boolean  "show_featured_testimonial",             :default => true
    t.text     "right_column"
  end

  create_table "people", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "title"
    t.string   "company"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "articles_count", :default => 0
    t.boolean  "active",         :default => true
    t.integer  "images_count"
    t.integer  "assets_count"
    t.integer  "features_count"
  end

  create_table "people_person_groups", :id => false, :force => true do |t|
    t.integer "person_id"
    t.integer "person_group_id"
  end

  create_table "person_groups", :force => true do |t|
    t.text     "description"
    t.string   "title"
    t.boolean  "public",      :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "role",        :default => false
  end

  create_table "settings", :force => true do |t|
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.text     "footer_text"
    t.text     "tracking_code"
    t.string   "inquiry_notification_email"
    t.boolean  "show_features",                     :default => true
    t.boolean  "show_feature_thumbs",               :default => true
    t.boolean  "show_testimonials",                 :default => true
    t.boolean  "comment_profanity_filter",          :default => true
    t.boolean  "show_tags_in_sidebar",              :default => true
    t.boolean  "show_authors_in_sidebar",           :default => true
    t.boolean  "show_categories_in_sidebar",        :default => true
    t.boolean  "show_archive_in_sidebar",           :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "articles_right",                    :default => true
    t.boolean  "articles_cat_right",                :default => true
    t.integer  "events_range"
    t.string   "newsletter_logo_file_name"
    t.string   "newsletter_from_email"
    t.string   "header_right_file_name"
    t.string   "header_right_content_type"
    t.datetime "header_right_updated_at"
    t.integer  "header_right_file_size"
    t.string   "header_right_url"
    t.boolean  "newsletter_border"
    t.text     "newsletter_footer_text"
    t.string   "newsletter_logo_content_type"
    t.integer  "newsletter_logo_file_size"
    t.text     "inquiry_confirmation_message"
    t.string   "inquiry_confirmation_subject_line"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type"], :name => "index_taggings_on_taggable_id_and_taggable_type"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "testimonials", :force => true do |t|
    t.string   "author"
    t.string   "author_title"
    t.text     "quote"
    t.text     "body"
    t.integer  "position"
    t.boolean  "feature"
    t.integer  "quotable_id"
    t.string   "quotable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "permalink"
  end

  create_table "users", :force => true do |t|
    t.integer  "person_id"
    t.string   "login"
    t.string   "salt",                      :limit => 40
    t.string   "crypted_password",          :limit => 40
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.boolean  "active",                                  :default => true
    t.boolean  "can_deactivate",                          :default => true
    t.integer  "comments_count",                          :default => 0
    t.integer  "galleries_count",                         :default => 0
    t.integer  "events_count",                            :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
