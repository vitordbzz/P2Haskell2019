formFuncionario :: TreinamentoId -> Form Funcionario
formFuncionario treid = renderBootstrap $ Funcionario 
    <$> areq textField "Nome do Funcionario: " Nothing
    <*> areq (selectField listTreinamento) "Treinamento" Nothing
    <*> areq (selectField listProfissao) "Profissao" Nothing
    <*> areq dayField "Data de Nascimento: " Nothing
    
listTreinamento = do
       entidades1 <- runDB $ selectList [] [Asc TreinamentoNome] 
       optionsPairs $ fmap (\ent -> (treinamentoNome $ entityVal ent, entityKey ent)) entidades1
       
listProfissao = do
       entidades2 <- runDB $ selectList [] [Asc ProfissaoNome]
       optionsPairs $ fmap (\ent -> (profissaoNome $ entityVal ent, entityKey ent)) entidades2