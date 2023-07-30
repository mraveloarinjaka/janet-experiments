(declare-project
  :name "sandbox"
  :dependencies ["file:///Users/mraveloarinjaka/projects/sandbox/janet_experiments/thirdparties/set"
                 {:url "https://github.com/ianthehenry/judge.git" :tag "v2.6.1"}])

(declare-executable
  :name "mycore"
  :entry "src/core/main.janet")
