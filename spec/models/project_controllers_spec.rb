require 'rails_helper'

RSpec.describe 'renders all controller metadata' do
  let(:controller) { TasksController }
  subject { RailsGrapher::ProjectControllers.new(controller).definition }

  it 'returns all models' do
    expect(subject).to eq({ 'actions' => { 'create' => [], 'edit' => [], 'index' => %i[html js xml], 'new' => [],
                                           'update' => [] } })
  end
end
