require 'spec_helper'

describe AirQualityEgg, :type => :request do

  before do
    WebMock.reset!
  end

  it "should render the homepage" do
    visit '/'
    page.should have_content "Air Quality Egg"
  end

  describe 'registering' do

    it 'should render the edit form if found' do
      stub_request(:get, "http://api.cosm.com/v2/feeds/101.json").
        with(:headers => { 'X-ApiKey' => 'HSA8lzxDe-uOigbz8Ic_syfuGsaSAKxjcUZMS3NTbXJhWT0g' }).
        to_return(:status => 200, :body => Cosm::Feed.new(:title => "Joe's Air Quality Egg", :id => 101).to_json)
      stub_request(:get, "http://api.cosm.com/v2/products/airqualityegg/devices/123/activate").
        with(:headers => { 'X-ApiKey' => 'apikey'}).
        to_return(:status => 200, :body => MultiJson.dump({"datastreams"=>[], "feed_id"=>101, "apikey"=>"HSA8lzxDe-uOigbz8Ic_syfuGsaSAKxjcUZMS3NTbXJhWT0g"}))
      visit '/'
      fill_in 'serial', :with => '123'
      click_button 'Add my egg'
      current_path.should == "/egg/101/edit"
    end

    it 'should handle no serial' do
      visit '/'
      fill_in 'serial', :with => ''
      click_button 'Add my egg'
      page.should have_content("Please enter a serial number")
      current_path.should == "/"
    end

    it 'should handle missing eggs' do
      request_stub = stub_request(:get, "http://api.cosm.com/v2/products/airqualityegg/devices/123/activate").
        with(:headers => { 'X-ApiKey' => 'apikey'}).
        to_return(:status => 404, :body => MultiJson.dump({"title"=>"Not found", "errors"=>"I'm sorry we are unable to find the device you are looking for."}))
      visit '/'
      fill_in 'serial', :with => '123'
      click_button 'Add my egg'
      page.should have_content("Egg not found")
      current_path.should == "/"
    end

  end

  describe 'editing' do

    it "should redirect and error if not in session" do
      visit '/egg/17/edit'
      page.should have_content "Air Quality Egg"
      current_path.should == '/'
    end

    context "after registering" do
      before do
        stub_request(:get, "http://api.cosm.com/v2/products/airqualityegg/devices/123/activate").
          with(:headers => { 'X-ApiKey' => 'apikey'}).
          to_return(:status => 200, :body => MultiJson.dump({"datastreams"=>[], "feed_id"=>101, "apikey"=>"HSA8lzxDe-uOigbz8Ic_syfuGsaSAKxjcUZMS3NTbXJhWT0g"}))
        stub_request(:get, "http://api.cosm.com/v2/feeds/101.json").
          with(:headers => { 'X-ApiKey' => 'HSA8lzxDe-uOigbz8Ic_syfuGsaSAKxjcUZMS3NTbXJhWT0g' }).
          to_return(:status => 200, :body => Cosm::Feed.new(:title => "Joe's Air Quality Egg", :id => 101).to_json)
        stub_request(:get, "http://api.cosm.com/v2/feeds/101.json").
          with(:headers => { 'X-ApiKey' => 'apikey' }).
          to_return(:status => 200, :body => Cosm::Feed.new(:title => "Joe's London based egg", :id => 101).to_json)
        visit '/'
        fill_in 'serial', :with => '123'
        click_button 'Add my egg'
      end

      it 'should render the form' do
        page.should have_field('title', :with => "Joe's Air Quality Egg")
        current_path.should == '/egg/101/edit'
      end

      it 'should allow updating the egg and render the dashboard' do
        stub_request(:put, "http://api.cosm.com/v2/feeds/101.json").
          with(:headers => { 'X-ApiKey' => 'HSA8lzxDe-uOigbz8Ic_syfuGsaSAKxjcUZMS3NTbXJhWT0g' }, :body => {"id" => 101,"title" => "Joe's London based egg","version" => "1.0.0"}).
          to_return(:status => 200, :body => "")
        fill_in 'title', :with => "Joe's London based egg"
        click_button 'Save'
        page.should have_content "Joe's London based egg"
        current_path.should == "/egg/101"
      end

      it 'should not allow editing another egg' do
        visit '/egg/999/edit'
        page.should have_content('Not your egg')
        current_path.should == '/'
      end
    end
  end

end
