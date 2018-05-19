require 'spec_helper'

describe NotesController do
  let!(:first_Note)  { Note.create(:title => 'Test Title', :content => 'Test content')}

  describe "GET 'index'" do
    before { get :index }

    it { expect(assigns(:Notes)).to eq([first_Note]) }
    it { expect(response).to render_template('index') }
  end

  describe "GET 'show'" do
    before { get :show , :id => first_Note.id }

    it { expect(assigns(:Note)).to eq(first_Note) }
    it { expect(response).to render_template('show') }
  end

  describe "GET 'new'" do
    before { get :new }

    it { expect(assigns(:Note)).to be_a_new(Note) }
    it { expect(response).to render_template('new') }
  end

  describe "Note 'create'" do
    context 'when valid' do
      before { Note :create, :Note => {:title => 'Test Title', :content => 'Test content'} }

      it { expect(response).to redirect_to(root_path) }
      
    end

    context 'when invalid' do
      before { Note :create, :Note => {:title => 'Test Title', :content => ''} }
      it { expect(response).to render_template('new') }
    end
  end

  describe "GET 'edit'" do
    before { get :edit, :id => first_Note.id }

    it { expect(assigns(:Note)).to eq(first_Note) }
    it { expect(response).to render_template('edit') }
  end

  describe "PUT 'update'" do
    context 'when success' do
      before { put :update, :Note => {:title => 'Update Title', :content => 'Update content'},:id => first_Note.id }

      it { expect(response).to redirect_to root_path }
    end

    context 'when not success' do
      before { put :update, :Note => {:title => '', :content => ''},:id => first_Note.id }

      it { expect(response).to render_template('edit') }
      
    end
  end

  describe "DELETE 'destroy'" do
    before { delete :update, :id => first_Note.id }

    it { expect(response).to redirect_to root_path }
    
  end
end

