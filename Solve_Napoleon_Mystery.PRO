domains
name, sex, occupation, object, crime ,company , vice, substance, place1 = symbol  
predicates
   person(name,sex,occupation,place1)
   killed_with(name, object)
   killed(name,crime)
   killer(name)
   motive(object)
   owns(name, object,place1)
   owns(name,name,place1)
   suspect(name)
   company(object,place1)
   works(name,company)
   sibling(name,name)
   maybe_hates(name,object)
   maybe_wants(name,object)
   crimes(crime)
   criminal_record(name,crime)
   involved_with_statue(name)
   break_statue(name)

clauses
   
   person(barnicot,m,doctor,kennington_road).
   person(beppo, m, mafioso,_).
   person(harding,m,harding_brothers,_).
   person(harker,m,_,_).
   person(horace_harker,m,newspaper_reporter,_).
   person(john_watson, m, doctor,bakerstreet).
   person(josiah_brown,m,napoleon_statue,chiswick).
   person(lestrade,m, inspector,scotland_yard).
   person(lucretia_venucci,f,maid,_).  
   person(morse_hudson,m,napoleon_statue,kennington_road).
   person(pietro_venucci,m, mafioso,_).
   person(sandeford,m,reading,_).
   person(sherlock_holmes,m,detector,bakerstreet).
   
   sibling(lucretia_venucci,pietro_venucci).
   
   company(napoleon_statue,harding_brothers).
   company(napoleon_statue,gwelder_co).
   
   works(beppo,gelder_co).
   works(harding,harding_brothers).
   works(lucretia_vennuci,prince_of_colonna).
   
   owns(pietro_venucci,beppo,_).
   owns(barnicot,napoleon_staue,kennington_road).
   owns(barnicot,napoleon_statue,lower_brixton).
   owns(josiah_brown,napoleon_statue,chiswick).
   owns(morse_hudson,napoleon_statue,kennington_road).
   owns(sandeford,napoleon_statue,reading).
   
   
   killed(pietro_venucci,murder).
   killed_with(pietro_venucci,knife).
   
   criminal_record(beppo,petty_theft).
   criminal_record(beppo,stabbing).
   criminal_record(lucretia_venucci,theft).

   maybe_hates(beppo,napoleon_statue).
   maybe_hates(pietro_venucci,napoleon_statue).
	
   maybe_wants(pietro_venucci,money).
   maybe_wants(beppo,money).
   
   maybe_wants(beppo,black_pearl).
   maybe_wants(lucrrtia_venucci,black_pearl).

   involved_with_statue(X):- works(X,gelder_co); owns(X,napoleon_statue,_).
   suspect(X):- works(X,gelder_co);works(X,prince_of_colonna).  
   suspect(X):- person(X,_,maid,_);
		person(X,_,maid,_),sibling(Y,X).
   suspect(X):- owns(pietro_venucci,X,_).
   suspect(X):- criminal_record(X,theft); criminal_record(X,petty_theft) ; criminal_record(X,stabbing).

   killer(X) :- suspect(X), owns(pietro_venucci,X,_), criminal_record(X,Y),person(_,m,_,_).
   motive(X):- maybe_hates(Y,X); 
               maybe_wants(Y,X).            
   crimes(X):- criminal_record(beppo, X); criminal_record(lucretia_venucci,X);killed(_,X).
   break_statue(X):- suspect(X),involved_with_statue(X).