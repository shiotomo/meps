require 'yaml'

class DockerDao
  class << self
    # docker_compose.ymlに記されているコンテナイメージ名のリストを返却する
    def load_docker_compose_yml
      docker_compose_yml_path = Dir.pwd + '/docker-compose.yml'
      yaml = YAML.load_file(docker_compose_yml_path)
      container_list = yaml['services'].keys
      container_list = container_list.collect { |item| ENV['PROJECT_NAME'] + '_' + item }
      return container_list
    end
  end
end
