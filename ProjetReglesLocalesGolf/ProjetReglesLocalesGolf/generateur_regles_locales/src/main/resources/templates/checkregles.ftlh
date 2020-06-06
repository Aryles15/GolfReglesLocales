<#import "main.ftlh" as m>

<@m.page title="Liste des Rubriques">
    <style>body{text-align: center;}</style>

    <h1>Liste des regles choisis</h1>

    <#list regle as regles>
        <h1>${regle.title}</h1>
    </#list>

</@m.page>