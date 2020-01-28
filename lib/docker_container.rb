require 'docker'
require 'yaml'

class DockerContainer
  class << self
    def get_status(current_dir)
      container_status_map = {}
      container_list = load_docker_compose_yml(current_dir)
      # return container_list
      cons = Docker::Container.all
      container_list.each do |container|
        container_status_map[:"#{container}"] = 'inactive'
      end
      cons.each do |con|
        next unless container_status_map.key?(:"#{con.info.fetch("Image")}")
        container_status_map[:"#{con.info.fetch("Image")}"] = 'active'
      end
      return container_status_map
    end

    # docker_compose.ymlに記されているコンテナイメージ名のリストを返却する
    # コンテナイメージ名はすべて"vmario_コンテナイメージ名"の形になる
    def load_docker_compose_yml(current_dir)
      docker_compose_yml_path = current_dir.to_s + '/docker-compose.yml'
      pp docker_compose_yml_path
      yaml = YAML.load_file(docker_compose_yml_path)
      container_list = yaml['services'].keys
      container_list = container_list.collect { |item| 'msns_' + item }
      return container_list
    end
  end
end
