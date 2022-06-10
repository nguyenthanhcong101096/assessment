RSpec.shared_examples "should add new 1 record" do |record_class|
  it { expect { subject }.to change(record_class, :count).by(1) }
end

RSpec.shared_examples "should delete 1 record" do |record_class|
  it { expect { subject }.to change(record_class, :count).by(-1) }
end

RSpec.shared_examples "should not change record" do |record_class|
  it { expect { subject }.to change(record_class, :count).by(record_class.count) }
end