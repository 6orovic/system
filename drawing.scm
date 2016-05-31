#lang racket
(require racket/gui/base)

; Make a 300 x 300 frame
  (define frame (new frame% [label "Drawing Example"]
                            [width 300]
                            [height 300]))
  ; Make the drawing area
  (define canvas (new canvas% [parent frame]))
  ; Get the canvas's drawing context
  (define dc (send canvas get-dc))
  
  ; Make some pens and brushes
  (define no-pen (make-object pen% "BLACK" 1 'transparent))
  (define no-brush (make-object brush% "BLACK" 'transparent))
  (define blue-brush (make-object brush% "BLUE" 'solid))
  (define yellow-brush (make-object brush% "YELLOW" 'solid))
  (define red-pen (make-object pen% "RED" 2 'solid))
  
  ; Define a procedure to draw a face
  (define (draw-face dc)
    (send dc set-pen no-pen)
    (send dc set-brush blue-brush)
    (send dc draw-ellipse 50 50 200 200)
  
    (send dc set-brush yellow-brush)
    (send dc draw-rectangle 100 100 10 10)
    (send dc draw-rectangle 200 100 10 10)
  
    (send dc set-brush no-brush)
    (send dc set-pen red-pen)
    (let ([-pi (atan 0 -1)])
      (send dc draw-arc 75 75 150 150 (* 5/4 -pi) (* 7/4 -pi))))
  
  ; Show the frame
  (send frame show #t)
  ; Wait a second to let the window get ready
  (sleep/yield 1)
  ; Draw the face
  (draw-face dc)