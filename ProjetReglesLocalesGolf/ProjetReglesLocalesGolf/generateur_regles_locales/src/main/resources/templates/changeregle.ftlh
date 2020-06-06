<#import "main.ftlh" as m>

<@m.page title="Changez la regle">
    <style>body{}</style>

    <h1>Changer le titre de la Sous Rubrique</h1>

    <form style="margin-top: 20%;" action="/changeregleformulaire/${regle.id}" method="post" class="row">
        Nouvelle Regle ?<input type="text" name="newregle">
        <button type="submit">Ajout</button>
    </form>

</@m.page>