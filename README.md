いい。
このコードなら、READMEは**「何をしたコードなのか」「なぜこう書いたのか」** が伝わるものにすると合う。

下書きをそのまま置くね。

# racket-fizzbuzz

Racket で FizzBuzz を **DSL 的に** 書いてみた小さなサンプルです。

通常の FizzBuzz のように「1 から 100 まで繰り返して条件分岐する」という書き方ではなく、  
**FizzBuzz のルールそのものを記述する** ことを意識しています。

元になった考えは、Qiita の記事「RacketでFizzBuzz問題をDSLとして書く」に書いてあります。

- Qiita: https://qiita.com/atelier-kame/items/4dff58cd5178c3ce6186

## Code

```racket
#lang racket

(define-syntax modulo-zero?
  (syntax-rules ()
    [(modulo-zero? x n)
     (zero? (modulo x n))]))

(stream->list
 (stream-map (lambda (x)
               (cond ((modulo-zero? x 15) 'FizzBuzz)
                     ((modulo-zero? x 3) 'Fizz)
                     ((modulo-zero? x 5) 'Buzz)
                     (else x)))
             (in-range 1 101)))
```

## Idea

このコードでは、modulo-zero? という小さな語彙を導入して、
「3 で割り切れる」「5 で割り切れる」といった条件を
問題領域の言葉に少し近い形 で書いています。

また、stream-map を使うことで、
ループそのものを前面に出すのではなく、
流れてくる値にルールを適用していく 形にしています。

そのため、このコードは「FizzBuzz をどう計算するか」よりも、
FizzBuzz とはどんなルールか を書いているように見えます。

## Run

Racket が入っていれば、そのまま実行できます。

racket main.rkt

## Output

1 から 100 までの値に対して、次のルールを適用した結果をリストとして返します。
	•	15 の倍数 → FizzBuzz
	•	3 の倍数 → Fizz
	•	5 の倍数 → Buzz
	•	それ以外 → 数値そのもの

## Why

FizzBuzz は小さな問題ですが、
	•	条件分岐として書く
	•	データ変換として書く
	•	ルール記述として書く

の違いが出やすい題材です。

このリポジトリでは、Racket のマクロと stream を使って、
できるだけ「ルール記述」に寄せた FizzBuzz を試しています。

