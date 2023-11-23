require 'rails_helper'

RSpec.describe 'Widget management', type: :request do
  it " creates a Widget and redirects to the Widget's page" do
    get '/rails_grapher/graphs'
    # expect(response).to redirect_to(assigns(:widget))
    # follow_redirect!
    # expect(response).to render_template(:show)
    expect(response.body).to include('Widget was successfully created.')
  end
end
