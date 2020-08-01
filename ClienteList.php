<?php
require_once 'classes/Cliente.php';

class ClienteList
{
    private $html;

    public function __construct()
    {
        $this->html = file_get_contents('html/list.html');
    }

    public function delete($param)
    {
        try 
        {
            $id = (int) $param['id'];
            Cliente::delete($id);
        } 
        
        catch (Exception $e) {
            echo $e->getMessage();
        }
    }

    public function load()
    {
        try 
        {
            $clientes = Cliente::all();

            $items = '';
            // echo '<pre>';
            // var_dump($pessoas);
            foreach ($clientes as $cliente)
            {     
                $item = file_get_contents('html/item.html');
                $item = str_replace('{id}', $cliente['id'], $item);
                $item = str_replace('{nome_completo}', $cliente['nome_completo'], $item);
                $item = str_replace('{email}', $cliente['email'], $item);
                $item = str_replace('{cpf}', $cliente['cpf'], $item);
                $item = str_replace('{telefone}', $cliente['telefone'], $item);
            
                $items .= $item;

            }
            $this->html = str_replace('{items}', $items, $this->html);
        } 
        catch (Exception $e) 
        {
            echo $e->getMessage();
        }
    }

    public function show()
    {
        $this->load();
        echo $this->html;
    }


}
