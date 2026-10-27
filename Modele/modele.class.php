<?php 

	class Modele {
		private $unPdo;

		public function __construct(){
			$url = "mysql:host=localhost;dbname=petsitter";
			$user = "root";
			$mdp = "";

			try {
				$this->unPdo = new PDO($url, $user, $mdp);
			}
			catch (PDOException $exp){
				echo "<br> Erreur de connexion a ".$url;
				echo $exp->getMessage();
			}
		}



 ?>