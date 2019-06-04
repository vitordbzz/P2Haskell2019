formProfissao :: Maybe Profissao -> Form Profissao
formProfissao mProfissao = renderBootstrap $ Profissao 
    <$> areq textField "Nome da Profissao: " (fmap profissaoNome mProfissao)
    <*> areq textField "Sigla: " (fmap profissaoSigla mProfissao)

-- ^ coloca outro html, no caso, os inputs
getProfissaoR :: Handler Html
getProfissaoR = do 
    (widget,enctype) <- generateFormPost (formProfissao Nothing)
    defaultLayout $ do
        [whamlet|
            <form action=@{ProfissaoR} method=post>
                ^{widget}
                <input type="submit" value="cadastrar profissao">
        |]
-- faz o post dos dados prof
postProfissaoR :: Handler Html
postProfissaoR = do
    ((res,_),_) <- runFormPost (formProfissao Nothing)
    case res of
        FormSuccess profissao -> do
            runDB $ insert profissao
            redirect ProfissaoR
        _ -> redirect HomeR