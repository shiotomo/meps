class MinecraftSettingFileDao
  class << self
    def get_whitelist
      whitelist_path = Dir.pwd + '/minecraft/whitelist.json'
      File.open(whitelist_path) do |f|
        @whitelist_json = JSON.load(f)
      end
      return @whitelist_json
    end

    def get_ops
      ops_path = Dir.pwd + '/minecraft/ops.json'
      File.open(ops_path) do |f|
        @ops_json = JSON.load(f)
      end
      return @ops_json
    end
  end
end
