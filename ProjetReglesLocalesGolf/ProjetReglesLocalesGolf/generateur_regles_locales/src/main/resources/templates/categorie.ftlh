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
                <li class=" divCategTitre list-group-item active">
                    <div class="row" onclick="AfficherMasquerCateg(${categorie.id})">
                        <h3>${categorie.code}.${categorie.title}</h3>
                        <!--  <input value="Afficher / Masquer" type="button" class="btn btn-success" onclick="AfficherMasquerCateg(${categorie.id})"></input>-->
                    </div>
                </li>

                <div id="${categorie.id}" class="divCateg" style="display:none;">

                    <a href="/changecateg/${categorie.id}">Changer titre rubriques</a>
                    <a href="/newsouscateg/${categorie.id}">Nouvelle Sous Rubrique</a>
                    <a href="/categoriedelete/${categorie.id}">Suprimer la Categorie </a>

                    <#list categorie.getSousCategories() as souscat>
                        <ul>
                            <li class="list-group-item">
                                <div class="row">
                                    <h5>${categorie.code}.${souscat.numordre}.${souscat.title}</h5>
                                    <input value="Afficher/Masquer" type="button" class="btn btn-success"
                                           onclick="AfficherMasquerCateg(1${souscat.id})"></input>
                                </div>
                            </li>
                        </ul>
                        <div id="1${souscat.id}" class="divSousCateg" style="display:none;">

                            <ul>
                                <li>
                                    <a href="/changesouscateg/${souscat.id}">Changer titre Sous-rubriques</a>
                                    <a href="/souscategoriedelete/${souscat.id}">Suprimer la Sous Categorie </a>
                                    <a href="/newnextregle/${souscat.id}">Nouvelle Regles</a>
                                    <a href="/changesouscategobjet/${souscat.id}">Changer objet</a>

                                    <p>Objet: </br>${souscat.objet}</p>
                                </li>

                            </ul>

                            <#list souscat.getRegles() as regles >
                                <ul>
                                    <li class="list-group-item">

                                        <h7>${categorie.code}.${souscat.numordre}-${regles.numordre}
                                            .${regles.corpus}</h7>

                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input"
                                                   id="defaultUnchecked${regles.id}"
                                                   name="idregles" value="${regles.id}">
                                            <label class="custom-control-label"
                                                   for="defaultUnchecked${regles.id}"></label>
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

            <button class="btn btn-warning" type="submit">Ajout à la liste</button>
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