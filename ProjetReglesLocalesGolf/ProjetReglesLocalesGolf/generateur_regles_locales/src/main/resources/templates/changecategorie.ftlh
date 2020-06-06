<#import "main.ftlh" as m>

<@m.page title="Liste des Rubriques">
    <style>body{background-color: black;color: aliceblue;text-align: center;}</style>

  <h1>Changer le titre de la Rubrique</h1>

    <form style="margin-top: 20%;" action="/changecategorie/${categorie.id}" method="post" class="row">
        New name Rubriques ?<input type="text" name="newtitre">
        <button type="submit">Ajout</button>
    </form>

</@m.page>