<#import "main.ftlh" as m>

<@m.page title="Cahngez Titre de la Sous Categorie">
    <h1>Changer le titre de la Sous Rubrique</h1>

    <form style="margin-top: 20%;" action="/changesouscategorie/${souscategorie.id}" method="post" class="row">
        Nom Sous Rubriques ?<input type="text" name="newtitre">
        <button type="submit">Ajout</button>
    </form>

</@m.page>