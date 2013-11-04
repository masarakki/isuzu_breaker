# -*- coding: utf-8 -*-
require 'spec_helper'

describe Naka::Api::Master::ShipType do
  let(:ship_type) { mock_user.api.master.ship_type }
  subject { ship_type }
  it { should be_a Naka::Models::Master::Collection }
  context :find, 1 do
    subject { ship_type.find(1) }
    its(:name) { should == "海防艦" }
  end
end
