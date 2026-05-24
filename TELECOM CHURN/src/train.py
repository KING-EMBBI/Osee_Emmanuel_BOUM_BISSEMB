from xgboost import XGBClassifier

def train_best_model(X_train, y_train, ratio):
    """Entraîne le modèle sélectionné (XGBoost) avec les hyperparamètres validés."""
    model = XGBClassifier(
        scale_pos_weight=ratio,
        n_estimators=150,
        max_depth=4,
        learning_rate=0.05,
        random_state=42
    )
    model.fit(X_train, y_train)
    return model