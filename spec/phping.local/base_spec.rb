require 'spec_helper'

[22, 8081].each do |value| 

  describe port(value) do
    it {should be_listening}
  end

end

describe host('phping.local') do
  it {should be_reachable}
  it {should be_resolvable}
end
