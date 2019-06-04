formLogin :: Form Usuario
formLogin = renderBootstrap $ Usuario 
        <$> areq emailField "E-mail:" Nothing
        <*> areq passwordField "Senha: " Nothing
    
getLoginR :: Handler Html
getLoginR = do 
    (widget,enctype) <- generateFormPost formLogin
    msg <- getMessage
    defaultLayout $ do
        [whamlet|
            $maybe mensagem <- msg
                ^{mensagem}
            <form action=@{LoginR} method=post>
                ^{widget}
                <input type="submit" value="entrar">
        |]

postLoginR :: Handler Html
postLoginR = do
    ((res,_),_) <- runFormPost formLogin
    case res of
        FormSuccess (Usuario "root@root123.com" "root") -> do 
            setSession "_ID" "root"
            redirect AdminR
        FormSuccess usuario -> do
            usuBanco <- runDB $ getBy $ UniqueRestEmail (usuarioEmail usuario)
            case usuBanco of 
                Just usuarioValido -> do 
                    if ((usuarioSenha usuario) == (usuarioSenha $ entityVal usuarioValido)) then do 
                        setSession "_ID" (usuarioEmail $ entityVal usuarioValido)
                        redirect HomeR
                    else do
                        setMessage [shamlet|
                            <h1>
                                Senha invalida
                        |]
                        redirect LoginR
                        
                Nothing -> do
                    setMessage [shamlet|
                        Usuario n encontrado
                    |]
                    redirect LoginR
        _ -> redirect HomeR