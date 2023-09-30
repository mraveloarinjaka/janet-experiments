(def SAMPLE
  ``
  1-3 a: abcde
  1-3 b: cdefg
  2-9 c: ccccccccc
  ``)

(def RULE-GRAMMAR ~{:nb-occurences (some (range "09"))
                    :mandatory-character :w
                    :password :w+
                    :main (sequence (/ (<- :nb-occurences) ,parse) "-" (/ (<- :nb-occurences) ,parse) :s+ (<- :mandatory-character) ":" :s+ (<- :password))})

(defn find-mandatory-character-frequency
  [mandatory-character password]
  (let [as-byte (first (string/bytes mandatory-character))
        freq (frequencies password)]
    #(printf "count %s in %s" mandatory-character password)
    #(printf "mandatory character as byte: %q" as-byte)
    #(printf "password: %s" password)
    (get freq as-byte 0)))

(defn password-valid?
  [[lower-bound upper-bound mandatory-character password]]
  (let [freq (find-mandatory-character-frequency mandatory-character password)]
    (and (<= lower-bound freq)
         (<= freq upper-bound))))

(defn nb-valid-passwords
  [passwords]
  (->> passwords
       (string/split "\n")
       (filter (complement empty?))
       (map (fn [rule] (peg/match RULE-GRAMMAR rule)))
       (filter password-valid?)
       length))

(nb-valid-passwords SAMPLE)
(nb-valid-passwords (slurp "resources/aoc2020/day2.txt"))

(comment

  (peg/match ~(any (+
                    (* "↑" (constant :up))
                    (* "↓" (constant :down))
                    (* "←" (constant :left))
                    (* "→" (constant :right))
                    (* "A" (constant :a))
                    (* "B" (constant :b))
                    (* "START" (constant :start))
                    1))
             "↑↑↓↓←→←→ B A START")

  (peg/match ~(any (+
                    (/ "↑" :up)
                    (/ "↓" :down)
                    (/ "←" :left)
                    (/ "→" :right)
                    (/ "A" :a)
                    (/ "B" :b)
                    (/ "START" :start)
                    1))
             "↑↑↓↓←→←→ B A START")

  (comment))

