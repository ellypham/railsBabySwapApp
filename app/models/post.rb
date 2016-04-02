class Post < ActiveRecord::Base
    # Validate presence - invalid if title is nil or empty
    validates :title, presence: true
    
    # Validate that this value is in a list
    validates :category, inclusion: { in: ['furniture', 'gear', 'accessories', 'toys & activities', 'nursing', 'baby apparel'] }
    
    belongs_to :user
    has_many :comments
    has_many :likes

    def self.entitled(value)
        where("lower(title) LIKE ? OR lower(content) LIKE ?", 
              "%#{value.downcase}%",
              "%#{value.downcase}%")
    end
    
    def self.entitled(title)
        where(title: title)
    end

    def search
        @posts = Post.entitled(params[:q])

        render 'index'
    end

    def author
      user.email if user
    end
    
    def lead
      content.to_s.first(100)	 + "..."
    end
    
    def to_s
        self.title
    end
    
    def by?(author)
       self.author == author
    end
    
    def same_category?(other)
       self.category == other.category
    end
end
