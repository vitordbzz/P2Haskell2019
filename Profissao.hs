getListProfissaoR :: Handler Html
getListProfissaoR = do 
    profissoes <- runDB $ selectList [] [Asc ProfissaoNome]
    defaultLayout $(whamletFile "templates/profissao.hamlet")
    
getPerfilProfissaoR :: ProfissaoId -> Handler Html
getPerfilProfissaoR profid = do 
    profissao <- runDB $ get404 profid
    defaultLayout $ do
        addStylesheet $ StaticR css_bootstrap_css
        toWidget [lucius|
            body {
                padding-top: 60px;
                padding-bottom: 40px;
            }
        |]
        [whamlet|
            <div>
                Profissao: #{profissaoNome profissao}
            <div>
                Sigla: #{profissaoSigla profissao}
        |]

postApagarProfissaoR :: ProfissaoId -> Handler Html
postApagarProfissaoR profid = do
    runDB $ get404 profid
    runDB $ delete profid
    redirect ListProfissaoR