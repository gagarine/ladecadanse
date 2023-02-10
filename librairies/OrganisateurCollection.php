<?php

namespace Ladecadanse;

use Ladecadanse\Collection;
use Ladecadanse\Organisateur;

class OrganisateurCollection extends Collection
{

    function __construct()
	{
		global $connector;
		$this->connector = $connector;
	}

	function load($idL)
	{
		$req = $this->connector->query("
		 SELECT descriptionlieu.idLieu AS idLieu, contenu, descriptionlieu.dateAjout AS dateAjout, pseudo, nom,
		 		 prenom, groupe, descriptionlieu.idPersonne AS idPersonne, descriptionlieu.date_derniere_modif
		 FROM descriptionlieu
		 INNER JOIN personne ON descriptionlieu.idPersonne = personne.idPersonne
		 WHERE descriptionlieu.idLieu =".$idL." ORDER BY descriptionlieu.dateAjout");

		if ($this->connector->getNumRows($req) == 0)
		{
		  	return false;
		}

		while ($tab = $this->connector->fetchArray($req))
		{
			$des = new Description();
			$des->setValues($tab);
			$id = $des->getValue('idPersonne').'_'.$des->getValue('idLieu');
			$this->elements[$id] = $des;
		}

		return true;
	}

	function loadByType($idL, $type)
	{
		$sql = "
		 SELECT descriptionlieu.idLieu AS idLieu, type, contenu, descriptionlieu.dateAjout AS dateAjout, pseudo, nom,
		 		 prenom, groupe, descriptionlieu.idPersonne AS idPersonne, descriptionlieu.date_derniere_modif
		 FROM descriptionlieu
		 INNER JOIN personne ON descriptionlieu.idPersonne = personne.idPersonne
		 WHERE descriptionlieu.idLieu =".$idL." AND type='".$type."' ORDER BY descriptionlieu.dateAjout";

		$req = $this->connector->query($sql);

		if ($this->connector->getNumRows($req) == 0)
		{
		  	return false;
		}

		while ($tab = $this->connector->fetchArray($req))
		{
			$des = new Description();
			$des->setValues($tab);
			$id = $des->getValue('idPersonne').'_'.$des->getValue('idLieu').'_'.$des->getValue('type');
			$this->elements[$id] = $des;
		}

		return true;
	}

	function loadFiches($region = null)
	{

                $sql_region = '';
                if (!empty($region))
                    $sql_region = "and organisateur.region='$region' ";

		$req = $this->connector->query("SELECT * FROM organisateur WHERE statut='actif' ".$sql_region."  ORDER BY date_ajout DESC LIMIT 8");


		if ($this->connector->getNumRows($req) == 0)
		{
		  	return false;
		}

		while ($tab = $this->connector->fetchArray($req))
		{
			$org = new Organisateur();
			$org->setValues($tab);
			$id = $org->getValue('idOrganisateur');
			$this->elements[$id] = $org;
		}

		return true;
	}

	function getNumRows($idL, $type = '')
	{
		 if ($type == 'description' || $type == 'presentation')
		 {
		 	$type = " AND type='".$type."'";
		 }
		$req = $this->connector->query("
		 SELECT descriptionlieu.idLieu AS idLieu, contenu, descriptionlieu.dateAjout AS dateAjout, pseudo, nom,
		 		 prenom, groupe, descriptionlieu.idPersonne AS idPersonne, descriptionlieu.date_derniere_modif
		 FROM descriptionlieu
		 INNER JOIN personne ON descriptionlieu.idPersonne = personne.idPersonne
		 WHERE descriptionlieu.idLieu =".$idL.$type." ORDER BY descriptionlieu.dateAjout");

		  	return $this->connector->getNumRows($req);


	}
}