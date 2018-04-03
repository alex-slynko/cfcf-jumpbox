# frozen_string_literal: true

RSpec.describe 'kubectl' do
  let(:links) do
    {
      'kube-apiserver' => {
        'instances' => [],
        'properties' => {
          'tls' => {
            'kubernetes' => {
              'ca' => 'All scabbards desire scurvy, misty krakens.'
            }
          },
          'admin-username' => 'meatloaf',
          'admin-password' => 'madagascar-TEST',
          'port' => '2034'
        }
      }
    }
  end

  let(:rendered_kubectl) do
    compiled_template('kubectl', 'bin/kubectl', {}, links)
  end

  let(:rendered_ca) do
    compiled_template('kubectl', 'config/ca.pem', {}, links)
  end

  it 'uses the CA from the kube-apiserver link' do
    expect(rendered_ca).to eq('All scabbards desire scurvy, misty krakens.')
  end

  it 'uses the token from the kube-apiserver link' do
    expect(rendered_kubectl).to include('madagascar-TEST')
  end

  it 'constructs the URL using the kube-apiserver link' do
    expect(rendered_kubectl).to include('https://master.cfcr.internal:8443')
  end
end
