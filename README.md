<h1 align="center">
    Zé Delivery Code Challenge
</h1>

## Sobre o Desafio

### Teste de Automação API

Queremos que você automatize uma suite de testes de API com abordagem **ATDD**

Crie testes automatizados para obter o clima usando a API Open Weather: 
[http://openweathermap.org/current](http://openweathermap.org/current)

#### Estrutura do projeto

    ├── .github                   
        ├── gitflows                            # Diretório de arquivos para rodar a pipeline
    ├── Resource                                # Diretório com as classes .robot que roda as keywords
        ├── JsonSchemas                         # Arquivos com validação do contrato de paylods de cada status das APIs
    ├── TestCase                                # Diretório para armazernar os cenários de testes  
    └── README.md                               # Documentação do projeto



### Configurando o projeto na sua máquina Windows
Para rodar o projeto na sua máquina será necessário ter as seguintes depedências:

- Ter uma IDE de sua preferência
- Python instalado: [Site de instalacao do python](https://www.python.org/downloads/)

> Copie o projeto
```
git clone https://github.com/leonardodossantos2012/ChallengeZeApi.git
```

> Instalar as dependencia do robot no seu terminal
```
cd C:\{PATH}\ChallengeZeApi
pip3 install -r .\requirements.txt
```

### Executando o projeto
> Acessar a pasta do projeto e executar o comando no seu terminal, informar um **API_KEY** valido gerado no site do openweathermap(igual no comando abaixo)
```
 robot -v API_KEY:8e51ef38d55470c7cdca8084303192f6 -d ./reports .\TestCase\ValidateApiOpenWeather.robot
```
<h1 align="center">
Execução no terminal
</h1>

![Terminal](https://user-images.githubusercontent.com/35806393/168165350-da4fa9e5-33ce-44e1-8126-4c8fa5a13f8a.gif)

<h1 align="center">
Execução no actions
</h1>

![Git hub actions](https://user-images.githubusercontent.com/35806393/168166182-b1f8cef4-c4da-49fe-ac82-3f4e2aaf0267.gif)


<h1 align="center">
Reports no Bucket S3
</h1>

![Amazon S3](https://user-images.githubusercontent.com/35806393/168166666-16a043b7-495b-4b16-8a05-ac8617a479fd.gif)

