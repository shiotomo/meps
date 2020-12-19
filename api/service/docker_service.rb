require 'docker'

require_relative '../dao/docker_dao.rb'

class DockerService
  # mepsの稼働状況を取得する
  def get_status
    container_status_map = {}
    container_list = DockerDao.load_docker_compose_yml()
    # return container_list
    cons = Docker::Container.all()
    container_list.each do |container|
      container_status_map[:"#{container}"] = 'inactive'
    end
    cons.each do |con|
      next unless container_status_map.key?(:"#{con.info.fetch("Image")}")
      container_status_map[:"#{con.info.fetch("Image")}"] = 'active'
    end
    return container_status_map
  end
end
