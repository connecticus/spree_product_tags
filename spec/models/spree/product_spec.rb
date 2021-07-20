describe Spree::Product do
  let(:product) { create(:product) }
  let(:variant) { create(:variant, product: product) }


  describe "tags" do
    let(:tag_list) { %w[tag1 tag2] }

    it "doesn't raise an error when adding tags to a product" do
      expect { product.update(tag_list: tag_list) }.not_to raise_error
    end
  end

  context 'acts_as_taggable' do
    let(:product) { create(:product) }

    it 'adds tags' do
      product.tag_list.add('awesome')
      expect(product.tag_list).to include('awesome')
    end

    it 'removes tags' do
      product.tag_list.remove('awesome')
      expect(product.tag_list).not_to include('awesome')
    end
  end
end
