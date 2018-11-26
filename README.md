# FIRE: trust and reputation model for open multi-agent systems (Trung Dong Huynh · Nicholas R. Jennings · Nigel R. Shadbolt)

## NetLogo Implementation by Elias Hanna and Jacques Zhong

## Hypothèses 
* Valeur du rayon d'opération et calcul de la décroissance de performance liée à la distance.
* Utilité espérée d'une choix aléatoire : 10 puis décroit jusqu'à 0 petit à petit.

## Recommandations du professeur
* Pas besoin de faire SPORAS
* Ajout de paramètres supplémentaires en plus de ceux de l'article.
Pour faire une analyse de sensibilité d'une variable = indicateur :
	* Définir un horizon temporel T
	* Nombre de réplication R=10 (minimum)
	* Faire tourner le modèle pendant T ticks, répété R fois, donnant I.
	* Is = moyenne(I) car modèle stochastique.
* Nombre de provider et consumer constant avec le renouvellement.
* Déplacement sur une sphère et non un rectangle.
* (p139) Initialisation des providers. 