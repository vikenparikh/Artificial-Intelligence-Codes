predicates

male(symbol)
female(symbol)
parent(symbol,symbol,symbol)
brother(symbol,symbol)
sister(symbol,symbol)
father(symbol,symbol)
mother(symbol,symbol)
son(symbol,symbol,symbol)
daughter(symbol,symbol,symbol)
wife(symbol,symbol)
grandfather(symbol,symbol)
uncle(symbol,symbol)
aunt(symbol,symbol)
ancestor(symbol,symbol,symbol)
ancestor(symbol,symbol,symbol)
husband(symbol,symbol)

clauses

male(eddard_stark).
male(robb_stark).
male(brandon_stark).
male(rickon_stark).
male(robert_baratheon).
male(renly_baratheon).
male(stanis_baratheon).
male(gendry_baratheon).
male(jofrey_baratheon).
male(tommen_baratheon).
male(tywin_lannister).
male(jaime_lannister).
male(tyrin_lannister).
male(balon_greyjoy).
male(theon_greyjoy).
male(mace_tyrell).
male(ser_loras_tyrell).

female(catelyn_stark).
female(arya_stark).
female(sansa_stark).
female(cersei_lannister).
female(myrcella_lannister).
female(yara_greyjoy).
female(lady_olenna_tyrell).
female(margaery_tyrell).

parent(eddard_stark,catelyn_stark,robb_stark).
parent(eddard_stark,catelyn_stark,brandon_stark).
parent(eddard_stark,catelyn_stark,rickon_stark).
parent(eddard_stark,catelyn_stark,arya_stark).
parent(eddard_stark,catelyn_stark,sansa_stark).
parent(robert_baratheon,unknown,gendry_baratheon).
parent(jaime_lannister,cersei_lannister,jofrey_baratheon).
parent(jaime_lannister,cersei_lannister,myrcella_baratheon).
parent(jaime_lannister,cersei_lannister,tommen_baratheon).
parent(tywin_lannister,unknown,jaime_lannister).
parent(tywin_lannister,unknown,cersei_lannister).
parent(tywin_lannister,unknown,tyrion_lannister).
parent(balon_greyjoy,unknown,theon_greyjoy).
parent(balon_greyjoy,unknown,yara_greyjoy).
parent(mace_tyrell,lady_olenna_tyrell,ser_loras_tyrell).
parent(mace_tyrell,lady_olenna_tyrell,margaery_tyrell).

brother(robb_stark,brandon_stark).
brother(robb_stark,rickon_stark).
brother(robb_stark,arya_stark).
brother(robb_stark,sansa_stark).
brother(brandon_stark,robb_stark).
brother(brandon_stark,rickon_stark).
brother(brandon_stark,arya_stark).
brother(brandon_stark,sansa_stark).
brother(rickon_stark,brandon_stark).
brother(rickon_stark,robb_stark).
brother(rickon_stark,arya_stark).
brother(rickon_stark,sansa_stark).
brother(renly_baratheon,stanis_baratheon).
brother(renly_baratheon,robert_baratheon).
brother(stanis_baratheon,robert_baratheon).
brother(stanis_baratheon,renly_baratheon).
brother(robert_baratheon,stanis_baratheon).
brother(robert_baratheon,renly_baratheon).
brother(jofrey_baratheon,myrcella_baratheon).
brother(jofrey_baratheon,tommen_baratheon).
brother(tommen_baratheon,myrcella_baratheon).
brother(tommen_baratheon,jofrey_baratheon).
brother(jaime_lannister,cersei_lannister).
brother(jaime_lannister,tyrion_lannister).
brother(tyrion_lannister,jaime_lannister).
brother(tyrion_lannister,cersei_lannister).
brother(theon_greyjoy,yara_greyjoy).
brother(ser_loras_tyrell,margaery_tyrell).

sister(sansa_stark,robb_stark).
sister(sansa_stark,brandon_stark).
sister(sansa_stark,rickon_stark).
sister(sansa_stark,arya_stark).
sister(arya_stark,sansa_stark).
sister(arya_stark,robb_stark).
sister(arya_stark,brandon_stark).
sister(arya_stark,rickon_stark).
sister(myrcella_baratheon,tommen_baratheon).
sister(myrcella_baratheon,jofrey_baratheon).
sister(cersei_lannister,jaime_lannister).
sister(cersei_lannister,tyrion_lannister).
sister(yara_greyjoy,theon_greyjoy).
sister(margaery_tyrell,ser_loras_tyrell).

father(X,Y) :- parent(X,Z,Y).
mother(X,Y) :- parent(Z,X,Y).
son(X,Y,Z) :- male(X),father(Y,X),mother(Z,X).
daughter(X,Y,Z) :- female(X),father(Y,X),mother(Z,X).
wife(X,Y) :- female(X),parent(Y,X,Z).
husband(X,Y) :- male(X),parent(X,Y,Z).
grandfather(X,Y) :- male(X),father(X,Z),father(Z,Y).
uncle(X,Y) :- male(X),brother(X,Z),father(Z,Y).
aunt(X,Y) :- wife(X,Z),uncle(Z,Y).
ancestor(X,Y,Z) :- parent(X,Y,Z).
ancestor(X,Y,Z) :- parent(X,Y,W),ancestor(W,U,Z).