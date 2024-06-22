require "rails_helper"

RSpec.describe Attachment::VideosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/attachment/videos").to route_to("attachment/videos#index")
    end

    it "routes to #new" do
      expect(get: "/attachment/videos/new").to route_to("attachment/videos#new")
    end

    it "routes to #show" do
      expect(get: "/attachment/videos/1").to route_to("attachment/videos#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/attachment/videos/1/edit").to route_to("attachment/videos#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/attachment/videos").to route_to("attachment/videos#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/attachment/videos/1").to route_to("attachment/videos#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/attachment/videos/1").to route_to("attachment/videos#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/attachment/videos/1").to route_to("attachment/videos#destroy", id: "1")
    end
  end
end
