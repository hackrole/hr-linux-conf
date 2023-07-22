;;; Compiled snippets and support files for `org-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'org-mode
                     '(("obit" "#+tblname: data_table\n$0" "ob-ipython-table-data" nil nil nil "/home/hackrole/.spacemacs.d/snippets/org-mode/ob-ipython-table-data" nil nil)
                       ("obisf" "#+begin_src ipython :session ${1::ipyfile ${2:$$(let ((temporary-file-directory \"./\")) (make-temp-file \"py\" nil \".png\"))} }:exports ${3:both}\n$0\n#+end_src" "ob-ipython-src-full" nil nil nil "/home/hackrole/.spacemacs.d/snippets/org-mode/ob-ipython-src-full" nil nil)
                       ("obis" "#+begin_src ipython :session :exports both :results raw drawer\n            $0\n#+end_src\n" "ob-ipython-simple-src" nil nil nil "/home/hackrole/.spacemacs.d/snippets/org-mode/ob-ipython-simple-src" nil nil)
                       ("obii" "#+begin_src ipython :session :exports both :results raw drawer\n  %matplotlib inline\n  import matplotlib.pylot as plt\n  import numpy as np\n  import pandas as pd\n  import seaborn as sns\n  $0\n#+end_src" "ob-ipython-import" nil nil nil "/home/hackrole/.spacemacs.d/snippets/org-mode/ob-ipython-import" nil nil)))


;;; Do not edit! File generated at Mon Mar 20 21:23:15 2023
