require 'spec_helper'

describe Bilbot do
  let(:user) { Bilbot::User.new }
  let(:rantanplan) { Bilbot::Rantanplan.new(user, followings) }

  describe '#action' do
    context 'the queue is empty' do
      let(:followings) { [] }

      it 'shouldn\'t hit the follow method', :vcr do
        Bilbot::User.any_instance.should_not_receive(:follow)
        rantanplan.action
      end
    end

    context 'the queue is not empty' do
      let(:followings) { ['tobware', 'tarte_au_sucre'] }

      it 'should hit the follow method', :vcr do
        Bilbot::User.any_instance.should_receive(:follow).with('tarte_au_sucre')
        rantanplan.action
      end
    end
  end
end
