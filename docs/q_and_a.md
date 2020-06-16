# Q & A

## Q. make buildでエラーがでます。

A. DockerComposeやDockerの設定が正しいか確認してください。  
permission関連のエラーが出ている場合は、`make build`を実行したあと、
`sudo docker-compose build`を実行することでエラーを回避することもできます。
