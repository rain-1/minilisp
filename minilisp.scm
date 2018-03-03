(define (null? x) (eq? x '()))

(define (cadr x) (car (cdr x)))

(define (map fn lis)
  (if (null? lis)
      '()
      (cons (fn (car lis))
            (map fn (cdr lis)))))

(define (for-each fn lis)
  (if (null? lis)
      '()
      (begin (fn (car lis)) (for-each fn (cdr lis)))))

(defmacro let (table . body)
  (cons (cons 'lambda (cons (map car table) body))
        (map cadr table)))
