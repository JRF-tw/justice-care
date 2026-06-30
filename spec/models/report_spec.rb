require "rails_helper"

describe Report do
  let(:report) {FactoryBot.create(:report)}

  it "#factory_creat_success" do
    expect {
      FactoryBot.create :report
    }.to change { Report.count }.by(1)
  end

  it "#order success" do
    analysis = FactoryBot.create(:analysis)
    report1 = FactoryBot.create(:report, no: 1, analysis: analysis)
    report2 = FactoryBot.create(:report, no: 2, analysis: analysis)
    report3 = FactoryBot.create(:report, no: 3, analysis: analysis)
    
    expect(analysis.reports).to eq([report1, report2, report3])
  end
end