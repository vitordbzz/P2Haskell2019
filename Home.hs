getHomeR :: Handler Html
getHomeR = do
    sess <- lookupSession "_ID"
    defaultLayout $ do
        -- pasta: static/css/bootstrap.css
        -- / e . sao trocados por _
        addStylesheet $ StaticR css_bootstrap_css
        toWidgetHead [julius|
     
        |]
        toWidget [lucius|
            body {
                padding-top: 60px;
                padding-bottom: 40px;
            }
        |]
        [whamlet|

            <h1 class>
                <img src="static/telainicial.png"><br>
                SISTREINA - Sistema de Treinamento Interno
            
            <ul>
                <li>
                    <a href=@{TreinamentoR}>
                        Cadastro de Treinamento
                <li>
                    <a href=@{ProfissaoR}>
                        Cadastro de Profissao
                <li>
                    <a href=@{UsuarioR}>
                        Cadastro de Usuario
                <li>
                    <a href=@{ListTreinamentoR}>
                        Listar Treinamentos
                <li>
                    <a href=@{ListProfissaoR}>
                        Listar Profissoes
                $maybe _ <- sess 
                    <li>
                        <form action=@{LogoutR} method=post>
                            <input type="submit" value="Sair">
                $nothing
                    <li>
                        <a href=@{LoginR}>
                            Entrar
            
        |]