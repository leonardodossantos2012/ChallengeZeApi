*** Settings ***
Resource            ../Resource/OpenWeatherKeywords.robot

Documentation
...                Narrativa do usuario: Saber o clima de uma região
...                Como usuario do open weather
...                Gostaria de saber o clima atual da cidade
...                Para que eu possa me programar para viajar

*** Test Cases ***
Cenario 01 - Validar busca por cidade
    Given que eu tenha inforfmado a cidade  Caieiras  200
    When verifico se a região retornada é da cidade  Caieiras
    Then é retornado uma descrição do clima

Cenario 02 - Validar retorno do status 404
    Given que eu tenha inforfmado a cidade  Não existe  404
    Then é retornado a mensagem  city not found
    And valido se o json schema esta correto  404

Cenario 03 - Validar retorno do status 401
    Given que eu tenha inforfmado a appid  teste123
    Then é retornado a mensagem  Invalid API key. Please see http://openweathermap.org/faq#error401 for more info.
    And valido se o json schema esta correto  401

Cenario 04 - Validar retorno do status 400
    Given que eu não tenha passado a cidade
    Then é retornado a mensagem  Nothing to geocode
    And valido se o json schema esta correto  400