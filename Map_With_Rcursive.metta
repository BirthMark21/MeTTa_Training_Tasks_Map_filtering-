; Base case: empty list
(= (map $func ()) ())

; Recursive case: apply function to head
(= (map $func (:: $head $tail))
   (:: ($func $head) (map $func $tail)))

; Example: Triple numbers
(= (triple $x) (* $x 3))
!(map triple (:: 1 (:: 2 (:: 3 ()))))

; Output: (:: 3 (:: 6 (:: 9 ())))

; tep-by-Step Evaluation
; Let’s evaluate (map triple [1, 2, 3]) to derive the output:

; Initial Call: (map triple (:: 1 (:: 2 (:: 3 ()))))
; $head = 1, $tail = [2, 3].
; (triple 1) → (* 1 3) → 3.
; Result: (:: 3 (map triple (:: 2 (:: 3 ())))).
; Second Call: (map triple (:: 2 (:: 3 ())))
; $head = 2, $tail = [3].
; (triple 2) → (* 2 3) → 6.
; Result: (:: 6 (map triple (:: 3 ()))).
; Third Call: (map triple (:: 3 ()))
; $head = 3, $tail = [] (i.e., ()).
; (triple 3) → (* 3 3) → 9.
; Result: (:: 9 (map triple ())).
; Base Case: (map triple ())
; Input is empty, so: ().
; Result: ().
; Combine Backwards:
; From Step 3: (:: 9 ()) → [9].
; From Step 2: (:: 6 [9]) → [6, 9].
; From Step 1: (:: 3 [6, 9]) → [3, 6, 9].