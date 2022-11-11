require "rails_helper"

RSpec.describe "Posts", type: :request do 
    describe "GET /post" do
        before { get "/post"}

        it "should return OK" do 
            payload = JSON.parse(response.body)
            expect(payload).to be_empty
            expect(response).to have_http_status(200)
        end

        describe "with data in the DB" do
            let(:posts) { create_list(:post, 10, published: true)}
            it "should return return all the published posts" do 
                payload = JSON.parse(response.body)
                expect(payload.size).to eq(posts.size)
                expect(response).to have_http_status(200)
            end 
        end
    end

    describe "GET /post/{id}" do
        let(:post) { create_list(:post)}
        it "should return return a post" do 
            payload = JSON.parse(response.body)
            expect(payload.size).to eq(posts.size)
            expect(response).to have_http_status(200)
        end 
    end
end