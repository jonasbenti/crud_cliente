    <?php
    require_once 'classes/Cliente.php';

    class ClienteForm
    {
    private $html;
    private $data;

    public function __construct() {
        $this->html = file_get_contents('html/form.html');
        $this->data = [
        'id' => null,
        'nome_completo' => null,
        'email' => null,
        'cpf' => null,
        'telefone' => null
        ];

        }

        public function edit($param)
        {
            try 
            {
                $id = (int) $param['id'];
                $this->data = Cliente::find($id);
            } 
            catch (Exception $e) {
                echo $e->getMessage();
            }
        }

        public function save($param)
        {
            try 
            {
                Cliente::save($param);
                $this->data = $param;
                header("Location: index.php");

            } 
            catch (Exception $e) {
                echo $e->getMessage();
            }
        }

        public function show()
        {
            $this->html  = file_get_contents('html/form.html');
            $this->html  = str_replace('{id}', $this->data['id'], $this->html );
            $this->html  = str_replace('{nome_completo}', $this->data['nome_completo'], $this->html );
            $this->html  = str_replace('{email}', $this->data['email'], $this->html );
            $this->html  = str_replace('{cpf}', $this->data['cpf'], $this->html );
            $this->html  = str_replace('{telefone}', $this->data['telefone'], $this->html );
     
            echo $this->html;
        }



    }


