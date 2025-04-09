; Non-deterministic predicate for even numbers
(= (nd-even-pred? $x)
   (if (== (% $x 2) 0)
       True    ; Include even numbers non-deterministically
       False)) ; Always exclude odd numbers

(= (nd-even-pred? $x)
   (if (== (% $x 2) 0)
       False   ; Exclude even numbers non-deterministically
       False)) ; Always exclude odd numbers

; Recursive filter for lists
(= (filter $pred ()) ()) ; Base case: empty list

(= (filter $pred (:: $head $tail)) ; Recursive case
   (if ($pred $head)
       (:: $head (filter $pred $tail)) ; Keep head
       (filter $pred $tail)))          ; Remove head

; Example: Generate all subsets of even numbers
!(collapse (filter nd-even-pred? (:: 0 (:: 1 (:: 2 (:: 3 (:: 4 ())))))))

; Possible outputs:
; [ 
;   (), 
;   (:: 0 ()), 
;   (:: 2 ()), 
;   (:: 4 ()), 
;   (:: 0 (:: 2 ())), 
;   (:: 0 (:: 4 ())), 
;   (:: 2 (:: 4 ())), 
;   (:: 0 (:: 2 (:: 4 ()))) 
; ]




