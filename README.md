ddb-sonarqube-scanner
===
Ce projet permet de mettre à disposition les commandes de scan pour SonarQube et DependencyCheck, et une commande d'extraction des résultats avec Sonar CNES report.

# Installation

Il est nécessaire d'avoir installé [docker-devbox-ddb](https://inetum-orleans.github.io/docker-devbox-ddb/).

Clonez ensuite ce dépôt et exécutez la commande suivante dans ce dossier:

```bash
ddb configure
```

Trois commandes sont alors enregistrées globalement dans `~/.docker-devbox/.bin`:

- `dependency-check`
- `sonar-scanner`
- `sonar-cnes-report`

# sonar-scanner : Configuration projet

[configurations/README.md](configurations/README.md)

Ensuite, il suffit de se déplacer dans le dossier de votre projet et d'exécuter la commande `sonar-scanner`.

# Instance SonarQube

Voir [inetum-orleans/ddb-sonarqube](https://github.com/inetum-orleans/ddb-sonarqube) pour executer une instance
pré-paramétrée de SonarQube en local.

# sonar-cnes-report : Extraction des résultats

Dans l'interface sonarqube, dans "My account" / "Security" / "Generate Tokens", générer un token de type "user".

Ensuite, exécuter la commande suivante, en remplaçant les valeurs entre crochets :

```bash
sonar-cnes-report -a [votre nom] -b [branche] -l [langage] -o [dossier de destination] -p [key du projet] -s [url sonar] -t [token]
```

par exemple
```bash
sonar-cnes-report -a "JVI" -b develop -l fr_FR -o cnesreport -p menj-bnie-webservices -s https://inetum-sonar2.inetum-diasco.fr/ -t squ_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

Plus d'infos et d'options de configuration sur [la page du projet](https://github.com/cnescatlab/sonar-cnes-report) ou avec `-h`.

Les logs sont générés dans `.volume/sonar-cnes-report-data/log` de ce projet.