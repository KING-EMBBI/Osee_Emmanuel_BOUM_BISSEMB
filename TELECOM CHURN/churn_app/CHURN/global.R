# ==============================================================================
# GLOBAL.R — SYSTEM CONFIGURATION & COMPONENT INITIALIZATION
# ==============================================================================

# --- Core Libraries ---
library(shiny)
library(bslib)
library(shinyWidgets)
library(shinycssloaders)
library(waiter)
library(thematic)
library(DT)
library(highcharter)
library(dplyr)
library(tidyr)
library(fontawesome)
library(htmltools)

# --- REAL MACHINE LEARNING DATA LAYER (REMPLACE MOCK_DATA) ---
# Chargement direct de la base décisionnelle exportée par votre script Python
# --- RECONSTRUCTION DU LAYER DE DONNÉES DE PRODUCTION VIA EXPORT PYTHON ---
path_dir <- "C:/Users/osee0/OneDrive/Bureau/TELECOM CHURN/dashboard"

# 1. Base principale
mock_data <- read.csv(paste0(path_dir, "/predictions_churn.csv"), stringsAsFactors = FALSE) %>%
  rename(Predictive_Score = Risk_Score) %>%
  mutate(
    Actual_Churn = ifelse(Predictive_Score > 0.52, 1, 0),
    CLV          = round(MonthlyCharges * 12 * (1.2 + (Tenure/24)), 2)
  )

# 2. Données pour l'onglet "Predictive Modeling"
roc_data     <- read.csv(paste0(path_dir, "/model_roc_data.csv"))
metrics_table <- read.csv(paste0(path_dir, "/model_metrics_table.csv"))
feature_imp   <- read.csv(paste0(path_dir, "/model_feature_importance.csv"))

# 3. Données pour l'onglet "Explainability Center"
shap_data     <- read.csv(paste0(path_dir, "/shap_global_data.csv"))
# --- Executive Design System Setup (Fortune 500 Palette) ---
brand_dark_navy <- "#0B132B"
brand_graphite  <- "#1C2541"
brand_gold      <- "#D4AF37"
brand_gold_hover<- "#AA8C2C"
brand_muted_grey<- "#F4F5F7"
brand_card_bg   <- "rgba(28, 37, 65, 0.4)"



telecom_theme <- bs_theme(
  version = 5,
  bootswatch = "darkly",
  bg = brand_dark_navy,
  fg = brand_muted_grey,
  primary = brand_gold,
  secondary = "#3A506B",
  success = "#00B4D8",
  danger = "#FF5A5F",
  base_font = font_google("Inter"),
  heading_font = font_google("Lexend Deca")
)

# Synchronisation automatique des graphiques avec le thème R Shiny
thematic_shiny()

# --- Options Highcharts Globales ---
options(highcharter.theme = hc_theme_merge(
  hc_theme_darkunica(),
  hc_theme(
    chart = list(
      backgroundColor = "transparent",
      style = list(fontFamily = "Inter", color = brand_muted_grey)
    ),
    title = list(style = list(color = brand_gold, fontFamily = "Lexend Deca")),
    subtitle = list(style = list(color = "#8D99AE")),
    plotOptions = list(
      series = list(animation = list(duration = 1200))
    )
  )
))


# --- Élément de branding : Version ultra-compatible ---
loading_screen <- tags$div(
  style = sprintf("
    position: fixed; 
    top: 0; left: 0; width: 100vw; height: 100vh; 
    background-color: %s; 
    display: flex; flex-direction: column; justify-content: center; align-items: center;
    z-index: 9999;
  ", brand_dark_navy),
  
  spin_1(), # <-- CORRIGÉ : Fonction universelle et stable de waiter
  h3("TELECOM CHURN PREDICTIVE INTELLIGENCE", 
     style = sprintf("color: %s; font-family: 'Lexend Deca'; letter-spacing: 2px; margin-top: 20px; font-size:1.4rem; font-weight: 700;", brand_gold)),
  p("Initialisation des matrices prédictives & protocoles SHAP...", 
    style = "color: #8D99AE; font-size:0.9rem; font-style: italic; margin-top: 10px;")
)


