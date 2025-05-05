#!/bin/bash

# Liste des repos
REPOS=(
"https://github.com/defich/ain"
"https://github.com/defich/defichain-docs"
"https://github.com/defich/defichain-wallet"
"https://github.com/defich/defichain-lightwallet"
"https://github.com/defich/defichain-api"
"https://github.com/defich/defichain-sdk"
"https://github.com/defich/defichain-js"
"https://github.com/defich/defichain-explorer"
"https://github.com/defich/defichain-tests"
"https://github.com/defich/defichain-tools"
"https://github.com/defich/infra"
"https://github.com/defich/ainx"
"https://github.com/defich/status"
"https://github.com/defich/pinkpaper"
"https://github.com/defich/defichain-app"
"https://github.com/defich/defichain-rust"
"https://github.com/defich/defichain-go"
"https://github.com/defich/defichain-mobile"
"https://github.com/defich/defichain-notifications"
"https://github.com/defich/defichain-events"
"https://github.com/defich/defichain-analytics"
"https://github.com/defich/defichain-monitor"
"https://github.com/defich/defichain-alerts"
"https://github.com/defich/defichain.com"
"https://github.com/defich/defichain-cli"
"https://github.com/defich/defichain-examples"
"https://github.com/defich/defichain-python"
"https://github.com/SunWeb3Sec/DeFiLabs"
"https://github.com/White-Whale-Defi-Platform/migaloo-frontend"
)

# Nom du fichier à ajouter
FICHIER="CONTRIBUTING_fr.md"

for REPO in "${REPOS[@]}"; do
  NAME=$(basename "$REPO")
  echo "➡️ Clonage de $NAME ..."
  git clone "$REPO"
  cd "$NAME" || continue

  git checkout -b contribution-fr

  echo "## Notes pour contributeurs francophones\nCe fichier a été ajouté dans le cadre d'une contribution communautaire DeFi." > "$FICHIER"
  git add "$FICHIER"
  git commit -m "Ajout de $FICHIER pour aide à la contribution francophone"
  git push origin contribution-fr

  echo "📬 Ouverture de la Pull Request sur $NAME..."
  gh pr create --title "Ajout de fichier CONTRIBUTING_fr.md" --body "Contribution pour la communauté francophone DeFi." --head contribution-fr

  cd ..
  echo "✅ Terminé pour $NAME"
done
