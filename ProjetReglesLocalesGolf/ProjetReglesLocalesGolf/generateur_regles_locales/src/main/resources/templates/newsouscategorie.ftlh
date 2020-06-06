<#import "main.ftlh" as m>

<@m.page title="Liste des Rubriques">
    <style></style>

    <h1>Ajouter le titre de la SousRubrique</h1>

    <form style="margin-top: 20%;" action="/newsouscategorie/${categorie.id}" method="post" class="row">
        New name SousRubriques ?<input type="text" name="NewTitle">
        <button type="submit">Ajouter</button>
    </form>

</@m.page>