<?php
class Cliente
{

    private static $conn;

    public static function getConnection()
    {
        if(empty(self::$conn))
        {
        $ini = parse_ini_file('config/clientes.ini');
        $host = $ini['host'];
        $name = $ini['name'];
        $user = $ini['user'];
        $pass = $ini['pass'];
        $port = $ini['port'];
        self::$conn = new PDO("mysql:host={$host};port={$port};dbname={$name}",$user,$pass);
        self::$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        }
        return self::$conn;
    }

    public static function find($id)
    {
        try
        {
            $conn = self::getConnection();
            
            $result = $conn->prepare("select * from cliente WHERE id= :id");
            $result->execute([':id' => $id]);
            return $result->fetch();
            

        $conn = null;
        }
        catch (PDOException $e)
        {
            print $e->getMessage();
        }
    }

    public static function delete($id)
    {
        try
        {
            $conn = self::getConnection();
            
            $result = $conn->prepare("DELETE from cliente WHERE id= :id");
            $result->execute([':id' => $id]);
            return $result;
            

        $conn = null;
        }
        catch (PDOException $e)
        {
            print $e->getMessage();
        }
    }

    public static function all()
    {
        try
        {
            $conn = self::getConnection();
            
            $result = $conn->query("select * from cliente ORDER BY id desc");
            return $result->fetchAll();
            

        $conn = null;
        }
        catch (PDOException $e)
        {
            print $e->getMessage();
        }
    }

    public static function save($cliente)
    {
        try
        {
            $conn = self::getConnection();
            $id = addslashes($cliente['id']);
            $nome_completo = addslashes($cliente['nome_completo']);
            $email = addslashes($cliente['email']);
            $cpf = addslashes($cliente['cpf']);
            $telefone = addslashes($cliente['telefone']);
           
            if (empty($id)) ///Insere o registro
            {
                $sql = "INSERT INTO cliente (nome_completo, email, cpf, telefone) 
                VALUES ('$nome_completo', 
                        '$email', 
                        '$cpf', 
                        '$telefone')";
            }
            else // Atualiza o registro
            {
                $sql = "UPDATE cliente SET
                nome_completo = '$nome_completo',
                email = '$email',
                cpf = '$cpf',
                telefone = '$telefone'
               
                WHERE id = '$id'";
            }

            return $conn->query($sql);
            

        $conn = null;
        }
        catch (PDOException $e)
        {
            print $e->getMessage();
        }
    }

    
}