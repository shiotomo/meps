require_relative '../../spec_helper'
require_relative '../../../lib/core/docker_container'

RSpec.describe 'docker_container' do
  context 'get_status' do
    it 'statusのkey情報が正しい' do
      # msnsのカレントディレクトリを取得
      dir = File.expand_path('.')
      status = DockerContainer.get_status(dir)
      expect(status.has_key?(:msns_api)).to eq true
      expect(status.has_key?(:msns_mc_server)).to eq true
    end

    it 'statusのvalue情報がactiveかinactiveである' do
      # msnsのカレントディレクトリを取得
      dir = File.expand_path('.')
      status = DockerContainer.get_status(dir)
      msns_api = status[:msns_api]
      msns_mc_server = status[:msns_mc_server]
      expect(msns_api).to match /(^active$|^inactive$)/
      expect(msns_mc_server).to match /(^active$|^inactive$)/
    end
  end
end
