# 📈 Telecom Churn Predictive Intelligence Platform

[![Python Version](https://img.shields.io/badge/Python-3.10%2B-blue)](https://www.python.org/)
[![R Shiny Version](https://img.shields.io/badge/R%20Shiny-bslib%20%2F%20v5-orange)](https://shiny.posit.co/)
[![Model Champion](https://img.shields.io/badge/XGBoost-Classifier-green)]()
[![Explainability](https://img.shields.io/badge/SHAP-Framework-purple)]()

> Une architecture décisionnelle industrielle de bout en bout qui unifie la puissance prédictive de **Python (XGBoost)** et l'interactivité managériale de **R Shiny (Bslib Dashboarding)** pour anticiper et monitorer le risque d'érosion client.

---

## 📸 Interface du Dashboard

*(Insérer ici votre GIF animé ou vos captures d'écran haute définition)*
![Dashboard Executive Overview](https://via.placeholder.com/1000x500/0B132B/D4AF37?text=PREDICTIVE+INTELLIGENCE+PLATFORM+SCREENSHOT)

---

## ⚡ Fonctionnalités Clés

* **Executive Monitoring :** Visualisation instantanée du taux de churn global, de la masse de revenu annuelle exposée au risque et du score moyen de la base.
* **Filtres de Segmentation Dynamiques :** Filtres multi-sélection fluides via `virtualSelectInput` (Contrats, Technologies, Modes de paiement).
* **Predictive Center :** Intégration en temps réel des performances de production (Courbe ROC et matrice de confusion native).
* **Explainability Center (SHAP) :** Restitution transparente des contributions de variables issues de la théorie des jeux pour bannir l'effet "boîte noire".
* **Simulateur Financier / ROI :** Ajustement en temps réel des coûts de perte, des budgets de rétention et des efficacités de campagne pour mesurer l'impact actuariel avant déploiement.

---

## 🏗️ Architecture du Projet & Flux de Production

L'infrastructure garantit une étanchéité totale entre l'ingénierie statistique et la couche applicative visuelle :

TELECOM CHURN/
│
├── data/                           # Entrepôt de données (CSV numériques & bruts)
│   ├── X_train.csv
│   ├── X_test.csv
│   ├── y_train.csv
│   ├── y_test.csv
│   └── WA_Fn-UseC_-Telco-Customer-Churn.csv
│
├── pipeline/                       # Moteur d'Intelligence Artificielle (Python)
│   └── train_pipeline.py
│
├── dashboard/                      # Couche de Synchronisation Inter-Langage
│   ├── predictions_churn.csv       # Base de données décisionnelle exportée
│   ├── model_roc_data.csv          # Coordonnées TPR / FPR de la courbe ROC
│   ├── model_metrics_table.csv     # Vérité terrain (Matrice de confusion)
│   └── shap_global_data.csv        # Vecteurs de Shapley réels
│
└── app/                            # Interface Décisionnelle Exécutive (R)
    ├── global.R                    # Chargement des CSV & Configuration du Design System
    ├── ui.R                        # Architecture UI moderne basée sur bslib
    └── server.R                    # Moteur de rendu graphique interactif highcharter



---

## 📊 Performances du Modèle Champion

L'architecture **XGBoost Classifier** a été configurée de manière rigoureuse pour corriger le déséquilibre naturel des classes :

| Métrique | Performance de Production |
| --- | --- |
| **Aire sous la courbe (AUC)** | `0.845` |
| **Rappel (Recall - Classe Churn)** | `81.2 %` |
| **Algorithme d'optimisation** | `Logloss Early Stopping` |

---

## 🚀 Installation & Déploiement Fast-Track

### 1. Génération des Matrices Prédictives (Python)

Assurez-vous de posséder les dépendances requises (`pandas`, `numpy`, `xgboost`, `scikit-learn`, `shap`), puis lancez le pipeline :

```bash
cd pipeline
python train_pipeline.py

```

*Cette commande va entraîner le modèle et exporter les matrices de performance directement dans le dossier `dashboard/`.*

### 2. Lancement du Dashboard (R)

Ouvrez votre console R ou RStudio, assurez-vous que vos packages sont à jour, puis exécutez :

```r
shiny::runApp("app/")

```

---

## 🛠️ Stack Technique Utilisée

* **Back-End / ML :** Python, XGBoost, SHAP Framework, Scikit-Learn.
* **Front-End / UI :** R, Shiny, Bslib (Bootstrap 5 Premium Theme), Highcharter (Graphiques HTML5 interactifs), Waiter (Expérience de chargement synchrone).

---

*Développé dans le cadre de la modernisation des architectures de Business Intelligence.*

```

```