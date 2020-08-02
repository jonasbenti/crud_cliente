# crud_clientes
Para rodar o projeto é necessário extrai-lo em um servidor, renomear o arquivo (que possui os dados de conexão com o BD) “clientes_conf.ini” para “clientes.ini” que está dentro da pasta config, e em seguida configurá-lo de acordo com o acesso ao seu banco de dados.
Na pasta db existe o arquivo clientes.sql que possui duas tabelas (cliente, log) e duas triggers (log_altera_cliente, log_deleta_cliente). As triggers são utilizadas para registrar todas as alterações e exclusões no cadastro de clientes (logs).
Neste projeto não foi utilizado nenhum framework, apenas PHP OO com PDO, Mysql, HTML e bootstrap. Para melhor organização e visualização foram separados os códigos html de PHP, e foi usada a biblioteca spl (spl_autoload_register) para implementar o carregamento automático das classes e/ou métodos.
