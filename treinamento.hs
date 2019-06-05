postTreinamentoR :: Handler Html
postTreinamentoR = do
    -- LE DO FORM
    ((res,_),_) <- runFormPost (formTreinamento Nothing)
    case res of
        FormSuccess treinamento -> do
            runDB $ insert treinamento
            setMessage [shamlet|
                <footer>
                    Treinamento CADASTRADO COM SUCESSO!
            |]
            redirect HomeR
        _ -> redirect HomeR