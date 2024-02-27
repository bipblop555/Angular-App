Le projet angular provient de la documentation Angular

1. Je créé un directory : 

    Je conserve les lignes ci dessous de mon script : 
    cd /home/node
    ng new app --routing=true --style=scss
    cd app
    npm start

2. Je lance mon container

3. Il faut modifier le package.json comme ceci : 
    "start": "ng serve --port 3000 --host 0.0.0.0 --disable-host-check --proxy-config",

****************************************************

Si le projet est déja existant alors il faut seulement
commenter le second bloc de script 
et lancer : docker compose up --build -d
