require 'spec_helper'

describe 'Product Details', type: :feature, js: true do
  stub_authorization!
  context 'editing a product' do
    before do
      create(:product, name: 'Bún thịt nướng', sku: 'A100',
             description: 'lorem ipsum', available_on: '2013-08-14 01:02:03')

      visit spree.admin_products_path
      within_row(1) { click_icon :edit }
    end

    it 'handles tag changes' do
      select2 'example-tag', from: 'div[data-hook="admin_product_form_tag_list"]'
      wait_for_ajax
      wait_for { !page.has_button?('Update') }
      click_button 'Update'
      expect(page).to have_content('successfully updated!')
      expect(page).to have_css('#s2id_product_tag_list', text: 'example-tag')
    end
  end
end

