require "rails_helper"

describe Analysis do
  let(:analysis) {FactoryGirl.create(:analysis)}

  it "#factory_creat_success" do
    expect {
      FactoryGirl.create :analysis
    }.to change { Analysis.count }.by(1)
  end

  it "#order success" do
    analysis1 = FactoryGirl.create(:analysis, no: 1)
    analysis2 = FactoryGirl.create(:analysis, no: 2)
    analysis3 = FactoryGirl.create(:analysis, no: 3)
    
    expect(Analysis.all).to eq([analysis1, analysis2, analysis3])
  end
end