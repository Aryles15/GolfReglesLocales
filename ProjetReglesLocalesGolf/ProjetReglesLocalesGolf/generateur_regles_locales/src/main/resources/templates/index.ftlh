<#import "main.ftlh" as m>

<@m.page title="Bienvenue">
    <style>body{background-color: darkcyan;color: aliceblue;text-align: center;}</style>
    <div>
        <p>Vous pourez ici consulter la liste des règles locales en vigueur (2020)</p>
        <a href="/categories">Voir la liste des Rubriques</a>
    </div>
    <textarea id="to-copy">Ecrit la idiot.</textarea>
    <button  id="copy" type="button">Copy in clipboard</button>
    <script>

            var toCopy  = document.getElementById( 'to-copy' ),
                btnCopy = document.getElementById( 'copy' );

            btnCopy.addEventListener( 'click', function(){
                toCopy.select();
                document.execCommand( 'copy' );
                return false;
            } );

    </script>
</@m.page>