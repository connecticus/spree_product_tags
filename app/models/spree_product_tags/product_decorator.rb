module SpreeProductTags
  module ProductDecorator
    def self.prepended(base)
      base.include ActsAsTaggable
    end
  end
end

::Spree::Product.prepend(SpreeProductTags::ProductDecorator)