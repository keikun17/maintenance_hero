require 'rails_helper'

describe ApplicationHelper do
  describe '#local_date' do
    subject { helper.local_date(date) }

    context "with date" do
      let(:date) {Date.today}
      it { is_expected.not_to be_blank }
    end

    context "no date" do
      let(:date) {nil}
      it { is_expected.to be_blank }
    end
  end
end
