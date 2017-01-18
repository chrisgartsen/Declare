require 'rails_helper'

RSpec.describe BreadcrumbHelper, type: :helper do

  it 'is an unordered list' do
    expect(helper.breadcrumb()).to have_selector('ol.breadcrumb')
  end

  context 'without any breadcrumb items passed' do

    it 'renders the home location as a static breadcrumb endpoint' do
      expect(helper.breadcrumb()).to have_selector('li.active', text: 'Home')
    end

    it 'has one breadcrumb item' do
      expect(helper.breadcrumb()).to have_selector('li', count: 1)
    end

    it 'has no active link breadcrumb items' do
      expect(helper.breadcrumb()).not_to have_selector('a')
    end

  end

  context 'with one static breadcrumb item passed' do

    let(:output) { helper.breadcrumb('Test' => '#') }

    it 'renders the home location as an active item' do
      expect(output).to have_link('Home', href: root_path)
    end

    it 'has two breadcrumb items' do
      expect(output).to have_selector('li', count: 2)
    end

    it 'renders the passed breadcrumb as a static item' do
      expect(output).to have_selector('li.active', text: 'Test')
    end

  end

  context 'with one active breadcrumb item passed' do

    let(:output) { helper.breadcrumb('First' => root_path) }

    it 'renders the home location as an active item' do
      expect(output).to have_link('Home', href: root_path)
    end

    it 'has two breadcrumb items' do
      expect(output).to have_selector('li', count: 2)
    end

    it 'renders the passed breadcrumb as an active item' do
      expect(output).to have_link('First', href: root_path)
    end

  end

  context 'with two active breadcrumbs passed' do

    let(:output) { helper.breadcrumb('First' => root_path, 'Second' => root_path) }

    it 'renders the home location as an active item' do
      expect(output).to have_link('Home', href: root_path)
    end

    it 'has three breadcrumb items' do
      expect(output).to have_selector('li', count: 3)
    end

    it 'renders the passed breadcrumb as an active item' do
      expect(output).to have_link('First', href: root_path)
      expect(output).to have_link('Second', href: root_path)
    end

    it 'remebers the sequence order of items' do
      expect(output).to have_selector('li:first-child', text: 'Home')
      expect(output).to have_selector('li:nth-child(2)', text: 'First')
      expect(output).to have_selector('li:last-child', text: 'Second')
    end

  end

  context 'with one active and one static item passed' do

    let(:output) { helper.breadcrumb('First' => root_path, 'Second' => '#') }

    it 'renders the home location as an active item' do
      expect(output).to have_link('Home', href: root_path)
    end

    it 'has three breadcrumb items' do
      expect(output).to have_selector('li', count: 3)
    end

    it 'renders the passed breadcrumb as an active and static item' do
      expect(output).to have_link('First', href: root_path)
      expect(output).to have_selector('li.active', text: 'Second')
    end

    it 'remebers the sequence order of items' do
      expect(output).to have_selector('li:first-child', text: 'Home')
      expect(output).to have_selector('li:nth-child(2)', text: 'First')
      expect(output).to have_selector('li:last-child', text: 'Second')
    end

  end

end
