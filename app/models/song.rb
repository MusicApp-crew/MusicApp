class Song < ActiveRecord::Base
  resourcify

  has_many :midis, :dependent => :destroy
  has_many :music_sheets, :dependent => :destroy
  has_many :videos, :dependent => :destroy
  has_many :comments, dependent: :destroy
  # El :dependent => destroy es para que cuando se borre una song, se borren sus respectivos "hijos"
  belongs_to :instrument
  belongs_to :user

  has_and_belongs_to_many :categories
  has_and_belongs_to_many :tags

  validates :title, presence: true
  validates_uniqueness_of :title, scope: :instrument_id

  extend FriendlyId
  friendly_id :title, use: :slugged

  accepts_nested_attributes_for :tags, allow_destroy: true
  accepts_nested_attributes_for :categories, allow_destroy: true
  accepts_nested_attributes_for :music_sheets, allow_destroy: true
end
