; Base case: empty list
(= (filter $predicate ()) ())

; Recursive case: match head and tail
(= (filter $predicate (:: $head $tail))
   (if ($predicate $head)
       (:: $head (filter $predicate $tail))
       (filter $predicate $tail)))

; Example: Keep odd numbers
(= (odd? $n) (== (% $n 2) 1)) ; Check if remainder is 1 (odd)
!(filter odd? (:: 1 (:: 2 (:: 3 (:: 4 ())))))

; Output: (:: 1 (:: 3 ()))



