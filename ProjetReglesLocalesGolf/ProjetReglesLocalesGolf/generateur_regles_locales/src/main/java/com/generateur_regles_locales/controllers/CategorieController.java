package com.generateur_regles_locales.controllers;

import com.generateur_regles_locales.models.*;
import com.generateur_regles_locales.models.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
public class CategorieController {
@Autowired
    private CategorieRepository categorieRepository;
@Autowired
    private SousCategorieRepository sousCategorieRepository;
@Autowired
    private RegleRepository regleRepository;

    @RequestMapping("/categories")
    public String categories(Model model) {
        List<Categorie> categories = categorieRepository.findAll();
        model.addAttribute("categories",categories);
        return "categorie";
    }

    @RequestMapping(value = "/changecateg/{id}", method = RequestMethod.GET)
    public String modifCategories(Model model, @PathVariable("id") Long id) {
        Categorie categ = categorieRepository.findById(id).get();
        model.addAttribute("categorie",categ);
        return "changecategorie";
    }

    @RequestMapping(value = "/changecategorie/{id}", method = RequestMethod.POST)
    public String modifyCategories(Model model, @PathVariable("id") Long id, @RequestParam("newtitre") String name) {
        Categorie categ = categorieRepository.findById(id).get();
        categ.setTitle(name);
        categorieRepository.save(categ);
        //model.addAttribute("categories", categorieRepository.findAll(categ));
        //Ligne au dessus //Comme le setAtribute dans les jsp ,                                                                           cette ligne sert a renvoyer au template ce que lon recup

        model.addAttribute("categories", categ);

        //return "golf";
        return "redirect:/changecateg/{id}";// on respect le prg ,
        // a chaque fois quon influe lapp ou bdd
        //on redirige jamais sur la meme page


    }



    @RequestMapping(value ="/newcategorie", method = RequestMethod.POST)
    public String NewCategorie (@RequestParam("NewNameTitle") String newt,@RequestParam("NewNameCode") String newc) {

        Categorie categ= new Categorie();
        categ.setTitle(newt);
        categ.setCode(newc);
        categorieRepository.save(categ);


        return "redirect:/categories";
    }

//////////////////////////////////////////NewSousCategorie

    @RequestMapping(value = "/newsouscateg/{id}", method = RequestMethod.GET)
    public String nextNewCategories(Model model, @PathVariable("id") Long id) {
        Categorie categ = categorieRepository.findById(id).get();
        //SousCategorie souscateg = sousCategorieRepository.findById(id).get();

        model.addAttribute("categorie",categ);
        //model.addAttribute("souscategorie",souscateg);

        return "newsouscategorie";
    }

    @RequestMapping(value = "/newsouscategorie/{id}", method = RequestMethod.POST)
    public String NewSousCategorie(Model model, @PathVariable("id") Long id, @RequestParam("NewTitle") String newtitle) {
        Categorie categ = categorieRepository.findById(id).get();
        SousCategorie souscateg = new SousCategorie();//new souscateg sur lid de la categorie
        souscateg.setCategorie(categ);
        souscateg.setTitle(newtitle);
        sousCategorieRepository.save(souscateg);


        return "redirect:/categories";// on respect le prg ,
        // a chaque fois quon influe lapp ou bdd
        //on redirige jamais sur la meme page
    }

//////////////////////////////////////////Regle

    @RequestMapping(value = "/newnextregle/{id}", method = RequestMethod.GET)
    public String nextRegles(Model model, @PathVariable("id") Long id) {
        //Categorie categ = categorieRepository.findById(id).get();
        SousCategorie souscateg = sousCategorieRepository.findById(id).get();
        //List<Regle> regle = regleRepository.findAllBySouscategorie(souscateg);

        //model.addAttribute("regle",regle);
        //model.addAttribute("categorie",categ);
        model.addAttribute("souscategorie",souscateg);

        return "newregle";
    }

    @RequestMapping(value = "/newregletexte/{id}", method = RequestMethod.POST)
    public String NewRegle(Model model, @PathVariable("id") Long id, @RequestParam("NewTitle") String newtitle) {
        SousCategorie souscateg = sousCategorieRepository.findById(id).get();
        Regle regle = new Regle();
        regle.setSouscategorie(souscateg);
        regle.setCorpus(newtitle);
        regleRepository.save(regle);


        return "redirect:/categories";// on respect le prg ,
        // a chaque fois quon influe lapp ou bdd
        //on redirige jamais sur la meme page
    }

//////////////////////////////////////////////Delate

    @RequestMapping(value = "/categoriedelete/{id}", method = RequestMethod.GET)
    public String DeleteCategorie (Model model, @PathVariable("id") Long id) {
        Categorie categ = categorieRepository.findById(id).get();
        //SousCategorie souscateg = sousCategorieRepository.findById(id).get();
        List<SousCategorie> souscatego = sousCategorieRepository.findAllByCategorie(categ);

        for (SousCategorie sous: souscatego){
            List<Regle> regle = regleRepository.findAllBySouscategorie(sous);
            for (Regle reg: regle){
                regleRepository.delete(reg);
            }
            sousCategorieRepository.delete(sous);
        }


        //sousCategorieRepository.deleteById(id);
        //regleRepository.delete(regle);
        //sousCategorieRepository.deleteById(id);



        categorieRepository.deleteById(id);

        return "redirect:/categories";
    }

    @RequestMapping(value = "/souscategoriedelete/{id}", method = RequestMethod.GET)
    public String DeleteSousCategorie (Model model, @PathVariable("id") Long id) {
        SousCategorie souscateg = sousCategorieRepository.findById(id).get();
        List<Regle> regle = regleRepository.findAllBySouscategorie(souscateg);

            for (Regle reg: regle){
                regleRepository.delete(reg);
            }
            sousCategorieRepository.delete(souscateg);

        return "redirect:/categories";
    }

    @RequestMapping(value = "/regledelete/{id}", method = RequestMethod.GET)
    public String DeleteRegle (Model model, @PathVariable("id") Long id) {

        Regle regles = regleRepository.findById(id).get();
        regleRepository.delete(regles);

        return "redirect:/categories";
    }

   @RequestMapping(value = "/regleselect", method = RequestMethod.POST)
    public String SelectRegle (Model model, @RequestParam("idregles") List<Long> idreg) {
         List<Regle> Listregleselect = new ArrayList<>();

       Regle regles = new Regle();

         for (Long id: idreg ){
             regles = regleRepository.findById(id).get();
             Listregleselect.add(regles);
         }




        model.addAttribute("listeregles",Listregleselect);
        model.addAttribute("regles",regles);

       // System.out.println("liste de regle "+regles);

        return "checkregles";
    }



}

