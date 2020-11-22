require_relative '../../spec_helper'
require_relative '../../../lib/core/docker_container'

RSpec.describe 'docker_container' do
  context 'get_status' do
    it 'statusのkey情報が正しい' do
      # mepsのカレントディレクトリを取得
      dir = File.expand_path('.')
      status = DockerContainer.get_status(dir)
      expect(status.has_key?(:meps_api)).to eq true
      expect(status.has_key?(:meps_mc_server)).to eq true
    end

    it 'statusのvalue情報がactiveかinactiveである' do
      # mepsのカレントディレクトリを取得
      dir = File.expand_path('.')
      status = DockerContainer.get_status(dir)
      meps_api = status[:meps_api]
      meps_mc_server = status[:meps_mc_server]
      expect(meps_api).to match /(^active$|^inactive$)/
      expect(meps_mc_server).to match /(^active$|^inactive$)/
    end
  end
end
