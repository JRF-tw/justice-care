require "rails_helper"

describe Analysis do
  let(:analysis) {FactoryBot.create(:analysis)}

  it "#factory_creat_success" do
    expect {
      FactoryBot.create :analysis
    }.to change { Analysis.count }.by(1)
  end

  it "#order success" do
    analysis1 = FactoryBot.create(:analysis, no: 1)
    analysis2 = FactoryBot.create(:analysis, no: 2)
    analysis3 = FactoryBot.create(:analysis, no: 3)
    
    expect(Analysis.all).to eq([analysis1, analysis2, analysis3])
  end
end