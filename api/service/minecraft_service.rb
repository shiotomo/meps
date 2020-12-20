require 'zip'
require 'json'

class MinecraftService
  MINECRAFT_API = 'https://api.mojang.com/users/profiles/minecraft/'

  # whitelistを取得する
  def get_whitelist
    whitelist = MinecraftSettingFileDao.get_whitelist()
    return whitelist.to_json()
  end

  # opsを取得する
  def get_ops
    ops = MinecraftSettingFileDao.get_ops()
    return ops.to_json()
  end

  # nameからaccount情報を取得する
  def get_account_info(name)
    url = MINECRAFT_API + name
    headers = {}
    body = {}
    client = RequestClient.new(url, headers, body)
    response = client.get()
    return response
  end
end
