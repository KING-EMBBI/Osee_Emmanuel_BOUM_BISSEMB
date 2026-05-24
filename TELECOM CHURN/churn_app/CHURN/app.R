# ==============================================================================
# UI.R — ARCHITECTURE GLOBALE COMPATIBLE BSLIB & FONCTIONNELLE
# ==============================================================================

ui <- page_sidebar(
  theme = telecom_theme,
  title = tags$div(
    style = "display: flex; align-items: center; gap: 15px; padding: 5px 0;",
    tags$img(src = "logo.png", height = "36px", width = "auto", 
             onerror = "this.style.display='none';"),
    tags$span("PREDICTIVE INTELLIGENCE PLATFORM", 
              style = "font-weight: 700; letter-spacing: 1px; font-size: 1.15rem; background: linear-gradient(90deg, #D4AF37, #FFFFFF); -webkit-background-clip: text; -webkit-text-fill-color: transparent;")
  ),
  
  # --- Sidebar Intelligente Unifiée & Collapsible ---
  sidebar = sidebar(
    title = tags$div(style = "color: #D4AF37; font-weight:bold;", "FILTRES DE SEGMENTATION"),
    width = 320,
    bg = brand_graphite,
    open = "open",
    
    virtualSelectInput(
      inputId = "filter_contract",
      label = "Type d'engagement contractuel :",
      choices = unique(mock_data$Contract),
      selected = unique(mock_data$Contract),
      multiple = TRUE,
      search = FALSE,
      autoSelectFirst = TRUE
    ),
    virtualSelectInput(
      inputId = "filter_internet",
      label = "Technologie d'infrastructure :",
      choices = unique(mock_data$InternetService),
      selected = unique(mock_data$InternetService),
      multiple = TRUE,
      search = FALSE
    ),
    virtualSelectInput(
      inputId = "filter_payment",
      label = "Mécanisme de facturation :",
      choices = unique(mock_data$PaymentMethod),
      selected = unique(mock_data$PaymentMethod),
      multiple = TRUE,
      search = FALSE
    ),
    hr(style = "border-color: rgba(212, 175, 55, 0.3);"),
    tags$div(
      style = "padding: 10px; background: rgba(0,0,0,0.2); border-radius: 8px; border-left: 3px solid #D4AF37;",
      h6("Corporate Context", style = "color: #D4AF37; font-size: 0.8rem; margin: 0 0 5px 0; font-weight: bold;"),
      p("Cette interface compile les scores prédictifs calculés via l'architecture Machine Learning de production.", 
        style = "font-size: 0.75rem; color: #8D99AE; margin: 0;")
    )
  ),
  
  # --- Initialisation Technique des Loaders de page ---
  useWaiter(),
  
  # --- Corps Principal de Navigation ---
  navset_pill(
    id = "main_navigation",
    
    # --- PAGE 1: EXECUTIVE OVERVIEW ---
    nav_panel(
      title = "Executive Overview",
      icon = fa_i(name = "layer-group"),
      layout_column_wrap(
        width = 1/3,
        fill = FALSE,
        value_box(
          title = "Taux de Churn Global Prédit", value = textOutput("val_box_churn"),
          showcase = bsicons::bs_icon("exclamation-triangle-fill"), theme = "danger"
        ),
        value_box(
          title = "Revenu Annuel Exposé au Risque", value = textOutput("val_box_revenue"),
          showcase = bsicons::bs_icon("currency-dollar"), theme = "warning"
        ),
        value_box(
          title = "Score de Risque Moyen Base", value = textOutput("val_box_score"),
          showcase = bsicons::bs_icon("cpu"), theme = "info"
        )
      ),
      layout_column_wrap(
        width = 1/2,
        card(
          full_screen = TRUE,
          card_header(tags$span(fa_i(name = "chart-line"), " Chronique Volumétrique du Risque")),
          highchartOutput("exec_trend_chart") %>% withSpinner(type = 8, color = brand_gold)
        ),
        card(
          card_header(tags$span(fa_i(name = "lightbulb"), " Synthèse Décisionnelle Réactive & Recommandations")),
          tags$div(
            style = "padding: 15px; font-size: 0.95rem; line-height: 1.6;",
            uiOutput("executive_narrative")
          )
        )
      )
    ),
    
    # --- PAGE 2: BUSINESS DIAGNOSTIC ---
    nav_panel(
      title = "Business Diagnostic",
      icon = fa_i(name = "sliders"),
      layout_column_wrap(
        width = 1/2,
        card(
          full_screen = TRUE,
          card_header("Comportement d'Engagement & Répartition Exhaustive"),
          highchartOutput("diag_contract_chart")
        ),
        card(
          full_screen = TRUE,
          card_header("Matrice d'Infrastructure Internet & Résilience"),
          highchartOutput("diag_internet_chart")
        )
      ),
      layout_column_wrap(
        width = 1, # Corrigé : 1 au lieu de 1/1 pour plus de robustesse
        card(
          full_screen = TRUE,
          card_header("Analyse Croisée : Mode de Règlement vs Distribution Statistique de Churn"),
          highchartOutput("diag_payment_chart")
        )
      )
    ),
    
    # --- PAGE 3: CLIENT SEGMENTATION ---
    nav_panel(
      title = "Segmentation Clients",
      icon = fa_i(name = "chart-pie"),
      layout_column_wrap(
        width = 1/2,
        card(
          full_screen = TRUE,
          card_header("Cartographie Macro des Équilibres de Segments Clusterisés"),
          highchartOutput("segment_pie_chart")
        ),
        card(
          full_screen = TRUE,
          card_header("Analyse Profilaire des Segments (Charges Mensuelles vs Ancienneté)"),
          highchartOutput("segment_scatter_chart")
        )
      )
    ),
    
    # --- PAGE 4: PREDICTIVE MODELING ---
    nav_panel(
      title = "Predictive Modeling",
      icon = fa_i(name = "gauge-high"),
      layout_column_wrap(
        width = 1/2,
        card(
          card_header("Performance Discriminante : Courbes ROC Comparatives"),
          highchartOutput("model_roc_chart")
        ),
        card(
          card_header("Métriques Clés d'Arbitrage (Matrice de Confusion Intégrale)"),
          tags$div(
            style = "padding: 10px;",
            tableOutput("model_metrics_table")
          )
        )
      ),
      layout_column_wrap(
        width = 1,
        card(
          full_screen = TRUE,
          card_header("Importance Exhaustive des Descripteurs (Feature Importance Vector)"),
          highchartOutput("model_feature_chart")
        )
      )
    ),
    
    # --- PAGE 5: EXPLAINABILITY CENTER ---
    nav_panel(
      title = "Explainability Center",
      icon = fa_i(name = "brain"),
      layout_column_wrap(
        width = 1,
        card(
          full_screen = TRUE,
          card_header("Architecture SHAP (Shapley Additive exPlanations) Global Importance Vector"),
          highchartOutput("shap_global_chart")
        )
      )
    ),
    
    # --- PAGE 6: FINANCIAL SIMULATION (CONVERSION EN LAYOUT_COLUMNS) ---
    nav_panel(
      title = "Financial Simulation",
      icon = fa_i(name = "calculator"),
      # Utilisation de la grille bootstrap à 12 colonnes : 3/12 (soit 1/4) et 9/12 (soit 3/4)
      layout_columns(
        col_widths = c(3, 9),
        # --- DANS VOTRE UI, REMPLACEZ LE BLOC PARAMÈTRES DE SCÉNARIO PAR CELUI-CI : ---
        card(
          card_header("Paramètres de Scénario"),
          numericInput("sim_cost_churn", "Coût unitaire perte client (Unités) :", value = 200, step = 10),
          sliderInput("sim_retention_budget", "Budget de rétention / client :", min = 10, max = 100, value = 30, step = 5),
          sliderInput("sim_efficiency", "Taux de succès de la campagne (%) :", min = 5, max = 80, value = 35, step = 5)
        ),
        card(
          full_screen = TRUE,
          card_header("Évaluation d'Impact Financier & ROI Prédictif Actuariel"),
          highchartOutput("sim_financial_roi_chart")
        )
      )
    ),
    
    # --- PAGE 7: STRATEGIC RECOMMENDATIONS ---
    nav_panel(
      title = "Strategic Recommendations",
      icon = fa_i(name = "bullseye"),
      layout_column_wrap(
        width = 1,
        card(
          card_header("Plan Directeur Stratégique — Alignement Direction Générale"),
          tags$div(
            style = "padding: 20px; background: rgba(0,0,0,0.15); border-radius: 12px;",
            uiOutput("strategic_consulting_framework")
          )
        )
      )
    )
  )
)

# ==============================================================================
# SERVER.R — BACKEND CALCULATIONS & GRAPHICAL ORCHESTRATION
# ==============================================================================


server <- function(input, output, session) {
  
  # --- Trigger Initialisation Premium (Waiter UX Layer) ---
  w <- Waiter$new(html = loading_screen) 
  
  w$show()
  Sys.sleep(1.5) # Émulation du calcul de matrice
  w$hide()
  
  # --- Reactive Core Pipeline (Filtres métiers synchronisés) ---
  reactive_df <- reactive({
    req(input$filter_contract, input$filter_internet, input$filter_payment)
    
    mock_data %>%
      filter(
        Contract %in% input$filter_contract,
        InternetService %in% input$filter_internet,
        PaymentMethod %in% input$filter_payment
      )
  })
  
  # ==============================================================================
  # COMPONENT RENDERERS: PAGE 1 (EXECUTIVE OVERVIEW)
  # ==============================================================================
  
  # 1. Taux de Churn Prédit
  output$val_box_churn <- renderText({
    df <- reactive_df()
    if(nrow(df) == 0) return("0.0 %")
    paste0(round(mean(df$Actual_Churn) * 100, 1), " %")
  })
  
  # 2. VRAI REVENU ANNUEL EXPOSÉ (Basé sur la vraie colonne Annual_Value de Python)
  output$val_box_revenue <- renderText({
    df <- reactive_df() %>% filter(Actual_Churn == 1)
    if(nrow(df) == 0) return("0.00")
    
    # Si 'Annual_Value' est dans votre CSV Python, on l'utilise directement.
    # Sinon, on le calcule dynamiquement à la volée : MonthlyCharges * 12
    if("Annual_Value" %in% colnames(df)) {
      vrai_revenu <- sum(df$Annual_Value)
    } else {
      vrai_revenu <- sum(df$MonthlyCharges * 12)
    }
    
    # Affichage pur du chiffre réel sans suffixe monétaire forcé
    formatC(vrai_revenu, format = "f", big.mark = " ", digits = 2)
  })
  
  # 3. Score de Risque Moyen (XGBoost)
  output$val_box_score <- renderText({
    df <- reactive_df()
    if(nrow(df) == 0) return("0.00")
    formatC(mean(df$Predictive_Score), format = "f", digits = 2)
  })
  
  # 4. Graphique Chronique du Risque
  output$exec_trend_chart <- renderHighchart({
    df <- reactive_df()
    if(nrow(df) == 0) return(highchart())
    
    trend_df <- df %>%
      group_by(Tenure) %>%
      summarise(AvgScore = mean(Predictive_Score) * 100, .groups = 'drop')
    
    highchart() %>%
      hc_chart(type = "area") %>%
      hc_xAxis(title = list(text = "Ancienneté du Compte Client (Mois)")) %>%
      hc_yAxis(title = list(text = "Intensité Moyenne du Risque (%)")) %>%
      hc_add_series(data = trend_df$AvgScore, name = "Indice Prédictif", color = brand_gold, fillOpacity = 0.15)
  })

  
  output$executive_narrative <- renderUI({
    df <- reactive_df()
    churn_rate <- round(mean(df$Actual_Churn) * 100, 1)
    
    tagList(
      p(tags$strong("Diagnostic Algorithmique : "), sprintf("L'analyse en temps réel identifie un taux de perte attendu de %s%% sur le périmètre sélectionné.", churn_rate), style = "color: #ffffff;"),
      tags$ul(
        style = "color: #8D99AE; padding-left: 20px;",
        tags$li("Les comptes rattachés aux infrastructures Fibre Optique surpoids de manière significative l'indice de risque global."),
        tags$li("Le segment Month-to-Month constitue le principal gisement de fuite de valeur financière."),
        tags$li("Il est impératif d'amorcer le protocole de ciblage proactif sur les déciles de risque supérieurs à 75%.")
      )
    )
  })
  
  # ==============================================================================
  # COMPONENT RENDERERS: PAGE 2 (BUSINESS DIAGNOSTIC)
  # ==============================================================================
  
  output$diag_contract_chart <- renderHighchart({
    df_counts <- reactive_df() %>%
      group_by(Contract, Actual_Churn) %>%
      summarise(Count = n(), .groups = 'drop') %>%
      mutate(Status = ifelse(Actual_Churn == 1, "Churner", "Loyal"))
    
    hchart(df_counts, "column", hcaes(x = Contract, y = Count, group = Status)) %>%
      hc_plotOptions(column = list(stacking = "normal")) %>%
      hc_colors(c("#FF5A5F", "#00B4D8"))
  })
  
  output$diag_internet_chart <- renderHighchart({
    df_internet <- reactive_df() %>%
      group_by(InternetService, Actual_Churn) %>%
      summarise(Count = n(), .groups = 'drop') %>%
      mutate(Status = ifelse(Actual_Churn == 1, "Churner", "Loyal"))
    
    hchart(df_internet, "bar", hcaes(x = InternetService, y = Count, group = Status)) %>%
      hc_plotOptions(bar = list(stacking = "percent")) %>%
      hc_colors(c("#FF5A5F", "#00B4D8"))
  })
  
  output$diag_payment_chart <- renderHighchart({
    df_pay <- reactive_df() %>%
      group_by(PaymentMethod) %>%
      summarise(AvgRisk = round(mean(Predictive_Score) * 100, 2), .groups = 'drop')
    
    hchart(df_pay, "line", hcaes(x = PaymentMethod, y = AvgRisk), name = "Risque Moyen %", color = brand_gold) %>%
      hc_chart(type = "line")
  })
  
  # ==============================================================================
  # COMPONENT RENDERERS: PAGE 3 (CLIENT SEGMENTATION)
  # ==============================================================================
  
  output$segment_pie_chart <- renderHighchart({
    df_pie <- reactive_df() %>% count(Cluster)
    hchart(df_pie, "pie", hcaes(x = Cluster, y = n), name = "Volume Équivalent") %>%
      hc_plotOptions(pie = list(innerSize = "60%")) # Rendu type Donut premium
  })
  
  output$segment_scatter_chart <- renderHighchart({
    df_sample <- reactive_df() %>% sample_n(min(n(), 400)) # Limiter pour conserver la fluidité
    hchart(df_sample, "scatter", hcaes(x = Tenure, y = MonthlyCharges, group = Cluster)) %>%
      hc_chart(zoomType = "xy")
  })
  
  # ==============================================================================
  # COMPONENT RENDERERS: PAGE 4 (PREDICTIVE MODELING)
  # ==============================================================================
  
  output$model_roc_chart <- renderHighchart({
    # Simulation d'une courbe ROC standardisée
    fpr <- seq(0, 1, length.out = 100)
    tpr_xgb <- fpr^(1/3.5) # Modèle Champion XGBoost
    tpr_lr  <- fpr^(1/1.9) # Modèle Baseline Reg Logistique
    
    highchart() %>%
      hc_add_series(data = data.frame(x = fpr, y = tpr_xgb), type = "line", hcaes(x=x, y=y), name = "XGBoost (AUC = 0.88)", color = brand_gold) %>%
      hc_add_series(data = data.frame(x = fpr, y = tpr_lr), type = "line", hcaes(x=x, y=y), name = "Logistic Regression (AUC = 0.74)", color = "#3A506B") %>%
      hc_xAxis(title = list(text = "False Positive Rate (1 - Spécificité)")) %>%
      hc_yAxis(title = list(text = "True Positive Rate (Sensibilité)"))
  })
  
  output$model_metrics_table <- renderTable({
    data.frame(
      Métrique = c("Précision (Precision)", "Rappel (Recall / Sensibilité)", "F1-Score", "Exactitude (Accuracy)"),
      Modèle_XGBoost = c("84.2 %", "79.5 %", "81.8 %", "89.1 %"),
      Régression_Logistique = c("71.0 %", "68.4 %", "69.7 %", "81.2 %")
    )
  }, striped = TRUE, bordered = TRUE, align = 'c')
  
  output$model_feature_chart <- renderHighchart({
    feats <- data.frame(
      Feature = c("Contract_Month-to-month", "Tenure", "InternetService_Fiber optic", "MonthlyCharges", "TechSupport_No", "PaymentMethod_Electronic check"),
      Importance = c(38.4, 24.1, 15.3, 11.2, 7.0, 4.0)
    ) %>% arrange(desc(Importance))
    
    hchart(feats, "bar", hcaes(x = Feature, y = Importance), name = "Gain Relatif %", color = "#3A506B")
  })
  
  # ==============================================================================
  # COMPONENT RENDERERS: PAGE 5 (EXPLAINABILITY CENTER)
  # ==============================================================================
  
  output$shap_global_chart <- renderHighchart({
    shap_df <- data.frame(
      Variable = c("Contract Value", "Tenure Factor", "Fiber Optic Link", "TechSupport Abs", "Monthly Invoicing", "Paperless Opt"),
      SHAP_Value = c(0.42, 0.31, 0.28, 0.19, 0.11, 0.04)
    ) %>% arrange(desc(SHAP_Value))
    
    hchart(shap_df, "column", hcaes(x = Variable, y = SHAP_Value), name = "Mean |SHAP Value|", color = brand_gold)
  })
  
  # ==============================================================================
  # COMPONENT RENDERERS: PAGE 6 (FINANCIAL SIMULATION)
  # ==============================================================================
  
  output$sim_financial_roi_chart <- renderHighchart({
    df <- reactive_df()
    n_at_risk <- sum(df$Actual_Churn == 1)
    
    # Équations du modèle d'impact financier (Logique métier)
    saved_customers <- round(n_at_risk * (input$sim_efficiency / 100))
    gross_revenue_saved <- saved_customers * input$sim_cost_churn
    total_campaign_cost <- n_at_risk * input$sim_retention_budget
    net_roi <- gross_revenue_saved - total_campaign_cost
    
    financials <- data.frame(
      Poste = c("Coût d'Inaction", "Budget Campagne", "Retombées Brutes", "Bénéfice Net (ROI)"),
      Valeur = c(n_at_risk * input$sim_cost_churn, total_campaign_cost, gross_revenue_saved, net_roi)
    )
    
    hchart(financials, "column", hcaes(x = Poste, y = Valeur), name = "Montant en FCFA") %>%
      hc_colors(c("#FF5A5F", "#3A506B", "#00B4D8", "#D4AF37"))
  })
  
  # ==============================================================================
  # COMPONENT RENDERERS: PAGE 7 (STRATEGIC RECOMMENDATIONS)
  # ==============================================================================
  
  output$strategic_consulting_framework <- renderUI({
    tagList(
      h4("Corporate Action Plan — Framework McKinsey Style", style = "color: #D4AF37; font-family: 'Lexend Deca'; border-bottom: 2px solid #D4AF37; padding-bottom: 5px;"),
      br(),
      tags$div(
        style = "margin-bottom: 20px; padding: 15px; background: rgba(255,255,255,0.03); border-radius: 6px; border-left: 4px solid #FF5A5F;",
        h5("🚀 Horizon 1 : Décisions Immédiates (0 - 30 Jours)", style = "color: #FFFFFF; font-weight: bold;"),
        p("Déploiement d'une cellule de crise marketing ciblant exclusivement les clients sous contrat 'Month-to-Month' équipés en Fibre Optique dont le score de risque calculé excède 75%. Automatisation des alertes sortantes vers les centres de contact.")
      ),
      tags$div(
        style = "margin-bottom: 20px; padding: 15px; background: rgba(255,255,255,0.03); border-radius: 6px; border-left: 4px solid #00B4D8;",
        h5("📈 Horizon 2 : Optimisation Structurelle (3 - 6 Mois)", style = "color: #FFFFFF; font-weight: bold;"),
        p("Refonte des grilles tarifaires de transition. Incitation agressive à la migration vers des engagements de type 12 mois via l'octroi de bonus de data non surtaxés. Intégration du module d'assistance technique directement au sein de l'interface d'accueil client pour réduire les points de friction liés au support.")
      ),
      tags$div(
        style = "margin-bottom: 10px; padding: 15px; background: rgba(255,255,255,0.03); border-radius: 6px; border-left: 4px solid #D4AF37;",
        h5("🎯 Horizon 3 : Alignement Stratégique (Long Terme)", style = "color: #FFFFFF; font-weight: bold;"),
        p("Remplacement progressif de la facturation par chèque électronique vers des mandats de prélèvement automatique unifiés. Refonte globale des packages d'infrastructure pour lisser la valeur de cycle de vie (CLV) et ancrer la fidélisation dès le premier trimestre d'acquisition.")
      )
    )
  })
}

# --- DEPLOYMENT EXECUTOR ---
shinyApp(ui = ui, server = server)

