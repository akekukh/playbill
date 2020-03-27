require 'rails_helper'

RSpec.describe Performance, type: :model do
  it "has none to begin with" do
    expect(Performance.count).to eq 0
  end

  it "has one after adding one" do
    Performance.create(name: 'Сибирский цирюльник', duration: Date.today..Date.today+2.days)
    expect(Performance.count).to eq 1
  end

  context "has error if new Performance overlapps" do
    it do
      Performance.create(name: 'Сибирский цирюльник', duration: Date.today..Date.today+2.days)
      expect(Performance.create(
          name: 'Укрощение страптивого',
          duration: Date.today+1.day..Date.today+4.days
      ).errors.messages).to eq({duration: ["cannot intersect"]})
    end

    it do
      Performance.create(name: 'Сибирский цирюльник', duration: Date.today..Date.today+2.days)
      expect(Performance.create(
          name: 'Укрощение страптивого',
          duration: Date.today-1.day..Date.today+4.days
      ).errors.messages).to eq({duration: ["cannot intersect"]})
    end

    it do
      Performance.create(name: 'Сибирский цирюльник', duration: Date.today..Date.today+2.days)
      expect(Performance.create(
          name: 'Укрощение страптивого',
          duration: Date.today-1.day..Date.today+1.days
      ).errors.messages).to eq({duration: ["cannot intersect"]})
    end
  end
end
