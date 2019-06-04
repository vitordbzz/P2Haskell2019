-- SELECT * FROM Funcionario
getListFuncionarioR :: Handler Html
getListFuncionarioR = do 
    funcionarios <- runDB $ selectList [] [Asc FuncionarioNome]
    defaultLayout $(whamletFile "templates/funcionario.hamlet")