# 🛒 Analyse E-Commerce & Logistique (Olist)

[![Power BI](https://img.shields.io/badge/Power_BI-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)](https://powerbi.microsoft.com/)
[![SQL](https://img.shields.io/badge/SQL-CC2927?style=for-the-badge&logo=microsoft-sql-server&logoColor=white)](https://en.wikipedia.org/wiki/SQL)
[![Data Modeling](https://img.shields.io/badge/Data_Modeling-Star_Schema-blue?style=for-the-badge)]()

## 📋 Contexte du Projet
Ce projet est une analyse approfondie du dataset public **Olist**, une plateforme e-commerce brésilienne. L'objectif est de comprendre la performance globale de l'entreprise en croisant trois axes majeurs : les ventes, l'efficacité logistique et la satisfaction client.

L'analyse a abouti à la création d'un **Tableau de Bord Interactif Power BI** destiné aux managers pour le pilotage de l'activité.

## 🎯 Objectifs Business
1.  **Suivi des Ventes :** Identifier les tendances de revenus, les produits phares (Pareto) et la saisonnalité.
2.  **Performance Logistique :** Analyser les délais de livraison réels vs estimés et identifier les zones géographiques à problèmes.
3.  **Satisfaction Client :** Comprendre les causes des mauvaises notes (Review Score) et mesurer la corrélation avec les retards de livraison.

## 🛠️ Stack Technique
* **Power BI Desktop :** Outil principal de visualisation.
* **Power Query (M) :** ETL, nettoyage et transformation des données brutes.
* **DAX :** Création de mesures complexes (ex: *Taux de retard*, *Panier moyen*, *Score NPS*).
* **SQL / CSV :** Sources de données initiales (9 tables relationnelles).

## ⚙️ Modélisation des Données
Pour assurer la performance du rapport, j'ai transformé les données brutes en un **Schéma en Étoile (Star Schema)** :
* **Table de Faits :** `Commandes` (Order_items + Orders + Payments)
* **Tables de Dimensions :** `Clients`, `Produits`, `Géolocalisation`, `Vendeurs`, `Temps`.

## 📊 Aperçu du Dashboard

### 1. Vue d'ensemble (KPIs & Carte)
*(Insère ici une capture d'écran de la page principale de ton dashboard)*
![Vue Générale](LIEN_VERS_TON_IMAGE_1.png)

### 2. Analyse Logistique & Satisfaction
*(Insère ici une capture d'écran de la page logistique ou satisfaction)*
![Logistique](LIEN_VERS_TON_IMAGE_2.png)

## 💡 Insights Clés
* **Corrélation Logistique/Satisfaction :** Une augmentation du délai de livraison de X jours entraîne une chute moyenne de Y points sur la note client.
* **Géographie :** Les états du [Nom Région] subissent les délais les plus longs malgré un volume de commande élevé.
* **Produits :** La catégorie [Nom Catégorie] représente Z% du chiffre d'affaires mais concentre le plus de retours négatifs.

## 🚀 Comment visualiser ce projet ?
Le fichier `.pbix` (Power BI) est disponible dans ce dépôt.

1.  Cloner le dépôt :
    ```bash
    git clone [https://github.com/michkath-aboudou/NOM_DU_REPO.git](https://github.com/michkath-aboudou/NOM_DU_REPO.git)
    ```
2.  Ouvrir le fichier `Olist_Analysis.pbix` avec **Power BI Desktop**.

---
*Projet réalisé par [Michkath ABOUDOU](https://www.linkedin.com/in/michkath-aboudou/)*
