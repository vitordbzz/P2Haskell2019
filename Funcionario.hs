getFuncionarioR :: TreinamentoId -> Handler Html
getFuncionarioR treid = do
    runDB $ get404 treid
    msg <- getMessage
    (widget,enctype) <- generateFormPost (formFuncionario treid)
    defaultLayout $ do
        addStylesheet $ StaticR css_bootstrap_css
        [whamlet|
            $maybe mensagem <- msg
                ^{mensagem}
            <form action=@{FuncionarioR treid} method=post enctype=#{enctype}>
                ^{widget}
                <input type="submit" value="Cadastrar">
        |]

postFuncionarioR :: TreinamentoId -> Handler Html
postFuncionarioR treid = do 
    ((res,_),_) <- runFormPost (formFuncionario treid)
    case res of 
        FormSuccess funcionario -> do 
            _ <- runDB $ insert funcionario
            setMessage [shamlet|
                <h2>
                    Funcionario CADASTRADO COM SUCESSO!
            |]
            redirect TreinamentoR
        _ -> redirect HomeR
    