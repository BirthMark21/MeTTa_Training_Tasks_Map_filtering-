; Non-deterministic function (returns $x or $x * 3)
(= (nd-func $x) $x)
(= (nd-func $x) (* $x 3))

; Base case: empty list
(= (map-nd $func ()) ())

; Recursive case: non-deterministically map head and tail
(= (map-nd $func (:: $head $tail))
   (:: ($func $head) (map-nd $func $tail)))

; Generate all combinations for the list [1, 2]
!(collapse (map-nd nd-func (:: 1 (:: 2 ()))))






; Possible outputs:
; [((:: 3 (:: 6 ())) (:: 3 (:: 2 ())) (:: 1 (:: 6 ())) (:: 1 (:: 2 ())))]


; Choices for nd-func:
; nd-func 1: 1 or 1 * 3 = 3.
; nd-func 2: 2 or 2 * 3 = 6.
; Combinations: 2 choices for 1 × 2 choices for 2 = 4 possible outcomes.

; Step-by-Step Evaluation
; Initial Call: (map-nd nd-func (:: 1 (:: 2 ())))
; $head = 1, $tail = [2].
; (nd-func 1) → {1, 3} (two branches).
; For Each Branch of nd-func 1:
; Branch 1: nd-func 1 = 1:
; (:: 1 (map-nd nd-func (:: 2 ()))).
; $head = 2, $tail = [].
; (nd-func 2) → {2, 6}.
; Sub-branches:
; nd-func 2 = 2: (:: 2 (map-nd nd-func ())) → (:: 2 ()) → [2].
; nd-func 2 = 6: (:: 6 (map-nd nd-func ())) → (:: 6 ()) → [6].
; Results:
; (:: 1 [2]) → [1, 2].
; (:: 1 [6]) → [1, 6].
; Branch 2: nd-func 1 = 3:
; (:: 3 (map-nd nd-func (:: 2 ()))).
; $head = 2, $tail = [].
; (nd-func 2) → {2, 6}.
; Sub-branches:
; nd-func 2 = 2: (:: 2 ()) → [2].
; nd-func 2 = 6: (:: 6 ()) → [6].
; Results:
; (:: 3 [2]) → [3, 2].
; (:: 3 [6]) → [3, 6].