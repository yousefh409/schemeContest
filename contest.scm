;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: <Golden Ratio in a Bear Parenthesis>
;;;
;;; Description:
;;;   <A shape in cool Parenthesis
;;;   The shape even cooler
;;;   bin shift?>

(define (opposite func) ;If left, returns right, else right
  (if (equal? func left) right left)
)
(define (opposite-color color)
  (if (equal? color "#e3a600") "#007df2" "#e3a600") ; Can be used to alternate colors. Was not used
)

(define (draw-lambda-sign size angle func min) ;Draws a lambda sign(part of the spiral)
    (cond
      ((> size min)
      (forward 3)
      (func angle)
      (draw-lambda-sign (- size 3) (- angle 0.06) func min)
      ((opposite func) angle)
    ))
)

(define (draw-spiral size begx begy min curr-color is-paran) ;Draws the spiral shape
( if (< size min)
  nil
  (begin
  (draw-lambda-sign size 2 left min)
  (left 30)
  (setposition begx begy)
  (if is-paran (color (opposite-color curr-color)) 0)
  (draw-spiral (- size 0.5) begx begy min (opposite-color curr-color) is-paran)

)))

(define (draw-paran rad posy posx angle size end) ;Draws a parantheses. This is based off of simple trig
  ( if (> angle end) nil
    (begin
      (penup)
      (setposition posx posy)
      (pendown)
      (draw-spiral size posx posy (- size) "#e3a600" #t)
      (draw-paran rad (* rad (sin angle)) (* rad (cos angle)) (+ angle 0.2) size end)
    )
  )
)

(define (draw)
  ; YOUR CODE HERE
  (hideturtle)
  (bgcolor "black")
  (color "#e3a600") ;Gold
  (speed 10)
  (draw-spiral 180 0 0 -300 "#e3a600" #f)
  (color "#e3a600") ;Gold
  (draw-paran 350 292.91 -191.58 2.15 20 4.37) ;There is some Math behind these numbers, but alas, it is also simple Trig
  (draw-paran 350 191.1 -292.91 5.29 20 7.51)
)

; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)
