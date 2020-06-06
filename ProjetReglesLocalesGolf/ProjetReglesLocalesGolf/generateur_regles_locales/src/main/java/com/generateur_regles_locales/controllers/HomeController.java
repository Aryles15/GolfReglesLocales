package com.generateur_regles_locales.controllers;

import com.generateur_regles_locales.models.*;

public class HomeController {
}

/*
package com.groupe2.generateur_regles.controllers;

        import com.groupe2.generateur_regles.models.*;
        import org.springframework.beans.factory.annotation.Autowired;
        import org.springframework.stereotype.Controller;
        import org.springframework.ui.Model;
        import org.springframework.web.bind.annotation.RequestMapping;
        import org.springframework.web.bind.annotation.RequestMethod;
        import org.springframework.web.bind.annotation.ResponseBody;

        import java.util.List;

@Controller
public class test {
    @Autowired
    private CategorieRepository categorieRepository;
    @Autowired
    private SousCategorieRepository sousCategorieRepository;
    @Autowired
    private RegleRepository regleRepository;
    @RequestMapping("/home")
    @ResponseBody
    public String home() {
        return "Hola";
    }
    @RequestMapping("/categories")
    public String categories(Model model) {
        List<Categorie> categories = categorieRepository.findAll();
        List<SousCategorie> souscategories ;
        List<Regle> regles ;
        //String toDisplay ="";
        for (Categorie cat: categories) {
            souscategories = sousCategorieRepository. findAllByCategorie(cat);
            // toDisplay +="::"+cat.getCode()+"//"+cat.getTitle();
            for (SousCategorie souscat : souscategories){
                regles = regleRepository.findAllBySouscategorie(souscat);
                cat.getSousCategories().add(souscat);
                //toDisplay +=cat.getCode()+"::"+souscat.getNumordre()+"[]"+souscat.getTitle();
                for (Regle regle : regles){
                    souscat.getRegles().add(regle);
                    model.addAttribute("regles",regles);
                    //toDisplay+=cat.getCode()+"//"+souscat.getNumordre()+"..."+regle.getNumordre()+"..."+regle.getTitle()+"-------";
                }
                model.addAttribute("souscategories",souscategories);
            }


        }
        //return toDisplay;
        model.addAttribute("categories",categories);
        return "categorie";
    }
}

*/