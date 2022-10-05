class Post < ApplicationRecord
    has_many_attached :images
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :users, through: :comments
    has_rich_text :description
    validates :title, :presence => true

    enum status: [
        :pending,
        :active,
        :inactive
    ]
    after_initialize :set_default_status, :if => :new_record?
    
      def set_default_status
        self.status ||= :pending
      end
      
      def comments_detail
        c = self.comments.pluck(:comment)
        c.each do |x|
        end

       # self.comments.all.map { |p| p.slice(:id, :comment) }
        end
end
