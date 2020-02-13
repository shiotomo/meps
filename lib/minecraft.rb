require 'zip'

class Minecraft
  class << self
    # minecraftディレクトリのバックアップを行う
    # backup配下に名前を日付にした圧縮フォルダを配置する
    def world_backup(version, minecraft_server_path, minecraft_server_back_up_path)
      dir_name = create_back_up_dir_name(version)
      compress(minecraft_server_path, minecraft_server_back_up_path + '/' + dir_name)
      return 'Backup Success !!'
    end

    private
    # バックアップフォルダ名を取得する
    def create_back_up_dir_name(version)
      time = Time.new
      dir_name = 'version_' + version + '_' + time.strftime("%Y%m%d%H%M%S") + '.zip'
      return dir_name
    end

    # zipファイルを作成する
    def compress(path, zip_path)
      File.unlink zip_path if File.file?(zip_path)
      target_files = []
      Dir.glob("#{path}/*").each do |i|
        target_files.push(File.basename(i))
      end
      Zip::File.open(zip_path, Zip::File::CREATE) do |z_fp|
        # z_fp.add(File.basename(path), path)
        target_files.each do |file|
          z_fp.add(file, "#{path}/#{file}")
        end
      end
    end
  end
end