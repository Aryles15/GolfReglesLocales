package com.generateur_regles_locales;

import com.generateur_regles_locales.models.*;
import com.generateur_regles_locales.models.*;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
class GenerateurReglesLocalesApplicationTests {

	@Autowired
	private CategorieRepository categorieRepository;

	@Autowired
	private SousCategorieRepository sousCategorieRepository;

	@Autowired
	private RegleRepository regleRepository;
	@Test
	@Transactional
	void createCategorie() {
		Categorie cat = new Categorie();
		cat.setTitle("Première catégorie");
		categorieRepository.save(cat);
		assertThat(cat.getId()).isNotNull();

		assertThat(cat.getSousCategories().size()).isEqualTo(0);

		assertThat(sousCategorieRepository.count()).isEqualTo(0);

		SousCategorie sousCat = new SousCategorie();
		sousCat.setTitle("hello");
		cat.getSousCategories().add(sousCat);

		sousCategorieRepository.save(sousCat);
		categorieRepository.save(cat);

		assertThat(sousCategorieRepository.count()).isEqualTo(1);
		Categorie cat0 = categorieRepository.getOne(cat.getId());
		assertThat(cat0.getSousCategories().size()).isEqualTo(1);
	}

	@Test
	@Transactional
	void sousCategorie() {

		//Assert.isTrue(sousCategorieRepository.count()==0," pas sous cat");
		assertThat(sousCategorieRepository.count()).isEqualTo(0);
		SousCategorie sousCat = new SousCategorie();
		sousCat.setTitle("Hello");
		Regle regle= new Regle();
		sousCat.getRegles().add(regle);
		regleRepository.save(regle);
		sousCategorieRepository.save(sousCat);

		assertThat(sousCategorieRepository.count()).isEqualTo(1);
		SousCategorie scat0 = sousCategorieRepository.getOne(sousCat.getId());
		assertThat(scat0.getRegles().size()).isEqualTo(1);
		//Assert.isTrue(sousCategorieRepository.count()==1," il doit y avoir 1 scat");
	}

	@Test
	@Transactional
	void createRegleSansIntroSansPenalite() {
		assertThat(regleRepository.count()).isEqualTo(0);

		Regle regle = new Regle();
		regle.setTitle("TitreTest");
		regle.setNumordre(1);
		//regle.setSouscategorie(sousCategorieRepository.findById(2).get());
		regleRepository.save(regle);
		assertThat(regle.getTitle()).isNotNull();
		assertThat(regle.getId()).isNotNull();


	}



}
