# robot-navigateur

Tests automatisés dans un **vrai navigateur** avec **Robot Framework** et la bibliothèque **Browser** (Playwright), lancés automatiquement par **GitHub Actions** à chaque `git push`.

## Ce que fait le projet

Les tests vérifient la page de connexion du site d'entraînement saucedemo.com :

- connexion réussie avec un identifiant valide ;
- connexion refusée avec un mauvais mot de passe ;
- connexion refusée sans identifiant.

Chaque test prend une capture d'écran, conservée dans le rapport.

## Fichiers

- `tests.robot` : les tests.
- `requirements.txt` : les outils Python à installer.
- `.github/workflows/tests.yml` : le pipeline GitHub Actions.

## Lancer les tests en local

1. Créer l'environnement : `python3 -m venv venv` puis `source venv/bin/activate`
2. Installer les outils : `pip install -r requirements.txt`
3. Installer le navigateur de test : `rfbrowser init chromium --with-deps`
4. Lancer les tests : `robot tests.robot`

Les rapports sont générés dans `report.html` et `log.html`.

## Outils

Robot Framework, Browser (Playwright), GitHub Actions.
