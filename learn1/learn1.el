(message "Hello Tabuyos")
"Hello Tabuyos"

(defun hello-world (name)
	"Say hello to user whose name is NAME."
	(message "Hello, %s" name))
hello-world

(hello-world "Tabuyos")
"Hello, Tabuyos"

(setq tabuyos "Tabuyos")
"Tabuyos"

(message tabuyos)
"Tabuyos"

(defvar tabuyos "This is tabuyos."
	"This is demo variable.")
tabuyos

(message tabuyos)
"Tabuyos"
;; the value don't change if existed and use defvar can be provide document string.


(defvar tabuyos-test "This is tabuyos."
	"This is demo variable.")
tabuyos-test

(message tabuyos-test)
"This is tabuyos."

(defun circle-area (radix)
	(let ((pi 3.1415926) (area))
		(setq area (* pi radix radix))
		(message "radix: %.2f -> area: %.2f" radix area)))
circle-area

(circle-area 2)
"radix: 2.00 -> area: 12.57"

(defun circle-area1 (radix)
	(let* ((pi 3.1415925) (area (* pi radix radix)))
		(message "radix: %.2f -> area: %.2f" radix area)))
circle-area1

(circle-area1 2)
"radix: 2.00 -> area: 12.57"

(funcall (lambda (name)
			 (message "Hello, %s!" name)) "Tabuyos")
"Hello, Tabuyos!"

(setq foo (lambda (name)
			  (message "Hello, %s!" name)))
(lambda (name) (message "Hello, %s!" name))

(funcall foo "tabuyos")
"Hello, tabuyos!"

(progn
	(setq foo 3)
	(message "Square of %d is %d" foo (* foo foo)))
"Square of 3 is 9"

(defun my-max (a b)
	(if (> a b)
		a
		b))
my-max

(my-max 3 4)
4

(my-max 4 2)
4

(defun fib (n)
	(cond ((= n 0) 0)
		((= n 1) 1)
		(t (+ (fib (- n 1)) (fib (- n 2))))))
fib

(fib 3)
2
(fib 4)
3
(fib 5)
5
(fib 6)
8
(fib 10)
55

(defun factorial (n)
	(let ((res 1))
		(while (> n 1)
			(setq res (* res n)
				n (- n 1)))
		res))
factorial
(factorial 10)
3628800

(defun hello-world (&optional name)
	(or name (setq name "Tabuyos"))
	(message "Hello, %s" name))
hello-world

(hello-world)
"Hello, Tabuyos"
(hello-world "Aaron Liew")
"Hello, Aaron Liew"

;; data type: primitive types
;; int float cons symbol string vector hash-table subr(cons if and etc.) byte-code function buffer

;; Starting with number.
#b101100
44

#o54
44

#x2c
44

#24r1k
44

#11r40
44

;; NaN(Not-a-Number)
(/ 0.0 0.0)
-0.0e+NaN

;; p->predicate
(integerp 1)
t

(integerp 1.)
t

(integerp 1.0)
nil

(floatp 1.0)
t

(numberp 1)
t

(numberp 1.0)
t

(zerop 1)
nil

(zerop 0)
t

(zerop 0.0)
t

(wholenump 1)
t

(wholenump -1)
nil

(setq foo (- (+ 1.0 1.0e-3) 1.0))
0.0009999999999998899

(setq bar 1.0e-3)
0.001

(= foo bar)
nil

(defvar fuzz-factor 1.0e-6)
fuzz-factor

(defun approx-equal (x y)
	(or (and (= x 0) (= y 0))
		(< (/ (abs (- x y)) (max (abs x) (abs y))) fuzz-factor)))
approx-equal

(approx-equal foo bar)
t

(abs 1.1)
1.1

(abs -1.1)
1.1

(max 2 4)
4

(abs (- 3.1 4.2))
1.1

(abs (- -3.1 4.2))
7.300000000000001

(abs (- 3.1 -4.2))
7.300000000000001

(abs (- -3.1 -4.2))
1.1

(= 1.0 1)
t

(eql 1.0 1)
nil

(/= 1.0 1)
nil

(/= 1 1)
nil

(float 2)
2.0

(truncate 2.1)
2

(truncate -1.4)
-1

(truncate 1.9)
1

(floor 1.2)
1

(ceiling 1.4)
2

(round 1.4)
1

(round 1.5)
2

(setq foo 10)
10

(setq foo (1+ foo))
11

(setq foo (1- foo))
10

(% 3 2)
1

(% 2 3)
2

(mod 3 2)
1

(mod 2 3)
2

(% 3.0 2.0)
;; error

(mod 3.0 2.0)
1.0

(mod 3.0 2)
1.0

;; so, %: first argument is integer. mod: first argument is integer or float.

(sqrt 4)
2.0

(log 100 10)
2.0

(log 1000 10)
3.0

(log 100)
4.605170185988092

(logb 4)
2

(random 10)
0
(random 10)
5
(random 10)
7

most-positive-fixnum
2305843009213693951

most-negative-fixnum
-2305843009213693952

(setq foo "abc\000abc")
"abc abc"

?A
65
?a
97

?\+
43
?+
43

?\a
7

?\C-g
7
?\^g
7

(logior (lsh 1 27) ?A)
134217793
?\M-a
134217825
?\M-A
134217793

?\C-a
1
?\C-A
1

?\M-
134217738
?\C-
67108874
?\M-\C-
201326602

?\S-
33554442
?\H-
16777226

(stringp 'a)
nil
(stringp ?a)
nil
(stringp foo)
t

(defun string-empty-p (str)
	(not (string< "" str)))
string-empty-p

(string< "" "1")
t
(string< "1" "")
nil
(string< "" "")
nil

(string-empty-p "")
t

(make-string 5 ?x)
"xxxxx"

(make-string 4 ?a)
"aaaa"

(string ?a ?b ?c)
"abc"

(substring "1234567890" 1 4)
"234"

(substring "1234567890" 5)
"67890"

(substring "1234567890" -3 -1)
"89"

(concat "ab" "cd" "e")
"abcde"

case-fold-search
t

(char-equal ?a ?c)
nil

(char-equal ?a ?a)
t

(char-equal ?a ?A)
t

(setq case-fold-search nil)
nil

(char-equal ?a ?A)
nil

(char-equal ?a ?a)
t

(setq case-fold-search t)
t

(string= "adfdsa" "fdsa")
nil

(string= "adb" "adb")
t

(string-equal "string" "string")
t

(string< "afds" "ad")
nil

(length "sfdsa")
5

(char-to-string ?a)
"a"

(string-to-char "fdsa")
102

?f
102

(number-to-string 123)
"123"

(string-to-number "1234")
1234

(defun number-to-bin-string (number)
	(require 'calculator)
	(let ((calculator-output-radix 'bin)
			 (calculator-radix-grouping-mode nil))
		(calculator-number-to-string number)))
number-to-bin-string

(number-to-bin-string 256)
"100000000"

(concat '(?a ?b ?c ?d ?e))
"abcde"
(concat [?a ?b ?c ?d ?e])
"abcde"
(vconcat "abcdef")
[97 98 99 100 101 102]
(append "abcd" "ef")
(97 98 99 100 . "ef")
(append "abcdef")
"abcdef"
(append "abcdef" nil)
(97 98 99 100 101 102)

(downcase "FDSA")
"fdsa"

(upcase "fdsa")
"FDSA"

(capitalize "tabuyos")
"Tabuyos"

(capitalize "Tabuyos")
"Tabuyos"

(capitalize "TABuYoS")
"Tabuyos"

(upcase-initials "this is test")
"This Is Test"

(string-match "34" "43254321532424345643")
14

(string-match "34" "43254321532424345643" 14)
14

(string-match "34" "43254321532424345643" 15)
nil

(regexp-quote "2*")
"2\\*"

(string-match (regexp-quote "2*") "232*3=696")
2

(progn
	(string-match "3\\(4\\)" "01234567890123456789")
	(match-data))
(3 5 4 5)

(let ((start 0))
	(while (string-match "34" "01234567890123456789" start)
		(princ (format "find at %d\n" (match-beginning 0)))
		(princ (format "end at %d\n" (match-end 0)))
		(setq start (match-end 0))))
find at 3
end at 5
find at 13
end at 15
nil

(let ((str "01234567890123456789"))
	(princ str)
	(princ "\n")
	(string-match "34" str)
	(princ (replace-match "x" nil nil str 0))
	(princ "\n")
	(princ str))
01234567890123456789
012x567890123456789
01234567890123456789"01234567890123456789"
;; the last line is by-product

(string-or-null-p "")
t
(string-or-null-p "abc")
t
(char-or-string-p "abc")
t
(char-or-string-p ?a)
t
(char-or-string-p "a")
t
;; the t is string

;; car: Contents of Address part of Register
;; cdr: Contents of Decrement part of Register
;; cons: construction

'(1 . 2)
(1 . 2)

'(1 . ?a)
(1 . 97)

'(1 . nil)
(1)

'(1 . "a")
(1 . "a")

'(nil . nil)
(nil)

;; ': eval-last-sexp
;; eval-last-sexp: 1. read previous S-expression, 2. calculator S-expression.
;; number and string(char) is special S-expression, call they self-evaluating-form
;; ' is special function -- quote, so '(1 . 2) => (quote (1 . 2))

(read "(1 . 2)")
(1 . 2)
;; read form equal output form

nil
nil

'()
nil

;; nil isn't cons cell, becuase have not car and cdr
;; in fact, nil is nothing in cons cell, but wo can think nil's car or cdr is nil for easy code

(car nil)
nil
(cdr nil)
nil

'( 1 2 3)
(1 2 3)
'(1 2 . 3)
(1 2 . 3)
'(1 . #1=(2 3 . #1#))
(1 2 3 . #1)
(cdr '(1 2 3))
(2 3)
(cdr '(1))
nil
(cdr '(1 (2 3)))
((2 3))
(cdr '((2 3)))
nil
(car '((2 3)))
(2 3)
(cdr '(1 . 2))
2
(cdr '(1 2 . 3))
(2 . 3)

'(1 . (2 . (3 . nil)))
(1 2 3)

(cdr '(1 . (2 . (3 . nil))))
(2 3)

(null nil)
t

(cons 1 2)
(1 . 2)

(cons 1 (cons 2 3))
(1 2 . 3)

(setq foo '(a b))
(a b)

(cons 'x foo)
(x a b)

foo
(a b)

(push 'x foo)
(x a b)

foo
(x a b)

(list 1 2 3 4 5 6 7)
(1 2 3 4 5 6 7)
(consp (list 1 2 3 4 5 6))
t

'((+ 1 2) 3)
((+ 1 2) 3)
(list (+ 1 2) 3)
(3 3)

(list ?a ?b ?c)
(97 98 99)
(list "a" "b" "c")
("a" "b" "c")
(list '(a b c))
((a b c))

(append '(a b) '(c))
(a b c)

(append '(car '(a b)) '(c))
(car (quote (a b)) c)

(append '(a b) 'c)
(a b . c)
(cdr '(a b . c))
(b . c)
(cdr '(b . c))
c

(cdr (cdr '(b c)))
nil

(cdr (cdr '(b . c)))
;; error

;; cons faster than append

(append [a b] "cd")
(a b . "cd")
(append [a b] "cd" nil)
(a b 99 100)

?c
99
?d
100

(append "abcd" nil)
(97 98 99 100)

(nth 3 '(0 1 2 3 4 5 6))
3
(nthcdr 2 '(0 1 2 3 4 5 6))
(2 3 4 5 6)
(nthcar 2 '(0 1 2 3 4 5 6))
;; error
(last '(0 1 2 3 4 5 6) 2)
(5 6)
(last '(7 (0 1 2 3 4 5 6)) 2)
(7 (0 1 2 3 4 5 6))
(butlast '(0 1 2 3 4 5 6) 2)
(0 1 2 3 4)

(defun my-subseq (str begin end)
	(cond
		((< (length str) end) (message "error!"))
		(t (nthcdr begin (butlast str (- (length str) end))))))
my-subseq

(my-subseq '(0 1 2 3 4 5 6 7 8 9) 2 5)
(2 3 4)

(my-subseq '(0 1 2 (3 4 5 6) 7 8 9) 2 5)
(2 (3 4 5 6) 7)

'(0 1 2 (3 4 5 6) 7 8 9)
(0 1 2 (3 4 5 6) 7 8 9)
(length '(0 1 2 (3 4 5 6) 7 8 9))
7

(my-subseq '(0 1 2 3 4 5 6 7 8 9) 2 5)
(2 3 4)

(my-subseq '(0 1 2 3 4 5 6 7 8 9) 2 11)
"error!"

(my-subseq '(0 1 2 3 4 5 6 7 8 9) 3 1)
nil

(setq foo '(a b c))
(a b c)

(setcar foo 'x)
x

foo
(x b c)

(setcdr foo '(y z))
(y z)

foo
(x y z)

(setq foo '(a b c))
(a b c)

(setcdr foo foo)
(a . #0)

(setq foo '((a b) c))
((a b) c)

(setcdr foo foo)
((a b) . #0)

(setq foo '(1 2 3))
(1 2 3)

(setcar foo 'a)
a

(setcar (cdr foo) 'b)
b

(setcar (nthcdr 2 foo) 'c)
c

foo
(a b c)

(setq foo nil)
nil

(push 'b foo)
(b)

(push 'b foo)
(b b)

(push 'a foo)
(a b b)

(pop foo)
a

foo
(b b)

(setq foo '(a b c))
(a b c)

(reverse foo)
(c b a)

foo
(a b c)

(nreverse foo)
(c b a)

foo
(a)
;; so nreverse function is devastation!

(setq foo '(3 2 4 1 5))
(3 2 4 1 5)
(sort foo '<)
(1 2 3 4 5)

foo
(3 4 5)

(setq foo '(3 2 4 1 5))
(3 2 4 1 5)

(sort (copy-sequence foo) '<)
(1 2 3 4 5)

foo
(3 2 4 1 5)

(setq foo '(1 4 3 2 5))
(1 4 3 2 5)

(sort foo '<)
(1 2 3 4 5)

foo
(1 2 3 4 5)

(setq foo '(a b c))
(a b c)

(remq 'b foo)
(a c)

foo
(a b c)

(delq 'b foo)
(a c)

foo
(a c)

(delq 'a foo)
(c)

foo
(a c)

(eq 1 3)
nil
(eq 1 "1")
nil
(eq 1 1)
t

(assoc "a" '(("a" 97) ("b 98")))
("a" 97)
(assq 'a '((a . 97) (b . 98)))
(a . 97)

(cdr '(a b))
(b)
(cdr '(a . b))
b

(assoc-default "a" '(("a" 97) ("b" 98)))
(97)

(rassoc '(97) '(("a" 97) ("b" 98)))
("a" 97)
(rassq '97 '((a . 97) (b . 98)))
(a . 97)

(setq foo '(("a" . 97) ("b" . 98)))
(("a" . 97) ("b" . 98))

(if (setq bar (assoc "a" foo))
	(setcdr bar "this is a")
	(setq foo (cons '("a" . "this is a") foo)))
"this is a"

foo
(("a" . "this is a") ("b" . 98))

(setq foo (cons '("a" . 97)
			  (delq (assoc "a" foo) foo)))
(("a" . 97) ("b" . 98))

foo
(("a" . 97) ("b" . 98))

(mapc '1+ '(1 2 3))
(1 2 3)

(mapcar '1+ '(1 2 3))
(2 3 4)

(setq foo '(1 2 3))
(1 2 3)

(mapc '1+ foo)
(1 2 3)

foo
(1 2 3)

(mapcar '1+ foo)
(2 3 4)

foo
(1 2 3)

(dolist (foo '(1 2 3))
	(incf foo))
nil

(setq bar nil)
nil

(dolist (foo '(1 2 3) bar)
	(push (incf foo) bar))
(4 3 2)

(defun my-remova-if (predicate list)
	(delq nil (mapcar (lambda (n)
						  (and (not (funcall predicate n)) n))
				  list)))
my-remova-if

(defun evenp (n)
	(= (% n 2) 0))
evenp

(my-remova-if 'evenp '(0 1 2 3 4 5))
(1 3 5)

(and t 1)
1
(and t nil)
nil
(and 1 t)
t
(and nil t)
nil
(and 1 0)
0
(and 0 1)
1

(delq nil '(1 2 3))
(1 2 3)

(mapcar (lambda (n)
			(and (not (funcall 'evenp n)) n)) '(1 2 3 4 5))
(1 nil 3 nil 5)

(evenp 2)
t
(evenp 1)
nil

(defun my-fold-left (op initial list)
	(dolist (var list initial)
		(setq initial (funcall op initial var))))
my-fold-left

(my-fold-left '+ 0 '(1 2 3 4 5))
15

(number-sequence 3 8 2)
(3 5 7)

(split-string "key = val" "\\s-*=\\s-*")
("key" "val")

(mapconcat 'identity '("a" "b" "c") "\t")
"a	b	c"
(identity "af")
"af"

(list 'a 'b 'c)
(a b c)

(defun my-nthcdr (n list)
	(if (or (null list) (= n 0))
		(car list)
		(my-nthcdr (1- n) (cdr list))))
my-nthcdr

(my-nthcdr 3 '(1 2 3 4 5 6))
4

(defun my-subseq (list from &optional to)
	(if (null to) (nthcdr from list)
		(butlast (nthcdr from list) (- (length list) to))))
my-subseq

;; list and array both of sequence
;; array: vector string char-table boolean-vector
;; array is self-evaluating and can't change length of it

(length '(1 2 3 4))
4

(safe-length '(a . b))
1

(safe-length '#1=(1 2 . #1#))
4
'#1=(1 2 . #1#)
(1 2 1 . #1)

(aref '[1 2 3 4] 3)
4

(setq foo (copy-sequence '(1 2 3 4 5)))
(1 2 3 4 5)

foo
(1 2 3 4 5)

(setq foo (copy-sequence '(1 2 3 4 . 5)))
;; error

(setq foo (copy-tree '(1 2 3 4 . 5)))
(1 2 3 4 . 5)

foo
(1 2 3 4 . 5)

(vector 'foo 23 [bar baz] "rats")
[foo 23 [bar baz] "rats"]

(setq foo '(a b))
(a b)

[foo]
[foo]

(vector foo)
[(a b)]

(make-vector 9 'z)
[z z z z z z z z z]

(fillarray (make-vector 3 'z) 5)
[5 5 5]

(fillarray '[1 2 3] 5)
[5 5 5]

(vconcat [1 2 3 4 5] "aa" '(foo (6 7)))
[1 2 3 4 5 97 97 foo (6 7)]

(append [1 2 3 4 5] [6 7])
(1 2 3 4 5 . [6 7])

(append [1 2 3] nil)
(1 2 3)

(defun circular-list-p (list)
	(and (consp list)
		(circular-list-p-l (cdr list) list 0)))
circular-list-p

(defun circular-list-p-l (tail halftail len)
	(if (eq tail halftail)
		t
		(if (consp tail)
			(circular-list-p-l (cdr tail)
				(if (= (% len 2) 0)
					(cdr halftail)
					halftail)
				(1+ len))
			nil)))
circular-list-p-l

(circular-list-p '#1=(1 2 . #1#))
t

(defun my-tr (str from to)
	(if (= (length to) 0)
		(progn
			(setq from (append from nil))
			(concat
				(delq nil
					(mapcar (lambda (c)
								(if (member c from)
									nil c))
						(append str nil)))))
		(let (table newstr pair)
			;; build convert table
			(dotimes (i (length from))
				(push (cons (aref from i) (aref to i)) table))
			(dotimes (i (length str))
				(push
					(if (setq pair (assoc (aref str i) table))
						(cdr pair)
						(aref str i))
					newstr))
			(concat (nreverse newstr) nil))))
my-tr

(let (a b c)
	(message"%s %s %s" a b c))
"nil nil nil"
(let ((a 0) (b 2) (c 5))
	(message"%s %s %s" a b c))
"0 2 5"

(symbolp '+1)
nil
(symbolp '\+1)
t

(setq foo (make-vector 10 0))
[0 0 0 0 0 0 0 0 0 0]

(intern-soft "abc" foo)
nil

(intern "abc" foo)
abc

(intern-soft "abc" foo)
abc

foo
[0 0 0 0 0 0 0 0 0 abc]

(intern-soft "abc")
nil

'abc
abc

(intern-soft "abc")
abc

(intern-soft "abcd")
nil

'#:abcd
abcd
;; don't intern to obarray

(intern-soft "abcd")
nil

(intern-soft "abc" foo)
abc

(unintern "abc" foo)
t

(intern-soft "abc" foo)
nil

(setq count 0)
0

(defun count-syms (s)
	(setq count (1+ count)))
count-syms

(mapatoms 'count-syms)
nil

count
43737

(length obarray)
15121

?\
-1


