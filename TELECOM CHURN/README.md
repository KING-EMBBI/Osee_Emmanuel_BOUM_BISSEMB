Voici une version hautement optimisée, immersive et premium de votre `README.md`.

Elle intègre votre identité de marque visuelle (le code couleur `#2e7d32` / `#0B132B`), une structure ultra-scannable pour les recruteurs (avec des icônes et des sections de code claires), et met en valeur la puissance de vos analyses (les tests statistiques de la phase 3, le choix de la métrique métier, et le pont technologique Python ➔ R Shiny).

---

```markdown
# 📈 Telecom Churn Predictive Intelligence Platform

[![Python Version](https://img.shields.io/badge/Python-3.10%2B-blue?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/)
[![R Shiny Version](https://img.shields.io/badge/R%20Shiny-bslib%20%2F%20v5-orange?style=for-the-badge&logo=r&logoColor=white)](https://shiny.posit.co/)
[![Model Champion](https://img.shields.io/badge/XGBoost-Classifier-green?style=for-the-badge&logo=xgboost)](https://xgboost.readthedocs.io/)
[![Explainability](https://img.shields.io/badge/SHAP-Framework-purple?style=for-the-badge)](https://shap.readthedocs.io/)

> **Architecture décisionnelle industrielle de bout en bout.** Cette plateforme unifie la puissance algorithmique de **Python (XGBoost de production)** pour l'ingénierie statistique et l'élégance managériale de **R Shiny (Bslib System)** pour le monitoring exécutif. Elle permet de substituer une approche marketing réactive par un protocole anticipatif, capable d'isoler les signaux faibles de rupture contractuelle.

---

## 📸 Interface du Dashboard & Design System

L'application utilise un *Design System* sur-mesure combinant un mode sombre premium (`#0B132B`) et des accents corporatifs (`#2e7d32`).

![Dashboard Executive Overview](https://via.placeholder.com/1000x500/0B132B/D4AF37?text=TELECOM+CHURN+PREDICTIVE+PLATFORM+SCREENSHOT)

---

## ⚡ Fonctionnalités Clés

* **Executive Monitoring :** Supervision en temps réel du taux de churn de la base, de la masse de revenus (FCFA/$) exposée au risque et du score d'attrition moyen.
* **Filtres de Segmentation Fluides :** Interactivité instantanée via des composants `virtualSelectInput` (Contrats, Technologies de connexion, Modes de facturation).
* **Predictive Center (Ops) :** Restitution embarquée des métriques de production (Courbe ROC dynamique et matrice de confusion matricielle).
* **Explainability Center (XAI) :** Ouverture de la "boîte noire" de l'algorithme via le framework **SHAP** (valeurs de Shapley issues de la théorie des jeux) pour auditer les décisions au niveau global et individuel.
* **Simulateur Actuariel de ROI :** Outil de simulation financière permettant aux directions marketing d'ajuster les budgets de rétention et de cibler exclusivement les profils à haute valeur.

---

## 🏗️ Architecture du Projet & Flux de Production

L'infrastructure applique une étanchéité stricte entre l'ingénierie de données (Data Science) et la couche de restitution (Business Intelligence) :

```text
TELECOM CHURN/
│
├── data/                           # Entrepôt de données (Brutes et Partitionnées)
│   ├── WA_Fn-UseC_-Telco-Customer-Churn.csv  # Dataset original Kaggle (7 043 clients)
│   ├── X_train.csv & X_test.csv    # Matrices d'apprentissage étanches
│   └── y_train.csv & y_test.csv    # Vecteurs cibles correspondants
│
├── pipeline/                       # Moteur d'Intelligence Artificielle (Python)
│   └── train_pipeline.py           # Pipeline complet (Audit, Nettoyage, XGBoost, Export SHAP)
│
├── dashboard/                      # Couche de Synchronisation Inter-Langage (CSV-Bridge)
│   ├── predictions_churn.csv       # Base décisionnelle exportée avec probabilités
│   ├── model_roc_data.csv          # Coordonnées TPR / FPR pour la courbe ROC
│   ├── model_metrics_table.csv     # Métriques de performance & Vérité terrain
│   └── shap_global_data.csv        # Contributions SHAP calculées par le modèle
│
└── app/                            # Interface Décisionnelle Exécutive (R Shiny)
    ├── global.R                    # Chargement des données d'ancrage & Design System
    ├── ui.R                        # Architecture UI moderne basée sur Bootstrap 5 (bslib)
    └── server.R                    # Moteur de rendu des graphiques interactifs (Highcharter)

```

---

## 🔬 Rigueur Statistique & Validation Métier (EDA)

Avant la phase de modélisation, une phase d'**Audio-Audit Statistique** a été développée en Python pour valider les hypothèses métiers et prouver la légitimité des features sélectionnées :

* **Déséquilibre des Classes maîtrisé :** La base présente **73,5% de clients fidèles** contre **26,5% de churn**. Le pipeline intègre un ajustement via `scale_pos_weight` pour éviter le piège d'un modèle aveugle sur la classe minoritaire.
* **Le Piège du Court Terme (Test du Chi-Deux) :** Les contrats au mois (*Month-to-month*) affichent un taux d'attrition de **43%** contre 3% pour les engagements de 2 ans ($p\text{-value} = 5.86 \times 10^{-258}$).
* **La Barrière Financière (T-Test de Welch) :** La facture mensuelle moyenne des clients qui résilient est significativement supérieure (**74.44$** vs **61.27$** pour les clients stables, $p\text{-value} = 8.59 \times 10^{-73}$).

---

## 📊 Performances du Modèle Champion (Test Set)

L'évaluation des modèles sur un échantillon de test indépendant (`1 409 profils`) a mis en compétition trois architectures :

| Modèle Algorithmique | Accuracy | Précision | Rappel (Recall) | F1-Score | ROC-AUC |
| --- | --- | --- | --- | --- | --- |
| Régression Logistique (Baseline) | 73.24 % | 49.74 % | 79.14 % | 61.09 % | 0.842 |
| Random Forest (Ensemble) | **76.72 %** | **54.56 %** | 73.52 % | 62.64 % | 0.841 |
| **XGBoost Classifier (Champion)** | 75.16 % | 52.06 % | **81.02 %** | **63.39 %** | **0.843** |

### 🎯 Justification Métier du Choix Algorithmique

En matière de churn, l'erreur la plus coûteuse est le *Faux Négatif* (manquer un client sur le départ). **XGBoost** a été sacré champion car il capture **81,02% du churn réel (Recall)**, minimisant drastiquement le risque opérationnel par rapport au Random Forest tout en offrant un pouvoir discriminant maximal (**AUC de 0.843**).

---

## 🚀 Installation & Déploiement Fast-Track

### 1. Cloner le Projet & Installer les Dépendances

```bash
git clone [https://github.com/KING-EMBBI/telecom-churn-predictive-intelligence.git](https://github.com/KING-EMBBI/telecom-churn-predictive-intelligence.git)
cd telecom-churn-predictive-intelligence
pip install -r requirements.txt

```

### 2. Exécuter le Pipeline d'Intelligence Artificielle (Python)

Cette commande exécute l'audit de qualité, traite le typage numérique (correction des espaces vides de `TotalCharges`), entraîne le modèle XGBoost et génère les matrices de synchronisation dans `/dashboard` :

```bash
python pipeline/train_pipeline.py

```

### 3. Déployer l'Interface Décisionnelle (R)

Lancez la console R ou RStudio pour exécuter le serveur d'affichage :

```r
# Dans R
install.packages(c("shiny", "bslib", "highcharter", "data.table", "waiter"))
shiny::runApp("app/")

```

---

## 🛠️ Stack Technique

* **Data Science & ML Core :** `Python 3.13`, `XGBoost`, `SHAP`, `Scikit-Learn`, `Pandas`, `SciPy`.
* **Business Intelligence UI :** `R`, `Shiny`, `bslib` (Bootstrap 5 HTML5 Architecture), `Highcharter` (Graphiques interactifs vectoriels SVG), `Waiter` (Gestion synchrone du chargement).

---

*Développé par **Osee Emmanuel Boum Bissemb** — Data Scientist & Analyste Statistique.*

