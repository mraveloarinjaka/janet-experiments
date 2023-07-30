(import set)
(import ./lib/math :as my-math)

(my-math/sum 40 2)

(defn main [& args]
    # You can also get command-line arguments through (dyn :args)
    (print "args: " ;(interpose ", " args))
    (set/hello))

(comment

(use sh)

  (eachk i [-3 1 99] (pp i))
  (eachp i [-3 1 99] (pp i))

  (defn make-table-set [& elements]
    (def result @{})
    (each element elements
      (put result element true))
    result)

  (defn elements [table-set]
    (coro
      (eachk element table-set
        (yield element))))

  (def good-numbers (make-table-set 1 3 60))

  (eachp i good-numbers (pp i))

  (reduce + 0 (elements good-numbers))

  (def hosts [
              {:name "claudius"
               :ip "45.63.9.183"
               :online true
               :services
               [{:name "janet.guide"}
                {:name "bauble.studio"}
                {:name "ianthehenry.com"}]}
              {:name "caligula"
               :ip "45.63.9.184"
               :online false
               :services[{:name "basilica.horse"}]}])

  (loop [host :in hosts
         :when (host :online)
         service :in (host :services)]
    (print (service :name)))

  (def hosts [
              {:name "claudius"
               :ip "45.63.9.183"
               :online true
               :services
               {"janet.guide" true
                "bauble.studio" false
                "ianthehenry.com" true}}
              {:name "caligula"
               :ip "45.63.9.184"
               :online false
               :services {"basilica.horse" true}}])

  (loop [host :in hosts
         :when (host :online)
         :let [ip (host :ip)]
         [service-name available] :pairs (host :services)
         :when available
         instance :range [0 3]]
    (pp [ip service-name instance]))

  (def services
    (seq [host :in hosts 
          :when (host :online)
          service :pairs (host :services)]
      service))

  (pp services)

  (defn fun-with-cond
    [x]
    (cond
      (> x 0) (print "positive")
      (< x 0) (print "negative")
      (= x 0) (print "zero")
      (print "NaNaNaNaN")))

  (fun-with-cond 42)
  (fun-with-cond -42)

  (type {:keyword :value})
  (type @{:keyword :value})

  (def table @{:get-foo (fn [self] (self :_foo)) :_foo 123 })

  ((table :get-foo) table)

  (:get-foo table)

  (def counter-prototype
    @{:add (fn [self amount] (+= (self :_count) amount))
      :increment (fn [self] (:add self 1))
      :count (fn [self] (self :_count))})

  (defn new-counter []
    (table/setproto @{:_count 0} counter-prototype))

  (def counter (new-counter))

  (:increment counter)

(pp counter)

#(import./ jpm_tree / lib / set : as testing)
#(testing / hello)

#(import set : as testing
#(pp(testing / new 1 2 3))

(defn chunk-string [str]
  (var unread true)
  (fn [buf _]
    (when unread
      (set unread false)
      (buffer/blit buf str))))

(defn evaluate [user-script]
  (def env (make-env root-env))

  (defn on-parse-error [parser where]
    (bad-parse parser where)
    (set (env :exit) true))

  (defn on-compile-error [msg fiber where line col]
    (bad-compile msg fiber where line col)
    (set (env :exit) true))

  (run-context
    {:env env
     :chunks (chunk-string user-script)
     :on-status (fn [fiber value]
                  (printf "> %q (%q)" value (fiber/status fiber)))
     :on-parse-error on-parse-error
     :on-compile-error on-compile-error
     }))

(evaluate `(+ 1 2)
(print "done")
(pp (yield 10))
(error "oh no")
`)
)

