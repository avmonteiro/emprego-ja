require 'rails_helper'

  feature 'user create categorie' do
    scenario 'create successfully'  do


      visit visit new_category_path

      #fill_in '' whith: title
      #fill_in '' whith: location
      #fill_in '' whith: description
      fill_in 'Categoria', with: 'Designer'

      click_on 'Criar Categoria'

      expect(page).to have_content('Designer')
    end

  end
