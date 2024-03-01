# frozen_string_literal: true

require 'spec_helper'

RSpec.describe ValidatesIdentity::ArDni::Validator do
  it 'rejects 1.123.123' do
    expect(described_class.new('1.123.123')).not_to be_valid
  end

  it 'rejects 12.12.123' do
    expect(described_class.new('12.12.123')).not_to be_valid
  end

  it 'rejects 12.123.12' do
    expect(described_class.new('12.123.12')).not_to be_valid
  end

  it 'rejects 12345' do
    expect(described_class.new('12345')).not_to be_valid
  end

  it 'accepts blank string' do
    expect(described_class.new('')).to be_valid
  end

  it 'accepts nil' do
    expect(described_class.new(nil)).to be_valid
  end

  it 'accepts 12.123.123' do
    expect(described_class.new('12.123.123')).to be_valid
  end

  it 'accepts 12123123' do
    expect(described_class.new('12123123')).to be_valid
  end

  it 'accepts 12.456.789' do
    expect(described_class.new('12.456.789')).to be_valid
  end
end
