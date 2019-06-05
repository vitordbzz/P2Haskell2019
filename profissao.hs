postProfissaoR :: Handler Html
postProfissaoR = do
    ((res,_),_) <- runFormPost (formProfissao Nothing)
    case res of
        FormSuccess profissao -> do
            runDB $ insert profissao
            setMessage [shamlet|
                <footer>
                    Profissao CADASTRADA COM SUCESSO!
            |]
            redirect HomeR
        _ -> redirect HomeR