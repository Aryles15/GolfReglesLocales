<#import "main.ftlh" as m>

<@m.page title="Liste des Rubriques">

    <form action="/newcategorie" method="post" class="row">
        New Categorie ?
        Titre <input type="text" name="NewNameTitle">
        Code <input type="text" name="NewNameCode">
        <button class="btn btn-warning" type="submit">Ajouter</button>
    </form>
    <ul class="list-group">
        <form action="/regleselect" method="post">
            <#list categories as categorie>
                <li class="list-group-item active">
                    <div class="row">
                        <h2>${categorie.code}"."${categorie.title}</h2>
                        <input value="Afficher / Masquer" type="button" class="btn btn-success" onclick="AfficherMasquerCateg(${categorie.id})"></input>
                    </div>
                </li>

                <div id="${categorie.id}" style="display:none;">

                    <a href="/changecateg/${categorie.id}">Changer titre rubriques</a>
                    <a href="/newsouscateg/${categorie.id}">Nouvelle Sous Rubrique</a>
                    <a href="/categoriedelete/${categorie.id}">Suprimer la Categorie </a>

                    <#list categorie.getSousCategories() as souscat>
                        <li class="list-group-item">
                            <div class="row">
                                <h3>${souscat.numordre}.${souscat.title}</h3>
                                <input value="Afficher/Masquer" type="button" class="btn btn-success" onclick="AfficherMasquerCateg(1${souscat.id})"></input>
                            </div>
                        </li>
                        <div id="1${souscat.id}" style="display:none;">

                            <a href="/changesouscateg/${souscat.id}">Changer titre Sous-rubriques</a>
                            <a href="/souscategoriedelete/${souscat.id}">Suprimer la Sous Categorie </a>
                            <a href="/newnextregle/${souscat.id}">Nouvelle Regles</a>

                            <#list souscat.getRegles() as regles >
                                <ul>
                                    <li class="list-group-item">

                                        <h4>${regles.numordre}.${regles.corpus}</h4>

                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" id="defaultUnchecked${regles.id}"
                                                   name="idregles" value="${regles.id}">
                                            <label class="custom-control-label" for="defaultUnchecked${regles.id}"></label>
                                        </div>

                                        <a href="/changeregle/${regles.id}">Editer la Regle</a>
                                        <a href="/regledelete/${regles.id}">Suprimer la Regle </a>
                                    </li>
                                </ul>
                            </#list>

                        </div>
                    </#list>
                </div>
            </#list>
            <button  class="btn btn-warning" type="submit">Ajout à la liste</button>
        </form>
    </ul>


    <script type="text/javascript">

        //La putain dsa race, peut pas utiliser la meme fonction car id categ ce confond avec id sous categ
        // .; arrive pas a utiliser deux param ca grand mere
        function AfficherMasquerCateg(id) {
            div = document.getElementById(id);
            if (div.style.display === "none") {
                div.style.display = "block";
            } else {
                div.style.display = "none";
            }
        }


    </script>



</@m.page>