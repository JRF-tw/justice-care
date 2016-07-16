require "rails_helper"

describe Report do
  let(:report) {FactoryGirl.create(:report)}

  it "#factory_creat_success" do
    expect {
      FactoryGirl.create :report
    }.to change { Report.count }.by(1)
  end

  it "#order success" do
    analysis = FactoryGirl.create(:analysis)
    report1 = FactoryGirl.create(:report, no: 1, analysis: analysis)
    report2 = FactoryGirl.create(:report, no: 2, analysis: analysis)
    report3 = FactoryGirl.create(:report, no: 3, analysis: analysis)
    
    expect(analysis.reports).to eq([report1, report2, report3])
  end
end