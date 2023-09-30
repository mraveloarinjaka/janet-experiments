(defn find-entries
  [parsed-input]
  (seq [first-entry :in parsed-input
        second-entry :in (drop 1 parsed-input)
        :when (= 2020 (+ first-entry second-entry))
        :let [result (* first-entry second-entry)]]
    (pp (string/format "%d-%d" first-entry second-entry))
    result))

(def sample
  `1721
  979
  366
  299
  675
  1456`)

(find-entries (->> (string/split "\n" sample)
                   (map parse)))

(defn find-3-entries
  [parsed-input]
  (seq [first-entry :in parsed-input
        second-entry :in (drop 1 parsed-input)
        third-entry :in (drop 2 parsed-input)
        :when (= 2020 (+ first-entry second-entry third-entry))
        :let [result (* first-entry second-entry third-entry)]]
    (pp (string/format "%d-%d-%d" first-entry second-entry third-entry))
    result))

(find-entries (->> (slurp "resources/aoc2020/day1.txt")
                   (string/split "\n")
                   (filter (fn [entry] (not= entry "")))
                   (map parse)))

(find-3-entries (->> (string/split "\n" sample)
                     (map parse)))

(find-3-entries (->> (slurp "resources/aoc2020/day1.txt")
                     (string/split "\n")
                     (filter (fn [entry] (not= entry "")))
                     (map parse)))

(def TARGET_SUM 2020)

(defmacro find-n-entries-ex
  [parsed-input nb-entries]
  (let [bindings (seq [i :in (range nb-entries)
                       :let [entries (drop i parsed-input)]]
                   (let [$x (gensym)]
                     ~[,$x :in [,;entries]]))]
    (with-syms [$entries $result]
      ~(seq ,(-> (array/concat @[] ~,;bindings)
                 (array/push :when ~(= ,TARGET_SUM (+ ,;(map first bindings))))
                 (array/push :let ~[,$entries ,(map first bindings)
                                    ,$result (apply * ,$entries)]))
         [,$entries ,$result]))))

(def PARSED-INPUT (->> (string/split "\n" sample)
                       (map parse)))

(macex1 ~(find-n-entries-ex ,PARSED-INPUT 3))

# @[1721 979 366 299 675 1456]

#(seq @[_00008G :in [1721 979 366 299 675 1456]
#       _00008H :in [979 366 299 675 1456]
#       _00008I :in [366 299 675 1456]
#       :when (= 2020 (+ _00008G _00008H _00008I))
#       :let [_00008J (* _00008G _00008H _00008I)]] _00008J)

(eval ~(find-n-entries-ex ,PARSED-INPUT 3))

(def PARSED-RESOURCE (->> (slurp "resources/aoc2020/day1.txt")
                          (string/split "\n")
                          (filter (fn [entry] (not= entry "")))
                          (map parse)))

(eval ~(find-n-entries-ex ,PARSED-RESOURCE 3))

(defn find-n-entries
  [parsed-input nb-entries]
  (eval ~(find-n-entries-ex ,parsed-input ,nb-entries)))


(find-n-entries PARSED-RESOURCE 3)
