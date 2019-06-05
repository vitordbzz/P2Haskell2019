getLoginR :: Handler Html
getLoginR = do 
    (widget,enctype) <- generateFormPost formLogin
    msg <- getMessage
    defaultLayout $ do
        [whamlet|
            $maybe mensagem <- msg
                ^{mensagem}
            <br><br>    
            <form action=@{LoginR} method=post>
                ^{widget}
                <input type="submit" class="btn btn-primary" value="Entrar">
        |]