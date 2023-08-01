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

(find-entries (->> (slurp "resources/aoc2020/day1.txt")
                   (string/split "\n")
                   (filter (fn [entry] (not= entry "")))
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

(find-3-entries (->> (string/split "\n" sample)
                     (map parse)))

(find-3-entries (->> (slurp "resources/aoc2020/day1.txt")
                     (string/split "\n")
                     (filter (fn [entry] (not= entry "")))
                     (map parse)))

