---- MODULE diehardspec ----

EXTENDS Integers

VARIABLES small, big

BigNot4 == big # 4

TypeOK == 
    /\ small \in 0..3
    /\ big \in 0..5
    
Init == 
    /\ small = 0
    /\ big = 0

FillSmall == 
    /\ small' = 3
    /\ big' = big

EmptySmall == 
    /\ small' = 0
    /\ big' = big

FillBig ==
    /\ small' = small
    /\ big' = 5

EmptyBig == 
    /\ small' = small
    /\ big' = 0

SmallToBig == IF small + big <= 5 
                THEN 
                    /\ small' = 0
                    /\ big' = big + small
                ELSE
                    /\ big'= 5
                    /\ small' = small - 5 + big

BigToSmall == IF small + big <= 3
                THEN 
                    /\ small' = small + big
                    /\ big' = 0
                ELSE
                    /\ big'= big -  (3 - small)
                    /\ small' = 3
        

Next ==
    \/ FillSmall
    \/ FillBig
    \/ EmptySmall
    \/ EmptyBig
    \/ SmallToBig
    \/ BigToSmall
    


====