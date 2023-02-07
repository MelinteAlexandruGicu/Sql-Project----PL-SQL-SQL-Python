-- TESTARE TRIGGER selectioner_antrenor --
BEGIN
	UPDATE echipa_nationala
	SET nume_selectioner = 'Toni Petrea'
	WHERE tara = 'ROMANIA';
END;

-- TESTARE TRIGGER retras_neconvocatTrg --
BEGIN
    jucator.primire_convocare(7);
END;

-- TRANZACTIE --
BEGIN
	afisare_numar_echipe('ROMANIA');
	club.insert_echipa_club('CSA Steaua', 'Bucuresti', 30, 'Daniel Oprita', 'ROMANIA');
	liga.modificare_nr_echipe(liga.get_id_liga('ROMANIA'), 1);
	afisare_numar_echipe('ROMANIA');
	club.update_echipa_club(club.get_id_club('CSA Steaua'), 'Marius Lacatus');
	afisare_numar_echipe('ROMANIA');
	club.delete_echipa_club(club.get_id_club('CSA Steaua'));
    liga.modificare_nr_echipe(liga.get_id_liga('ROMANIA'), -1);
	afisare_numar_echipe('ROMANIA');
    SAVEPOINT csaSteaua;
    COMMIT;
    club.insert_echipa_club('Rapid Bucuresti', 'Bucuresti', 30, 'Adrian Mutu', 'ROMANIA');
    liga.modificare_nr_echipe(liga.get_id_liga('ROMANIA'), 1);
    afisare_numar_echipe('ROMANIA');
    SAVEPOINT rapid;
    COMMIT;
END;

--INSERT JUCATOR DE FOTBAL -> GENERARE EROARE PENTRU DATA NASTERII
BEGIN
	jucator.insert_jucator( 'Gigi Becali', TO_DATE('22-10-2025', ' DD-MM-YYYY'), 183, 70, 'fundas',
		7, 403, 26, 'neconvocat', 'nu', 'Capitan', 'FC Barcelona', 'Mirel Radoi','SPAIN');
-- data nasterii este din 'viitor'--
END;

