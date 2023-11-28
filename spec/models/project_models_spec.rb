require 'rails_helper'

RSpec.describe 'renders all model metadata', type: :model do
  let(:task) { Task }
  subject { RailsGrapher::ProjectModels.new(task).definition }

  it 'returns all models' do
    expect(subject.keys).to eq(%w[attributes associations validations scopes methods])
  end

  it 'returns all attributes' do
    expect(subject['attributes'].first.keys).to eq(['completed_at'])
    expect(subject['attributes'].first['completed_at'].keys).to eq(%i[type limit default null])
  end
end
