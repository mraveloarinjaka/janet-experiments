(declare-project
  :name "sandbox"
  :dependencies [#"file:///Users/mraveloarinjaka/projects/sandbox/janet_experiments/thirdparties/set"
                 "https://github.com/mraveloarinjaka/janet-experiments-native-lib.git"
                 {:url "https://github.com/ianthehenry/judge.git" :tag "v2.6.1"}])

(declare-executable
  :name "space.mrave.app.janet-experiments"
  :entry "src/main.janet")
