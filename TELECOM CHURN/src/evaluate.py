from sklearn.metrics import classification_report, fbeta_score, roc_auc_score

def get_business_metrics(y_true, y_pred, y_proba):
    """Calcule et affiche les métriques cibles orientées business."""
    metrics = {
        "F2-Score": fbeta_score(y_true, y_pred, beta=2),
        "ROC-AUC": roc_auc_score(y_true, y_proba)
    }
    print("=== MÉTRIQUES COMPLEMENTAIRES DE PERFORMANCE ===")
    print(f"F2-Score (Priorité Rétention) : {metrics['F2-Score']*100:.2f}%")
    print(f"ROC-AUC (Pouvoir Séparateur)  : {metrics['ROC-AUC']*100:.2f}%")
    print("\nRapport Complet :")
    print(classification_report(y_true, y_pred))
    return metrics