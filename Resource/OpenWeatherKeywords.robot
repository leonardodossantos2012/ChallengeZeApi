*** Settings ***
Variables        ../Resource/env.py

Library         RequestsLibrary
Library         JsonValidator
Library         Collections

*** Variables ***
${APY_KEY}

*** Keywords ***
###Condicao
que eu tenha inforfmado a cidade
    [Arguments]  ${cidade}  ${status_code}
    Create Session   data        ${DEV}  verify=true
    &{PARAMS}       Create Dictionary         q=${cidade}       APPID=${API_KEY}
    ${RESPOSTA}  Get on Session   data        weather   params=&{PARAMS}  expected_status=${status_code}
    SET GLOBAL VARIABLE  ${RESPOSTA}

que eu não tenha passado a cidade
    Create Session   data        ${DEV}  verify=true
    &{PARAMS}       Create Dictionary        APPID=${API_KEY}
    ${RESPOSTA}  Get on Session   data        weather   params=&{PARAMS}  expected_status=400
    SET GLOBAL VARIABLE  ${RESPOSTA}

que eu tenha inforfmado a appid
    [Arguments]  ${api_key_invalid}
    Create Session   data        ${DEV}  verify=true
    &{PARAMS}       Create Dictionary        APPID=${api_key_invalid}
    ${RESPOSTA}  Get on Session   data        weather   params=&{PARAMS}  expected_status=401
    SET GLOBAL VARIABLE  ${RESPOSTA}

###Acao
verifico se a região retornada é da cidade
    [Arguments]  ${cidade}
    Should Be Equal As Strings      ${RESPOSTA.json()["name"]}      ${cidade}


###Validacao
é retornado uma descrição do clima
    Should Not Be Empty    ${RESPOSTA.json()["weather"]}  description

é retornado a mensagem
    [Arguments]  ${not_found}
    Should Be Equal As Strings      ${RESPOSTA.json()["message"]}      ${not_found}

valido se o json schema esta correto
    [Arguments]  ${status}
    Validate Jsonschema From File	  ${RESPOSTA.json()}   ${CURDIR}/JsonSchemas/JsonSchemaApi${status}.json