require "rails_helper"

RSpec.describe Attachment::PhotosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/attachment/photos").to route_to("attachment/photos#index")
    end

    it "routes to #new" do
      expect(get: "/attachment/photos/new").to route_to("attachment/photos#new")
    end

    it "routes to #show" do
      expect(get: "/attachment/photos/1").to route_to("attachment/photos#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/attachment/photos/1/edit").to route_to("attachment/photos#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/attachment/photos").to route_to("attachment/photos#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/attachment/photos/1").to route_to("attachment/photos#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/attachment/photos/1").to route_to("attachment/photos#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/attachment/photos/1").to route_to("attachment/photos#destroy", id: "1")
    end
  end
end
