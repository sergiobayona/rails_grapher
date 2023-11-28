require 'rails_helper'

RSpec.describe 'renders all controller metadata' do
  let(:controller) { TasksController }
  subject { RailsGrapher::ProjectControllers.new(controller).definition }

  it 'returns all models' do
    expect(subject.keys).to eq(%w[actions])
  end

  # it 'returns all attributes' do
  #   expect(subject['attributes'].first.keys).to eq(['completed_at'])
  #   expect(subject['attributes'].first['completed_at'].keys).to eq(%i[type limit default null])
  # end
end
