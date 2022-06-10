RSpec.shared_examples "with response success" do
  it "conforms to request schema" do
    is_expected
    expect(response).to have_http_status(:ok)
  end
end

RSpec.shared_examples "with response not found" do
  it "conforms to request schema" do
    is_expected
    expect(response).to have_http_status(:not_found)
  end
end

RSpec.shared_examples "with response unauthorized" do
  it "conforms to request schema" do
    is_expected
    expect(response).to have_http_status(:unauthorized)
  end
end

RSpec.shared_examples "render index template" do
  it do
    is_expected
    is_expected.to be_successful
    is_expected.to render_template(:index)
  end
end

RSpec.shared_examples "render new template" do
  it do
    is_expected
    is_expected.to be_successful
    is_expected.to render_template(:new)
  end
end

RSpec.shared_examples "render show template" do
  it do
    is_expected
    is_expected.to be_successful
    is_expected.to render_template(:show)
  end
end
