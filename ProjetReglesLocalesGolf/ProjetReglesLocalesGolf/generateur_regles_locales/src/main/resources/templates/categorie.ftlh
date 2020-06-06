<#import "main.ftlh" as m>

<@m.page title="Liste des Rubriques">
    <ul class="list-group">
    <form action="/newcategorie" method="post" class="row">
        New Categorie ?
        Titre <input type="text" name="NewNameTitle">
        Code <input type="text" name="NewNameCode">
        <button type="submit">Ajouter</button>
    </form>
    <form action="/regleselect" method="post">
        <#list categories as categorie>
            <h2>${categorie.code}"."${categorie.title}</h2>
            <a href="/changecateg/${categorie.id}">Changer titre rubriques</a>
            <a href="/newsouscateg/${categorie.id}">Nouvelle Sous Rubrique</a>
            <a href="/categoriedelete/${categorie.id}">Suprimer la Categorie </a>

            <#list categorie.getSousCategories() as souscat>
                <li  class="list-group-item">
                    <h3>${souscat.title}</h3>
                    <a href="/changesouscateg/${souscat.id}">Changer titre  Sous-rubriques</a>
                    <a href="/souscategoriedelete/${souscat.id}">Suprimer la Sous Categorie </a>
                    <a href="/newnextregle/${souscat.id}">Nouvelle Regles</a>

                </li>


                <#list souscat.getRegles() as regles >
                    <ul>
                        <li  class="list-group-item">

                            <h4>${regles.corpus}</h4>

                            <!--PREMIERE SOLUTION FORMULAIRE A CHAQUE REGLES AVEC UN BUTTON SUBMIT-->
                            <input type="checkbox"  id="idregles" name="idregles" value="${regles.id}">


                            <!-- DEUXIEM SOLUTION HREF SELECTIONNABLE-->
                            <!-- <a href="/regleselect/${regles.id}">Selectionner la regles</a>-->

                            <!--bouton a la fin en dehors de la list -->

                            <!-- 3eme SOLUTION LIST DE REGLES COMPRIS DANS UN FORMULAIRE, BOUTON SUBMIT EN DEHOR DE LA LIST -->
                            <a href="/changeregle/${regles.id}">Editer la Regle</a>
                            <a href="/regledelete/${regles.id}">Suprimer la Regle </a>
                        </li>
                    </ul>
                </#list>

            </#list>

        </#list>
        <button type="submit">Ajout à la liste</button>
    </form>
    <h1>Liste des regles choisis</h1>
</@m.page>